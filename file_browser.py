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


def parse_ls_output(output: str, parent_path: str) -> List[FileInfo]:
    """
    Parse output from 'ls -la' command into FileInfo objects.

    Args:
        output: Raw output from ls -la
        parent_path: The directory path these files are in

    Returns:
        List of FileInfo objects
    """
    files = []
    lines = output.strip().split('\n')

    for line in lines[1:]:  # Skip "total X" line
        if not line.strip():
            continue

        # Parse ls -la format: permissions, links, owner, group, size, date, time, name
        parts = line.split(None, 8)
        if len(parts) < 9:
            continue

        permissions = parts[0]
        size_str = parts[4]
        modified = f"{parts[5]} {parts[6]} {parts[7]}"
        name = parts[8]

        # Skip . and ..
        if name in ('.', '..'):
            continue

        # Determine file type
        if permissions.startswith('d'):
            file_type = 'directory'
        elif permissions.startswith('l'):
            file_type = 'symlink'
        elif 'x' in permissions[1:4]:
            file_type = 'executable'
        else:
            file_type = 'file'

        # Parse size
        try:
            size = int(size_str)
        except ValueError:
            size = 0

        # Create full path
        full_path = f"{parent_path.rstrip('/')}/{name}"

        info = FileInfo(
            name=name,
            path=full_path,
            file_type=file_type,
            size=size,
            permissions=permissions,
            modified=modified
        )
        info.color = info.get_color()
        files.append(info)

    return files


class SpatialLayout:
    """Calculates positions for file tiles on the map."""

    TILE_WIDTH = 120
    TILE_HEIGHT = 60
    TILE_PADDING = 10
    GRID_COLUMNS = 6

    def __init__(self, origin_x: int = 100, origin_y: int = 100):
        self.origin_x = origin_x
        self.origin_y = origin_y

    def layout_grid(self, files: List[FileInfo]) -> List[FileInfo]:
        """Layout files in a grid pattern starting at origin."""
        col = 0
        row = 0

        for f in files:
            f.x = self.origin_x + col * (self.TILE_WIDTH + self.TILE_PADDING)
            f.y = self.origin_y + row * (self.TILE_HEIGHT + self.TILE_PADDING)

            col += 1
            if col >= self.GRID_COLUMNS:
                col = 0
                row += 1

        return files

    def layout_radial(self, files: List[FileInfo], center_x: int, center_y: int,
                      radius: int = 200) -> List[FileInfo]:
        """Layout files in a radial pattern around a center point."""
        if not files:
            return files

        angle_step = (2 * math.pi) / len(files)

        for i, f in enumerate(files):
            angle = i * angle_step - math.pi / 2  # Start from top
            f.x = int(center_x + radius * math.cos(angle))
            f.y = int(center_y + radius * math.sin(angle))

        return files
