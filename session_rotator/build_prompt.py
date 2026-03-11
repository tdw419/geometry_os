#!/usr/bin/env python3
"""build_prompt.py - Build session prompt from handoff and history"""

from pathlib import Path

def load_handoff(handoff_file: Path) -> str:
    """Load handoff context."""
    if handoff_file.exists():
        return handoff_file.read_text()
    return ""