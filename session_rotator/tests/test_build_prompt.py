import pytest
import subprocess
from pathlib import Path
from build_prompt import load_handoff

def test_load_handoff_no_file(tmp_path):
    """Returns empty string when file doesn't exist."""
    result = load_handoff(tmp_path / "nonexistent.md")
    assert result == ""

def test_load_handoff_with_content(tmp_path):
    """Returns file content when file exists."""
    handoff = tmp_path / "handoff.md"
    handoff.write_text("# Task\nDo something")
    result = load_handoff(handoff)
    assert result == "# Task\nDo something"

def test_build_prompt_cli_with_handoff(tmp_path):
    """CLI outputs formatted prompt with handoff content."""
    handoff = tmp_path / "handoff.md"
    handoff.write_text("# My Task\nProgress: 50%")
    result = subprocess.run(
        ["python3", "build_prompt.py", "--handoff", str(handoff)],
        capture_output=True, text=True, cwd="."
    )
    assert "## Session Continuation" in result.stdout
    assert "# My Task" in result.stdout
    assert "Continue working on the task" in result.stdout

def test_build_prompt_cli_no_handoff(tmp_path):
    """CLI outputs empty when no handoff exists."""
    handoff = tmp_path / "nonexistent.md"
    result = subprocess.run(
        ["python3", "build_prompt.py", "--handoff", str(handoff)],
        capture_output=True, text=True, cwd="."
    )
    assert result.stdout.strip() == ""