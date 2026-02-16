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
from dataclasses import dataclass, field, asdict
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


class FileBrowser:
    """Visual file browser on the infinite map."""

    def __init__(self, ws, bridge: VMLinuxBridge, start_path: str = "/"):
        self.ws = ws
        self.bridge = bridge
        self.current_path = start_path
        self.expanded_dirs: Set[str] = set()
        self.file_cache: Dict[str, List[FileInfo]] = {}
        self.layout = SpatialLayout()
        self.msg_id = int(time.time() * 1000)
        self.all_files: List[FileInfo] = []

    async def send_js(self, js_code: str) -> Optional[dict]:
        """Send JavaScript to browser via CDP."""
        self.msg_id += 1
        payload = {
            "id": self.msg_id,
            "method": "Runtime.evaluate",
            "params": {"expression": js_code, "returnByValue": True}
        }
        await self.ws.send(json.dumps(payload))
        try:
            response = await asyncio.wait_for(self.ws.recv(), timeout=5.0)
            return json.loads(response)
        except asyncio.TimeoutError:
            return None

    async def list_directory(self, path: str) -> List[FileInfo]:
        """Get file listing for a directory."""
        if path in self.file_cache:
            return self.file_cache[path]

        result = await self.bridge.execute(f"ls -la '{path}'")
        if result.exit_code != 0:
            print(f"Error listing {path}: {result.stderr}")
            return []

        files = parse_ls_output(result.stdout, path)
        self.file_cache[path] = files
        return files

    async def navigate_to(self, path: str):
        """Navigate to a directory and display its contents."""
        self.current_path = path
        self.expanded_dirs = {path}
        self.all_files = []

        files = await self.list_directory(path)
        self.layout.layout_grid(files)
        self.all_files = files

        await self.render()

    async def expand_directory(self, dir_info: FileInfo):
        """Expand a directory in-place with radial layout."""
        if dir_info.path in self.expanded_dirs:
            # Collapse - remove children
            self.expanded_dirs.discard(dir_info.path)
            self.all_files = [f for f in self.all_files
                            if not f.path.startswith(dir_info.path + "/")]
        else:
            # Expand - add children with radial layout
            self.expanded_dirs.add(dir_info.path)
            children = await self.list_directory(dir_info.path)
            self.layout.layout_radial(children, dir_info.x, dir_info.y)
            self.all_files.extend(children)

        await self.render()

    async def refresh(self):
        """Refresh current view."""
        self.file_cache.clear()
        await self.navigate_to(self.current_path)

    async def init_display(self):
        """Initialize the file browser display with click handling."""
        setup_js = """
            // Initialize file browser state
            window.fileBrowser = {
                tiles: [],
                clickSocket: null
            };

            // Connect to click server
            try {
                window.fileBrowser.clickSocket = new WebSocket('ws://localhost:8766');
                window.fileBrowser.clickSocket.onopen = () => {
                    console.log('File browser click socket connected');
                };
                window.fileBrowser.clickSocket.onerror = (e) => {
                    console.error('Click socket error:', e);
                };
            } catch (e) {
                console.error('Failed to connect click socket:', e);
            }

            // Click detection for tiles
            window.geometryOSApp.app.view.addEventListener('click', (e) => {
                const rect = window.geometryOSApp.app.view.getBoundingClientRect();
                const x = e.clientX - rect.left;
                const y = e.clientY - rect.top;

                // Find clicked tile
                const tiles = window.fileBrowser.tiles;
                for (const tile of tiles) {
                    if (x >= tile.x && x <= tile.x + tile.width &&
                        y >= tile.y && y <= tile.y + tile.height) {
                        // Send click event
                        if (window.fileBrowser.clickSocket &&
                            window.fileBrowser.clickSocket.readyState === WebSocket.OPEN) {
                            window.fileBrowser.clickSocket.send(JSON.stringify({
                                type: 'tile_click',
                                path: tile.path,
                                name: tile.name,
                                fileType: tile.fileType
                            }));
                        }
                        break;
                    }
                }
            });

            'File browser initialized';
        """
        await self.send_js(setup_js)
        print("File browser display initialized")

    async def render(self):
        """Render all files as color-coded tiles on the map."""
        # Clear existing graphics and tile registry
        await self.send_js("window.geometryOSApp.clearGraphics()")

        # Build tile registry in browser
        tiles_js = "window.fileBrowser.tiles = ["
        for f in self.all_files:
            tiles_js += f"""{{
                path: '{self._escape_js(f.path)}',
                name: '{self._escape_js(f.name)}',
                fileType: '{f.file_type}',
                x: {f.x},
                y: {f.y},
                width: {self.layout.TILE_WIDTH},
                height: {self.layout.TILE_HEIGHT}
            }},"""
        tiles_js += "];"
        await self.send_js(tiles_js)

        # Draw each file tile
        for i, f in enumerate(self.all_files):
            await self.draw_tile(f, f"file_{i}")

        print(f"Rendered {len(self.all_files)} files from {self.current_path}")

    async def draw_tile(self, f: FileInfo, id: str):
        """Draw a single file tile."""
        is_dir = "true" if f.file_type == 'directory' else "false"
        js = f"""
            (function() {{
                const x = {f.x};
                const y = {f.y};
                const w = {self.layout.TILE_WIDTH};
                const h = {self.layout.TILE_HEIGHT};
                const color = {f.color};
                const name = '{self._escape_js(f.name)}';
                const isDir = {is_dir};

                // Tile background
                window.geometryOSApp.drawRect(x, y, w, h, color, 0.8);

                // Border for directories
                if (isDir) {{
                    window.geometryOSApp.drawRect(x-1, y-1, w+2, 2, color, 1.0);
                    window.geometryOSApp.drawRect(x-1, y+h, w+2, 2, color, 1.0);
                    window.geometryOSApp.drawRect(x-1, y-1, 2, h+2, color, 1.0);
                    window.geometryOSApp.drawRect(x+w, y-1, 2, h+2, color, 1.0);
                }}

                // Filename (truncated)
                const displayName = name.length > 12 ? name.substring(0, 10) + '...' : name;
                window.geometryOSApp.placeText('{id}', displayName, x + w/2, y + h/2,
                    {{fontFamily: 'Courier New', fontSize: 12, fill: 0x000000}});

                return '{id}';
            }})();
        """
        await self.send_js(js)

    async def read_file(self, path: str, max_bytes: int = 10000) -> dict:
        """
        Read file contents.

        Args:
            path: File path to read
            max_bytes: Maximum bytes to read (default 10KB)

        Returns:
            Dict with content, truncated flag
        """
        result = await self.bridge.execute(f"head -c {max_bytes} {path}", timeout=5)

        if result.exit_code != 0:
            return {"error": result.stderr, "content": "", "truncated": False}

        content = result.stdout
        truncated = len(content) >= max_bytes

        return {
            "content": content,
            "truncated": truncated,
            "path": path,
        }

    async def find_files(self, pattern: str, root: str = "/") -> list:
        """
        Find files matching a pattern.

        Args:
            pattern: Glob pattern (e.g., "*.log")
            root: Root directory to search

        Returns:
            List of FileInfo dicts
        """
        result = await self.bridge.execute(f"find {root} -name '{pattern}' -type f 2>/dev/null | head -50", timeout=10)

        if result.exit_code != 0 or not result.stdout.strip():
            return []

        files = []
        for line in result.stdout.strip().split('\n')[:50]:
            if line:
                # Get file info
                info_result = await self.bridge.execute(f"ls -la '{line}' 2>/dev/null", timeout=2)
                if info_result.exit_code == 0:
                    parsed = parse_ls_output(info_result.stdout, line.rsplit('/', 1)[0])
                    if parsed:
                        files.append(asdict(parsed[0]))

        return files

    def get_state(self) -> dict:
        """Get browser state as a dictionary."""
        return {
            "current_path": self.current_path,
            "files_count": len(self.files) if hasattr(self, 'files') else 0,
            "x": self.x if hasattr(self, 'x') else 0,
            "y": self.y if hasattr(self, 'y') else 0,
        }

    def _escape_js(self, s: str) -> str:
        """Escape string for JavaScript."""
        return s.replace('\\', '\\\\').replace("'", "\\'").replace('"', '\\"')


class ClickServer:
    """WebSocket server that receives click events from browser."""

    def __init__(self, browser: FileBrowser, port: int = 8766):
        self.browser = browser
        self.port = port
        self.clients = set()

    async def handle_client(self, websocket):
        """Handle incoming click messages."""
        self.clients.add(websocket)
        try:
            async for message in websocket:
                data = json.loads(message)
                await self.process_click(data)
        except websockets.exceptions.ConnectionClosed:
            pass
        finally:
            self.clients.discard(websocket)

    async def process_click(self, data: dict):
        """Process a click event on a file tile."""
        event_type = data.get('type')

        if event_type == 'tile_click':
            path = data.get('path', '')
            # Find the clicked file
            for f in self.browser.all_files:
                if f.path == path:
                    if f.file_type == 'directory':
                        print(f"Expanding directory: {path}")
                        await self.browser.expand_directory(f)
                    else:
                        print(f"Clicked file: {path}")
                        # Future: show preview card
                    break
        elif event_type == 'navigate':
            path = data.get('path', '/')
            await self.browser.navigate_to(path)

    async def start(self):
        """Start the WebSocket server."""
        self.server = await serve(self.handle_client, "localhost", self.port)
        print(f"Click server listening on ws://localhost:{self.port}")


def parse_args():
    """Parse command line arguments."""
    parser = argparse.ArgumentParser(description='Geometry OS Visual File Browser')
    parser.add_argument(
        '--backend',
        choices=['host', 'qemu', 'wgpu'],
        default='host',
        help='Execution backend: host (default), qemu, or wgpu'
    )
    parser.add_argument(
        '--path',
        default='/',
        help='Starting directory path (default: /)'
    )
    return parser.parse_args()


async def create_bridge(backend: str, cdp_ws=None) -> VMLinuxBridge:
    """Create the appropriate bridge based on backend selection."""
    if backend == 'host':
        print(f"Using HostBridge (subprocess execution)")
        return HostBridge()
    elif backend == 'qemu':
        print(f"Using QEMUBridge")
        bridge = QEMUBridge()
        if await bridge.start():
            return bridge
        else:
            print("WARNING: Failed to start QEMU, falling back to HostBridge")
            return HostBridge()
    elif backend == 'wgpu':
        print("Using WGPUBridge")
        if cdp_ws is None:
            print("WARNING: No CDP connection for WGPU, falling back to HostBridge")
            return HostBridge()
        bridge = WGPUBridge(cdp_ws)
        if await bridge.start():
            return bridge
        else:
            print("WARNING: Failed to initialize WGPU, falling back to HostBridge")
            return HostBridge()
    else:
        return HostBridge()


async def main():
    """Main entry point."""
    args = parse_args()

    print("=== Geometry OS: Visual File Browser ===")
    print(f"Backend: {args.backend}")
    print(f"Start path: {args.path}")
    print()

    # Connect to browser via CDP
    try:
        resp = requests.get("http://localhost:9222/json")
        pages = resp.json()
        page = next((p for p in pages if "index.html" in p.get("url", "")), None)

        if not page:
            print("ERROR: Could not find 'index.html'. Is the Geometry OS app running?")
            return

        ws_url = page['webSocketDebuggerUrl']
        print(f"Connecting to: {page.get('url')}")

    except requests.exceptions.ConnectionError:
        print("ERROR: Cannot connect to Chrome. Is it running with --remote-debugging-port=9222?")
        return

    async with websockets.connect(ws_url) as ws:
        # Create bridge and browser
        bridge = await create_bridge(args.backend, cdp_ws=ws)
        browser = FileBrowser(ws, bridge=bridge, start_path=args.path)

        # Create click server
        click_server = ClickServer(browser, port=8766)

        # Initialize display
        await browser.init_display()
        await click_server.start()

        print()
        print("File browser ready!")
        print()
        print("  • Click on directories to expand/collapse")
        print("  • Click on files to see info (coming soon)")
        print()

        # Navigate to start path
        await browser.navigate_to(args.path)

        # Run forever
        await click_server.server.serve_forever()

    print("\nFile browser session ended.")


if __name__ == "__main__":
    asyncio.run(main())
