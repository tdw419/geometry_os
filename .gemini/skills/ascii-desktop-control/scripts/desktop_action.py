import sys
import subprocess
import json
import os

def perform_action(action_type, target, value=None):
    if action_type == "click":
        # target is [x, y]
        x, y = target
        subprocess.run(["xdotool", "mousemove", str(x), str(y), "click", "1"])
    elif action_type == "type":
        subprocess.run(["xdotool", "type", value])
    elif action_type == "key":
        subprocess.run(["xdotool", "key", target])
    elif action_type == "move":
        x, y = target
        subprocess.run(["xdotool", "mousemove", str(x), str(y)])

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: desktop_action.py <action_type> <target> [value]")
        sys.exit(1)
        
    action_type = sys.argv[1]
    target_str = sys.argv[2]
    value = sys.argv[3] if len(sys.argv) > 3 else None
    
    try:
        target = json.loads(target_str)
    except:
        target = target_str # string for key/type
        
    perform_action(action_type, target, value)
    print(f"Executed {action_type} on {target}")
