#!/usr/bin/env python3
"""
Sisyphus v4 Entry Point
"""
import sys
import os
import argparse

# Add project root to path
sys.path.insert(0, os.path.abspath(os.path.dirname(__file__)))

from systems.sisyphus.daemon import SisyphusDaemon

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Sisyphus v4 Evolution Daemon")
    parser.add_argument("--brain", action="store_true", help="Enable PixelBrain evolution")
    parser.add_argument("--rewriting", action="store_true", help="Enable self-rewriting kernel")
    parser.add_argument("--tectonic", action="store_true", help="Enable tectonic gravity engine")
    parser.add_argument("--commit", action="store_true", help="Enable automatic git commits")
    
    args = parser.parse_args()

    daemon = SisyphusDaemon(
        enable_brain_evolution=args.brain,
        enable_self_rewriting=args.rewriting,
        enable_tectonic=args.tectonic,
        auto_commit=args.commit
    )
    daemon.run()
