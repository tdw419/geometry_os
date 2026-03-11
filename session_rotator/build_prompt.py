#!/usr/bin/env python3
"""build_prompt.py - Build session prompt from handoff and history"""

import json
from pathlib import Path

def load_handoff(handoff_file: Path) -> str:
    """Load handoff context."""
    if handoff_file.exists():
        return handoff_file.read_text()
    return ""

def search_history(query: str, limit: int = 5) -> list[str]:
    """Search recent conversation history for relevant context."""
    claude_home = Path.home() / ".claude" / "projects"
    if not claude_home.exists():
        return []

    try:
        project_dirs = sorted(claude_home.iterdir(), key=lambda d: d.stat().st_mtime, reverse=True)
    except (PermissionError, OSError):
        return []

    results = []
    for project_dir in project_dirs[:1]:
        try:
            jsonl_files = sorted(project_dir.glob("*.jsonl"), key=lambda f: f.stat().st_mtime, reverse=True)
        except (PermissionError, OSError):
            continue
        for jsonl_file in jsonl_files[:1]:
            try:
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
            except (OSError, PermissionError):
                continue

    return results[:limit]

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

    if args.search:
        history = search_history(args.search)
        if history:
            prompt_parts.append("\n## Relevant History\n")
            for h in history:
                prompt_parts.append(f"- {h[:200]}...\n")

    print("".join(prompt_parts))

if __name__ == "__main__":
    main()