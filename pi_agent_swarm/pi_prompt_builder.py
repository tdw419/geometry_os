#!/usr/bin/env python3
import sys
from pathlib import Path

# Simplified builder to avoid argument splitting issues in shell
def main():
    handoff_path = Path("pi_agent_swarm/handoff.md")
    handoff = handoff_path.read_text().strip() if handoff_path.exists() else "Start mission."
    
    # Simple history stub for robust building
    prompt = f"""
# PI AGENT MISSION START
{handoff}
"""
    print(prompt)

if __name__ == "__main__":
    main()
