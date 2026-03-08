#!/usr/bin/env python3
"""
Sisyphus v4 Entry Point
"""
import sys
import os

# Add project root to path
sys.path.insert(0, os.path.abspath(os.path.dirname(__file__)))

from systems.sisyphus.daemon import SisyphusDaemon

if __name__ == "__main__":
    daemon = SisyphusDaemon()
    daemon.run()
