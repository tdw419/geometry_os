#!/usr/bin/env python3
"""build_prompt.py - Build session prompt from handoff and history"""

from pathlib import Path

def load_handoff(handoff_file: Path) -> str:
    """Load handoff context."""
    if handoff_file.exists():
        return handoff_file.read_text()
    return ""

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

    # Placeholder for Task 8
    if args.search:
        prompt_parts.append("\n## Relevant History\n")
        prompt_parts.append("(History search not yet implemented)\n")

    print("".join(prompt_parts))

if __name__ == "__main__":
    main()