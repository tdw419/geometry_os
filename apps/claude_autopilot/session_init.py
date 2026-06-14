#!/usr/bin/env python3
"""
session_init.py — SessionStart Hook

Fires when a Claude Code session starts (new, resume, or /clear).
Resets the autopilot loop counter and injects the project goal
as a system message so Claude always knows what it's building.
"""

import sys
import json
import os
from pathlib import Path
from datetime import datetime

LOOP_COUNT_FILE = Path("/tmp/autopilot_loop_count")
LOG_FILE        = Path("/tmp/autopilot.log")
PROJECT_ROOT    = Path(os.getcwd())


def log(msg: str):
    ts = datetime.now().strftime("%H:%M:%S")
    with open(LOG_FILE, "a") as f:
        f.write(f"[{ts}] INIT: {msg}\n")


def load_goal() -> str:
    for candidate in [
        PROJECT_ROOT / "CLAUDE.md",
        PROJECT_ROOT / ".claude" / "goal.md",
        Path.home() / ".claude" / "CLAUDE.md",
    ]:
        if candidate.is_file():
            return candidate.read_text().strip()[:2000]
    return ""


def main():
    raw = sys.stdin.read()
    try:
        hook_input = json.loads(raw)
    except Exception:
        hook_input = {}

    session_id = hook_input.get("session_id", "unknown")
    cwd        = hook_input.get("cwd", str(PROJECT_ROOT))

    # Reset loop counter
    LOOP_COUNT_FILE.write_text("0")
    log(f"Session started | id={session_id} | cwd={cwd} | loop counter reset")

    goal = load_goal()
    if goal:
        log(f"Goal loaded ({len(goal)} chars)")
        # Inject goal as system context Claude will see
        output = {
            "systemMessage": f"## Project Goal (loaded at session start)\n\n{goal}\n\nAlways work toward this goal. When you stop, the autopilot will give you the next task."
        }
        print(json.dumps(output))
    else:
        log("No goal file found — no system message injected")
        print(json.dumps({}))

    sys.exit(0)


if __name__ == "__main__":
    main()
