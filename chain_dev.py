#!/usr/bin/env python3
"""
Geometry OS Development Chain -- Carry Forward Integration

Runs a single Hermes session that:
1. Reads Carry Forward context from the last session
2. Picks the next task from ROADMAP.md
3. Implements it, writes tests, commits
4. Records git heads for progress tracking

Usage:
    python3 chain_dev.py                  # run one cycle
    python3 chain_dev.py --dry-run        # show what would happen
    python3 chain_dev.py --task "..."     # override with specific task

Designed to be called from cron or manually.
"""
import subprocess
import sys
import os
import json
import argparse
from datetime import datetime

CARRY_FORWARD = os.path.expanduser(
    "~/zion/projects/carry_forward/carry_forward/carry_forward.py"
)
PROJECT_DIR = os.path.expanduser("~/zion/projects/geometry_os/geometry_os")
AI_GUIDE = os.path.join(PROJECT_DIR, "AI_GUIDE.md")
ROADMAP = os.path.join(PROJECT_DIR, "ROADMAP.md")

PROMPT_TEMPLATE = """You are continuing automated development of Geometry OS.

## Context from Last Session
{context}

## Your Task
{task}

## Rules
1. Read AI_GUIDE.md first for architecture and conventions
2. Run `cargo test` before and after every change
3. Commit after each logical unit of work (with descriptive message)
4. If tests fail, fix them before moving on
5. If you get stuck on something for >3 attempts, skip it and try the next item
6. When done, record git heads: `python3 {carry_forward} record-git-heads $SESSION_ID`

## How to Work
- Use the `patch` tool for Rust edits (it auto-formats, that's fine)
- NEVER do read_file then write_file on Rust files (corrupts with line numbers)
- Commit before risky edits so you can revert
- Keep tests passing at all times
"""


def run_cmd(cmd, capture=True):
    """Run a command and return output."""
    result = subprocess.run(
        cmd, shell=True, capture_output=capture, text=True, timeout=60
    )
    return result.stdout.strip() if capture else ""


def get_carry_context():
    """Get context from carry_forward."""
    result = subprocess.run(
        ["python3", CARRY_FORWARD, "context"],
        capture_output=True, text=True, timeout=30
    )
    if result.returncode != 0:
        return f"(carry_forward context unavailable: {result.stderr[:200]})"
    return result.stdout.strip()


def should_continue():
    """Check if it's safe to chain."""
    result = subprocess.run(
        ["python3", CARRY_FORWARD, "should-continue"],
        capture_output=True, text=True, timeout=30
    )
    output = result.stdout + result.stderr
    if result.returncode != 0 or "not safe" in output.lower():
        return False, output.strip()
    return True, output.strip()


def get_unchecked_roadmap_items():
    """Parse ROADMAP.md Priority Order section for unchecked items."""
    items = []
    in_priority = False
    with open(ROADMAP) as f:
        for line in f:
            if "Priority Order" in line:
                in_priority = True
                continue
            if in_priority and line.startswith("##"):
                break  # end of priority section
            if in_priority and line.strip().startswith("- [ ] "):
                items.append(line.strip().lstrip("- [ ] "))
    # Fallback: if priority section empty, grab all unchecked
    if not items:
        with open(ROADMAP) as f:
            for line in f:
                if line.strip().startswith("- [ ] "):
                    items.append(line.strip().lstrip("- [ ] "))
    return items


def pick_task(specific=None):
    """Pick the next task to work on."""
    if specific:
        return specific

    items = get_unchecked_roadmap_items()
    if not items:
        return "Review ROADMAP.md and add new tasks. Then pick the first unchecked item and implement it."

    # Return the first unchecked item
    return f"From ROADMAP.md, implement: {items[0]}\n\nIf that's done or blocked, pick the next unchecked item."


def run_cycle(task_override=None, dry_run=False):
    """Run one development cycle."""
    # 1. Check if we should continue
    safe, reason = should_continue()
    if not safe:
        print(f"STOP: {reason}")
        return 1
    print(f"Gate check passed: {reason[:100]}")

    # 2. Get carry forward context
    context = get_carry_context()
    context_summary = context[:2000] if len(context) > 2000 else context
    print(f"Context loaded ({len(context)} chars)")

    # 3. Pick task
    task = pick_task(task_override)
    print(f"Task: {task[:100]}...")

    if dry_run:
        print("\n--- DRY RUN ---")
        print(f"Would run Hermes with prompt ({len(PROMPT_TEMPLATE)} char template)")
        print(f"Task: {task}")
        return 0

    # 4. Build prompt
    prompt = PROMPT_TEMPLATE.format(
        context=context_summary,
        task=task,
        carry_forward=CARRY_FORWARD,
    )

    # 5. Run Hermes
    print(f"\nLaunching Hermes session at {datetime.now().isoformat()}...")
    result = subprocess.run(
        [
            "hermes", "chat",
            "-q", prompt,
            "--yolo",
            "-Q",
            "-s", "rust-safe-edits",
        ],
        cwd=PROJECT_DIR,
        timeout=1200,  # 20 minute max
    )

    exit_code = result.returncode
    duration = "unknown"

    if exit_code == 0:
        print(f"\nCycle completed successfully")
    else:
        print(f"\nCycle exited with code {exit_code}")

    return exit_code


def main():
    parser = argparse.ArgumentParser(description="Geometry OS Dev Chain")
    parser.add_argument("--dry-run", action="store_true", help="Show what would happen")
    parser.add_argument("--task", type=str, help="Override task")
    parser.add_argument("--list", action="store_true", help="List roadmap items")
    args = parser.parse_args()

    if args.list:
        items = get_unchecked_roadmap_items()
        for i, item in enumerate(items, 1):
            print(f"  {i}. {item}")
        return 0

    return run_cycle(task_override=args.task, dry_run=args.dry_run)


if __name__ == "__main__":
    sys.exit(main())
