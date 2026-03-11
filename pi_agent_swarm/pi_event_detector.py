#!/usr/bin/env python3
"""pi_event_detector.py - Monitor the handoff file for session events"""

from pathlib import Path

def main():
    handoff_file = Path("pi_agent_swarm/handoff.md")
    
    if not handoff_file.exists():
        print("continue")
        return
        
    content = handoff_file.read_text().lower()
    
    if "task complete" in content:
        print("complete")
    elif "rotate" in content:
        print("rotate")
    elif "error" in content:
        print("error")
    else:
        print("continue")

if __name__ == "__main__":
    main()
