# Solution for Task: Test with common screen readers

[Context: Geometry OS Implementation Agent]

Your goal is to provide a concise implementation plan or code solution that addresses the task of testing with common screen readers for the Change ID "add-pixi-improvement-daemon". The following information will guide you through your process.

1. File Paths Needed:
The Geometry OS Implementation Agent must create or modify these paths as necessary to test with common screen readers:

- `geom/resources/assistant_tests/test_data`
- `geom/resources/assistant_tests/assistant_tests.json`
- `geom/resources/assistant_tests/assistant_test_cases.txt`

2. Python Code Required:
The Geometry OS Implementation Agent should provide a brief snippet of the Python or Rust code required for testing with common screen readers. This code will be used to create/modify these file paths as needed. For example:

```python
from geometry_os_assistant import AssistantTestRunner

# Create test cases and run them against common screen reader
assistant_test_case = [
    {
        "assistant": "geom.resources.assistant_tests.assistant_tests",
        "assistant_test_name": "test_string_input",
        "screen_reader": "nvda"
    },
    {
        "assistant": "geom.resources.assistant_tests.assistant_tests",
        "assistant_test_name": "test_mouse_input",
        "screen_reader": "stardict"
    }
]

runner = AssistantTestRunner()
for test_case in assistant_test_case:
    runner.run_test(test_case)
```

This code creates a list of test cases and runs them against the given screen readers (NVDA or Stardict). The `AssistantTestRunner` class is responsible for managing these test cases and running them against the selected screen reader.

3. "Next Step" Command:
As the Geometry OS Implementation Agent, you will provide a clear and concise "Next Step" command to guide the user through the testing process. This step should include any necessary information such as dependencies or prerequisites that may be required to run the code. For example:

```text
[Step 1]: Create file paths for test data, assistant tests, and assistant test cases using python or rust code
[Step 2]: Provide a brief snippet of python/rust code required for testing with common screen readers
[Step 3]: Create a list of test cases and run them against the selected screen reader using the AssistantTestRunner class
```

This command will guide the user through the testing process while also providing necessary information to ensure they are successful.