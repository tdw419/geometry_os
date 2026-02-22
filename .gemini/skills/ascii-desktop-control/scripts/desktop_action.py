#!/usr/bin/env python3
"""
Desktop Action Script - Execute xdotool commands for desktop control.

Usage:
    desktop_action.py click "[x, y]"
    desktop_action.py type "text to type"
    desktop_action.py key "Control+L"
    desktop_action.py move "[x, y]"
"""

import subprocess
import sys
import json


def perform_action(action_type, target, value=None):
    """Execute a desktop action via xdotool."""
    if action_type == "click":
        x, y = target
        subprocess.run(["xdotool", "mousemove", str(x), str(y), "click", "1"], check=False)
    elif action_type == "type":
        subprocess.run(["xdotool", "type", value or target], check=False)
    elif action_type == "key":
        subprocess.run(["xdotool", "key", target], check=False)
    elif action_type == "move":
        x, y = target
        subprocess.run(["xdotool", "mousemove", str(x), str(y)], check=False)
    elif action_type == "windowfocus":
        subprocess.run(["xdotool", "windowfocus", target], check=False)
    elif action_type == "search":
        result = subprocess.run(
            ["xdotool", "search", "--name", target],
            capture_output=True,
            text=True
        )
        return result.stdout.strip().split('\n')[0] if result.stdout.strip() else None
    else:
        print(f"Unknown action: {action_type}")
        return False
    return True


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: desktop_action.py <action_type> <target> [value]")
        print("Actions: click, type, key, move, windowfocus, search")
        print('Examples:')
        print('  desktop_action.py click "[100, 200]"')
        print('  desktop_action.py type "Hello World"')
        print('  desktop_action.py key "Control+L"')
        sys.exit(1)

    action_type = sys.argv[1]
    target_str = sys.argv[2] if len(sys.argv) > 2 else None
    value = sys.argv[3] if len(sys.argv) > 3 else None

    # Parse target
    if target_str and target_str.startswith("["):
        try:
            target = json.loads(target_str)
        except json.JSONDecodeError:
            target = target_str
    else:
        target = target_str

    result = perform_action(action_type, target, value)
    if result is True:
        print(f"✓ Executed {action_type} on {target}")
    elif result is False:
        print(f"✗ Failed to execute {action_type}")
        sys.exit(1)
    else:
        print(f"Result: {result}")
