import pytest
from pathlib import Path
import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))
from detect_event import get_token_usage, detect_errors, detect_completion
import subprocess

def test_get_token_usage_empty_dir(tmp_path):
    """Returns 0 when no JSONL files exist."""
    result = get_token_usage(tmp_path)
    assert result == 0

def test_get_token_usage_with_file(tmp_path):
    """Returns estimated token count from JSONL file."""
    jsonl_file = tmp_path / "session.jsonl"
    # 300 bytes = 100 tokens (300 / 3)
    jsonl_file.write_text("x" * 300)

    result = get_token_usage(tmp_path)
    assert result == 100


def test_detect_errors_no_file(tmp_path):
    """Returns False when handoff file doesn't exist."""
    result = detect_errors(tmp_path / "nonexistent.md")
    assert result is False


def test_detect_errors_with_stuck_keyword(tmp_path):
    """Returns True when handoff contains 'stuck'."""
    handoff = tmp_path / "handoff.md"
    handoff.write_text("I am stuck on this problem")
    result = detect_errors(handoff)
    assert result is True


def test_detect_errors_clean(tmp_path):
    """Returns False when handoff has no error keywords."""
    handoff = tmp_path / "handoff.md"
    handoff.write_text("Making good progress on the task")
    result = detect_errors(handoff)
    assert result is False


def test_detect_completion_no_file(tmp_path):
    """Returns False when handoff file doesn't exist."""
    result = detect_completion(tmp_path / "nonexistent.md")
    assert result is False


def test_detect_completion_found(tmp_path):
    """Returns True when handoff contains 'task complete'."""
    handoff = tmp_path / "handoff.md"
    handoff.write_text("All done! TASK COMPLETE")
    result = detect_completion(handoff)
    assert result is True


def test_detect_completion_not_found(tmp_path):
    """Returns False when handoff doesn't contain completion signal."""
    handoff = tmp_path / "handoff.md"
    handoff.write_text("Still working on the task")
    result = detect_completion(handoff)
    assert result is False


def test_detect_event_cli_continue(tmp_path):
    """CLI outputs 'continue' when no triggers."""
    handoff = tmp_path / "handoff.md"
    handoff.write_text("Working on task")
    result = subprocess.run(
        ["python3", "session_rotator/detect_event.py", "--handoff", str(handoff), "--no-token-check"],
        capture_output=True, text=True, cwd="."
    )
    assert result.stdout.strip() == "continue"


def test_detect_event_cli_complete(tmp_path):
    """CLI outputs 'complete' when task is done."""
    handoff = tmp_path / "handoff.md"
    handoff.write_text("TASK COMPLETE")
    result = subprocess.run(
        ["python3", "session_rotator/detect_event.py", "--handoff", str(handoff), "--no-token-check"],
        capture_output=True, text=True, cwd="."
    )
    assert result.stdout.strip() == "complete"


def test_detect_event_cli_error(tmp_path):
    """CLI outputs 'error' when stuck keyword found."""
    handoff = tmp_path / "handoff.md"
    handoff.write_text("I am stuck")
    result = subprocess.run(
        ["python3", "session_rotator/detect_event.py", "--handoff", str(handoff), "--no-token-check"],
        capture_output=True, text=True, cwd="."
    )
    assert result.stdout.strip() == "error"