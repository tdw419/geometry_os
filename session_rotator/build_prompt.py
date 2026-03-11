#!/usr/bin/env python3
"""build_prompt.py - Build session prompt from handoff and history"""

import json
import os
import re
from pathlib import Path
from typing import List, Dict, Any

def load_handoff(handoff_file: Path) -> str:
    """Load handoff context."""
    if handoff_file.exists():
        return handoff_file.read_text()
    return ""

def search_history(query: str, limit: int = 10) -> List[str]:
    """Search recent conversation history for relevant context."""
    # Support both Claude and Gemini/Pi CLI paths
    home = Path.home()
    search_paths = [
        home / ".claude" / "projects",
        home / ".pi" / "agent" / "sessions"
    ]
    
    results = []
    seen_hashes = set()

    for base_path in search_paths:
        if not base_path.exists():
            continue

        try:
            # Recursively find all .jsonl files, sorted by mtime
            jsonl_files = []
            for root, _, files in os.walk(base_path):
                for f in files:
                    if f.endswith(".jsonl"):
                        p = Path(root) / f
                        jsonl_files.append((p, p.stat().st_mtime))
            
            jsonl_files.sort(key=lambda x: x[1], reverse=True)
            
            # Search through the most recent 20 files
            for jsonl_file, _ in jsonl_files[:20]:
                try:
                    with open(jsonl_file, 'r', encoding='utf-8', errors='ignore') as f:
                        lines = f.readlines()
                        
                        # Process in reverse to get most recent context first
                        for line in reversed(lines):
                            try:
                                obj = json.loads(line)
                                msg = obj.get("message", {})
                                content = ""
                                
                                # Handle different JSON structures
                                if "content" in msg:
                                    c = msg["content"]
                                    if isinstance(c, list):
                                        content = " ".join(b.get("text", "") for b in c if isinstance(b, dict))
                                    else:
                                        content = str(c)
                                elif "text" in obj:
                                    content = obj["text"]
                                
                                if not content:
                                    continue

                                if query.lower() in content.lower():
                                    # Create a snippet and avoid duplicates
                                    snippet = content.strip()
                                    snippet_hash = hash(snippet[:200])
                                    
                                    if snippet_hash not in seen_hashes:
                                        results.append(snippet)
                                        seen_hashes.add(snippet_hash)
                                        
                                    if len(results) >= limit:
                                        break
                            except (json.JSONDecodeError, KeyError, AttributeError):
                                continue
                except (OSError, PermissionError):
                    continue
                
                if len(results) >= limit:
                    break
        except Exception as e:
            # Fallback for search errors
            continue

    return results[:limit]

def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--handoff", type=str, required=True)
    parser.add_argument("--search", type=str, default="")
    parser.add_argument("--limit", type=int, default=5)
    args = parser.parse_args()

    handoff = load_handoff(Path(args.handoff))
    prompt_parts = []

    # 1. CORE HANDOFF
    if handoff:
        prompt_parts.append("# Session Continuation\n\n")
        prompt_parts.append("You are continuing from a previous session. Use the following context to resume progress immediately.\n\n")
        prompt_parts.append("## Handoff Context\n\n")
        prompt_parts.append(handoff)
        prompt_parts.append("\n\n")

    # 2. SEMANTIC HISTORY SEARCH
    if args.search:
        history_snippets = search_history(args.search, limit=args.limit)
        if history_snippets:
            prompt_parts.append("## Relevant Historical Context\n\n")
            prompt_parts.append(f"Searching history for: '{args.search}'\n\n")
            for i, snippet in enumerate(history_snippets):
                # Clean and truncate snippet for prompt injection
                clean_snippet = re.sub(r'\s+', ' ', snippet).strip()
                if len(clean_snippet) > 1000:
                    clean_snippet = clean_snippet[:1000] + "... [truncated]"
                
                prompt_parts.append(f"### Context Block {i+1}\n")
                prompt_parts.append(f"```text\n{clean_snippet}\n```\n\n")

    # 3. DIRECTIVE
    prompt_parts.append("## Executive Directive\n\n")
    prompt_parts.append("- Continue the implementation/verification described in the handoff.\n")
    prompt_parts.append("- Do NOT provide summaries or meta-commentary about the session rotation.\n")
    prompt_parts.append("- If you have completed the task, include 'TASK COMPLETE' in your final response.\n")
    prompt_parts.append("- Use tools as needed to verify state before proceeding.\n")

    print("".join(prompt_parts))

if __name__ == "__main__":
    main()
