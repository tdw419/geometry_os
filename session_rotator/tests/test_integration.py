"""Integration tests for session rotator."""
import subprocess
from pathlib import Path

def test_detect_event_and_build_prompt_integration(tmp_path):
    """Test that detect_event and build_prompt work together."""
    # Create handoff
    handoff = tmp_path / "handoff.md"
    handoff.write_text("# Task\nWorking on it")

    # Build prompt
    prompt_result = subprocess.run(
        ["python3", "build_prompt.py", "--handoff", str(handoff)],
        capture_output=True, text=True
    )
    assert "## Session Continuation" in prompt_result.stdout

    # Detect event (should be 'continue')
    event_result = subprocess.run(
        ["python3", "detect_event.py", "--handoff", str(handoff), "--no-token-check"],
        capture_output=True, text=True
    )
    assert event_result.stdout.strip() == "continue"

    # Update handoff to complete
    handoff.write_text("TASK COMPLETE")

    # Detect event (should be 'complete')
    event_result = subprocess.run(
        ["python3", "detect_event.py", "--handoff", str(handoff), "--no-token-check"],
        capture_output=True, text=True
    )
    assert event_result.stdout.strip() == "complete"