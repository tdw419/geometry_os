import pytest
from pathlib import Path
from detect_event import get_token_usage

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