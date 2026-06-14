#!/usr/bin/env python3
"""Metrics collector preflight — ensures repo is in a sane state before collection."""
import subprocess
import sys
from pathlib import Path

WORKDIR = Path(__file__).resolve().parent.parent


def main():
    # Check we're in the right directory
    if not (WORKDIR / "Cargo.toml").exists():
        print("ERROR: Not in Geometry OS repo")
        sys.exit(1)

    # Check metrics log isn't corrupt (last line is valid JSON)
    metrics_log = WORKDIR / ".autodev" / "metrics_history.jsonl"
    if metrics_log.exists():
        try:
            last_line = metrics_log.read_text().strip().splitlines()[-1]
            import json
            json.loads(last_line)
        except Exception as e:
            print(f"WARN: Corrupt metrics log, last line invalid: {e}")
            # Don't block collection, just warn

    print("READY")
    sys.exit(0)


if __name__ == "__main__":
    main()
