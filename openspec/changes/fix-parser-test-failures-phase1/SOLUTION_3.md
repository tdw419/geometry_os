# Solution for Task: **Task 1**: Investigate failing parser unit tests by examining logs, error messages from failed execution suite outputs in ProjectParser module including stack traces assertion errors and exception handling scenarios that prevent successful test completion during automated regression runs to identify specific failure points causing each Parser-related broken scenario.

Based on the **OpenSpec** provided for `fix-parser-test-failures-phase1`, the objective is to perform a systematic investigation (Phase I) rather than implementing the final fixes. The goal is to automate the extraction of failure reasons from the test logs.

Here is the implementation plan to execute this investigation phase using Python.

### 1. File Paths

*   **`scripts/investigate_parser_failures.py`** (New file)
    *   This script will parse the test execution logs (e.g., from `pytest` or standard output) to categorize failures and identify the specific assertion errors or stack traces involved.

### 2. Code Implementation

This script assumes you have access to the test execution output (either redirected to a file or piped in). It uses Regex to isolate stack traces and error messages.

**File: `scripts/investigate_parser_failures.py`**

```python
import re
import sys
from pathlib import Path
from collections import defaultdict

def parse_test_log(log_content):
    """
    Parses a test log file to extract specific failure points 
    in the ProjectParser module.
    """
    # Regex patterns for common Python test failures (pytest/unittest)
    # Captures: Test File, Test Name, Error Line, and Error Message
    failure_pattern = re.compile(
        r"FAIL(?:URE)?: (.*?::.*?)\n"
        r".*?"  # Skip traceback headers
        r"File \"(.*?)\", line (\d+), in .*?\n"
        r".*?"
        r"(?:AssertionError|Exception|Error): (.*?)\n",
        re.DOTALL
    )

    # Specific pattern for ProjectParser stack traces
    traceback_pattern = re.compile(
        r"File \"(.*?/project_parser\.py)\", line (\d+), in (\w+)"
    )

    findings = defaultdict(list)

    matches = failure_pattern.finditer(log_content)
    
    for match in matches:
        test_id = match.group(1)
        file_path = match.group(2)
        line_no = match.group(3)
        error_msg = match.group(4).strip()

        # Filter for ProjectParser specific issues
        if "project_parser" in file_path.lower() or "ProjectParser" in test_id:
            findings[test_id].append({
                "file": file_path,
                "line": line_no,
                "error": error_msg,
                "context": "ProjectParser_Impact"
            })

    # Secondary scan for raw stack traces mentioning ProjectParser
    for match in traceback_pattern.finditer(log_content):
        findings["Raw_Trace"].append({
            "file": match.group(1),
            "line": match.group(2),
            "function": match.group(3)
        })

    return findings

def generate_report(findings):
    report = []
    report.append("# Investigation Report: Phase I - Parser Failures\n")
    report.append(f"Total Scenarios Analyzed: {len(findings)}\n")
    
    for test_name, details in findings.items():
        report.append(f"\n## Failure Point: {test_name}")
        for detail in details:
            report.append(f" - Location: {detail.get('file')}:{detail.get('line')}")
            report.append(f" - Issue: {detail.get('error', 'Unknown Exception')}")
            
    return "\n".join(report)

if __name__ == "__main__":
    # Expecting log path as argument or stdin
    if len(sys.argv) > 1:
        log_path = Path(sys.argv[1])
        if not log_path.exists():
            print(f"Error: Log file not found at {log_path}")
            sys.exit(1)
        content = log_path.read_text()
    else:
        content = sys.stdin.read()

    if not content.strip():
        print("No input provided. Please pipe a log file or provide a path.")
        sys.exit(1)

    analysis = parse_test_log(content)
    report = generate_report(analysis)
    
    print(report)
    
    # Optional: Save report to disk
    # Path("parser_phase1_report.md").write_text(report)
```

### 3. Next Step

To execute the investigation and generate the report, run the following command in your terminal. You will need the output log from your failing test suite.

**If you have a log file (e.g., `test_failures.log`):**
```bash
python scripts/investigate_parser_failures.py test_failures.log
```

**If you want to run the tests and pipe the output directly:**
```bash
pytest tests/project_parser_tests.py -v 2>&1 | python scripts/investigate_parser_failures.py
```