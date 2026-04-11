#!/usr/bin/env python3
"""
Pre-flight check for Geometry OS hook-based dev chain.

Runs before each cron session. Outputs either:
  - HALT + reason (session should exit immediately)
  - Context JSON from carry_forward (session should do work)

Exit code always 0 -- the session reads stdout to decide what to do.
"""
import os, sys, subprocess, time, json

LOCK_FILE = "/tmp/geo-chain.lock"
CARRY = os.path.expanduser("~/zion/projects/carry_forward/carry_forward/carry_forward.py")
PROJECT = os.path.expanduser("~/zion/projects/geometry_os/geometry_os")
LOCK_TIMEOUT = 1800  # 30 min -- stale lock threshold


def log(msg):
    ts = time.strftime("%H:%M:%S")
    print(f"[{ts}] PREFLIGHT: {msg}", file=sys.stderr)


def check_lock():
    """Check lock file. Returns True if we can proceed, False if locked."""
    if os.path.exists(LOCK_FILE):
        age = time.time() - os.path.getmtime(LOCK_FILE)
        if age < LOCK_TIMEOUT:
            lock_pid = "unknown"
            try:
                with open(LOCK_FILE) as f:
                    lock_pid = f.read().strip()
            except Exception:
                pass
            log(f"Locked by PID {lock_pid} ({int(age)}s ago)")
            return False
        else:
            log(f"Stale lock ({int(age)}s old), removing")
            try:
                os.unlink(LOCK_FILE)
            except Exception:
                pass
    return True


def create_lock():
    """Create lock file with current PID."""
    with open(LOCK_FILE, "w") as f:
        f.write(str(os.getpid()))


def run_gate():
    """Run carry_forward run --json. Returns (continue_bool, json_or_reason)."""
    try:
        result = subprocess.run(
            ["python3", CARRY, "run", "--json"],
            capture_output=True, text=True, timeout=30,
            cwd=PROJECT,
        )
    except subprocess.TimeoutExpired:
        return False, "carry_forward timed out"
    except Exception as e:
        return False, f"carry_forward error: {e}"

    output = result.stdout.strip()
    if result.returncode != 0:
        # Halt -- try to parse reason
        try:
            data = json.loads(output)
            reasons = data.get("reasons", [output[:200]])
            return False, "; ".join(reasons)
        except (json.JSONDecodeError, AttributeError):
            return False, output[:200] if output else "unknown halt reason"

    return True, output


def get_roadmap_top():
    """Get the first unchecked ROADMAP item."""
    roadmap = os.path.join(PROJECT, "ROADMAP.md")
    items = []
    try:
        with open(roadmap) as f:
            for line in f:
                if line.strip().startswith("- [ ] "):
                    items.append(line.strip()[6:])
    except Exception:
        pass
    return items[0] if items else "Review ROADMAP.md and pick a task"


def main():
    # 1. Lock check
    if not check_lock():
        print("STATUS: LOCKED")
        print("ACTION: Exit immediately. Another session is running.")
        return

    # 2. Gate check
    can_continue, data = run_gate()
    if not can_continue:
        print("STATUS: HALT")
        print(f"REASON: {data}")
        print("ACTION: Exit immediately. Do not do any work.")
        return

    # 3. We're clear -- create lock and output context
    create_lock()
    log("Lock created, gate passed")

    # 4. Output context for the session
    print("STATUS: CONTINUE")
    print(f"TASK: {get_roadmap_top()}")
    print("---CARRY_FORWARD_CONTEXT---")
    print(data)
    print("---END_CONTEXT---")
    print(f"PROJECT_DIR: {PROJECT}")
    print(f"LOCK_FILE: {LOCK_FILE}")
    print("ACTION: Do work from ROADMAP.md. Delete lock file when done.")


if __name__ == "__main__":
    main()
