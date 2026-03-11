#!/usr/bin/env python3
"""detect_event.py - Event detection for session rotation"""

import os
from pathlib import Path

def get_token_usage() -> int:
    """Estimate token usage from JSONL file size across all CLI platforms."""
    home = Path.home()
    search_paths = [
        home / ".claude" / "projects",
        home / ".pi" / "agent" / "sessions"
    ]
    
    max_tokens = 0
    
    for base_path in search_paths:
        if not base_path.exists():
            continue
            
        try:
            # Find the most recently modified JSONL file recursively
            latest_file = None
            latest_mtime = 0
            
            for root, _, files in os.walk(base_path):
                for f in files:
                    if f.endswith(".jsonl"):
                        p = Path(root) / f
                        mtime = p.stat().st_mtime
                        if mtime > latest_mtime:
                            latest_mtime = mtime
                            latest_file = p
            
            if latest_file:
                size = latest_file.stat().st_size
                tokens = size // 3  # Conservative: 1 token ≈ 3 bytes
                max_tokens = max(max_tokens, tokens)
        except OSError:
            continue
            
    return max_tokens


def detect_errors(handoff_file: Path) -> bool:
    """Check handoff for error indicators."""
    if not handoff_file.exists():
        return False
    content = handoff_file.read_text().lower()
    error_patterns = ["stuck", "blocked", "error:", "failed", "cannot proceed", "infinite loop"]
    return any(p in content for p in error_patterns)


def detect_completion(handoff_file: Path) -> bool:
    """Check for completion signals."""
    if not handoff_file.exists():
        return False
    content = handoff_file.read_text().lower()
    return "task complete" in content


def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--pid", type=int)
    parser.add_argument("--handoff", type=str, required=True)
    parser.add_argument("--token-limit", type=int, default=150000)
    parser.add_argument("--no-token-check", action="store_true")
    args = parser.parse_args()

    handoff = Path(args.handoff)

    # 1. Check completion signal (highest priority)
    if detect_completion(handoff):
        print("complete")
        return

    # 2. Check for explicit error patterns
    if detect_errors(handoff):
        print("error")
        return

    # 3. Check estimated token usage
    if not args.no_token_check:
        tokens = get_token_usage()
        if tokens > args.token_limit:
            print("rotate")
            return

    print("continue")


if __name__ == "__main__":
    main()
