#!/usr/bin/env python3
"""
Geometry OS Development Chain -- Carry Forward Integration

Self-chaining loop: each cycle picks a ROADMAP item, runs a Hermes session,
commits, then immediately fires the next cycle if Carry Forward says it's safe.

Stops when:
  - Carry Forward detects thrashing or blockers
  - No unchecked roadmap items remain
  - Two consecutive cycles fail (circuit breaker)
  - SIGTERM received (graceful shutdown)

Usage:
    python3 chain_dev.py                  # run continuously (self-chaining loop)
    python3 chain_dev.py --once           # run one cycle then stop
    python3 chain_dev.py --dry-run        # show what would happen
    python3 chain_dev.py --task "..."     # override with specific task (one cycle)
    python3 chain_dev.py --list           # list remaining roadmap items
    python3 chain_dev.py --status         # show current state
"""
import subprocess
import sys
import os
import re
import signal
import argparse
import time
from datetime import datetime

CARRY_FORWARD = os.path.expanduser(
    "~/zion/projects/carry_forward/carry_forward/carry_forward.py"
)
PROJECT_DIR = os.path.expanduser("~/zion/projects/geometry_os/geometry_os")
AI_GUIDE = os.path.join(PROJECT_DIR, "AI_GUIDE.md")
ROADMAP = os.path.join(PROJECT_DIR, "ROADMAP.md")
LOG_FILE = "/tmp/chain_dev.log"

# Graceful shutdown on SIGTERM/SIGINT
_running = True
def _signal_handler(sig, frame):
    global _running
    print(f"\nReceived signal {sig}, shutting down gracefully...")
    _running = False
signal.signal(signal.SIGTERM, _signal_handler)
signal.signal(signal.SIGINT, _signal_handler)


def log(msg):
    """Print with timestamp."""
    ts = datetime.now().strftime("%H:%M:%S")
    line = f"[{ts}] {msg}"
    print(line, flush=True)


def run_cmd(cmd, **kwargs):
    """Run a command, return CompletedProcess."""
    defaults = {"capture_output": True, "text": True, "timeout": 60}
    defaults.update(kwargs)
    return subprocess.run(cmd, **defaults)


# ---------------------------------------------------------------------------
# Context gathering
# ---------------------------------------------------------------------------

def get_carry_context():
    """Get context from carry_forward."""
    result = run_cmd(["python3", CARRY_FORWARD, "context"], timeout=30)
    if result.returncode != 0:
        return f"(carry_forward context unavailable: {result.stderr[:200]})"
    return result.stdout.strip()


def should_continue():
    """Check if it's safe to chain. Returns (bool, reason_string)."""
    result = run_cmd(["python3", CARRY_FORWARD, "should-continue"], timeout=30)
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
                break
            if in_priority and line.strip().startswith("- [ ] "):
                items.append(line.strip().lstrip("- [ ] "))
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
        return "All roadmap items complete! Review ROADMAP.md and add new tasks."
    return f"From ROADMAP.md, implement: {items[0]}\n\nIf that's done or blocked, pick the next unchecked item."


# ---------------------------------------------------------------------------
# Hermes prompt
# ---------------------------------------------------------------------------

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


# ---------------------------------------------------------------------------
# Single cycle
# ---------------------------------------------------------------------------

def run_cycle(task_override=None, dry_run=False):
    """Run one development cycle. Returns 0 on success, 1 on gate stop, 2 on failure."""

    # 1. Gate check
    safe, reason = should_continue()
    if not safe:
        log(f"GATE STOP: {reason[:200]}")
        return 1
    log(f"Gate OK: {reason[:80]}")

    # 2. Pick task
    items = get_unchecked_roadmap_items()
    if not items:
        log("ROADMAP COMPLETE -- no items left!")
        return 1

    task = pick_task(task_override)
    log(f"Task: {task[:100]}")

    if dry_run:
        log("DRY RUN -- would launch Hermes")
        return 0

    # 3. Get context
    context = get_carry_context()
    context_summary = context[:2000] if len(context) > 2000 else context

    # 4. Build prompt
    prompt = PROMPT_TEMPLATE.format(
        context=context_summary,
        task=task,
        carry_forward=CARRY_FORWARD,
    )

    # 5. Run Hermes
    log("Launching Hermes...")
    try:
        result = run_cmd(
            [
                "hermes", "chat",
                "-q", prompt,
                "--yolo",
                "-Q",
                "-s", "rust-safe-edits",
            ],
            cwd=PROJECT_DIR,
            timeout=1200,  # 20 min max per cycle
        )
        exit_code = result.returncode
    except subprocess.TimeoutExpired:
        log("Hermes timed out (20 min)")
        exit_code = -1

    if exit_code == 0:
        log("Hermes completed")
    else:
        log(f"Hermes exited with code {exit_code}")

    # 6. Post-cycle: verify tests, revert if broken
    log("Verifying tests...")
    test_result = run_cmd(
        ["cargo", "test", "--quiet"],
        cwd=PROJECT_DIR,
        timeout=120
    )
    test_output = test_result.stdout + test_result.stderr

    if "FAILED" in test_output:
        log("WARNING: Tests failing. Attempting revert of uncommitted work...")
        status = run_cmd(["git", "status", "--short"], cwd=PROJECT_DIR)
        if status.stdout.strip():
            log(f"Dirty files:\n{status.stdout}")
            run_cmd(["git", "checkout", "--", "."], cwd=PROJECT_DIR)
            run_cmd(
                ["git", "clean", "-fd", "--", "lib/", "tests/"],
                cwd=PROJECT_DIR
            )
            log("Reverted uncommitted changes.")
            # Re-verify
            test_result2 = run_cmd(
                ["cargo", "test", "--quiet"],
                cwd=PROJECT_DIR, timeout=120
            )
            if "FAILED" not in (test_result2.stdout + test_result2.stderr):
                log("Tests green after revert.")
                return 0
            else:
                log("Tests STILL failing after revert -- last commit broken!")
                return 2
        else:
            log("No dirty files but tests fail -- last commit broke something.")
            return 2

    total = sum(int(m) for m in re.findall(r'(\d+) passed', test_output))
    log(f"Tests green: {total} passing")

    # Record git heads
    run_cmd(["python3", CARRY_FORWARD, "record-git-heads", "chain-cycle"], timeout=30)

    return 0


# ---------------------------------------------------------------------------
# Self-chaining loop
# ---------------------------------------------------------------------------

def run_loop(task_override=None):
    """Run cycles continuously until stopped."""
    log("=" * 60)
    log("Geometry OS Dev Chain -- self-chaining loop started")
    log("=" * 60)

    consecutive_failures = 0
    cycle = 0

    while _running:
        cycle += 1
        log(f"--- Cycle {cycle} ---")

        result = run_cycle(task_override=task_override)

        if result == 0:
            consecutive_failures = 0
            log(f"Cycle {cycle} succeeded")
        elif result == 1:
            log(f"Cycle {cycle} gate stopped -- chain halting")
            break
        else:
            consecutive_failures += 1
            log(f"Cycle {cycle} failed ({consecutive_failures} consecutive)")
            if consecutive_failures >= 2:
                log("Circuit breaker: 2 consecutive failures, stopping.")
                break

        # Brief pause between cycles to let the filesystem settle
        if _running:
            time.sleep(5)

    log(f"Chain ended after {cycle} cycles ({consecutive_failures} failures)")
    items = get_unchecked_roadmap_items()
    log(f"Remaining roadmap items: {len(items)}")


# ---------------------------------------------------------------------------
# Status
# ---------------------------------------------------------------------------

def show_status():
    """Show current state of the project."""
    log("Geometry OS Status")
    log("-" * 40)

    # Git
    r = run_cmd(["git", "log", "--oneline", "-5"], cwd=PROJECT_DIR)
    log("Recent commits:")
    for line in r.stdout.strip().split("\n"):
        log(f"  {line}")

    # Tests
    r = run_cmd(["cargo", "test", "--quiet"], cwd=PROJECT_DIR, timeout=120)
    test_output = r.stdout + r.stderr
    total = sum(int(m) for m in re.findall(r'(\d+) passed', test_output))
    failed = "FAILED" in test_output
    log(f"Tests: {total} passing {'(FAILURES!)' if failed else ''}")

    # Roadmap
    items = get_unchecked_roadmap_items()
    done = 21 - len(items)  # total was 21
    log(f"Roadmap: {done} done, {len(items)} remaining")

    # Carry forward
    safe, reason = should_continue()
    log(f"Chain gate: {'OPEN' if safe else 'BLOCKED'}")


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main():
    parser = argparse.ArgumentParser(description="Geometry OS Dev Chain")
    parser.add_argument("--once", action="store_true", help="Run one cycle then stop")
    parser.add_argument("--dry-run", action="store_true", help="Show what would happen")
    parser.add_argument("--task", type=str, help="Override task (one cycle)")
    parser.add_argument("--list", action="store_true", help="List roadmap items")
    parser.add_argument("--status", action="store_true", help="Show current state")
    args = parser.parse_args()

    if args.list:
        items = get_unchecked_roadmap_items()
        for i, item in enumerate(items, 1):
            print(f"  {i}. {item}")
        return 0

    if args.status:
        show_status()
        return 0

    if args.task:
        return run_cycle(task_override=args.task, dry_run=args.dry_run)

    if args.once:
        return run_cycle(dry_run=args.dry_run)

    # Default: self-chaining loop
    run_loop()
    return 0


if __name__ == "__main__":
    sys.exit(main())
