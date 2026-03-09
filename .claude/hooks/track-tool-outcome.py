#!/usr/bin/env python3
"""
PostToolUse Hook - Tracks tool outcomes for Meta-Prompter Evolution

This hook runs after every tool execution and records success/failure
for the evolution system to use as fitness signals.

When combined with the meta-prompter hook, this creates a feedback loop
where the brain learns which prompts lead to successful outcomes.

Events: PostToolUse, PostToolUseFailure
"""

import json
import sys
from pathlib import Path
from datetime import datetime

PROJECT_DIR = Path("/home/jericho/zion/projects/geometry_os/geometry_os")
sys.path.insert(0, str(PROJECT_DIR))

PROMPT_STATE_FILE = PROJECT_DIR / ".geometry/meta_prompter_state.json"
OUTCOME_LOG = PROJECT_DIR / ".claude/hooks/tool_outcomes.log"


def log(message: str):
    """Log to file for debugging."""
    OUTCOME_LOG.parent.mkdir(parents=True, exist_ok=True)
    timestamp = datetime.now().isoformat()
    with open(OUTCOME_LOG, "a") as f:
        f.write(f"[{timestamp}] {message}\n")


def load_prompt_state():
    """Load current prompt state if exists."""
    try:
        if PROMPT_STATE_FILE.exists():
            with open(PROMPT_STATE_FILE) as f:
                return json.load(f)
    except Exception as e:
        log(f"Could not load prompt state: {e}")
    return None


def save_prompt_state(state: dict):
    """Save updated prompt state."""
    try:
        with open(PROMPT_STATE_FILE, "w") as f:
            json.dump(state, f)
    except Exception as e:
        log(f"Could not save prompt state: {e}")


def main():
    # Read hook input from stdin
    input_data = json.load(sys.stdin)

    event = input_data.get("hook_event_name", "")
    tool_name = input_data.get("tool_name", "unknown")
    tool_input = input_data.get("tool_input", {})

    is_failure = event == "PostToolUseFailure"

    log(f"Tool {'FAILED' if is_failure else 'OK'}: {tool_name}")

    # Load current prompt state
    state = load_prompt_state()
    if not state:
        log("No active prompt state - skipping tracking")
        sys.exit(0)

    # Record outcome
    state["tool_calls"] = state.get("tool_calls", []) + [tool_name]
    if is_failure:
        state["failures"] = state.get("failures", 0) + 1
    else:
        state["successes"] = state.get("successes", 0) + 1

    save_prompt_state(state)

    log(f"Updated state: {state['successes']} successes, {state['failures']} failures")

    # Try to notify evolution hook
    try:
        from systems.evolution_daemon.evolution_hooks.meta_prompter_evolution_hook import (
            MetaPrompterEvolutionHook
        )
        hook = MetaPrompterEvolutionHook()

        # Import asyncio for async methods
        import asyncio

        if is_failure:
            asyncio.run(hook.on_tool_failure(input_data))
        else:
            asyncio.run(hook.on_tool_success(input_data))

        log(f"Notified evolution hook of tool outcome")

    except Exception as e:
        log(f"Could not notify evolution hook: {e}")

    sys.exit(0)


if __name__ == "__main__":
    main()
