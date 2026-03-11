#!/usr/bin/env python3
"""detect_event.py - Event detection for session rotation"""

import os
import argparse
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


def detect_errors(handoff_file: Path, log_file: Path = None) -> bool:
    """Check handoff and log for error indicators."""
    error_patterns = ["stuck", "blocked", "error:", "failed", "cannot proceed", "infinite loop"]
    
    if handoff_file.exists():
        content = handoff_file.read_text().lower()
        if any(p in content for p in error_patterns):
            return True
            
    if log_file and log_file.exists():
        # Check last 50 lines of log
        try:
            with open(log_file, 'r') as f:
                lines = f.readlines()[-50:]
                content = "".join(lines).lower()
                if any(p in content for p in error_patterns):
                    return True
        except Exception:
            pass
            
    return False


def detect_completion(handoff_file: Path, log_file: Path = None) -> bool:
    """Check for completion signals in handoff or log."""
    if handoff_file.exists():
        if "task complete" in handoff_file.read_text().lower():
            return True
            
    if log_file and log_file.exists():
        # Check last 20 lines of log
        try:
            with open(log_file, 'r') as f:
                lines = f.readlines()[-20:]
                content = "".join(lines).lower()
                if "task complete" in content:
                    return True
        except Exception:
            pass
            
    return False


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--pid", type=int)
    parser.add_argument("--handoff", type=str, required=True)
    parser.add_argument("--log", type=str)
    parser.add_argument("--token-limit", type=int, default=150000)
    parser.add_argument("--no-token-check", action="store_true")
    args = parser.parse_args()

    handoff = Path(args.handoff)
    log = Path(args.log) if args.log else None

    # 1. Check completion signal (highest priority)
    if detect_completion(handoff, log):
        print("complete")
        return

    # 2. Check for explicit error patterns
    if detect_errors(handoff, log):
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
