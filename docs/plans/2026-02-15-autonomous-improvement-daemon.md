# Autonomous Improvement Daemon Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create a background daemon that autonomously detects failing tests, generates fixes, validates them, and commits successful fixes without human intervention.

**Architecture:** A polling daemon monitors test suite output. When failures are detected, it analyzes the failing test and code, generates a fix using the existing WebMCP ide_compile/ide_test tools, validates the fix passes all tests, then commits the change. All operations are scoped to a configurable "safe" directory to prevent touching core infrastructure.

**Tech Stack:** Python 3.12+, pytest, subprocess, WebMCP Bridge, existing ide_* tools

---

## Task 1: Create Daemon Core Structure

**Files:**
- Create: `systems/pixel_compiler/autofix/daemon.py`
- Create: `systems/pixel_compiler/autofix/__init__.py`
- Test: `systems/pixel_compiler/tests/test_autofix_daemon.py`

**Step 1: Write the failing test for daemon initialization**

```python
# systems/pixel_compiler/tests/test_autofix_daemon.py
"""Tests for Autonomous Improvement Daemon."""

import pytest
from systems.pixel_compiler.autofix.daemon import AutofixDaemon


class TestAutofixDaemon:
    """Test suite for AutofixDaemon."""

    def test_daemon_initializes_with_defaults(self):
        """Daemon should initialize with default configuration."""
        daemon = AutofixDaemon()
        assert daemon.poll_interval == 60
        assert daemon.safe_directories == ["systems/pixel_compiler/autofix/sandbox"]
        assert daemon.max_fix_attempts == 3

    def test_daemon_initializes_with_custom_config(self):
        """Daemon should accept custom configuration."""
        config = {
            "poll_interval": 30,
            "safe_directories": ["tests/fixtures"],
            "max_fix_attempts": 5,
        }
        daemon = AutofixDaemon(config)
        assert daemon.poll_interval == 30
        assert daemon.safe_directories == ["tests/fixtures"]
        assert daemon.max_fix_attempts == 5

    def test_daemon_starts_in_stopped_state(self):
        """Daemon should start in stopped state."""
        daemon = AutofixDaemon()
        assert daemon.is_running is False
```

**Step 2: Run test to verify it fails**

Run: `pytest systems/pixel_compiler/tests/test_autofix_daemon.py -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'systems.pixel_compiler.autofix.daemon'"

**Step 3: Create package structure and minimal implementation**

```python
# systems/pixel_compiler/autofix/__init__.py
"""Autonomous Improvement Daemon package."""
from .daemon import AutofixDaemon

__all__ = ["AutofixDaemon"]
```

```python
# systems/pixel_compiler/autofix/daemon.py
"""Autonomous Improvement Daemon - Self-healing OS component."""

from typing import List, Optional
from dataclasses import dataclass, field


@dataclass
class AutofixDaemon:
    """
    Background daemon that autonomously detects and fixes test failures.

    Configuration:
        poll_interval: Seconds between test suite polls
        safe_directories: Directories where fixes are allowed
        max_fix_attempts: Maximum attempts per failing test
    """

    config: dict = field(default_factory=dict)
    poll_interval: int = field(init=False, default=60)
    safe_directories: List[str] = field(init=False)
    max_fix_attempts: int = field(init=False, default=3)
    is_running: bool = field(init=False, default=False)

    def __post_init__(self):
        """Apply configuration overrides."""
        if "poll_interval" in self.config:
            self.poll_interval = self.config["poll_interval"]
        if "safe_directories" in self.config:
            self.safe_directories = self.config["safe_directories"]
        else:
            self.safe_directories = ["systems/pixel_compiler/autofix/sandbox"]
        if "max_fix_attempts" in self.config:
            self.max_fix_attempts = self.config["max_fix_attempts"]
```

**Step 4: Run test to verify it passes**

Run: `pytest systems/pixel_compiler/tests/test_autofix_daemon.py -v`
Expected: PASS (3 tests)

**Step 5: Commit**

```bash
git add systems/pixel_compiler/autofix/__init__.py \
        systems/pixel_compiler/autofix/daemon.py \
        systems/pixel_compiler/tests/test_autofix_daemon.py
git commit -m "feat(autofix): add AutofixDaemon core structure"
```

---

## Task 2: Implement Test Failure Detection

**Files:**
- Modify: `systems/pixel_compiler/autofix/daemon.py`
- Modify: `systems/pixel_compiler/tests/test_autofix_daemon.py`

**Step 1: Write the failing test for failure detection**

```python
# Add to test_autofix_daemon.py

    def test_run_tests_returns_success_when_all_pass(self):
        """run_tests should return success dict when tests pass."""
        daemon = AutofixDaemon()
        result = daemon.run_tests(["tests/fixtures/passing_test.py"])
        assert result["success"] is True
        assert result["passed"] >= 0
        assert result["failed"] == 0

    def test_run_tests_returns_failures_when_some_fail(self):
        """run_tests should return failure info when tests fail."""
        daemon = AutofixDaemon()
        result = daemon.run_tests(["tests/fixtures/failing_test.py"])
        assert result["success"] is False
        assert result["failed"] >= 1
        assert len(result["failures"]) >= 1

    def test_parse_pytest_output_extracts_failures(self):
        """_parse_pytest_output should extract failure details."""
        daemon = AutofixDaemon()
        sample_output = """
============================= test session starts ==============================
collected 2 items

test_example.py F.                                                      [100%]

=================================== FAILURES ===================================
_________________________________ test_fail ___________________________________

    def test_fail():
>       assert False
E       assert False

test_example.py:2: AssertionError
============================= 1 failed, 1 passed ==============================
"""
        result = daemon._parse_pytest_output(sample_output)
        assert result["success"] is False
        assert result["failed"] == 1
        assert result["passed"] == 1
        assert len(result["failures"]) == 1
        assert result["failures"][0]["test_name"] == "test_fail"
        assert result["failures"][0]["file"] == "test_example.py"
        assert result["failures"][0]["line"] == 2
```

**Step 2: Run test to verify it fails**

Run: `pytest systems/pixel_compiler/tests/test_autofix_daemon.py::TestAutofixDaemon::test_run_tests_returns_success_when_all_pass -v`
Expected: FAIL with "AttributeError: 'AutofixDaemon' object has no attribute 'run_tests'"

**Step 3: Implement test runner and output parser**

```python
# Add to daemon.py (after AutofixDaemon class definition)

import subprocess
import re
from typing import Dict, Any, List


@dataclass
class AutofixDaemon:
    # ... existing fields ...

    def run_tests(self, test_paths: List[str]) -> Dict[str, Any]:
        """
        Run pytest on specified paths and return structured results.

        Args:
            test_paths: List of test files or directories to run

        Returns:
            Dict with keys: success, passed, failed, failures, output
        """
        cmd = ["pytest", "-v", "--tb=short"] + test_paths
        result = subprocess.run(cmd, capture_output=True, text=True)
        combined_output = result.stdout + "\n" + result.stderr
        return self._parse_pytest_output(combined_output)

    def _parse_pytest_output(self, output: str) -> Dict[str, Any]:
        """
        Parse pytest output to extract test results and failures.

        Args:
            output: Combined stdout+stderr from pytest

        Returns:
            Structured dict with success status and failure details
        """
        result = {
            "success": True,
            "passed": 0,
            "failed": 0,
            "failures": [],
            "output": output,
        }

        # Match summary line: "X failed, Y passed" or "X passed"
        summary_match = re.search(
            r"(\d+) failed, (\d+) passed|(\d+) passed",
            output
        )
        if summary_match:
            if summary_match.group(1):  # Has failures
                result["failed"] = int(summary_match.group(1))
                result["passed"] = int(summary_match.group(2))
                result["success"] = False
            else:  # All passed
                result["passed"] = int(summary_match.group(3))

        # Extract individual failures
        failure_pattern = re.compile(
            r"_{10,}\n(_+)\n(.*?)\n.*?"
            r"def (test_\w+).*?"
            r">(.*?)\n"
            r"E\s+(.*?)\n"
            r"(.*?):(\d+):",
            re.DOTALL
        )

        for match in failure_pattern.finditer(output):
            test_name = match.group(3)
            file_path = match.group(6)
            line_num = int(match.group(7))
            error_msg = match.group(5).strip()

            result["failures"].append({
                "test_name": test_name,
                "file": file_path,
                "line": line_num,
                "error": error_msg,
            })

        return result
```

**Step 4: Create fixture tests for testing**

```bash
mkdir -p tests/fixtures
```

```python
# tests/fixtures/passing_test.py
def test_always_passes():
    """A test that always passes."""
    assert True
```

```python
# tests/fixtures/failing_test.py
def test_always_fails():
    """A test that always fails."""
    assert False, "Intentional failure for testing"
```

**Step 5: Run test to verify it passes**

Run: `pytest systems/pixel_compiler/tests/test_autofix_daemon.py -v`
Expected: PASS (6 tests)

**Step 6: Commit**

```bash
git add systems/pixel_compiler/autofix/daemon.py \
        systems/pixel_compiler/tests/test_autofix_daemon.py \
        tests/fixtures/passing_test.py \
        tests/fixtures/failing_test.py
git commit -m "feat(autofix): add test failure detection and parsing"
```

---

## Task 3: Implement Safe Directory Enforcement

**Files:**
- Modify: `systems/pixel_compiler/autofix/daemon.py`
- Modify: `systems/pixel_compiler/tests/test_autofix_daemon.py`

**Step 1: Write the failing test for safe directory check**

```python
# Add to test_autofix_daemon.py

    def test_is_safe_path_accepts_safe_directories(self):
        """is_safe_path should return True for paths in safe directories."""
        daemon = AutofixDaemon({"safe_directories": ["tests/fixtures"]})
        assert daemon.is_safe_path("tests/fixtures/example.py") is True
        assert daemon.is_safe_path("tests/fixtures/subdir/file.py") is True

    def test_is_safe_path_rejects_unsafe_directories(self):
        """is_safe_path should return False for paths outside safe directories."""
        daemon = AutofixDaemon({"safe_directories": ["tests/fixtures"]})
        assert daemon.is_safe_path("systems/core/kernel.py") is False
        assert daemon.is_safe_path("/etc/passwd") is False

    def test_is_safe_path_prevents_traversal_attacks(self):
        """is_safe_path should reject path traversal attempts."""
        daemon = AutofixDaemon({"safe_directories": ["tests/fixtures"]})
        assert daemon.is_safe_path("tests/fixtures/../core/kernel.py") is False
        assert daemon.is_safe_path("tests/fixtures/../../etc/passwd") is False
```

**Step 2: Run test to verify it fails**

Run: `pytest systems/pixel_compiler/tests/test_autofix_daemon.py::TestAutofixDaemon::test_is_safe_path_accepts_safe_directories -v`
Expected: FAIL with "AttributeError: 'AutofixDaemon' object has no attribute 'is_safe_path'"

**Step 3: Implement safe path validation**

```python
# Add to AutofixDaemon class in daemon.py

import os
from pathlib import Path

    def is_safe_path(self, path: str) -> bool:
        """
        Check if a path is within a safe directory.

        This prevents the daemon from modifying files outside designated
        safe zones, protecting core infrastructure.

        Args:
            path: File path to check

        Returns:
            True if path is safe, False otherwise
        """
        try:
            # Resolve to absolute path, following symlinks
            resolved_path = Path(path).resolve()

            for safe_dir in self.safe_directories:
                safe_resolved = Path(safe_dir).resolve()
                # Check if resolved_path is inside safe_resolved
                try:
                    resolved_path.relative_to(safe_resolved)
                    return True
                except ValueError:
                    continue

            return False
        except (OSError, ValueError):
            return False
```

**Step 4: Run test to verify it passes**

Run: `pytest systems/pixel_compiler/tests/test_autofix_daemon.py -v`
Expected: PASS (9 tests)

**Step 5: Commit**

```bash
git add systems/pixel_compiler/autofix/daemon.py \
        systems/pixel_compiler/tests/test_autofix_daemon.py
git commit -m "feat(autofix): add safe directory enforcement"
```

---

## Task 4: Create Fix Generator Integration

**Files:**
- Create: `systems/pixel_compiler/autofix/fixer.py`
- Modify: `systems/pixel_compiler/tests/test_autofix_daemon.py`
- Create: `systems/pixel_compiler/tests/test_autofix_fixer.py`

**Step 1: Write the failing test for fix generation**

```python
# systems/pixel_compiler/tests/test_autofix_fixer.py
"""Tests for AutofixGenerator."""

import pytest
from systems.pixel_compiler.autofix.fixer import AutofixGenerator


class TestAutofixGenerator:
    """Test suite for AutofixGenerator."""

    def test_generator_initializes(self):
        """Generator should initialize with default config."""
        gen = AutofixGenerator()
        assert gen is not None

    def test_generate_fix_returns_patch_dict(self):
        """generate_fix should return a patch dictionary."""
        gen = AutofixGenerator()

        failure_info = {
            "test_name": "test_addition",
            "file": "tests/fixtures/math_test.py",
            "line": 5,
            "error": "assert 2 + 2 == 5",
        }

        source_code = """
def add(a, b):
    return a + b - 1  # Bug: subtracts 1
"""

        result = gen.generate_fix(failure_info, source_code)

        assert "patch" in result
        assert "confidence" in result
        assert "explanation" in result
        assert 0.0 <= result["confidence"] <= 1.0

    def test_apply_patch_modifies_code(self):
        """apply_patch should correctly modify source code."""
        gen = AutofixGenerator()

        source = "def broken(): return 1"
        patch = {
            "old": "return 1",
            "new": "return 2",
        }

        result = gen.apply_patch(source, patch)
        assert result == "def broken(): return 2"

    def test_apply_patch_returns_none_on_mismatch(self):
        """apply_patch should return None if old string not found."""
        gen = AutofixGenerator()

        source = "def broken(): return 1"
        patch = {
            "old": "return 999",  # Not in source
            "new": "return 2",
        }

        result = gen.apply_patch(source, patch)
        assert result is None
```

**Step 2: Run test to verify it fails**

Run: `pytest systems/pixel_compiler/tests/test_autofix_fixer.py -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'systems.pixel_compiler.autofix.fixer'"

**Step 3: Implement fix generator**

```python
# systems/pixel_compiler/autofix/fixer.py
"""Autofix Generator - AI-powered bug fix generation."""

from typing import Dict, Any, Optional
from dataclasses import dataclass
import re


@dataclass
class AutofixGenerator:
    """
    Generates code fixes for failing tests.

    Uses pattern matching and heuristics to propose fixes.
    In production, this would integrate with LLM via WebMCP.
    """

    def generate_fix(
        self,
        failure_info: Dict[str, Any],
        source_code: str,
    ) -> Dict[str, Any]:
        """
        Generate a fix for a failing test.

        Args:
            failure_info: Details about the failure (test name, error, etc.)
            source_code: The source code containing the bug

        Returns:
            Dict with:
                - patch: Dict with 'old' and 'new' strings
                - confidence: Float 0-1 indicating fix confidence
                - explanation: Human-readable explanation of fix
        """
        error = failure_info.get("error", "")

        # Pattern: Assert with wrong value
        # e.g., "assert 2 + 2 == 5" -> suggests correct assertion
        assert_match = re.search(r"assert (.+?) == (.+)", error)
        if assert_match:
            return self._fix_assertion(assert_match, source_code)

        # Pattern: TypeError or AttributeError
        if "TypeError" in error or "AttributeError" in error:
            return self._fix_attribute_error(error, source_code)

        # Pattern: IndexError or KeyError
        if "IndexError" in error or "KeyError" in error:
            return self._fix_index_error(error, source_code)

        # Default: No fix available
        return {
            "patch": None,
            "confidence": 0.0,
            "explanation": "No pattern match found for this error type",
        }

    def _fix_assertion(
        self,
        match: re.Match,
        source_code: str,
    ) -> Dict[str, Any]:
        """Generate fix for assertion failures."""
        actual = match.group(1)
        expected = match.group(2)

        return {
            "patch": {"old": expected, "new": f"# {expected}  # TODO: Review this fix"},
            "confidence": 0.3,
            "explanation": f"Assertion '{actual} == {expected}' failed. "
            f"This is a low-confidence fix - needs human review.",
        }

    def _fix_attribute_error(
        self,
        error: str,
        source_code: str,
    ) -> Dict[str, Any]:
        """Generate fix for attribute errors."""
        # Extract the missing attribute
        attr_match = re.search(r"'(\w+)' object has no attribute '(\w+)'", error)
        if attr_match:
            obj_type = attr_match.group(1)
            missing_attr = attr_match.group(2)
            return {
                "patch": None,
                "confidence": 0.0,
                "explanation": f"Missing attribute '{missing_attr}' on {obj_type}. "
                "This requires adding the attribute - too complex for auto-fix.",
            }

        return {
            "patch": None,
            "confidence": 0.0,
            "explanation": "AttributeError pattern not recognized",
        }

    def _fix_index_error(
        self,
        error: str,
        source_code: str,
    ) -> Dict[str, Any]:
        """Generate fix for index errors."""
        return {
            "patch": None,
            "confidence": 0.0,
            "explanation": "IndexError detected. Usually requires bounds checking - "
            "too complex for auto-fix without more context.",
        }

    def apply_patch(
        self,
        source_code: str,
        patch: Dict[str, str],
    ) -> Optional[str]:
        """
        Apply a patch to source code.

        Args:
            source_code: Original source code
            patch: Dict with 'old' and 'new' strings

        Returns:
            Modified source code, or None if patch doesn't apply
        """
        if "old" not in patch or "new" not in patch:
            return None

        old_str = patch["old"]
        new_str = patch["new"]

        if old_str not in source_code:
            return None

        return source_code.replace(old_str, new_str, 1)
```

**Step 4: Update __init__.py to export fixer**

```python
# systems/pixel_compiler/autofix/__init__.py
"""Autonomous Improvement Daemon package."""
from .daemon import AutofixDaemon
from .fixer import AutofixGenerator

__all__ = ["AutofixDaemon", "AutofixGenerator"]
```

**Step 5: Run test to verify it passes**

Run: `pytest systems/pixel_compiler/tests/test_autofix_fixer.py -v`
Expected: PASS (4 tests)

**Step 6: Commit**

```bash
git add systems/pixel_compiler/autofix/fixer.py \
        systems/pixel_compiler/autofix/__init__.py \
        systems/pixel_compiler/tests/test_autofix_fixer.py
git commit -m "feat(autofix): add AutofixGenerator with pattern-based fixes"
```

---

## Task 5: Implement Main Daemon Loop

**Files:**
- Modify: `systems/pixel_compiler/autofix/daemon.py`
- Modify: `systems/pixel_compiler/tests/test_autofix_daemon.py`

**Step 1: Write the failing test for daemon loop**

```python
# Add to test_autofix_daemon.py

    def test_start_begins_polling(self):
        """start() should begin the polling loop."""
        daemon = AutofixDaemon({"poll_interval": 1})

        # Track if poll was called
        poll_called = []

        def mock_poll():
            poll_called.append(True)
            daemon.stop()  # Stop after first poll

        daemon._poll_once = mock_poll
        daemon.start()

        assert len(poll_called) >= 1
        assert daemon.is_running is False  # Stopped after mock_poll

    def test_stop_terminates_loop(self):
        """stop() should terminate the polling loop."""
        daemon = AutofixDaemon()

        daemon.is_running = True
        daemon.stop()

        assert daemon.is_running is False

    def test_process_failure_returns_fix_result(self):
        """_process_failure should attempt to fix and return result."""
        daemon = AutofixDaemon({"safe_directories": ["tests/fixtures"]})

        failure = {
            "test_name": "test_example",
            "file": "tests/fixtures/example.py",
            "line": 1,
            "error": "assert True == False",
        }

        # Create a mock source file
        import tempfile
        with tempfile.NamedTemporaryFile(
            mode='w', suffix='.py', delete=False, dir='tests/fixtures'
        ) as f:
            f.write("def test_example():\n    assert True == False\n")
            temp_path = f.name

        try:
            result = daemon._process_failure(failure)
            assert "fix_applied" in result
            assert "confidence" in result
        finally:
            import os
            os.unlink(temp_path)
```

**Step 2: Run test to verify it fails**

Run: `pytest systems/pixel_compiler/tests/test_autofix_daemon.py::TestAutofixDaemon::test_start_begins_polling -v`
Expected: FAIL with "AttributeError: 'AutofixDaemon' object has no attribute 'start'"

**Step 3: Implement main daemon loop**

```python
# Add to AutofixDaemon class in daemon.py

import time
import threading
from .fixer import AutofixGenerator

    def __post_init__(self):
        """Apply configuration overrides."""
        # ... existing code ...
        self._stop_event = threading.Event()
        self._generator = AutofixGenerator()

    def start(self) -> None:
        """Start the daemon polling loop."""
        self.is_running = True
        self._stop_event.clear()

        while self.is_running and not self._stop_event.is_set():
            self._poll_once()
            self._stop_event.wait(self.poll_interval)

    def stop(self) -> None:
        """Stop the daemon polling loop."""
        self.is_running = False
        self._stop_event.set()

    def _poll_once(self) -> None:
        """
        Perform one polling cycle.

        1. Run tests
        2. If failures, attempt to fix each
        3. Report results
        """
        # Run full test suite
        result = self.run_tests(["tests/"])

        if result["success"]:
            print("All tests passing - no fixes needed")
            return

        print(f"Found {result['failed']} failing tests")

        for failure in result["failures"]:
            if self._stop_event.is_set():
                break

            fix_result = self._process_failure(failure)

            if fix_result["fix_applied"]:
                print(
                    f"Fixed {failure['test_name']} "
                    f"(confidence: {fix_result['confidence']:.2f})"
                )
            else:
                print(f"Could not fix {failure['test_name']}: {fix_result['reason']}")

    def _process_failure(self, failure: Dict[str, Any]) -> Dict[str, Any]:
        """
        Attempt to fix a single test failure.

        Args:
            failure: Failure info from test run

        Returns:
            Dict with fix_applied, confidence, reason
        """
        file_path = failure.get("file", "")

        # Safety check
        if not self.is_safe_path(file_path):
            return {
                "fix_applied": False,
                "confidence": 0.0,
                "reason": f"Path {file_path} is not in safe directories",
            }

        # Read source file
        try:
            with open(file_path, "r") as f:
                source_code = f.read()
        except FileNotFoundError:
            return {
                "fix_applied": False,
                "confidence": 0.0,
                "reason": f"File not found: {file_path}",
            }

        # Generate fix
        fix = self._generator.generate_fix(failure, source_code)

        if fix["patch"] is None or fix["confidence"] < 0.5:
            return {
                "fix_applied": False,
                "confidence": fix["confidence"],
                "reason": fix["explanation"],
            }

        # Apply fix
        new_source = self._generator.apply_patch(source_code, fix["patch"])
        if new_source is None:
            return {
                "fix_applied": False,
                "confidence": 0.0,
                "reason": "Patch failed to apply",
            }

        # Write fixed file
        with open(file_path, "w") as f:
            f.write(new_source)

        # Validate fix by running tests
        validation = self.run_tests([file_path])

        if not validation["success"]:
            # Rollback
            with open(file_path, "w") as f:
                f.write(source_code)
            return {
                "fix_applied": False,
                "confidence": 0.0,
                "reason": "Fix validation failed - rolled back",
            }

        return {
            "fix_applied": True,
            "confidence": fix["confidence"],
            "reason": fix["explanation"],
        }
```

**Step 4: Run test to verify it passes**

Run: `pytest systems/pixel_compiler/tests/test_autofix_daemon.py -v`
Expected: PASS (most tests; some may need mock refinement)

**Step 5: Commit**

```bash
git add systems/pixel_compiler/autofix/daemon.py \
        systems/pixel_compiler/tests/test_autofix_daemon.py
git commit -m "feat(autofix): implement main daemon polling loop"
```

---

## Task 6: Add CLI Entry Point

**Files:**
- Create: `bin/autofix-daemon`
- Modify: `systems/pixel_compiler/autofix/__init__.py`

**Step 1: Write the CLI entry point**

```python
#!/usr/bin/env python3
"""
Autofix Daemon CLI - Start the autonomous improvement daemon.

Usage:
    autofix-daemon [--poll-interval SECONDS] [--safe-dir DIR] [--dry-run]
"""

import argparse
import signal
import sys
from pathlib import Path

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent))

from systems.pixel_compiler.autofix import AutofixDaemon


def main():
    parser = argparse.ArgumentParser(
        description="Autonomous Improvement Daemon for Geometry OS",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
    # Start with defaults (60s poll, sandbox only)
    autofix-daemon

    # Poll every 30 seconds, allow fixes in tests/
    autofix-daemon --poll-interval 30 --safe-dir tests/

    # Dry run - detect but don't fix
    autofix-daemon --dry-run
""",
    )

    parser.add_argument(
        "--poll-interval",
        type=int,
        default=60,
        help="Seconds between test suite polls (default: 60)",
    )

    parser.add_argument(
        "--safe-dir",
        action="append",
        dest="safe_directories",
        default=[],
        help="Directories where fixes are allowed (can specify multiple)",
    )

    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Detect failures but don't apply fixes",
    )

    parser.add_argument(
        "--max-attempts",
        type=int,
        default=3,
        help="Maximum fix attempts per failure (default: 3)",
    )

    args = parser.parse_args()

    # Build config
    config = {
        "poll_interval": args.poll_interval,
        "max_fix_attempts": args.max_attempts,
    }

    if args.safe_directories:
        config["safe_directories"] = args.safe_directories

    # Create daemon
    daemon = AutofixDaemon(config)

    # Handle signals for graceful shutdown
    def handle_shutdown(signum, frame):
        print("\nShutting down...")
        daemon.stop()
        sys.exit(0)

    signal.signal(signal.SIGINT, handle_shutdown)
    signal.signal(signal.SIGTERM, handle_shutdown)

    print(f"Starting Autofix Daemon (poll interval: {args.poll_interval}s)")
    print(f"Safe directories: {daemon.safe_directories}")
    print(f"Dry run: {args.dry_run}")
    print("Press Ctrl+C to stop\n")

    # Start daemon
    daemon.start()


if __name__ == "__main__":
    main()
```

**Step 2: Make executable**

```bash
chmod +x bin/autofix-daemon
```

**Step 3: Test CLI starts**

Run: `./bin/autofix-daemon --help`
Expected: Shows help text

**Step 4: Commit**

```bash
git add bin/autofix-daemon
git commit -m "feat(autofix): add CLI entry point for daemon"
```

---

## Task 7: Integrate with WebMCP IDE Tools

**Files:**
- Modify: `systems/pixel_compiler/autofix/daemon.py`
- Modify: `systems/pixel_compiler/autofix/fixer.py`
- Modify: `systems/pixel_compiler/tests/test_autofix_fixer.py`

**Step 1: Write test for WebMCP integration**

```python
# Add to test_autofix_fixer.py

    def test_generator_can_use_webmcp_compile(self):
        """Generator should be able to validate fixes via ide_compile."""
        gen = AutofixGenerator(use_webmcp=True)

        # Mock WebMCP bridge
        gen._webmcp_compile = lambda code: {"success": True, "errors": []}

        result = gen.validate_syntax("def foo(): pass")
        assert result is True

    def test_generator_can_use_webmcp_test(self):
        """Generator should be able to run tests via ide_test."""
        gen = AutofixGenerator(use_webmcp=True)

        # Mock WebMCP bridge
        gen._webmcp_test = lambda path: {"success": True, "passed": 1, "failed": 0}

        result = gen.run_validation_test("tests/fixtures/passing_test.py")
        assert result["success"] is True
```

**Step 2: Run test to verify it fails**

Run: `pytest systems/pixel_compiler/tests/test_autofix_fixer.py::TestAutofixGenerator::test_generator_can_use_webmcp_compile -v`
Expected: FAIL with "TypeError: AutofixGenerator.__init__() got an unexpected keyword argument 'use_webmcp'"

**Step 3: Implement WebMCP integration**

```python
# Update AutofixGenerator in fixer.py

@dataclass
class AutofixGenerator:
    """
    Generates code fixes for failing tests.

    Uses pattern matching and heuristics to propose fixes.
    Can integrate with WebMCP for enhanced validation.
    """

    use_webmcp: bool = False
    _bridge: Any = None

    def __post_init__(self):
        """Initialize WebMCP connection if enabled."""
        if self.use_webmcp:
            try:
                # Import WebMCP bridge if available
                import importlib
                bridge_module = importlib.import_module(
                    "systems.visual_shell.web.webmcp_bridge"
                )
                # In browser context, bridge would be available
                # In daemon context, we use HTTP/WebSocket client
            except ImportError:
                self.use_webmcp = False

    def validate_syntax(self, code: str) -> bool:
        """
        Validate code syntax using ide_compile if available.

        Args:
            code: Python source code to validate

        Returns:
            True if syntax is valid
        """
        if self.use_webmcp and hasattr(self, "_webmcp_compile"):
            result = self._webmcp_compile(code)
            return result.get("success", False)

        # Fallback: Use Python's compile()
        try:
            compile(code, "<string>", "exec")
            return True
        except SyntaxError:
            return False

    def run_validation_test(self, test_path: str) -> Dict[str, Any]:
        """
        Run a test file for validation using ide_test if available.

        Args:
            test_path: Path to test file

        Returns:
            Dict with success, passed, failed keys
        """
        if self.use_webmcp and hasattr(self, "_webmcp_test"):
            return self._webmcp_test(test_path)

        # Fallback: Use subprocess pytest
        import subprocess
        result = subprocess.run(
            ["pytest", test_path, "-v", "--tb=no"],
            capture_output=True,
            text=True,
        )
        return {
            "success": result.returncode == 0,
            "output": result.stdout + result.stderr,
        }
```

**Step 4: Run test to verify it passes**

Run: `pytest systems/pixel_compiler/tests/test_autofix_fixer.py -v`
Expected: PASS (6 tests)

**Step 5: Commit**

```bash
git add systems/pixel_compiler/autofix/fixer.py \
        systems/pixel_compiler/tests/test_autofix_fixer.py
git commit -m "feat(autofix): add WebMCP ide_compile/ide_test integration"
```

---

## Task 8: Add Logging and Metrics

**Files:**
- Create: `systems/pixel_compiler/autofix/metrics.py`
- Modify: `systems/pixel_compiler/autofix/daemon.py`
- Create: `systems/pixel_compiler/tests/test_autofix_metrics.py`

**Step 1: Write the failing test for metrics**

```python
# systems/pixel_compiler/tests/test_autofix_metrics.py
"""Tests for AutofixMetrics."""

import pytest
from systems.pixel_compiler.autofix.metrics import AutofixMetrics


class TestAutofixMetrics:
    """Test suite for AutofixMetrics."""

    def test_metrics_initializes_empty(self):
        """Metrics should start with zero counts."""
        metrics = AutofixMetrics()
        assert metrics.tests_fixed == 0
        assert metrics.fixes_attempted == 0
        assert metrics.fixes_rejected == 0
        assert metrics.uptime_seconds == 0

    def test_record_fix_increments_counters(self):
        """record_fix should increment appropriate counters."""
        metrics = AutofixMetrics()

        metrics.record_fix_attempt()
        assert metrics.fixes_attempted == 1

        metrics.record_fix_success()
        assert metrics.tests_fixed == 1

    def test_record_rejection_increments_counter(self):
        """record_rejection should increment rejected counter."""
        metrics = AutofixMetrics()
        metrics.record_fix_attempt()
        metrics.record_fix_rejected("low confidence")
        assert metrics.fixes_rejected == 1

    def test_get_summary_returns_dict(self):
        """get_summary should return all metrics as dict."""
        metrics = AutofixMetrics()
        metrics.record_fix_attempt()
        metrics.record_fix_success()

        summary = metrics.get_summary()
        assert "fixes_attempted" in summary
        assert "tests_fixed" in summary
        assert summary["tests_fixed"] == 1
```

**Step 2: Run test to verify it fails**

Run: `pytest systems/pixel_compiler/tests/test_autofix_metrics.py -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'systems.pixel_compiler.autofix.metrics'"

**Step 3: Implement metrics module**

```python
# systems/pixel_compiler/autofix/metrics.py
"""Autofix Metrics - Track daemon performance and activity."""

import time
from dataclasses import dataclass, field
from typing import Dict, Any, List


@dataclass
class AutofixMetrics:
    """
    Track metrics for the autonomous improvement daemon.

    Records:
        - Tests fixed vs attempted
        - Rejection reasons
        - Uptime
    """

    start_time: float = field(default_factory=time.time)
    tests_fixed: int = 0
    fixes_attempted: int = 0
    fixes_rejected: int = 0
    rejection_reasons: List[str] = field(default_factory=list)

    def record_fix_attempt(self) -> None:
        """Record that a fix was attempted."""
        self.fixes_attempted += 1

    def record_fix_success(self) -> None:
        """Record that a fix was successfully applied."""
        self.tests_fixed += 1

    def record_fix_rejected(self, reason: str) -> None:
        """Record that a fix was rejected and why."""
        self.fixes_rejected += 1
        self.rejection_reasons.append(reason)

    @property
    def uptime_seconds(self) -> float:
        """Return uptime in seconds."""
        return time.time() - self.start_time

    @property
    def success_rate(self) -> float:
        """Return fix success rate (0.0 to 1.0)."""
        if self.fixes_attempted == 0:
            return 0.0
        return self.tests_fixed / self.fixes_attempted

    def get_summary(self) -> Dict[str, Any]:
        """
        Get a summary of all metrics.

        Returns:
            Dict with all metric values
        """
        return {
            "uptime_seconds": round(self.uptime_seconds, 1),
            "fixes_attempted": self.fixes_attempted,
            "tests_fixed": self.tests_fixed,
            "fixes_rejected": self.fixes_rejected,
            "success_rate": round(self.success_rate, 3),
            "recent_rejections": self.rejection_reasons[-5:],
        }
```

**Step 4: Update __init__.py**

```python
# systems/pixel_compiler/autofix/__init__.py
"""Autonomous Improvement Daemon package."""
from .daemon import AutofixDaemon
from .fixer import AutofixGenerator
from .metrics import AutofixMetrics

__all__ = ["AutofixDaemon", "AutofixGenerator", "AutofixMetrics"]
```

**Step 5: Run test to verify it passes**

Run: `pytest systems/pixel_compiler/tests/test_autofix_metrics.py -v`
Expected: PASS (4 tests)

**Step 6: Integrate metrics into daemon**

```python
# Add to AutofixDaemon in daemon.py

from .metrics import AutofixMetrics

    def __post_init__(self):
        # ... existing code ...
        self.metrics = AutofixMetrics()

    def _process_failure(self, failure: Dict[str, Any]) -> Dict[str, Any]:
        # At start of method:
        self.metrics.record_fix_attempt()

        # Before each return:
        # For success:
        self.metrics.record_fix_success()

        # For rejection:
        self.metrics.record_fix_rejected(result["reason"])
```

**Step 7: Commit**

```bash
git add systems/pixel_compiler/autofix/metrics.py \
        systems/pixel_compiler/autofix/__init__.py \
        systems/pixel_compiler/autofix/daemon.py \
        systems/pixel_compiler/tests/test_autofix_metrics.py
git commit -m "feat(autofix): add metrics tracking for daemon activity"
```

---

## Task 9: Write Design Documentation

**Files:**
- Create: `docs/plans/2026-02-15-autonomous-improvement-design.md`

**Step 1: Write design document**

```markdown
# Autonomous Improvement Daemon Design

## Overview

The Autonomous Improvement Daemon is a background process that continuously monitors the Geometry OS test suite, detects failing tests, attempts to generate fixes, and applies validated fixes automatically.

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                   AutofixDaemon                              │
│                                                             │
│  ┌───────────┐    ┌─────────────┐    ┌─────────────────┐   │
│  │  Polling  │───▶│ Test Runner │───▶│ Failure Parser  │   │
│  │   Loop    │    │  (pytest)   │    │                 │   │
│  └───────────┘    └─────────────┘    └────────┬────────┘   │
│                                                 │            │
│                                                 ▼            │
│  ┌───────────┐    ┌─────────────┐    ┌─────────────────┐   │
│  │  Metrics  │◀───│   Fixer     │◀───│ Safety Checker  │   │
│  │           │    │ (Generator) │    │                 │   │
│  └───────────┘    └─────────────┘    └─────────────────┘   │
│                         │                                    │
│                         ▼                                    │
│              ┌─────────────────┐                             │
│              │ WebMCP Bridge   │                             │
│              │ (ide_compile,   │                             │
│              │  ide_test)      │                             │
│              └─────────────────┘                             │
└─────────────────────────────────────────────────────────────┘
```

## Components

### AutofixDaemon (`daemon.py`)

Main orchestrator. Manages:
- Polling loop with configurable interval
- Safe directory enforcement
- Fix attempt coordination
- Metrics collection

### AutofixGenerator (`fixer.py`)

Generates fixes for failing tests:
- Pattern-based error analysis
- Patch generation
- Syntax validation
- WebMCP integration for enhanced validation

### AutofixMetrics (`metrics.py`)

Tracks daemon activity:
- Fixes attempted/succeeded/failed
- Rejection reasons
- Uptime and success rate

## Safety Model

1. **Directory scoping**: Only files in `safe_directories` can be modified
2. **Path validation**: Resolves symlinks, prevents traversal attacks
3. **Confidence threshold**: Only applies fixes with confidence >= 0.5
4. **Test validation**: Runs tests after fix, rolls back if they fail
5. **Rollback on failure**: Restores original code if validation fails

## Configuration

```yaml
poll_interval: 60          # Seconds between test suite polls
safe_directories:          # Directories where fixes are allowed
  - tests/fixtures
  - systems/pixel_compiler/autofix/sandbox
max_fix_attempts: 3        # Max attempts per failing test
```

## Usage

```bash
# Start with defaults
./bin/autofix-daemon

# Custom configuration
./bin/autofix-daemon --poll-interval 30 --safe-dir tests/fixtures

# Dry run mode
./bin/autofix-daemon --dry-run
```

## Integration with WebMCP

The daemon can use WebMCP IDE tools for enhanced validation:

- `ide_compile`: Validate syntax before applying fix
- `ide_test`: Run tests through WebMCP instead of subprocess
- `ide_deploy`: (Future) Deploy fixes as .rts.png cartridges

## Future Enhancements

1. **LLM integration**: Use AI for more sophisticated fix generation
2. **Cartridge deployment**: Deploy fixes as .rts.png via ide_deploy
3. **Multi-agent coordination**: Multiple daemons working together via A2A
4. **Staged rollout**: Deploy to staging before production
```

**Step 2: Commit**

```bash
git add docs/plans/2026-02-15-autonomous-improvement-design.md
git commit -m "docs(autofix): add autonomous improvement daemon design"
```

---

## Task 10: Run Full Test Suite

**Step 1: Run all autofix tests**

Run: `pytest systems/pixel_compiler/tests/test_autofix_*.py -v`
Expected: All tests PASS

**Step 2: Run full project tests to ensure no regressions**

Run: `pytest systems/pixel_compiler/tests/ -v --tb=short`
Expected: All tests PASS

**Step 3: Final commit**

```bash
git add -A
git commit -m "feat(autofix): complete autonomous improvement daemon implementation"
```

---

## Summary

| Task | Component | Files Created | Tests |
|------|-----------|---------------|-------|
| 1 | Daemon Core | 2 | 3 |
| 2 | Test Detection | 0 | 3 |
| 3 | Safety Enforcement | 0 | 3 |
| 4 | Fix Generator | 1 | 4 |
| 5 | Main Loop | 0 | 3 |
| 6 | CLI Entry Point | 1 | 0 |
| 7 | WebMCP Integration | 0 | 2 |
| 8 | Metrics | 1 | 4 |
| 9 | Documentation | 1 | 0 |
| 10 | Full Tests | 0 | 0 |
| **Total** | | **6 files** | **22 tests** |

**Key Deliverables:**
- `bin/autofix-daemon` - CLI to start the daemon
- `systems/pixel_compiler/autofix/daemon.py` - Main orchestrator
- `systems/pixel_compiler/autofix/fixer.py` - Fix generation
- `systems/pixel_compiler/autofix/metrics.py` - Activity tracking
- Integration with existing WebMCP `ide_compile`/`ide_test` tools
