#!/usr/bin/env python3
"""
Meta-Prompter Hook using PixelBrain for native inference.

This hook uses the on-screen LLM (PixelBrain) to analyze conversation
history and generate the next prompt. Every thought is visible as
THOUGHT_PULSE glyphs on the Geometry OS desktop.

Features:
- Native GPU inference via PixelBrain
- Visible cognition via THOUGHT_PULSE glyphs
- Self-improving via Evolution Daemon integration
- Fallback to CLI if PixelBrain unavailable

Events: Stop, Notification
Exit 0 + stdout = feed prompt to main session
Exit 0 + empty = do nothing
"""

import json
import sys
from pathlib import Path
from datetime import datetime
import asyncio

# Add project to path
PROJECT_DIR = Path("/home/jericho/zion/projects/geometry_os/geometry_os")
sys.path.insert(0, str(PROJECT_DIR))

HISTORY_DIR = Path.home() / ".claude/projects/-home-jericho-zion-projects-geometry-os-geometry-os"
LOG_FILE = PROJECT_DIR / ".claude/hooks/meta-prompter-pixelbrain.log"
PROMPT_STATE_FILE = PROJECT_DIR / ".geometry/meta_prompter_state.json"

# Global instances (lazy loaded)
_evolution_hook = None
_pixelbrain_service = None


def log(message: str):
    """Log to file for debugging."""
    LOG_FILE.parent.mkdir(parents=True, exist_ok=True)
    timestamp = datetime.now().isoformat()
    with open(LOG_FILE, "a") as f:
        f.write(f"[{timestamp}] {message}\n")


def get_evolution_hook():
    """Get or initialize the evolution hook for tracking outcomes."""
    global _evolution_hook
    if _evolution_hook is not None:
        return _evolution_hook

    try:
        from systems.evolution_daemon.evolution_hooks.meta_prompter_evolution_hook import (
            MetaPrompterEvolutionHook
        )
        _evolution_hook = MetaPrompterEvolutionHook()
        return _evolution_hook
    except ImportError as e:
        log(f"Evolution hook not available: {e}")
        return None
    except Exception as e:
        log(f"Evolution hook init error: {e}")
        return None


def save_prompt_state(prompt: str, event: str):
    """Save the current prompt state for tracking by PostToolUse hooks."""
    try:
        PROMPT_STATE_FILE.parent.mkdir(parents=True, exist_ok=True)
        state = {
            "current_prompt": prompt,
            "source_event": event,
            "timestamp": datetime.now().isoformat(),
            "tool_calls": [],
            "successes": 0,
            "failures": 0
        }
        with open(PROMPT_STATE_FILE, "w") as f:
            json.dump(state, f)
    except Exception as e:
        log(f"Could not save prompt state: {e}")


def extract_history(history_file: Path, lines: int = 30) -> str:
    """Extract readable conversation from JSONL."""
    import subprocess

    # SECURITY: Use list arguments instead of shell=True to prevent command injection
    # Handle nested content structure (tool_results have content arrays with text objects)
    jq_filter = '''
        select(.type == "user" or .type == "assistant") |
        if .type == "user" then
            "USER: " + (
                if (.message.content | type) == "string" then
                    .message.content[0:300]
                elif (.message.content | type) == "array" then
                    # Handle tool_result with nested content
                    (.message.content | map(
                        if .type == "text" then
                            .text[0:300]
                        elif .type == "tool_result" then
                            # Tool result - get first text if available
                            ((.content | type) == "array" and (.content[0].text // ""))[0:100]
                        else
                            ""
                        end
                    ) | join(" "))[0:300]
                else
                    ""
                end
            )
        else
            "ASSISTANT: " + (
                if (.message.content | type) == "string" then
                    .message.content[0:300]
                elif (.message.content | type) == "array" then
                    (.message.content | map(select(.type == "text") | .text)[0] // "")[0:300]
                else
                    ""
                end
            )
        end
    '''

    # SECURITY: Use subprocess with list arguments, not shell=True
    # Tail the file safely
    tail_result = subprocess.run(
        ["tail", f"-{lines}", str(history_file)],
        capture_output=True,
        text=True,
        timeout=10
    )
    
    if tail_result.returncode != 0:
        return ""
    
    # Pipe to jq safely
    jq_result = subprocess.run(
        ["jq", "-r", jq_filter],
        input=tail_result.stdout,
        capture_output=True,
        text=True,
        timeout=10
    )
    
    # Filter output
    filtered = subprocess.run(
        ["grep", "-v", "^null$", "-"],
        input=jq_result.stdout,
        capture_output=True,
        text=True,
        timeout=5
    )
    
    further_filtered = subprocess.run(
        ["grep", "-v", "^USER: $", "-"],
        input=filtered.stdout,
        capture_output=True,
        text=True,
        timeout=5
    )
    
    final = subprocess.run(
        ["head", "-15"],
        input=further_filtered.stdout,
        capture_output=True,
        text=True,
        timeout=5
    )

    return final.stdout.strip()


class MockVisualBridge:
    """Mock visual bridge for standalone hook execution.

    When the Visual Bridge server is running, we could connect to it.
    For now, this provides logging of visual events.
    """

    def emit_thought_pulse(self, token_id: int, position: tuple, intensity: float = 1.0) -> bool:
        log(f"THOUGHT_PULSE: token={token_id}, pos={position}, intensity={intensity}")
        return True

    def emit_atlas_glow(self, coords: list, intensity: float = 1.0) -> bool:
        log(f"ATLAS_GLOW: {len(coords)} coords, intensity={intensity}")
        return True


async def get_pixelbrain_with_visuals():
    """Get PixelBrain service with visual feedback capability."""
    global _pixelbrain_service

    if _pixelbrain_service is not None:
        return _pixelbrain_service

    try:
        from systems.visual_shell.api.pixel_brain_service import get_pixel_brain_service

        # Try to get existing service (may not have visual bridge)
        service = get_pixel_brain_service()

        if service.is_available():
            # Attach mock visual bridge for logging
            if service.visual_bridge is None:
                service.visual_bridge = MockVisualBridge()
                log("Attached MockVisualBridge for event logging")

            _pixelbrain_service = service
            return service
        else:
            log("PixelBrain pipeline not available")
            return None

    except Exception as e:
        log(f"PixelBrain init error: {e}")
        return None


async def analyze_with_pixel_brain(context: str, history: str) -> str | None:
    """Use PixelBrain to analyze and generate next prompt."""

    service = await get_pixelbrain_with_visuals()
    if service is None:
        log("PixelBrain service unavailable, falling back to CLI")
        return None

    # Short prompt for faster inference (TinyStories-33M is small)
    prompt = f"""What should happen next in this session?

Context: {context[:200]}
Recent: {history[:500]}

Output ONE short prompt or WAIT or STUCK:"""

    try:
        result = await service.generate(
            prompt=prompt,
            max_tokens=20,  # Fewer tokens = faster
            temperature=0.7,
            emit_visual=True  # Emit THOUGHT_PULSE glyphs!
        )
        return result.get("text", "").strip()
    except Exception as e:
        log(f"PixelBrain generation error: {e}")
        return None


def is_valid_prompt(text: str) -> bool:
    """Check if the generated text is a valid prompt (not garbage)."""
    if not text or len(text) < 3:
        return False

    # Check for repetitive garbage (e.g., "!!!!!!!!" or "aaaa")
    if len(set(text)) < 3:
        return False

    # Check for mostly punctuation
    alpha_ratio = sum(c.isalpha() or c.isspace() for c in text) / len(text)
    if alpha_ratio < 0.5:
        return False

    return True


def analyze_with_cli_fallback(context: str, history: str) -> str | None:
    """Fallback to CLI if PixelBrain unavailable."""
    import subprocess

    prompt = f"""You are a meta-cognitive assistant. Determine the NEXT prompt.

CONTEXT: {context}
RECENT: {history[:2000]}

Output ONLY a single prompt (max 2 sentences) or "WAIT" or "STUCK: reason"."""

    try:
        result = subprocess.run(
            ["claude", "--print", "--dangerously-skip-permissions", prompt],
            capture_output=True,
            text=True,
            timeout=30
        )
        return result.stdout.strip()[:500] if result.returncode == 0 else None
    except Exception as e:
        log(f"CLI fallback error: {e}")
        return None


async def main():
    # Read hook input from stdin
    input_data = json.load(sys.stdin)

    event = input_data.get("hook_event_name", "")
    session_id = input_data.get("session_id", "")
    transcript_path = input_data.get("transcript_path", "")
    notification_type = input_data.get("notification_type", "")

    log(f"Hook fired: event={event}, session={session_id}, notif={notification_type}")

    # Determine context
    if event == "Stop":
        context = "The main Claude session just completed a turn."
    elif event == "Notification":
        if notification_type == "idle_prompt":
            context = "The main Claude session is idle and waiting for input."
        elif notification_type == "permission_prompt":
            context = "The main Claude session is waiting for permission approval."
        else:
            context = f"Notification: {notification_type}"
    else:
        log(f"Unhandled event: {event}")
        sys.exit(0)

    # Find history file
    if transcript_path and Path(transcript_path).exists():
        history_file = Path(transcript_path)
    else:
        history_files = sorted(
            HISTORY_DIR.glob("*.jsonl"),
            key=lambda p: p.stat().st_mtime,
            reverse=True
        )
        history_file = history_files[0] if history_files else None

    if not history_file:
        log("No history file found")
        sys.exit(0)

    log(f"Using history: {history_file}")

    # Extract recent conversation
    history = extract_history(history_file, 50)
    if not history:
        log("Could not extract history")
        sys.exit(0)

    # Try PixelBrain first, then CLI fallback
    next_prompt = await analyze_with_pixel_brain(context, history)

    # Validate PixelBrain output - fall back to CLI if garbage
    if next_prompt is None or not is_valid_prompt(next_prompt):
        if next_prompt:
            log(f"PixelBrain produced invalid output: {next_prompt[:50]}")
        log("Using CLI fallback")
        next_prompt = analyze_with_cli_fallback(context, history)

    if not next_prompt:
        log("No prompt generated - using sensible default")
        # Provide a sensible default prompt based on context
        if "idle" in context.lower():
            # Session is idle - check for obvious next steps
            next_prompt = "check git status and continue with any pending work"
        elif "completed a turn" in context.lower():
            # Just finished something - suggest verification
            next_prompt = "run tests to verify recent changes work correctly"
        else:
            # Generic fallback
            next_prompt = "what should we work on next?"

    log(f"Generated prompt: {next_prompt}")

    # Handle response
    if next_prompt.startswith("WAIT"):
        log("Session should wait")
        sys.exit(0)
    elif next_prompt.startswith("STUCK:"):
        reason = next_prompt[6:].strip()
        log(f"Session stuck: {reason}")
        sys.exit(0)
    else:
        # Track this prompt for evolution
        evolution_hook = get_evolution_hook()
        if evolution_hook:
            evolution_hook.on_meta_prompt_generated(next_prompt, event)
            log("Registered prompt with evolution hook")

        # Save state for PostToolUse tracking
        save_prompt_state(next_prompt, event)

        # Feed prompt to main session
        log(f"OUTPUT: {next_prompt}")
        print(next_prompt)
        sys.exit(0)


if __name__ == "__main__":
    asyncio.run(main())
