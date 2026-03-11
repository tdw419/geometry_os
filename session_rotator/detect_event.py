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


def detect_errors(handoff_file: Path) -> bool:
    """Check handoff for error indicators."""
    if not handoff_file.exists():
        return False
    content = handoff_file.read_text().lower()
    error_patterns = ["stuck", "blocked", "error:", "failed", "cannot proceed"]
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

    # Check completion first
    if detect_completion(handoff):
        print("complete")
        return

    # Check errors
    if detect_errors(handoff):
        print("error")
        return

    # Check token usage
    if not args.no_token_check:
        claude_home = Path.home() / ".claude" / "projects"
        if claude_home.exists():
            project_dirs = sorted(claude_home.iterdir(), key=lambda d: d.stat().st_mtime, reverse=True)
            if project_dirs:
                tokens = get_token_usage(project_dirs[0])
                if tokens > args.token_limit:
                    print("rotate")
                    return

    print("continue")


if __name__ == "__main__":
    main()