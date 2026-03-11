#!/usr/bin/env python3
"""detect_event.py - Event detection for session rotation"""

from pathlib import Path

def get_token_usage(project_dir: Path) -> int:
    """Estimate token usage from JSONL file size."""
    jsonl_files = sorted(project_dir.glob("*.jsonl"), key=lambda f: f.stat().st_mtime, reverse=True)
    if not jsonl_files:
        return 0
    try:
        size = jsonl_files[0].stat().st_size
        return size // 3  # Conservative: 1 token ≈ 3 bytes
    except OSError:
        return 0