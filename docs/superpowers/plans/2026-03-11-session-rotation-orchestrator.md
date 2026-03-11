# Session Rotation Orchestrator Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a shell-based orchestrator that manages Claude CLI sessions, rotating to fresh sessions when context limits approach.

**Architecture:** Three components - orchestrator.sh (main loop), detect_event.py (monitoring), build_prompt.py (context handoff). Shell script launches Claude, Python scripts detect rotation triggers and build continuation prompts.

**Tech Stack:** Bash, Python 3, Claude Code CLI

---

## File Structure

```
session_rotator/
├── orchestrator.sh        # Main control loop
├── detect_event.py        # Event detection (tokens, errors, completion)
├── build_prompt.py        # Build continuation prompt from handoff
├── tests/
│   ├── test_detect_event.py
│   └── test_build_prompt.py
└── .session/              # Runtime directory (created by orchestrator)
    ├── handoff.md
    ├── logs/
    └── state.json
```

---

## Chunk 1: Event Detection Module

### Task 1: Test detect_event.py - Token Usage Detection

**Files:**
- Create: `session_rotator/tests/test_detect_event.py`
- Create: `session_rotator/detect_event.py`

- [ ] **Step 1: Write the failing test**

```python
# session_rotator/tests/test_detect_event.py
import pytest
from pathlib import Path
from detect_event import get_token_usage

def test_get_token_usage_empty_dir(tmp_path):
    """Returns 0 when no JSONL files exist."""
    result = get_token_usage(tmp_path)
    assert result == 0
```

- [ ] **Step 2: Run test to verify it fails**

Run: `cd session_rotator && python -m pytest tests/test_detect_event.py::test_get_token_usage_empty_dir -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'detect_event'"

- [ ] **Step 3: Write minimal implementation**

```python
# session_rotator/detect_event.py
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
```

- [ ] **Step 4: Run test to verify it passes**

Run: `cd session_rotator && python -m pytest tests/test_detect_event.py::test_get_token_usage_empty_dir -v`
Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add session_rotator/detect_event.py session_rotator/tests/test_detect_event.py
git commit -m "feat: add get_token_usage function with empty dir test"
```

### Task 2: Test detect_event.py - Token Usage with Files

**Files:**
- Modify: `session_rotator/tests/test_detect_event.py`
- Modify: `session_rotator/detect_event.py`

- [ ] **Step 1: Write the failing test**

```python
# Add to session_rotator/tests/test_detect_event.py
def test_get_token_usage_with_file(tmp_path):
    """Returns estimated token count from JSONL file."""
    jsonl_file = tmp_path / "session.jsonl"
    # 300 bytes = 100 tokens (300 / 3)
    jsonl_file.write_text("x" * 300)

    result = get_token_usage(tmp_path)
    assert result == 100
```

- [ ] **Step 2: Run test to verify it passes**

Run: `cd session_rotator && python -m pytest tests/test_detect_event.py::test_get_token_usage_with_file -v`
Expected: PASS (implementation already handles this)

- [ ] **Step 3: Commit**

```bash
git add session_rotator/tests/test_detect_event.py
git commit -m "test: add token usage test with actual file"
```

### Task 3: Test detect_event.py - Error Detection

**Files:**
- Modify: `session_rotator/tests/test_detect_event.py`
- Modify: `session_rotator/detect_event.py`

- [ ] **Step 1: Write the failing test**

```python
# Add to session_rotator/tests/test_detect_event.py
from detect_event import detect_errors

def test_detect_errors_no_file(tmp_path):
    """Returns False when handoff file doesn't exist."""
    result = detect_errors(tmp_path / "nonexistent.md")
    assert result is False

def test_detect_errors_with_stuck_keyword(tmp_path):
    """Returns True when handoff contains 'stuck'."""
    handoff = tmp_path / "handoff.md"
    handoff.write_text("I am stuck on this problem")

    result = detect_errors(handoff)
    assert result is True

def test_detect_errors_clean(tmp_path):
    """Returns False when handoff has no error keywords."""
    handoff = tmp_path / "handoff.md"
    handoff.write_text("Making good progress on the task")

    result = detect_errors(handoff)
    assert result is False
```

- [ ] **Step 2: Run test to verify it fails**

Run: `cd session_rotator && python -m pytest tests/test_detect_event.py::test_detect_errors_no_file -v`
Expected: FAIL with "ImportError: cannot import name 'detect_errors'"

- [ ] **Step 3: Write minimal implementation**

```python
# Add to session_rotator/detect_event.py
def detect_errors(handoff_file: Path) -> bool:
    """Check handoff for error indicators."""
    if not handoff_file.exists():
        return False
    content = handoff_file.read_text().lower()
    error_patterns = ["stuck", "blocked", "error:", "failed", "cannot proceed"]
    return any(p in content for p in error_patterns)
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `cd session_rotator && python -m pytest tests/test_detect_event.py -v`
Expected: All PASS

- [ ] **Step 5: Commit**

```bash
git add session_rotator/detect_event.py session_rotator/tests/test_detect_event.py
git commit -m "feat: add detect_errors function with tests"
```

### Task 4: Test detect_event.py - Completion Detection

**Files:**
- Modify: `session_rotator/tests/test_detect_event.py`
- Modify: `session_rotator/detect_event.py`

- [ ] **Step 1: Write the failing test**

```python
# Add to session_rotator/tests/test_detect_event.py
from detect_event import detect_completion

def test_detect_completion_no_file(tmp_path):
    """Returns False when handoff file doesn't exist."""
    result = detect_completion(tmp_path / "nonexistent.md")
    assert result is False

def test_detect_completion_found(tmp_path):
    """Returns True when handoff contains 'task complete'."""
    handoff = tmp_path / "handoff.md"
    handoff.write_text("All done! TASK COMPLETE")

    result = detect_completion(handoff)
    assert result is True

def test_detect_completion_not_found(tmp_path):
    """Returns False when handoff doesn't contain completion signal."""
    handoff = tmp_path / "handoff.md"
    handoff.write_text("Still working on the task")

    result = detect_completion(handoff)
    assert result is False
```

- [ ] **Step 2: Run test to verify it fails**

Run: `cd session_rotator && python -m pytest tests/test_detect_event.py::test_detect_completion_no_file -v`
Expected: FAIL with "ImportError: cannot import name 'detect_completion'"

- [ ] **Step 3: Write minimal implementation**

```python
# Add to session_rotator/detect_event.py
def detect_completion(handoff_file: Path) -> bool:
    """Check for completion signals."""
    if not handoff_file.exists():
        return False
    content = handoff_file.read_text().lower()
    return "task complete" in content
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `cd session_rotator && python -m pytest tests/test_detect_event.py -v`
Expected: All PASS

- [ ] **Step 5: Commit**

```bash
git add session_rotator/detect_event.py session_rotator/tests/test_detect_event.py
git commit -m "feat: add detect_completion function with tests"
```

### Task 5: Test detect_event.py - Main CLI

**Files:**
- Modify: `session_rotator/detect_event.py`

- [ ] **Step 1: Write the failing test**

```python
# Add to session_rotator/tests/test_detect_event.py
import subprocess

def test_detect_event_cli_continue(tmp_path):
    """CLI outputs 'continue' when no triggers."""
    handoff = tmp_path / "handoff.md"
    handoff.write_text("Working on task")

    result = subprocess.run(
        ["python", "detect_event.py", "--handoff", str(handoff)],
        capture_output=True,
        text=True
    )
    assert result.stdout.strip() == "continue"

def test_detect_event_cli_complete(tmp_path):
    """CLI outputs 'complete' when task is done."""
    handoff = tmp_path / "handoff.md"
    handoff.write_text("TASK COMPLETE")

    result = subprocess.run(
        ["python", "detect_event.py", "--handoff", str(handoff)],
        capture_output=True,
        text=True,
        cwd="session_rotator"
    )
    assert result.stdout.strip() == "complete"

def test_detect_event_cli_error(tmp_path):
    """CLI outputs 'error' when stuck keyword found."""
    handoff = tmp_path / "handoff.md"
    handoff.write_text("I am stuck")

    result = subprocess.run(
        ["python", "detect_event.py", "--handoff", str(handoff)],
        capture_output=True,
        text=True,
        cwd="session_rotator"
    )
    assert result.stdout.strip() == "error"
```

- [ ] **Step 2: Run test to verify it fails**

Run: `cd session_rotator && python -m pytest tests/test_detect_event.py::test_detect_event_cli_continue -v`
Expected: FAIL (main() not implemented)

- [ ] **Step 3: Write minimal implementation**

```python
# Add to session_rotator/detect_event.py
def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--pid", type=int)
    parser.add_argument("--handoff", type=str, required=True)
    parser.add_argument("--token-limit", type=int, default=150000)
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
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `cd session_rotator && python -m pytest tests/test_detect_event.py -v`
Expected: All PASS

- [ ] **Step 5: Commit**

```bash
git add session_rotator/detect_event.py session_rotator/tests/test_detect_event.py
git commit -m "feat: add CLI to detect_event.py with tests"
```

---

## Chunk 2: Build Prompt Module

### Task 6: Test build_prompt.py - Load Handoff

**Files:**
- Create: `session_rotator/tests/test_build_prompt.py`
- Create: `session_rotator/build_prompt.py`

- [ ] **Step 1: Write the failing test**

```python
# session_rotator/tests/test_build_prompt.py
import pytest
from pathlib import Path
from build_prompt import load_handoff

def test_load_handoff_no_file(tmp_path):
    """Returns empty string when file doesn't exist."""
    result = load_handoff(tmp_path / "nonexistent.md")
    assert result == ""

def test_load_handoff_with_content(tmp_path):
    """Returns file content when file exists."""
    handoff = tmp_path / "handoff.md"
    handoff.write_text("# Task\nDo something")

    result = load_handoff(handoff)
    assert result == "# Task\nDo something"
```

- [ ] **Step 2: Run test to verify it fails**

Run: `cd session_rotator && python -m pytest tests/test_build_prompt.py::test_load_handoff_no_file -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'build_prompt'"

- [ ] **Step 3: Write minimal implementation**

```python
# session_rotator/build_prompt.py
#!/usr/bin/env python3
"""build_prompt.py - Build session prompt from handoff and history"""

from pathlib import Path

def load_handoff(handoff_file: Path) -> str:
    """Load handoff context."""
    if handoff_file.exists():
        return handoff_file.read_text()
    return ""
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `cd session_rotator && python -m pytest tests/test_build_prompt.py -v`
Expected: All PASS

- [ ] **Step 5: Commit**

```bash
git add session_rotator/build_prompt.py session_rotator/tests/test_build_prompt.py
git commit -m "feat: add load_handoff function with tests"
```

### Task 7: Test build_prompt.py - CLI Output

**Files:**
- Modify: `session_rotator/tests/test_build_prompt.py`
- Modify: `session_rotator/build_prompt.py`

- [ ] **Step 1: Write the failing test**

```python
# Add to session_rotator/tests/test_build_prompt.py
import subprocess

def test_build_prompt_cli_with_handoff(tmp_path):
    """CLI outputs formatted prompt with handoff content."""
    handoff = tmp_path / "handoff.md"
    handoff.write_text("# My Task\nProgress: 50%")

    result = subprocess.run(
        ["python", "build_prompt.py", "--handoff", str(handoff)],
        capture_output=True,
        text=True,
        cwd="session_rotator"
    )

    assert "## Session Continuation" in result.stdout
    assert "# My Task" in result.stdout
    assert "Continue working on the task" in result.stdout

def test_build_prompt_cli_no_handoff(tmp_path):
    """CLI outputs empty when no handoff exists."""
    handoff = tmp_path / "nonexistent.md"

    result = subprocess.run(
        ["python", "build_prompt.py", "--handoff", str(handoff)],
        capture_output=True,
        text=True,
        cwd="session_rotator"
    )

    assert result.stdout.strip() == ""
```

- [ ] **Step 2: Run test to verify it fails**

Run: `cd session_rotator && python -m pytest tests/test_build_prompt.py::test_build_prompt_cli_with_handoff -v`
Expected: FAIL (main() not implemented)

- [ ] **Step 3: Write minimal implementation**

```python
# Add to session_rotator/build_prompt.py
def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--handoff", type=str, required=True)
    parser.add_argument("--search", type=str, default="")
    args = parser.parse_args()

    handoff = load_handoff(Path(args.handoff))

    prompt_parts = []

    if handoff:
        prompt_parts.append("## Session Continuation\n")
        prompt_parts.append("You are continuing from a previous session. Here's the handoff context:\n")
        prompt_parts.append(handoff)
        prompt_parts.append("\n## Instructions\n")
        prompt_parts.append("Continue working on the task above. Do not summarize - just continue the work.\n")

    # Search history if query provided (placeholder - implemented in Task 8)
    if args.search:
        prompt_parts.append("\n## Relevant History\n")
        prompt_parts.append("(History search not yet implemented)\n")

    print("".join(prompt_parts))

if __name__ == "__main__":
    main()
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `cd session_rotator && python -m pytest tests/test_build_prompt.py -v`
Expected: All PASS

- [ ] **Step 5: Commit**

```bash
git add session_rotator/build_prompt.py session_rotator/tests/test_build_prompt.py
git commit -m "feat: add CLI to build_prompt.py with tests"
```

### Task 8: Test build_prompt.py - History Search (Optional)

**Files:**
- Modify: `session_rotator/tests/test_build_prompt.py`
- Modify: `session_rotator/build_prompt.py`

- [ ] **Step 1: Write the failing test**

```python
# Add to session_rotator/tests/test_build_prompt.py
from build_prompt import search_history

def test_search_history_empty(tmp_path, monkeypatch):
    """Returns empty list when no history matches."""
    monkeypatch.setattr(Path, "home", lambda: tmp_path)

    result = search_history("nonexistent query")
    assert result == []
```

- [ ] **Step 2: Run test to verify it fails**

Run: `cd session_rotator && python -m pytest tests/test_build_prompt.py::test_search_history_empty -v`
Expected: FAIL with "ImportError: cannot import name 'search_history'"

- [ ] **Step 3: Write minimal implementation**

```python
# Add to session_rotator/build_prompt.py
def search_history(query: str, limit: int = 5) -> list[str]:
    """Search recent conversation history for relevant context."""
    claude_home = Path.home() / ".claude" / "projects"
    if not claude_home.exists():
        return []

    project_dirs = sorted(claude_home.iterdir(), key=lambda d: d.stat().st_mtime, reverse=True)

    results = []
    for project_dir in project_dirs[:1]:
        jsonl_files = sorted(project_dir.glob("*.jsonl"), key=lambda f: f.stat().st_mtime, reverse=True)
        for jsonl_file in jsonl_files[:1]:
            import json
            for line in jsonl_file.read_text().splitlines()[-50:]:
                try:
                    obj = json.loads(line)
                    msg = obj.get("message", {})
                    content = msg.get("content", "")
                    if isinstance(content, list):
                        content = " ".join(b.get("text", "") for b in content if isinstance(b, dict))
                    if query.lower() in content.lower():
                        results.append(content[:500])
                except (json.JSONDecodeError, KeyError, AttributeError):
                    continue

    return results[:limit]
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `cd session_rotator && python -m pytest tests/test_build_prompt.py -v`
Expected: All PASS

- [ ] **Step 5: Commit**

```bash
git add session_rotator/build_prompt.py session_rotator/tests/test_build_prompt.py
git commit -m "feat: add search_history function with test"
```

---

## Chunk 3: Orchestrator Shell Script

### Task 9: Create orchestrator.sh

**Files:**
- Create: `session_rotator/orchestrator.sh`

- [ ] **Step 1: Write the orchestrator script**

```bash
#!/bin/bash
# orchestrator.sh - Session Rotation Orchestrator

set -e

# Configuration (override via environment)
HANDOFF_FILE="${HANDOFF_FILE:-.session/handoff.md}"
MAX_SESSIONS="${MAX_SESSIONS:-50}"
TOKEN_LIMIT="${TOKEN_LIMIT:-150000}"
SEARCH_QUERY="${SEARCH_QUERY:-}"
SESSION_DIR=".session"

SESSION_COUNT=0
CLAUDE_PID=""

# Graceful shutdown handler
cleanup() {
    echo "Shutting down orchestrator..."
    if [ -n "$CLAUDE_PID" ] && kill -0 "$CLAUDE_PID" 2>/dev/null; then
        echo "Terminating Claude session $CLAUDE_PID"
        kill "$CLAUDE_PID" 2>/dev/null || true
        wait "$CLAUDE_PID" 2>/dev/null || true
    fi
    # Save final state
    echo "{\"session_count\": $SESSION_COUNT, \"status\": \"shutdown\"}" > "$SESSION_DIR/state.json"
    exit 0
}

trap cleanup SIGTERM SIGINT SIGQUIT

# Ensure session directory exists
mkdir -p "$SESSION_DIR/logs"

while [ $SESSION_COUNT -lt $MAX_SESSIONS ]; do
  echo "=== Starting session $SESSION_COUNT ==="

  # Build prompt from handoff + optional history search
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  if [ -n "$SEARCH_QUERY" ]; then
    PROMPT=$(python3 "$SCRIPT_DIR/build_prompt.py" --handoff "$HANDOFF_FILE" --search "$SEARCH_QUERY")
  else
    PROMPT=$(python3 "$SCRIPT_DIR/build_prompt.py" --handoff "$HANDOFF_FILE")
  fi

  # Launch Claude session
  claude --print "$PROMPT" 2>&1 | tee "$SESSION_DIR/logs/session_$SESSION_COUNT.log" &
  CLAUDE_PID=$!

  # Monitor for events
  while kill -0 $CLAUDE_PID 2>/dev/null; do
    EVENT=$(python3 "$SCRIPT_DIR/detect_event.py" --pid $CLAUDE_PID --handoff "$HANDOFF_FILE" --token-limit "$TOKEN_LIMIT")

    case "$EVENT" in
      "rotate")
        echo "Rotation triggered - ending session $SESSION_COUNT"
        kill $CLAUDE_PID
        break
        ;;
      "complete")
        echo "Task complete - exiting orchestrator"
        kill $CLAUDE_PID 2>/dev/null || true
        cleanup
        ;;
      "error")
        echo "Error detected - rotating session"
        kill $CLAUDE_PID
        break
        ;;
    esac
    sleep 5
  done

  wait $CLAUDE_PID 2>/dev/null || true
  CLAUDE_PID=""
  SESSION_COUNT=$((SESSION_COUNT + 1))

  # Save state
  echo "{\"session_count\": $SESSION_COUNT, \"status\": \"running\"}" > "$SESSION_DIR/state.json"
done

echo "Max sessions reached - stopping"
cleanup
```

- [ ] **Step 2: Make executable**

Run: `chmod +x session_rotator/orchestrator.sh`
Expected: No output (success)

- [ ] **Step 3: Commit**

```bash
git add session_rotator/orchestrator.sh
git commit -m "feat: add orchestrator.sh main control loop"
```

### Task 10: Create README and Package

**Files:**
- Create: `session_rotator/README.md`

- [ ] **Step 1: Write README**

```markdown
# Session Rotation Orchestrator

Manages Claude Code CLI sessions with automatic rotation when context limits approach.

## Quick Start

```bash
./orchestrator.sh
```

## Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `MAX_SESSIONS` | 50 | Hard stop after N rotations |
| `TOKEN_LIMIT` | 150000 | Rotate when tokens exceed limit |
| `SEARCH_QUERY` | (empty) | Optional history search term |
| `HANDOFF_FILE` | .session/handoff.md | Path to handoff file |

## Files

- `orchestrator.sh` - Main control loop
- `detect_event.py` - Detect rotation triggers
- `build_prompt.py` - Build continuation prompt

## Handoff Format

Create `.session/handoff.md` with:

```markdown
# Session Handoff

## Current Task
[What you're working on]

## Progress
- [x] Done
- [ ] Remaining

## Next Action
[Specific next step]
```

## Testing

```bash
cd session_rotator
python -m pytest tests/ -v
```
```

- [ ] **Step 2: Commit**

```bash
git add session_rotator/README.md
git commit -m "docs: add README for session rotator"
```

### Task 11: Integration Test

**Files:**
- Create: `session_rotator/tests/test_integration.py`

- [ ] **Step 1: Write integration test**

```python
# session_rotator/tests/test_integration.py
"""Integration tests for session rotator."""
import subprocess
import time
from pathlib import Path

def test_detect_event_and_build_prompt_integration(tmp_path):
    """Test that detect_event and build_prompt work together."""
    # Create handoff
    handoff = tmp_path / "handoff.md"
    handoff.write_text("# Task\nWorking on it")

    # Build prompt
    prompt_result = subprocess.run(
        ["python", "build_prompt.py", "--handoff", str(handoff)],
        capture_output=True,
        text=True,
        cwd="session_rotator"
    )
    assert "## Session Continuation" in prompt_result.stdout

    # Detect event (should be 'continue')
    event_result = subprocess.run(
        ["python", "detect_event.py", "--handoff", str(handoff)],
        capture_output=True,
        text=True,
        cwd="session_rotator"
    )
    assert event_result.stdout.strip() == "continue"

    # Update handoff to complete
    handoff.write_text("TASK COMPLETE")

    # Detect event (should be 'complete')
    event_result = subprocess.run(
        ["python", "detect_event.py", "--handoff", str(handoff)],
        capture_output=True,
        text=True,
        cwd="session_rotator"
    )
    assert event_result.stdout.strip() == "complete"
```

- [ ] **Step 2: Run integration test**

Run: `cd session_rotator && python -m pytest tests/test_integration.py -v`
Expected: PASS

- [ ] **Step 3: Commit**

```bash
git add session_rotator/tests/test_integration.py
git commit -m "test: add integration test for session rotator"
```

### Task 12: Final Verification

- [ ] **Step 1: Run all tests**

Run: `cd session_rotator && python -m pytest tests/ -v`
Expected: All tests PASS

- [ ] **Step 2: Verify script syntax**

Run: `bash -n session_rotator/orchestrator.sh`
Expected: No output (success)

- [ ] **Step 3: Final commit**

```bash
git add -A
git commit -m "feat: complete session rotation orchestrator implementation"
```

---

## Summary

| Task | Description | Files |
|------|-------------|-------|
| 1-5 | detect_event.py with tests | `detect_event.py`, `tests/test_detect_event.py` |
| 6-8 | build_prompt.py with tests | `build_prompt.py`, `tests/test_build_prompt.py` |
| 9 | orchestrator.sh | `orchestrator.sh` |
| 10 | Documentation | `README.md` |
| 11 | Integration test | `tests/test_integration.py` |
| 12 | Final verification | All files |
