# Solution for Task: **Task 1**: Design and implement PromptOptimizer class with statistical analysis engine capable of comparing prompt variants across task executions. The optimizer should identify success patterns by analyzing successful completions, detecting failure modes through error tracking or quality scoring metrics.

[Insert file paths here]

[Insert brief snippet of Python or Rust code required here]

Next Step:
- [Create a file](https://help.github.com/en/articles/creating-and-editing-commits) named "Instruction_Effectiveness_Analysis.py" with the following contents:
```python
import torch
from torch import nn
from prompt_toolkit import document, prompt

class Instruction_Effectiveness_Model(nn.Module):
    def __init__(self):
        super().__init__()

    def forward(self, input):
        # TODO: Implement your model here
        pass

def main():
    # Prompt the user to enter the input text
    with document("Instruction_Effectiveness_Analysis.txt"):
        text = prompt("Enter instruction text: ", completion="auto")
    
    # Instantiate the Instruction_Effectiveness_Model and call forward pass on the input text
    model = Instruction_Effectiveness_Model()
    output = model(text)
    
    # Output the results to the console
    print("Instruction effectiveness analysis:")
    for i, (instruction, score) in enumerate(zip(model.output(), output)):
        print(f"Instruction {i+1}: {instruction}")
        print(f"Score: {score:.2f}")

if __name__ == "__main__":
    main()
```

- [Create a script named 'Next_Step'](https://help.github.com/en/articles/creating-and-editing-commits) that links to the file containing the Instruction_Effectiveness_Analysis.py code snippet and adds it to the project's repository.

- [Create a new folder in your project directory named 'Instructions'](https://help.github.com/en/articles/creating-and-editing-commits) and add any instructions or prompts you need for the analysis. For example:
```
Instruction 1: How do I create this folder?
Instruction 2: What are some common prompts for creating a new directory?
Instruction 3: What is the difference between creating and using a `torch.nn.Module`?
```

- [Create a README file](https://help.github.com/en/articles/creating-and-editing-commits) with brief instructions for using the new code snippet and the project directory structure.