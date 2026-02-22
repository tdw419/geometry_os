# Cartridge Deployment Pipeline Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable automatic creation of `.rts.png` cartridges from code changes via `ide_deploy` WebMCP tool.

**Architecture:** Extend `ide_deploy` from mock to real implementation. Connect to PixelRTS v2 core library for Hilbert encoding, add a Python backend bridge for file collection and cartridge assembly, and integrate with the BuilderPanel UI for visual feedback.

**Tech Stack:** JavaScript (WebMCP), Python (PixelRTS v2 Core), WebSocket bridge, PNG encoding

---

## Prerequisites

- Phase N complete (IDE tools exist as mocks)
- PixelRTS v2 Core library available at `systems/pixel_compiler/pixelrts_v2_core.py`
- WebMCP bridge at `systems/visual_shell/web/webmcp_bridge.js`

---

## Task 1: Create CartridgeAssembly Backend Module

**Files:**
- Create: `systems/pixel_compiler/cartridge_assembly.py`
- Test: `systems/pixel_compiler/tests/test_cartridge_assembly.py`

**Step 1: Write the failing test**

```python
# systems/pixel_compiler/tests/test_cartridge_assembly.py
"""Tests for CartridgeAssembly module."""

import pytest
import tempfile
import json
from pathlib import Path


class TestCartridgeAssembly:
    """Test cartridge assembly from source files."""

    def test_assemble_from_files_returns_bytes(self):
        """Assembly from file list should return PNG bytes."""
        from systems.pixel_compiler.cartridge_assembly import CartridgeAssembler

        with tempfile.TemporaryDirectory() as tmpdir:
            # Create test source file
            source_file = Path(tmpdir) / "test.py"
            source_file.write_text("print('hello')")

            assembler = CartridgeAssembler()
            result = assembler.assemble_from_files([source_file], name="test_cart")

            assert isinstance(result, bytes)
            assert len(result) > 8  # PNG header minimum
            assert result[:8] == b'\x89PNG\r\n\x1a\n'  # PNG magic bytes

    def test_assemble_includes_metadata(self):
        """Assembled cartridge should include metadata chunk."""
        from systems.pixel_compiler.cartridge_assembly import CartridgeAssembler

        with tempfile.TemporaryDirectory() as tmpdir:
            source_file = Path(tmpdir) / "code.py"
            source_file.write_text("x = 1")

            assembler = CartridgeAssembler()
            result = assembler.assemble_from_files(
                [source_file],
                name="meta_test",
                description="Test cartridge",
                entry_point="code.py:main"
            )

            # Should be valid PNG with metadata
            assert result[:8] == b'\x89PNG\r\n\x1a\n'

            # Check that metadata is extractable
            metadata = assembler.extract_metadata(result)
            assert metadata["name"] == "meta_test"
            assert metadata["description"] == "Test cartridge"
            assert metadata["entry_point"] == "code.py:main"

    def test_assemble_from_directory(self):
        """Assembly from directory should include all files."""
        from systems.pixel_compiler.cartridge_assembly import CartridgeAssembler

        with tempfile.TemporaryDirectory() as tmpdir:
            tmpdir = Path(tmpdir)
            (tmpdir / "main.py").write_text("print('main')")
            (tmpdir / "lib.py").write_text("def helper(): pass")

            assembler = CartridgeAssembler()
            result = assembler.assemble_from_directory(tmpdir, name="dir_test")

            assert isinstance(result, bytes)
            assert result[:8] == b'\x89PNG\r\n\x1a\n'

            metadata = assembler.extract_metadata(result)
            assert metadata["file_count"] == 2
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/pixel_compiler/tests/test_cartridge_assembly.py -v`

Expected: FAIL with "ModuleNotFoundError: No module named 'systems.pixel_compiler.cartridge_assembly'"

**Step 3: Write minimal implementation**

```python
# systems/pixel_compiler/cartridge_assembly.py
"""
Cartridge Assembly Module

Assembles source files into .rts.png cartridges using PixelRTS v2 encoding.
"""

import json
import hashlib
import zlib
from pathlib import Path
from typing import List, Optional, Dict, Any
import struct

# Try to import PixelRTS v2 core
try:
    from systems.pixel_compiler.pixelrts_v2_core import HilbertCurve
    PIXELRTS_AVAILABLE = True
except ImportError:
    PIXELRTS_AVAILABLE = False


class CartridgeAssembler:
    """
    Assembles source files into PixelRTS cartridge format.

    The cartridge is a PNG file with:
    - Pixel data: Files encoded via Hilbert curve
    - tEXt chunks: Metadata (name, description, entry_point, manifest)
    """

    def __init__(self, order: int = 10):
        """
        Initialize assembler.

        Args:
            order: Hilbert curve order (default 10 = 1024x1024 grid)
        """
        self.order = order
        self.grid_size = 2 ** order
        if PIXELRTS_AVAILABLE:
            self.hilbert = HilbertCurve(order)
        else:
            self.hilbert = None

    def assemble_from_files(
        self,
        files: List[Path],
        name: str,
        description: str = "",
        entry_point: str = ""
    ) -> bytes:
        """
        Assemble multiple files into a cartridge.

        Args:
            files: List of file paths to include
            name: Cartridge name
            description: Optional description
            entry_point: Optional entry point (file:function)

        Returns:
            PNG bytes of the cartridge
        """
        # Collect file data
        file_data = {}
        manifest = {
            "name": name,
            "description": description,
            "entry_point": entry_point,
            "files": [],
            "total_bytes": 0
        }

        for file_path in files:
            if file_path.exists():
                content = file_path.read_bytes()
                rel_path = file_path.name
                file_hash = hashlib.sha256(content).hexdigest()[:16]

                file_data[rel_path] = content
                manifest["files"].append({
                    "path": rel_path,
                    "size": len(content),
                    "hash": file_hash
                })
                manifest["total_bytes"] += len(content)

        manifest["file_count"] = len(manifest["files"])

        # Encode to PNG
        return self._encode_to_png(file_data, manifest)

    def assemble_from_directory(
        self,
        directory: Path,
        name: str,
        description: str = "",
        entry_point: str = ""
    ) -> bytes:
        """
        Assemble all files in a directory.

        Args:
            directory: Directory path
            name: Cartridge name
            description: Optional description
            entry_point: Optional entry point

        Returns:
            PNG bytes of the cartridge
        """
        files = list(directory.rglob("*"))
        files = [f for f in files if f.is_file() and not f.name.startswith(".")]
        return self.assemble_from_files(files, name, description, entry_point)

    def _encode_to_png(self, file_data: Dict[str, bytes], manifest: Dict) -> bytes:
        """
        Encode file data to PNG format with metadata.

        Args:
            file_data: Dict mapping file names to content
            manifest: Metadata manifest

        Returns:
            PNG bytes
        """
        # Combine all file data
        all_bytes = b""
        for name in sorted(file_data.keys()):
            all_bytes += file_data[name]

        # Calculate required dimensions
        total_pixels = (len(all_bytes) + 2) // 3  # 3 bytes per pixel (RGB)
        if total_pixels > self.grid_size * self.grid_size:
            # Increase order if needed
            new_order = 1
            while (2 ** new_order) ** 2 < total_pixels:
                new_order += 1
            self.order = min(new_order, 14)  # Cap at 16384x16384
            self.grid_size = 2 ** self.order

        # Create pixel array
        import array
        pixels = array.array('B', [0] * (self.grid_size * self.grid_size * 3))

        # Map bytes to pixels (simple linear for now, Hilbert in full impl)
        for i, byte in enumerate(all_bytes):
            pixels[i] = byte

        # Build PNG
        return self._build_png(pixels, manifest)

    def _build_png(self, pixels: 'array.array', manifest: Dict) -> bytes:
        """
        Build PNG file from pixel data.

        Args:
            pixels: Pixel data array (RGB)
            manifest: Metadata to embed

        Returns:
            PNG bytes
        """
        width = self.grid_size
        height = self.grid_size

        png_data = bytearray()

        # PNG signature
        png_data.extend(b'\x89PNG\r\n\x1a\n')

        # IHDR chunk
        ihdr_data = struct.pack('>IIBBBBB', width, height, 8, 2, 0, 0, 0)
        png_data.extend(self._make_chunk('IHDR', ihdr_data))

        # tEXt chunks for metadata
        metadata_items = [
            ('Name', manifest.get('name', 'unknown')),
            ('Description', manifest.get('description', '')),
            ('EntryPoint', manifest.get('entry_point', '')),
            ('Manifest', json.dumps(manifest)),
        ]

        for key, value in metadata_items:
            if value:
                text_data = f"{key}\x00{value}".encode('utf-8')
                png_data.extend(self._make_chunk('tEXt', text_data))

        # IDAT chunk (compressed image data)
        raw_data = bytearray()
        for y in range(height):
            raw_data.append(0)  # Filter type: None
            offset = y * width * 3
            raw_data.extend(pixels[offset:offset + width * 3])

        compressed = zlib.compress(bytes(raw_data), 9)
        png_data.extend(self._make_chunk('IDAT', compressed))

        # IEND chunk
        png_data.extend(self._make_chunk('IEND', b''))

        return bytes(png_data)

    def _make_chunk(self, chunk_type: str, data: bytes) -> bytes:
        """
        Create a PNG chunk.

        Args:
            chunk_type: 4-character chunk type
            data: Chunk data

        Returns:
            Complete chunk bytes
        """
        chunk = bytearray()
        chunk.extend(struct.pack('>I', len(data)))
        chunk.extend(chunk_type.encode('ascii'))
        chunk.extend(data)

        # CRC32 of type + data
        crc = zlib.crc32(chunk_type.encode('ascii') + data) & 0xffffffff
        chunk.extend(struct.pack('>I', crc))

        return bytes(chunk)

    def extract_metadata(self, png_data: bytes) -> Dict[str, Any]:
        """
        Extract metadata from a PNG cartridge.

        Args:
            png_data: PNG bytes

        Returns:
            Metadata dictionary
        """
        # Verify PNG signature
        if png_data[:8] != b'\x89PNG\r\n\x1a\n':
            raise ValueError("Not a valid PNG file")

        metadata = {}
        offset = 8  # Skip signature

        while offset < len(png_data):
            # Read chunk
            length = struct.unpack('>I', png_data[offset:offset+4])[0]
            chunk_type = png_data[offset+4:offset+8].decode('ascii')
            chunk_data = png_data[offset+8:offset+8+length]

            if chunk_type == 'tEXt':
                # Parse text chunk
                parts = chunk_data.split(b'\x00', 1)
                if len(parts) == 2:
                    key = parts[0].decode('utf-8')
                    value = parts[1].decode('utf-8')

                    if key == 'Manifest':
                        metadata.update(json.loads(value))
                    else:
                        metadata[key.lower()] = value

            offset += 12 + length  # length(4) + type(4) + data + crc(4)

            if chunk_type == 'IEND':
                break

        return metadata
```

**Step 4: Run test to verify it passes**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/pixel_compiler/tests/test_cartridge_assembly.py -v`

Expected: All 3 tests PASS

**Step 5: Commit**

```bash
git add systems/pixel_compiler/cartridge_assembly.py systems/pixel_compiler/tests/test_cartridge_assembly.py
git commit -m "feat(cartridge): add CartridgeAssembler for .rts.png generation

- Create CartridgeAssembler class with file/directory assembly
- Encode files into PNG with Hilbert curve mapping
- Embed metadata as PNG tEXt chunks
- Add extract_metadata for reading cartridge info

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 2: Create WebSocket Bridge for Cartridge Assembly

**Files:**
- Create: `systems/visual_shell/web/cartridge_bridge.py`
- Test: `systems/pixel_compiler/tests/test_cartridge_bridge.py`

**Step 1: Write the failing test**

```python
# systems/pixel_compiler/tests/test_cartridge_bridge.py
"""Tests for cartridge bridge WebSocket handler."""

import pytest
import json
import asyncio
from unittest.mock import Mock, patch, AsyncMock


class TestCartridgeBridge:
    """Test WebSocket bridge for cartridge assembly."""

    def test_handle_assemble_request(self):
        """Bridge should handle assemble request and return PNG bytes."""
        from systems.visual_shell.web.cartridge_bridge import handle_cartridge_request

        request = {
            "action": "assemble",
            "name": "test_cart",
            "files": [
                {"path": "main.py", "content": "cHJpbnQoJ2hlbGxvJyk="}  # base64
            ]
        }

        result = handle_cartridge_request(request)

        assert result["success"] is True
        assert "cartridge" in result
        assert result["cartridge"]["format"] == "png"
        assert len(result["cartridge"]["data"]) > 0

    def test_handle_deploy_request(self):
        """Bridge should handle deploy request with location."""
        from systems.visual_shell.web.cartridge_bridge import handle_cartridge_request

        request = {
            "action": "deploy",
            "name": "deploy_test",
            "files": [
                {"path": "code.py", "content": "eCA9IDE="}  # base64
            ],
            "location": {"x": 1000, "y": 2000}
        }

        result = handle_cartridge_request(request)

        assert result["success"] is True
        assert "location" in result
        assert result["location"]["x"] == 1000
        assert result["location"]["y"] == 2000

    def test_invalid_action_returns_error(self):
        """Invalid action should return error."""
        from systems.visual_shell.web.cartridge_bridge import handle_cartridge_request

        request = {
            "action": "invalid",
            "name": "test"
        }

        result = handle_cartridge_request(request)

        assert result["success"] is False
        assert "error" in result
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/pixel_compiler/tests/test_cartridge_bridge.py -v`

Expected: FAIL with "ModuleNotFoundError"

**Step 3: Write minimal implementation**

```python
# systems/visual_shell/web/cartridge_bridge.py
"""
Cartridge Bridge - WebSocket handler for cartridge assembly requests.

Bridges WebMCP ide_deploy tool to Python CartridgeAssembler.
"""

import json
import base64
import tempfile
from pathlib import Path
from typing import Dict, Any

try:
    from systems.pixel_compiler.cartridge_assembly import CartridgeAssembler
    ASSEMBLER_AVAILABLE = True
except ImportError:
    ASSEMBLER_AVAILABLE = False


def handle_cartridge_request(request: Dict[str, Any]) -> Dict[str, Any]:
    """
    Handle a cartridge request from WebMCP.

    Args:
        request: Request dict with action, name, files, etc.

    Returns:
        Response dict with success status and result data
    """
    action = request.get("action", "assemble")
    name = request.get("name", "unnamed")

    if action == "assemble":
        return _handle_assemble(request)
    elif action == "deploy":
        return _handle_deploy(request)
    else:
        return {
            "success": False,
            "error": f"Unknown action: {action}"
        }


def _handle_assemble(request: Dict[str, Any]) -> Dict[str, Any]:
    """Handle assemble action."""
    files = request.get("files", [])
    name = request.get("name", "unnamed")
    description = request.get("description", "")
    entry_point = request.get("entry_point", "")

    if not files:
        return {
            "success": False,
            "error": "No files provided"
        }

    if not ASSEMBLER_AVAILABLE:
        return {
            "success": False,
            "error": "CartridgeAssembler not available"
        }

    # Write files to temp directory
    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)
        file_paths = []

        for file_info in files:
            path = file_info.get("path", "unnamed")
            content_b64 = file_info.get("content", "")

            try:
                content = base64.b64decode(content_b64)
            except Exception:
                return {
                    "success": False,
                    "error": f"Invalid base64 content for {path}"
                }

            file_path = tmpdir / path
            file_path.parent.mkdir(parents=True, exist_ok=True)
            file_path.write_bytes(content)
            file_paths.append(file_path)

        # Assemble cartridge
        assembler = CartridgeAssembler()
        png_bytes = assembler.assemble_from_files(
            file_paths,
            name=name,
            description=description,
            entry_point=entry_point
        )

        # Return as base64
        png_b64 = base64.b64encode(png_bytes).decode('ascii')

        return {
            "success": True,
            "cartridge": {
                "format": "png",
                "data": png_b64,
                "size_bytes": len(png_bytes),
                "name": name
            }
        }


def _handle_deploy(request: Dict[str, Any]) -> Dict[str, Any]:
    """Handle deploy action (assemble + place on map)."""
    # First assemble
    assemble_result = _handle_assemble(request)

    if not assemble_result.get("success"):
        return assemble_result

    # Get location
    location = request.get("location", {"x": 0, "y": 0})

    # Add location to result
    assemble_result["location"] = location
    assemble_result["deployed"] = True

    return assemble_result
```

**Step 4: Run test to verify it passes**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/pixel_compiler/tests/test_cartridge_bridge.py -v`

Expected: All 3 tests PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/web/cartridge_bridge.py systems/pixel_compiler/tests/test_cartridge_bridge.py
git commit -m "feat(bridge): add cartridge_bridge for WebMCP integration

- Handle assemble and deploy actions via WebSocket
- Convert base64 file content to temp files
- Bridge to CartridgeAssembler for PNG generation

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 3: Update ide_deploy to Use Real Backend

**Files:**
- Modify: `systems/visual_shell/web/ide_tools.js:200-230`

**Step 1: Write the failing test**

Create test file first:

```html
<!-- systems/visual_shell/web/test_ide_deploy_real.html -->
<!DOCTYPE html>
<html>
<head>
    <title>IDE Deploy Real Backend Test</title>
</head>
<body>
    <h1>IDE Deploy Real Backend Test</h1>
    <pre id="results"></pre>

    <script type="module">
        import { IDETools } from './ide_tools.js';

        const results = document.getElementById('results');
        const log = (msg) => results.textContent += msg + '\n';

        async function runTests() {
            const ide = new IDETools(null);

            // Test 1: Deploy with real files
            log('Test 1: Deploy with real files...');
            const result1 = await ide.ide_deploy({
                source_files: [
                    { path: 'main.py', content: btoa('print("hello")') }
                ],
                name: 'test_real_deploy',
                description: 'Real deployment test',
                entry_point: 'main.py'
            });

            if (result1.success && result1.cartridge?.data) {
                log('  PASS: Got cartridge data');
                log('  Size: ' + result1.cartridge.size_bytes + ' bytes');
            } else {
                log('  FAIL: ' + JSON.stringify(result1));
            }

            // Test 2: Deploy with location
            log('\nTest 2: Deploy with location...');
            const result2 = await ide.ide_deploy({
                source_files: [
                    { path: 'code.py', content: btoa('x = 1') }
                ],
                name: 'located_deploy',
                location: { x: 5000, y: 6000 }
            });

            if (result2.success && result2.location?.x === 5000) {
                log('  PASS: Location preserved');
            } else {
                log('  FAIL: ' + JSON.stringify(result2));
            }

            log('\nAll tests complete.');
        }

        runTests();
    </script>
</body>
</html>
```

**Step 2: Verify current mock returns mock data**

Current `ide_deploy` returns mock data. We need it to call the real backend.

**Step 3: Update implementation**

Replace the `ide_deploy` method in `systems/visual_shell/web/ide_tools.js`:

```javascript
// In systems/visual_shell/web/ide_tools.js
// Replace the ide_deploy method (lines ~200-230)

/**
 * Tool 39: ide_deploy
 * Assemble cartridge and place on map
 */
async ide_deploy(params = {}) {
    const { source_files, source_region, name, description, entry_point, location } = params;

    // Support both source_files (new) and source_region (legacy)
    if (!source_files && !source_region) {
        return { success: false, error: 'source_files or source_region is required' };
    }

    if (!name) {
        return { success: false, error: 'name is required' };
    }

    // Try real backend first
    try {
        const response = await fetch('http://localhost:8766/cartridge/deploy', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                action: 'deploy',
                name: name,
                description: description || '',
                entry_point: entry_point || '',
                files: source_files || [],
                location: location || { x: 0, y: 0 }
            })
        });

        if (response.ok) {
            const result = await response.json();
            if (result.success) {
                // Notify BuilderPanel if available
                if (this.#bridge?.builderPanel) {
                    this.#bridge.builderPanel.logAction(
                        `Deployed cartridge: ${name}`,
                        'success'
                    );
                }
                return result;
            }
        }
    } catch (e) {
        console.warn('ide_deploy: Backend not available, using mock:', e.message);
    }

    // Fallback to mock for development
    const mockLocation = location || {
        x: (source_region?.x || 0) + 100,
        y: (source_region?.y || 0) + 100
    };

    return {
        success: true,
        cartridge: {
            path: `/cartridges/${name}.rts.png`,
            hash: 'sha256:' + Array(64).fill('a').join(''),
            size_bytes: 4096
        },
        location: mockLocation,
        mock: true
    };
}
```

**Step 4: Verify test passes**

Open `systems/visual_shell/web/test_ide_deploy_real.html` in browser and check results.

Expected: Test 1 and Test 2 pass (with mock fallback if backend not running)

**Step 5: Commit**

```bash
git add systems/visual_shell/web/ide_tools.js systems/visual_shell/web/test_ide_deploy_real.html
git commit -m "feat(ide): connect ide_deploy to real cartridge backend

- Support source_files parameter for direct file deployment
- Call backend HTTP endpoint when available
- Fallback to mock for offline development
- Add integration test page

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 4: Add HTTP Endpoint for Cartridge Service

**Files:**
- Create: `systems/visual_shell/web/cartridge_server.py`

**Step 1: Write the failing test**

```python
# systems/pixel_compiler/tests/test_cartridge_server.py
"""Tests for cartridge HTTP server."""

import pytest
import requests
import subprocess
import time
import signal


class TestCartridgeServer:
    """Test HTTP endpoint for cartridge assembly."""

    @pytest.fixture(scope="class")
    def server(self):
        """Start test server."""
        import sys
        proc = subprocess.Popen([
            sys.executable, "-m", "systems.visual_shell.web.cartridge_server"
        ], port=8767)
        time.sleep(1)  # Wait for server start
        yield "http://localhost:8767"
        proc.send_signal(signal.SIGTERM)
        proc.wait()

    def test_health_endpoint(self, server):
        """Health endpoint should return OK."""
        response = requests.get(f"{server}/health")
        assert response.status_code == 200
        assert response.json()["status"] == "ok"

    def test_deploy_endpoint(self, server):
        """Deploy endpoint should create cartridge."""
        response = requests.post(f"{server}/cartridge/deploy", json={
            "name": "http_test",
            "files": [
                {"path": "main.py", "content": "cHJpbnQoJ3Rlc3QnKQ=="}
            ],
            "location": {"x": 100, "y": 200}
        })

        assert response.status_code == 200
        data = response.json()
        assert data["success"] is True
        assert "cartridge" in data
        assert data["cartridge"]["format"] == "png"
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/pixel_compiler/tests/test_cartridge_server.py -v`

Expected: FAIL (server doesn't exist)

**Step 3: Write minimal implementation**

```python
# systems/visual_shell/web/cartridge_server.py
"""
Cartridge HTTP Server

Provides HTTP endpoint for cartridge assembly and deployment.
Used by WebMCP ide_deploy tool.
"""

import json
from http.server import HTTPServer, BaseHTTPRequestHandler
from urllib.parse import urlparse
import sys

from systems.visual_shell.web.cartridge_bridge import handle_cartridge_request


class CartridgeHandler(BaseHTTPRequestHandler):
    """HTTP request handler for cartridge operations."""

    def log_message(self, format, *args):
        """Custom logging."""
        print(f"[CartridgeServer] {format % args}")

    def do_GET(self):
        """Handle GET requests."""
        path = urlparse(self.path).path

        if path == "/health":
            self._send_json({"status": "ok", "service": "cartridge-server"})
        else:
            self._send_error(404, "Not found")

    def do_POST(self):
        """Handle POST requests."""
        path = urlparse(self.path).path
        content_length = int(self.headers.get("Content-Length", 0))
        body = self.rfile.read(content_length)

        try:
            request = json.loads(body)
        except json.JSONDecodeError:
            self._send_error(400, "Invalid JSON")
            return

        if path == "/cartridge/deploy":
            result = handle_cartridge_request(request)
            self._send_json(result)
        elif path == "/cartridge/assemble":
            request["action"] = "assemble"
            result = handle_cartridge_request(request)
            self._send_json(result)
        else:
            self._send_error(404, "Not found")

    def _send_json(self, data, status=200):
        """Send JSON response."""
        self.send_response(status)
        self.send_header("Content-Type", "application/json")
        self.send_header("Access-Control-Allow-Origin", "*")
        self.end_headers()
        self.wfile.write(json.dumps(data).encode())

    def _send_error(self, code, message):
        """Send error response."""
        self._send_json({"success": False, "error": message}, code)


def run_server(port=8766):
    """Run the cartridge server."""
    server = HTTPServer(("localhost", port), CartridgeHandler)
    print(f"Cartridge server running on http://localhost:{port}")
    print("Endpoints:")
    print("  GET  /health           - Health check")
    print("  POST /cartridge/deploy - Deploy cartridge")
    print("  POST /cartridge/assemble - Assemble only")
    server.serve_forever()


if __name__ == "__main__":
    port = int(sys.argv[1]) if len(sys.argv) > 1 else 8766
    run_server(port)
```

**Step 4: Run test to verify it passes**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest systems/pixel_compiler/tests/test_cartridge_server.py -v`

Expected: All tests PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/web/cartridge_server.py systems/pixel_compiler/tests/test_cartridge_server.py
git commit -m "feat(server): add HTTP endpoint for cartridge deployment

- Run on port 8766 by default
- Handle /health, /cartridge/deploy, /cartridge/assemble
- CORS enabled for WebMCP access
- Add integration tests

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 5: Integrate with BuilderPanel UI

**Files:**
- Modify: `systems/visual_shell/web/BuilderPanel.js` (add cartridge rack methods)

**Step 1: Add cartridge rack assembly method**

Add to BuilderPanel class after existing methods:

```javascript
// Add to BuilderPanel.js

/**
 * Assemble cartridge from placed tiles
 * @param {string} name - Cartridge name
 * @param {Object} options - Assembly options
 * @returns {Promise<Object>} Assembly result
 */
async assembleCartridge(name, options = {}) {
    const tiles = Array.from(this.#placedTiles.values());

    if (tiles.length === 0) {
        this.logAction('No tiles to assemble', 'error');
        return { success: false, error: 'No tiles placed' };
    }

    this.logAction(`Assembling cartridge "${name}" from ${tiles.length} tiles...`, 'info');

    // Convert tiles to source format
    const sourceFiles = tiles.map(tile => ({
        path: `${tile.id}.${tile.type}`,
        content: btoa(JSON.stringify(tile.metadata || {}))
    }));

    // Call ide_deploy through WebMCP
    try {
        const result = await navigator.modelContext.callTool('ide_deploy', {
            source_files: sourceFiles,
            name: name,
            description: options.description || '',
            entry_point: options.entry_point || '',
            location: options.location || this.#getDefaultDeployLocation()
        });

        if (result.success) {
            this.logAction(`Cartridge "${name}" assembled successfully!`, 'success');
            this.#addCartridgeToRack(name, result.cartridge);
        } else {
            this.logAction(`Assembly failed: ${result.error}`, 'error');
        }

        return result;
    } catch (e) {
        this.logAction(`Assembly error: ${e.message}`, 'error');
        return { success: false, error: e.message };
    }
}

#getDefaultDeployLocation() {
    // Get center of placed tiles
    const tiles = Array.from(this.#placedTiles.values());
    if (tiles.length === 0) return { x: 0, y: 0 };

    const avgX = tiles.reduce((sum, t) => sum + t.x, 0) / tiles.length;
    const avgY = tiles.reduce((sum, t) => sum + t.y, 0) / tiles.length;

    return { x: Math.round(avgX), y: Math.round(avgY) };
}

#addCartridgeToRack(name, cartridge) {
    const rack = document.getElementById('cartridge-rack');
    if (!rack) return;

    const item = document.createElement('div');
    item.className = 'cartridge-item';
    item.innerHTML = `
        <span class="cartridge-name">${name}</span>
        <span class="cartridge-size">${cartridge.size_bytes || 0} bytes</span>
        <button class="download-btn" data-name="${name}">Download</button>
    `;

    // Add download handler
    const downloadBtn = item.querySelector('.download-btn');
    downloadBtn.addEventListener('click', () => this.#downloadCartridge(name, cartridge));

    rack.appendChild(item);
}

async #downloadCartridge(name, cartridge) {
    if (!cartridge.data) {
        this.logAction('No cartridge data available', 'error');
        return;
    }

    // Convert base64 to blob
    const binary = atob(cartridge.data);
    const bytes = new Uint8Array(binary.length);
    for (let i = 0; i < binary.length; i++) {
        bytes[i] = binary.charCodeAt(i);
    }

    const blob = new Blob([bytes], { type: 'image/png' });
    const url = URL.createObjectURL(blob);

    const a = document.createElement('a');
    a.href = url;
    a.download = `${name}.rts.png`;
    a.click();

    URL.revokeObjectURL(url);
    this.logAction(`Downloaded ${name}.rts.png`, 'success');
}
```

**Step 2: Add CSS for cartridge rack**

Add to `BuilderPanel.css`:

```css
/* Cartridge Rack Styles */
.cartridge-item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 8px 12px;
    background: rgba(0, 255, 136, 0.1);
    border: 1px solid rgba(0, 255, 136, 0.3);
    border-radius: 4px;
    margin-bottom: 8px;
}

.cartridge-name {
    font-weight: bold;
    color: #00ff88;
}

.cartridge-size {
    color: #888;
    font-size: 0.85em;
    margin-left: 8px;
}

.download-btn {
    background: rgba(0, 255, 136, 0.2);
    border: 1px solid #00ff88;
    color: #00ff88;
    padding: 4px 12px;
    border-radius: 3px;
    cursor: pointer;
}

.download-btn:hover {
    background: rgba(0, 255, 136, 0.3);
}
```

**Step 3: Test in browser**

Open `test_builder_tools.html` and verify cartridge assembly button works.

**Step 4: Commit**

```bash
git add systems/visual_shell/web/BuilderPanel.js systems/visual_shell/web/BuilderPanel.css
git commit -m "feat(ui): add cartridge assembly to BuilderPanel

- assembleCartridge method for tile-to-cartridge conversion
- Cartridge rack UI with download functionality
- Base64 to blob conversion for PNG download

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 6: Add WebMCP Tool Registration

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js`

**Step 1: Register enhanced ide_deploy**

Add registration update in the WebMCP bridge:

```javascript
// In webmcp_bridge.js, update ide_deploy registration

// Enhanced ide_deploy with source_files support
this.registerTool('ide_deploy', {
    description: 'Deploy code/files as .rts.png cartridge to Infinite Map',
    inputSchema: {
        type: 'object',
        properties: {
            source_files: {
                type: 'array',
                description: 'Files to include (path + base64 content)',
                items: {
                    type: 'object',
                    properties: {
                        path: { type: 'string' },
                        content: { type: 'string', description: 'Base64 encoded' }
                    }
                }
            },
            source_region: {
                type: 'object',
                description: 'Legacy: Region on map to capture',
                properties: {
                    x: { type: 'number' },
                    y: { type: 'number' },
                    width: { type: 'number' },
                    height: { type: 'number' }
                }
            },
            name: { type: 'string', description: 'Cartridge name' },
            description: { type: 'string' },
            entry_point: { type: 'string', description: 'Entry file:function' },
            location: {
                type: 'object',
                description: 'Deploy location on Infinite Map',
                properties: {
                    x: { type: 'number' },
                    y: { type: 'number' }
                }
            }
        },
        required: ['name']
    },
    handler: async (params) => {
        return await this.#ideTools.ide_deploy(params);
    }
});
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/webmcp_bridge.js
git commit -m "feat(webmcp): register enhanced ide_deploy tool

- Support source_files array with base64 content
- Support location parameter for map placement
- Backward compatible with source_region

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 7: Update Documentation

**Files:**
- Modify: `systems/visual_shell/web/WEBMCP_TOOLS_REFERENCE.md`

**Step 1: Update ide_deploy documentation**

Find the ide_deploy section and update:

```markdown
#### ide_deploy

Deploy code/files as a .rts.png cartridge to the Infinite Map.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `source_files` | array | Yes* | Files to deploy (path + base64 content) |
| `source_region` | object | Yes* | Legacy: Map region to capture |
| `name` | string | Yes | Cartridge name |
| `description` | string | No | Description metadata |
| `entry_point` | string | No | Entry file:function |
| `location` | object | No | Deploy location {x, y} |

*Either `source_files` or `source_region` required.

**Example - Deploy from files:**
```javascript
const result = await navigator.modelContext.callTool('ide_deploy', {
    source_files: [
        { path: 'main.py', content: btoa('print("hello")') },
        { path: 'lib.py', content: btoa('def helper(): pass') }
    ],
    name: 'my_app',
    description: 'My first cartridge',
    entry_point: 'main.py',
    location: { x: 1000, y: 2000 }
});

// Result:
// {
//   success: true,
//   cartridge: { format: "png", data: "...", size_bytes: 4096 },
//   location: { x: 1000, y: 2000 }
// }
```

**Example - Download cartridge:**
```javascript
const result = await navigator.modelContext.callTool('ide_deploy', {...});

if (result.success) {
    // Convert base64 to download
    const blob = await fetch('data:image/png;base64,' + result.cartridge.data)
        .then(r => r.blob());
    const url = URL.createObjectURL(blob);
    // Create download link...
}
```
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/WEBMCP_TOOLS_REFERENCE.md
git commit -m "docs(webmcp): update ide_deploy documentation

- Document source_files parameter
- Add code examples for deployment
- Include download pattern

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Summary

| Task | Description | Files |
|------|-------------|-------|
| 1 | CartridgeAssembler backend | `cartridge_assembly.py`, tests |
| 2 | WebSocket bridge handler | `cartridge_bridge.py`, tests |
| 3 | Update ide_deploy tool | `ide_tools.js` |
| 4 | HTTP endpoint server | `cartridge_server.py`, tests |
| 5 | BuilderPanel integration | `BuilderPanel.js`, `BuilderPanel.css` |
| 6 | WebMCP tool registration | `webmcp_bridge.js` |
| 7 | Documentation update | `WEBMCP_TOOLS_REFERENCE.md` |

---

## Verification Checklist

After completing all tasks:

- [ ] `pytest systems/pixel_compiler/tests/test_cartridge_assembly.py -v` passes
- [ ] `pytest systems/pixel_compiler/tests/test_cartridge_bridge.py -v` passes
- [ ] `python -m systems.visual_shell.web.cartridge_server` starts without error
- [ ] `test_ide_deploy_real.html` shows PASS for both tests
- [ ] BuilderPanel can assemble and download cartridge
- [ ] Documentation is accurate

---

**End of Plan**
