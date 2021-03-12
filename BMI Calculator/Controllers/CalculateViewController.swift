

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weitghSlider: UISlider!
    
    var bmiValue = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChange(_ sender: UISlider) {
        updateHeightUi(height: String(format: "%.2f", sender.value))
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        updateWeightUi(weight: String(Int(sender.value)))
    }
    
    func updateHeightUi(height: String){
        heightLabel.text = "\(height)m"
    }
    
    func updateWeightUi(weight: String) {
        weightLabel.text = "\(weight)Kg"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weitghSlider.value
        let bmi = weight/(pow(height, 2))
        bmiValue = String(format: "%.1f", bmi)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult") {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = bmiValue
        }
    }

}

