#!/usr/bin/env python3
"""
autopilot.py — Claude Code Stop Hook: Autopilot Engine

Reads the current session's JSONL conversation history,
extracts what Claude was working on, and generates the next
action prompt so Claude never goes idle.

Called by the Stop hook. Outputs JSON to stdout that blocks
the stop and injects a new prompt.

Exit codes:
  0  — let Claude stop normally (goal met / safety limit hit)
  2  — block the stop, inject next prompt (keep working)
"""

import sys
import json
import os
import re
import subprocess
from pathlib import Path
from datetime import datetime

# ── Config ────────────────────────────────────────────────────────────────────
MAX_LOOPS        = int(os.environ.get("AUTOPILOT_MAX_LOOPS", "50"))
LOOP_COUNT_FILE  = Path(os.environ.get("AUTOPILOT_LOOP_FILE", "/tmp/autopilot_loop_count"))
GOAL_FILE        = Path(os.environ.get("AUTOPILOT_GOAL", ""))  # optional: path to goal.md
LOG_FILE         = Path(os.environ.get("AUTOPILOT_LOG", "/tmp/autopilot.log"))
PROJECT_ROOT     = Path(os.environ.get("AUTOPILOT_PROJECT", os.getcwd()))
CLAUDE_HOME      = Path.home() / ".claude"
PROJECTS_DIR     = CLAUDE_HOME / "projects"

# Stop words — if last assistant message contains these, let Claude stop
COMPLETION_SIGNALS = [
    "task complete", "all done", "finished successfully",
    "goal achieved", "mission complete", "triangle closed",
    "draw_pixel works", "end-to-end loop complete",
]


def log(msg: str):
    ts = datetime.now().strftime("%H:%M:%S")
    with open(LOG_FILE, "a") as f:
        f.write(f"[{ts}] {msg}\n")


def read_loop_count() -> int:
    try:
        return int(LOOP_COUNT_FILE.read_text().strip())
    except Exception:
        return 0


def write_loop_count(n: int):
    LOOP_COUNT_FILE.write_text(str(n))


def slugify_path(path: Path) -> str:
    """Convert /home/jericho/zion/projects/geometry-os → -home-jericho-zion-projects-geometry-os"""
    return str(path).replace("/", "-").replace("_", "-")


def find_project_dir(cwd: Path) -> Path | None:
    """Find the matching .claude/projects/<slug> dir for the current repo."""
    slug = slugify_path(cwd)
    candidate = PROJECTS_DIR / slug
    if candidate.is_dir():
        return candidate
    # Try git root instead of cwd
    try:
        git_root = subprocess.check_output(
            ["git", "rev-parse", "--show-toplevel"],
            cwd=cwd, stderr=subprocess.DEVNULL
        ).decode().strip()
        slug = slugify_path(Path(git_root))
        candidate = PROJECTS_DIR / slug
        if candidate.is_dir():
            return candidate
    except Exception:
        pass
    # Fuzzy: find dirs whose slug ends with the project name
    proj_name = cwd.name.replace("_", "-")
    for d in PROJECTS_DIR.iterdir():
        if d.is_dir() and proj_name in d.name:
            return d
    return None


def read_recent_conversation(project_dir: Path, max_turns: int = 30) -> list[dict]:
    """Read the most recent JSONL session file and return message turns."""
    jsonl_files = sorted(
        project_dir.glob("*.jsonl"),
        key=lambda f: f.stat().st_mtime,
        reverse=True
    )
    if not jsonl_files:
        return []

    turns = []
    for line in jsonl_files[0].read_text(errors="replace").splitlines():
        line = line.strip()
        if not line:
            continue
        try:
            obj = json.loads(line)
            # Claude CLI nests role/content in 'message'
            msg = obj.get("message", {})
            role    = msg.get("role", "")
            content = msg.get("content", "")
            
            # content can be a list of blocks
            if isinstance(content, list):
                text_parts = [
                    b.get("text", "") for b in content
                    if isinstance(b, dict) and b.get("type") == "text"
                ]
                content = "\n".join(text_parts)
            if role and content:
                turns.append({"role": role, "content": str(content)})
        except json.JSONDecodeError:
            continue

    return turns[-max_turns:]


def check_completion(turns: list[dict]) -> bool:
    """Return True if Claude has signalled it's done."""
    # Check last few assistant messages
    assistant_msgs = [t["content"].lower() for t in turns if t["role"] == "assistant"]
    recent = " ".join(assistant_msgs[-3:])
    for signal in COMPLETION_SIGNALS:
        if signal in recent:
            return True
    return False


def extract_current_work(turns: list[dict]) -> str:
    """Summarise what Claude was just working on from the last few turns."""
    recent = turns[-6:] if len(turns) >= 6 else turns
    parts = []
    for t in recent:
        role    = t["role"].upper()
        snippet = t["content"][:400].replace("\n", " ")
        parts.append(f"[{role}]: {snippet}")
    return "\n".join(parts)


def load_goal() -> str:
    """Load the project goal from a goal file or CLAUDE.md."""
    if GOAL_FILE and GOAL_FILE.is_file():
        return GOAL_FILE.read_text().strip()[:1500]
    # Try CLAUDE.md in project root
    claude_md = PROJECT_ROOT / "CLAUDE.md"
    if claude_md.is_file():
        return claude_md.read_text().strip()[:1500]
    return ""


def generate_next_prompt(turns: list[dict], loop: int, goal: str) -> str:
    """
    Build the next action prompt Claude will receive.
    This is the brain of the autopilot — it reads context and
    decides what to tell Claude to do next.
    """
    recent_work = extract_current_work(turns)

    # Pull the last assistant message to understand where we stopped
    last_assistant = ""
    for t in reversed(turns):
        if t["role"] == "assistant":
            last_assistant = t["content"][:800]
            break

    # Detect if Claude stopped mid-task (no tool calls in last message)
    seems_incomplete = not any(
        kw in last_assistant.lower()
        for kw in ["complete", "done", "finished", "✓", "✅", "working", "successfully"]
    )

    goal_section = f"\n## Project Goal\n{goal}\n" if goal else ""

    prompt = f"""## Autopilot Continuation — Loop {loop}
{goal_section}
## Recent Work Context
{recent_work}

## Your Task
{"You stopped before completing the current task. Continue where you left off." if seems_incomplete else "The last step is complete. Identify the next concrete task toward the project goal and execute it."}

Rules:
- Be specific and take immediate action (write code, edit files, run commands)
- Do NOT summarise or report — just do the work
- After completing a step, commit progress with git if files changed
- If the goal is fully achieved, end your response with exactly: TASK COMPLETE
- If you are blocked, explain what you need and wait for human input
"""
    return prompt.strip()


def main():
    # ── Read hook input from stdin ─────────────────────────────────────────
    raw = sys.stdin.read()
    try:
        hook_input = json.loads(raw)
    except json.JSONDecodeError:
        hook_input = {}

    session_id    = hook_input.get("session_id", "unknown")
    cwd           = Path(hook_input.get("cwd", os.getcwd()))
    stop_reason   = hook_input.get("stop_reason", "")   # end_turn | max_tokens | stop_sequence

    log(f"Stop hook fired | session={session_id} | reason={stop_reason} | cwd={cwd}")

    # ── Loop counter — safety limit ────────────────────────────────────────
    loop = read_loop_count() + 1
    write_loop_count(loop)
    log(f"Loop {loop}/{MAX_LOOPS}")

    if loop > MAX_LOOPS:
        log("MAX_LOOPS reached — letting Claude stop")
        write_loop_count(0)   # reset for next run
        print(json.dumps({"decision": "allow"}))
        sys.exit(0)

    # ── Find conversation history ──────────────────────────────────────────
    project_dir = find_project_dir(cwd)
    turns = []
    if project_dir:
        log(f"Found project dir: {project_dir}")
        turns = read_recent_conversation(project_dir)
        log(f"Loaded {len(turns)} turns from conversation history")
    else:
        log(f"No project dir found for {cwd} — proceeding without history")

    # ── Check completion signals ───────────────────────────────────────────
    if check_completion(turns):
        log("Completion signal detected — letting Claude stop")
        write_loop_count(0)
        print(json.dumps({"decision": "allow"}))
        sys.exit(0)

    # ── Generate next prompt ───────────────────────────────────────────────
    goal   = load_goal()
    prompt = generate_next_prompt(turns, loop, goal)
    log(f"Injecting prompt (loop {loop}):\n{prompt[:200]}...")

    # ── Output: block the stop and inject the prompt ───────────────────────
    # "decision": "block" + "reason" prevents Claude from stopping.
    # The reason is fed back to Claude as its next instruction.
    output = {
        "decision": "block",
        "reason": prompt
    }
    print(json.dumps(output))
    sys.exit(2)   # exit 2 = block stop, keep working


if __name__ == "__main__":
    main()
