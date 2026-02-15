"""
Geometry OS: Visual File Browser

A spatial file browser that displays files as color-coded tiles on the map.

Usage:
    python3 file_browser.py                    # Host backend (default)
    python3 file_browser.py --backend qemu     # QEMU backend
    python3 file_browser.py --path /home/user  # Start at specific path
"""

import argparse
import asyncio
import json
import math
import re
import requests
import websockets
from websockets.server import serve
from dataclasses import dataclass, field
from typing import List, Dict, Set, Optional
import time

from vm_linux_bridge import VMLinuxBridge, HostBridge, QEMUBridge, WGPUBridge


# Color coding for file types
FILE_COLORS = {
    'directory': 0x4A90D9,    # Blue
    'executable': 0x2ECC71,   # Green
    'code': 0x1ABC9C,         # Teal
    'data': 0xF1C40F,         # Yellow
    'media': 0x9B59B6,        # Purple
    'config': 0xE67E22,       # Orange
    'document': 0xECF0F1,     # White
    'other': 0x95A5A6,        # Gray
}

# File extension mappings
EXTENSION_MAP = {
    'code': ['.py', '.js', '.ts', '.sh', '.bash', '.zsh', '.c', '.cpp', '.h', '.rs', '.go', '.java', '.rb', '.php', '.lua', '.wasm'],
    'data': ['.json', '.csv', '.xml', '.yaml', '.yml', '.toml', '.sql', '.db', '.sqlite'],
    'media': ['.png', '.jpg', '.jpeg', '.gif', '.bmp', '.svg', '.mp3', '.wav', '.mp4', '.avi', '.mkv', '.webm'],
    'config': ['.conf', '.cfg', '.ini', '.env', '.config', '.dockerfile'],
    'document': ['.md', '.txt', '.pdf', '.doc', '.docx', '.rst', '.html', '.css'],
}


@dataclass
class FileInfo:
    """Information about a file or directory."""
    name: str
    path: str
    file_type: str  # 'directory', 'file', 'symlink', 'executable'
    size: int       # bytes
    permissions: str
    modified: str
    x: int = 0
    y: int = 0
    color: int = 0xFFFFFF

    def get_color(self) -> int:
        """Determine color based on file type and extension."""
        if self.file_type == 'directory':
            return FILE_COLORS['directory']
        if self.file_type == 'executable':
            return FILE_COLORS['executable']

        # Check extension
        ext = '.' + self.name.rsplit('.', 1)[-1].lower() if '.' in self.name else ''
        for category, extensions in EXTENSION_MAP.items():
            if ext in extensions:
                return FILE_COLORS[category]

        return FILE_COLORS['other']
