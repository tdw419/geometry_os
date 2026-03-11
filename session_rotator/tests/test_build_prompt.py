import pytest
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