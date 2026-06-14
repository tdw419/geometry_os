#!/usr/bin/env python3
"""
Memory Palace Bridge — shared knowledge store between host and VM Hermes.
Both instances read/write the same JSON facts file via the 9p shared mount.

Usage:
  python3 memory_palace_bridge.py add <tier> <subject> <content>
  python3 memory_palace_bridge.py list [tier]
  python3 memory_palace_bridge.py search <query>
  python3 memory_palace_bridge.py stats
"""
import json, sys, os
from datetime import datetime
from pathlib import Path

# The facts file is the canonical shared store
FACTS_FILE = Path(__file__).parent / "memory_palace_facts.json"

def load():
    if FACTS_FILE.exists():
        with open(FACTS_FILE) as f:
            return json.load(f)
    return {"version": 1, "facts": [], "last_updated": datetime.now().isoformat()}

def save(data):
    data["last_updated"] = datetime.now().isoformat()
    with open(FACTS_FILE, "w") as f:
        json.dump(data, f, indent=2)

def cmd_add(tier, subject, content, source=""):
    data = load()
    max_id = max([f["id"] for f in data["facts"]], default=0)
    ring = len(data["facts"]) % 3
    angle = (len(data["facts"]) * 30) % 360
    data["facts"].append({
        "id": max_id + 1, "tier": tier, "subject": subject,
        "content": content, "source": source or os.uname().nodename,
        "ring": ring, "angle": angle,
        "added": datetime.now().isoformat()
    })
    save(data)
    print(f"✓ Added fact #{max_id + 1} [{tier}] {subject}")

def cmd_list(tier=None):
    data = load()
    for f in data["facts"]:
        if tier and f["tier"] != tier:
            continue
        print(f"  #{f['id']:>4} [{f['tier']:>10}] {f['subject']}")
        print(f"        {f['content'][:100]}")
        print(f"        source={f.get('source','?')}")

def cmd_search(query):
    data = load()
    q = query.lower()
    for f in data["facts"]:
        if q in f["subject"].lower() or q in f["content"].lower():
            print(f"  #{f['id']:>4} [{f['tier']:>10}] {f['subject']}")
            print(f"        {f['content'][:120]}")

def cmd_stats():
    data = load()
    tiers = {}
    sources = {}
    for f in data["facts"]:
        tiers[f["tier"]] = tiers.get(f["tier"], 0) + 1
        src = f.get("source", "?")
        sources[src] = sources.get(src, 0) + 1
    print(f"Total facts: {len(data['facts'])}")
    print(f"By tier: {', '.join(f'{k}={v}' for k,v in sorted(tiers.items()))}")
    print(f"By source: {', '.join(f'{k}={v}' for k,v in sorted(sources.items()))}")
    print(f"Last updated: {data.get('last_updated','?')}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(__doc__); sys.exit(1)
    cmd = sys.argv[1]
    if cmd == "add" and len(sys.argv) >= 5:
        cmd_add(sys.argv[2], sys.argv[3], sys.argv[4], sys.argv[5] if len(sys.argv) > 5 else "")
    elif cmd == "list":
        cmd_list(sys.argv[2] if len(sys.argv) > 2 else None)
    elif cmd == "search" and len(sys.argv) >= 3:
        cmd_search(sys.argv[2])
    elif cmd == "stats":
        cmd_stats()
    else:
        print(__doc__)
