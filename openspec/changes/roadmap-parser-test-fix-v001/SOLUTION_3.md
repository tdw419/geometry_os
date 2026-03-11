# Solution for Task: **Task 1**: Investigate failing parser test logs to identify specific error patterns, stack traces, and failure conditions for each failed unit or integration test case.

Here is the implementation plan for **Task 1** of the `roadmap-parser-test-fix-v001` change.

Since I do not have direct access to your local file system or the specific CI/CD logs, I will provide a script that automates this investigation. This script will execute the tests, capture the output, and format the failure logs into a structured report (JSON) for analysis.

### 1. File Paths

*   **Create:** `scripts/investigate_parser_failures.py`
    *   *Purpose:* A utility script to run tests and extract error patterns/stack traces programmatically.
*   **Create:** `logs/parser_failure_report.json`
    *   *Purpose:* The output file where the investigation results will be stored.

### 2. Code Implementation

**File:** `scripts/investigate_parser_failures.py`

```python
import json
import subprocess
import sys
import re
from pathlib import Path
from datetime import datetime

def run_tests_and_capture_output(test_path):
    """
    Runs the parser tests and captures both stdout and stderr.
    """
    print(f"--- Investigating Test Path: {test_path} ---")
    try:
        # Run pytest with maximum verbosity and capture output
        # Assuming pytest is used. Adjust if using another runner.
        result = subprocess.run(
            ["pytest", test_path, "-v", "--tb=long"], 
            capture_output=True, 
            text=True, 
            check=False
        )
        return result.stdout + result.stderr
    except FileNotFoundError:
        return "Error: pytest command not found. Ensure testing environment is active."

def parse_failures(log_output):
    """
    Parses raw test logs to extract specific error patterns, stack traces, and failure conditions.
    """
    failure_data = []
    # Split by test case header (pytest standard format)
    # Regex looks for "TEST_FILE::TEST_NAME"
    test_blocks = re.split(r'^=+$|^---+$', log_output, flags=re.MULTILINE)
    
    current_test = None
    capture_next = False
    
    for line in log_output.splitlines():
        # Identify Test Case Name
        if line.startswith("test_") or ("::test_" in line):
            parts = line.split()
            if "FAILED" in line or "ERROR" in line:
                current_test = {
                    "test_name": parts[0],
                    "status": "FAILED" if "FAILED" in line else "ERROR",
                    "error_type": "Unknown",
                    "stack_trace": [],
                    "error_message": "",
                    "file_path": "",
                    "line_no": 0
                }
                
        # Capture File and Line Number (e.g., /path/to/file.py:123)
        file_match = re.search(r'(\/[\w\/\-_\.]+):(\d+):', line)
        if file_match and current_test:
            current_test["file_path"] = file_match.group(1)
            current_test["line_no"] = file_match.group(2)

        # Capture Error Type (e.g., ValueError, AssertionError)
        error_match = re.match(r'(.*Error|.*Exception)', line)
        if error_match and current_test:
            current_test["error_type"] = error_match.group(1)

        # Capture Stack Trace and Error Message
        # We assume the relevant context follows the failure header
        if current_test:
            current_test["stack_trace"].append(line)
            
            # Capture the specific assertion message if available
            if "AssertionError:" in line:
                current_test["error_message"] = line.split("AssertionError:")[-1].strip()
            elif "Error:" in line:
                current_test["error_message"] = line.split("Error:")[-1].strip()

        # End of a test block logic (simplified for this script)
        if line.startswith("=") and current_test:
            failure_data.append(current_test)
            current_test = None

    return failure_data

def main():
    # Configuration: Adjust these paths as needed for the Geometry OS structure
    PARSER_TEST_PATH = "tests/parser/" 
    OUTPUT_REPORT = "logs/parser_failure_report.json"
    
    # Ensure logs directory exists
    Path("logs").mkdir(exist_ok=True)

    # 1. Run Tests
    raw_logs = run_tests_and_capture_output(PARSER_TEST_PATH)
    
    # 2. Analyze Logs
    failures = parse_failures(raw_logs)
    
    # 3. Generate Report
    report = {
        "timestamp": datetime.now().isoformat(),
        "total_failures": len(failures),
        "failures": failures
    }
    
    with open(OUTPUT_REPORT, "w") as f:
        json.dump(report, f, indent=4)
        
    print(f"\n--- Investigation Complete ---")
    print(f"Found {len(failures)} specific failure patterns.")
    print(f"Detailed report saved to: {OUTPUT_REPORT}")

if __name__ == "__main__":
    main()
```

### 3. Next Step

To proceed with **Task 1**, run the following command in your terminal to generate the failure analysis report:

```bash
python scripts/investigate_parser_failures.py
```