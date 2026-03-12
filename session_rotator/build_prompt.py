#!/usr/bin/env python3
"""build_prompt.py - Build session prompt from history (and optional handoff)"""

import json
import os
import re
from pathlib import Path
from typing import List, Optional

def get_recent_sessions(limit: int = 5) -> List[tuple]:
    """Get most recent JSONL session files."""
    home = Path.home()
    search_paths = [
        home / ".claude" / "projects",
        home / ".pi" / "agent" / "sessions"
    ]

    sessions = []
    for base_path in search_paths:
        if not base_path.exists():
            continue
        try:
            for root, _, files in os.walk(base_path):
                for f in files:
                    if f.endswith(".jsonl"):
                        p = Path(root) / f
                        sessions.append((p, p.stat().st_mtime))
        except (OSError, PermissionError):
            continue

    sessions.sort(key=lambda x: x[1], reverse=True)
    return sessions[:limit]

def extract_recent_context(jsonl_path: Path, max_lines: int = 100) -> List[dict]:
    """Extract recent messages from a session file."""
    messages = []
    try:
        with open(jsonl_path, 'r', encoding='utf-8', errors='ignore') as f:
            lines = f.readlines()

        for line in reversed(lines[-max_lines:]):
            try:
                obj = json.loads(line)
                msg = obj.get("message", {})
                role = msg.get("role", obj.get("role", "unknown"))
                content = ""

                if "content" in msg:
                    c = msg["content"]
                    if isinstance(c, list):
                        content = " ".join(b.get("text", "") for b in c if isinstance(b, dict))
                    else:
                        content = str(c)
                elif "text" in obj:
                    content = obj["text"]

                if content and len(content) > 50:  # Skip tiny messages
                    messages.append({
                        "role": role,
                        "content": content[:2000],  # Truncate long messages
                        "file": jsonl_path.name
                    })
            except (json.JSONDecodeError, KeyError, AttributeError):
                continue
    except (OSError, PermissionError):
        pass

    return messages

def infer_current_task(messages: List[dict]) -> str:
    """Infer what task is being worked on from recent messages."""
    # Look for task-related patterns in recent user messages
    task_patterns = [
        r"(?:task|todo|fix|implement|add|create|improve|update)[:\s]+([^\n]+)",
        r"(?:working on|continue)[:\s]+([^\n]+)",
        r"(?:need to|should|must)[:\s]+([^\n]+)",
    ]

    for msg in reversed(messages):  # Most recent first
        if msg["role"] == "user":
            content = msg["content"]
            for pattern in task_patterns:
                match = re.search(pattern, content, re.IGNORECASE)
                if match:
                    return match.group(1).strip()

    # Fallback: look for recent assistant work
    for msg in reversed(messages):
        if msg["role"] == "assistant":
            content = msg["content"].lower()
            if any(word in content for word in ["implementing", "fixing", "adding", "creating"]):
                # Extract a sentence about what's being done
                sentences = msg["content"].split(".")
                for sent in sentences:
                    if any(word in sent.lower() for word in ["implementing", "fixing", "adding", "creating"]):
                        return sent.strip()[:200]

    return ""

def search_history(query: str, limit: int = 10) -> List[str]:
    """Search conversation history for relevant context."""
    sessions = get_recent_sessions(20)
    results = []
    seen_hashes = set()

    for jsonl_path, _ in sessions:
        messages = extract_recent_context(jsonl_path, max_lines=50)
        for msg in messages:
            if query.lower() in msg["content"].lower():
                snippet = msg["content"].strip()
                snippet_hash = hash(snippet[:200])

                if snippet_hash not in seen_hashes:
                    results.append(snippet)
                    seen_hashes.add(snippet_hash)

                if len(results) >= limit:
                    break
        if len(results) >= limit:
            break

    return results

def load_handoff(handoff_file: Path) -> str:
    """Load handoff context if exists."""
    if handoff_file.exists():
        return handoff_file.read_text()
    return ""

def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--handoff", type=str, default="")
    parser.add_argument("--search", type=str, default="")
    parser.add_argument("--limit", type=int, default=5)
    parser.add_argument("--auto", action="store_true", help="Auto-detect task from history")
    args = parser.parse_args()

    prompt_parts = []

    # 1. AUTO-DETECT TASK FROM HISTORY (if --auto or no handoff)
    if args.auto or not args.handoff:
        sessions = get_recent_sessions(3)
        all_messages = []
        for jsonl_path, _ in sessions:
            all_messages.extend(extract_recent_context(jsonl_path, max_lines=50))

        if all_messages:
            # Get the most recent context
            recent_user_msgs = [m for m in all_messages if m["role"] == "user"][:5]
            recent_assistant_msgs = [m for m in all_messages if m["role"] == "assistant"][:5]

            inferred_task = infer_current_task(all_messages)

            prompt_parts.append("# Autonomous Session Continuation\n\n")
            prompt_parts.append("You are an autonomous agent continuing work from a previous session.\n\n")

            if inferred_task:
                prompt_parts.append(f"## Inferred Current Task\n\n")
                prompt_parts.append(f"Based on recent conversation history, you appear to be working on:\n\n")
                prompt_parts.append(f"**{inferred_task}**\n\n")

            prompt_parts.append("## Recent Conversation Context\n\n")
            prompt_parts.append("Here are the most recent exchanges from your session history:\n\n")

            # Show recent context
            for msg in (recent_user_msgs + recent_assistant_msgs)[:8]:
                role = "User" if msg["role"] == "user" else "Assistant"
                content = re.sub(r'\s+', ' ', msg["content"]).strip()
                if len(content) > 500:
                    content = content[:500] + "... [truncated]"
                prompt_parts.append(f"**{role}:** {content}\n\n")

    # 2. HANDOFF FILE (if provided)
    if args.handoff:
        handoff = load_handoff(Path(args.handoff))
        if handoff:
            prompt_parts.append("## Handoff Context\n\n")
            prompt_parts.append(handoff)
            prompt_parts.append("\n\n")

    # 3. SEARCH RESULTS (if query provided)
    if args.search:
        results = search_history(args.search, limit=args.limit)
        if results:
            prompt_parts.append(f"## Search Results for '{args.search}'\n\n")
            for i, snippet in enumerate(results[:3]):
                clean = re.sub(r'\s+', ' ', snippet).strip()
                if len(clean) > 800:
                    clean = clean[:800] + "... [truncated]"
                prompt_parts.append(f"### Match {i+1}\n```\n{clean}\n```\n\n")

    # 4. EXECUTIVE DIRECTIVE
    prompt_parts.append("## Executive Directive\n\n")
    prompt_parts.append("1. **Continue the work** - Pick up where the previous session left off.\n")
    prompt_parts.append("2. **Be autonomous** - Make decisions and take action without asking for clarification.\n")
    prompt_parts.append("3. **Write code** - Implement features, fix bugs, make improvements.\n")
    prompt_parts.append("4. **Signal completion** - Include 'TASK COMPLETE' when done with a logical unit of work.\n")
    prompt_parts.append("5. **No meta-commentary** - Don't discuss the session rotation system itself.\n")

    print("".join(prompt_parts))

if __name__ == "__main__":
    main()
