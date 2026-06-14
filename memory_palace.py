#!/usr/bin/env python3

import json
import sys
from datetime import datetime
from pathlib import Path

FACTS_FILE = Path.home() / "projects" / "zion" / "projects" / "geometry_os" / "geometry_os" / "memory_palace_facts.json"

def add_fact(tier: str, subject: str, content: str, path: str = ""):
    """
    Add a new fact to the Memory Palace.
    Tiers: critical, important, reference
    """
    if tier not in ["critical", "important", "reference"]:
        print(f"Invalid tier: {tier}. Use: critical, important, reference")
        sys.exit(1)

    # Load existing
    if FACTS_FILE.exists():
        with open(FACTS_FILE) as f:
            data = json.load(f)
    else:
        data = {"version": 1, "facts": []}

    # Find next ID
    max_id = max([f["id"] for f in data["facts"]], default=0)

    # Assign position (simple round-robin)
    ring = len(data["facts"]) % 3
    angle = (len(data["facts"]) * 30) % 360

    # Add new fact
    data["facts"].append({
        "id": max_id + 1,
        "tier": tier,
        "subject": subject,
        "content": content,
        "path": path,
        "ring": ring,
        "angle": angle
    })

    data["last_updated"] = datetime.now().isoformat()

    # Write back
    with open(FACTS_FILE, "w") as f:
        json.dump(data, f, indent=2)

    print(f"✓ Added fact #{max_id + 1}: {subject}")

def list_facts():
    """List all facts in the palace."""
    if not FACTS_FILE.exists():
        print("No facts file exists yet.")
        return

    with open(FACTS_FILE) as f:
        data = json.load(f)

    print(f"Memory Palace: {len(data['facts'])} facts\n")

    for fact in data["facts"]:
        emoji = {"critical": "🔴", "important": "🟡", "reference": "🔵"}[fact["tier"]]
        print(f"{emoji} [{fact['id']}] {fact['subject']}")
        if fact["content"]:
            print(f"    {fact['content'][:80]}...")
        if fact["path"]:
            print(f"    Path: {fact['path']}")
        print()

def clear_facts():
    """Clear all facts from the palace."""
    data = {
        "version": 1,
        "last_updated": datetime.now().isoformat(),
        "facts": []
    }
    with open(FACTS_FILE, "w") as f:
        json.dump(data, f, indent=2)
    print("✓ Cleared all facts from Memory Palace")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: memory_palace.py <add|list|clear> [args...]")
        print("\nCommands:")
        print("  add <tier> <subject> <content> [path]")
        print("  list")
        print("  clear")
        print("\nTiers: critical, important, reference")
        sys.exit(1)

    cmd = sys.argv[1]

    if cmd == "add":
        if len(sys.argv) < 5:
            print("Usage: memory_palace.py add <tier> <subject> <content> [path]")
            sys.exit(1)
        tier = sys.argv[2]
        subject = sys.argv[3]
        content = sys.argv[4]
        path = sys.argv[5] if len(sys.argv) > 5 else ""
        add_fact(tier, subject, content, path)

    elif cmd == "list":
        list_facts()

    elif cmd == "clear":
        clear_facts()

    else:
        print(f"Unknown command: {cmd}")
        sys.exit(1)