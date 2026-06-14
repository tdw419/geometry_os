#!/usr/bin/env python3
"""
Quick VCC checker - runs validation and prints just the overall accuracy.
Used by daemon for monitoring.
"""

import sys
import subprocess
from pathlib import Path

SCRIPTS_DIR = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os/scripts")

def run_vcc():
    """Run VCC and parse overall accuracy."""
    result = subprocess.run(
        ["python3", str(SCRIPTS_DIR / "vcc_validation_simple.py")],
        capture_output=True,
        text=True,
        timeout=600
    )

    if result.returncode != 0:
        print(f"Error: {result.stderr}")
        return None

    # Parse overall VCC from output
    for line in result.stdout.split('\n'):
        if "Overall VCC" in line:
            try:
                pct = line.split(':')[1].strip()
                return float(pct.replace('%', ''))
            except:
                pass

    return None

if __name__ == "__main__":
    vcc = run_vcc()
    if vcc is not None:
        print(f"{vcc:.2f}%")
        sys.exit(0)
    else:
        print("ERROR")
        sys.exit(1)