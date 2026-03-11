#!/usr/bin/env python3
import json
import sys
from pathlib import Path

def extract_last_messages(jsonl_path: Path, n: int = 5) -> str:
    if not jsonl_path.exists():
        return ""
    
    messages = []
    try:
        with open(jsonl_path, 'r') as f:
            for line in f:
                try:
                    obj = json.loads(line)
                    # Support both standard Claude Code format and variations
                    role = obj.get("role") or (obj.get("message", {}).get("role"))
                    content = obj.get("content") or (obj.get("message", {}).get("content"))
                    
                    if role in ["user", "assistant"] and content:
                        # Handle content as list of text blocks
                        if isinstance(content, list):
                            text = "".join(b.get("text", "") for b in content if b.get("type") == "text")
                        else:
                            text = str(content)
                        
                        messages.append(f"[{role.upper()}]: {text[:1000]}")
                except (json.JSONDecodeError, AttributeError):
                    continue
    except Exception as e:
        return f"Error reading logs: {e}"

    return "\n\n".join(messages[-n:])

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: extract_history.py <jsonl_path> [n]")
        sys.exit(1)
    
    path = Path(sys.argv[1])
    count = int(sys.argv[2]) if len(sys.argv) > 2 else 5
    print(extract_last_messages(path, count))
