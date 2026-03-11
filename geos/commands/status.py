"""geos status - System health check."""

import sys
from pathlib import Path


def run(args) -> int:
    """Show system health check."""
    print("=" * 50)
    print("GEOMETRY OS STATUS")
    print("=" * 50)

    # Check LM Studio connection
    try:
        import requests
        r = requests.get("http://localhost:1234/v1/models", timeout=2)
        if r.ok:
            models = [m["id"] for m in r.json().get("data", [])]
            print(f"\n✅ LM Studio: Connected ({len(models)} models)")
            if models:
                print(f"   Primary: {models[0]}")
        else:
            print("\n❌ LM Studio: Connection failed")
    except Exception:
        print("\n❌ LM Studio: Not connected")
        print("   Hint: Start LM Studio on localhost:1234")

    # Check Sisyphus daemon
    checkpoint_path = Path(".loop/checkpoint.json")
    if checkpoint_path.exists():
        import json
        try:
            with open(checkpoint_path) as f:
                state = json.load(f)
            print(f"\n✅ Sisyphus: Checkpoint found")
            print(f"   Task: {state.get('task_name', 'Unknown')}")
            print(f"   Cycle: {state.get('cycle', 'Unknown')}")
        except Exception:
            print("\n⚠️  Sisyphus: Checkpoint corrupted")
    else:
        print("\n⚠️  Sisyphus: No checkpoint found")

    # Check systems
    systems_path = Path("systems")
    if systems_path.exists():
        systems = [d.name for d in systems_path.iterdir() if d.is_dir() and not d.name.startswith("_")]
        print(f"\n✅ Systems: {len(systems)} modules")
        print(f"   {', '.join(sorted(systems)[:5])}...")
    else:
        print("\n❌ Systems: Directory not found")

    print("\n" + "=" * 50)
    return 0
