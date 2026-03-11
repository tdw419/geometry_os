import pytest
from pathlib import Path
from detect_event import get_token_usage

def test_get_token_usage_empty_dir(tmp_path):
    """Returns 0 when no JSONL files exist."""
    result = get_token_usage(tmp_path)
    assert result == 0