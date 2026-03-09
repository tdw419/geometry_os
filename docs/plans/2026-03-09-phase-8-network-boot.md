# Phase 8: Network Boot Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable Geometry OS to boot remotely by streaming the 3D Holographic Substrate as a bootable PixelRTS v2 texture over WebSocket.

**Architecture:** The server flattens 3D Hilbert VRAM into a 2D bootable texture, streams it via WebSocket with SHA256 integrity headers. The client receives the stream, reconstructs memory via inverse Hilbert mapping, and jumps to the kernel entry point.

**Tech Stack:** Python (boot_bridge), Rust (net_loader), WGSL (flatten shader), WebSocket, SHA256

---

## Task 1: Create Boot Bridge Protocol

**Files:**
- Create: `systems/visual_shell/api/boot_bridge.py`
- Test: `tests/test_boot_bridge.py`

### Step 1: Write the failing test

```python
# tests/test_boot_bridge.py
"""
Tests for Network Boot Bridge Protocol.

Verifies the /ws/v1/boot_stream endpoint for streaming
bootable PixelRTS textures.
"""

import pytest
import asyncio
import hashlib
from unittest.mock import AsyncMock, patch


class TestBootBridgeProtocol:
    """Tests for boot stream protocol."""

    def test_boot_bridge_module_exists(self):
        """Test that boot_bridge module can be imported."""
        from systems.visual_shell.api import boot_bridge
        assert boot_bridge is not None

    def test_boot_bridge_has_stream_function(self):
        """Test that boot_bridge has stream_boot_texture function."""
        from systems.visual_shell.api.boot_bridge import stream_boot_texture
        assert callable(stream_boot_texture)

    def test_boot_frame_structure(self):
        """Test that BootFrame has required fields."""
        from systems.visual_shell.api.boot_bridge import BootFrame

        frame = BootFrame(
            sequence=0,
            chunk_offset=0,
            chunk_data=b'\x00\x01\x02\x03',
            checksum="a591a6d40bf420404a011733cfb7b190f62bcb5f9f8a8c7c9e9b7d7e8f6f9a1"
        )

        assert frame.sequence == 0
        assert frame.chunk_offset == 0
        assert len(frame.chunk_data) == 4
        assert len(frame.checksum) == 64  # SHA256 hex

    def test_chunk_data_checksum_validation(self):
        """Test that checksum is correctly computed."""
        from systems.visual_shell.api.boot_bridge import BootFrame

        data = b'hello world'
        expected_sha = hashlib.sha256(data).hexdigest()

        frame = BootFrame(
            sequence=1,
            chunk_offset=0,
            chunk_data=data,
            checksum=expected_sha
        )

        assert frame.validate_checksum() == True

        # Corrupted data should fail
        frame.chunk_data = b'hello worlX'
        assert frame.validate_checksum() == False


class TestBootStreamEndpoint:
    """Tests for WebSocket boot stream endpoint."""

    @pytest.mark.asyncio
    async def test_boot_stream_yields_frames(self):
        """Test that stream_boot_texture yields BootFrames."""
        from systems.visual_shell.api.boot_bridge import stream_boot_texture, BootFrame

        # Mock texture data
        texture_data = bytes(range(256))

        frames = []
        async for frame in stream_boot_texture(texture_data, chunk_size=64):
            frames.append(frame)
            if len(frames) >= 3:
                break

        assert len(frames) >= 1
        assert all(isinstance(f, BootFrame) for f in frames)
        assert frames[0].sequence == 0


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

### Step 2: Run test to verify it fails

Run: `python3 -m pytest tests/test_boot_bridge.py -v`
Expected: FAIL with "No module named 'systems.visual_shell.api.boot_bridge'"

### Step 3: Implement Boot Bridge

```python
# systems/visual_shell/api/boot_bridge.py
"""
Network Boot Bridge Protocol.

Streams bootable PixelRTS textures via WebSocket for
remote hypervisor boot.
"""

import hashlib
import struct
from dataclasses import dataclass
from typing import AsyncIterator, Optional


@dataclass
class BootFrame:
    """
    A single frame in the boot stream.

    Protocol:
    - sequence: Frame number (uint32)
    - chunk_offset: Byte offset in total image (uint64)
    - chunk_data: Raw texture bytes (variable)
    - checksum: SHA256 of chunk_data (32 bytes hex)
    """
    sequence: int
    chunk_offset: int
    chunk_data: bytes
    checksum: str

    def validate_checksum(self) -> bool:
        """Verify chunk data integrity."""
        computed = hashlib.sha256(self.chunk_data).hexdigest()
        return computed == self.checksum

    def to_bytes(self) -> bytes:
        """Serialize frame for wire transmission."""
        # Format: [seq:4][offset:8][len:4][data:N][checksum:64]
        header = struct.pack(
            '>IIQ',
            self.sequence,
            len(self.chunk_data),
            self.chunk_offset
        )
        return header + self.chunk_data + self.checksum.encode('ascii')

    @classmethod
    def from_bytes(cls, data: bytes) -> 'BootFrame':
        """Deserialize frame from wire format."""
        sequence, data_len, offset = struct.unpack('>IIQ', data[:16])
        chunk_data = data[16:16 + data_len]
        checksum = data[16 + data_len:16 + data_len + 64].decode('ascii')
        return cls(sequence, offset, chunk_data, checksum)


async def stream_boot_texture(
    texture_data: bytes,
    chunk_size: int = 65536,  # 64KB chunks
    total_size: Optional[int] = None
) -> AsyncIterator[BootFrame]:
    """
    Stream a boot texture as a sequence of BootFrames.

    Args:
        texture_data: Raw PixelRTS texture bytes
        chunk_size: Bytes per frame (default 64KB)
        total_size: Total expected size (for header frame)

    Yields:
        BootFrame objects with integrity checksums
    """
    offset = 0
    sequence = 0
    total = len(texture_data)

    while offset < total:
        chunk = texture_data[offset:offset + chunk_size]
        checksum = hashlib.sha256(chunk).hexdigest()

        yield BootFrame(
            sequence=sequence,
            chunk_offset=offset,
            chunk_data=chunk,
            checksum=checksum
        )

        offset += chunk_size
        sequence += 1


class BootStreamServer:
    """
    WebSocket server for boot streaming.

    Endpoint: /ws/v1/boot_stream
    Protocol: Binary BootFrames with SHA256 integrity
    """

    def __init__(self, texture_source: callable):
        self.texture_source = texture_source
        self.clients = set()

    async def handle_client(self, websocket, path):
        """Handle a boot client connection."""
        self.clients.add(websocket)
        try:
            # Get current texture
            texture = await self.texture_source()

            # Stream frames
            async for frame in stream_boot_texture(texture):
                await websocket.send(frame.to_bytes())

            # Send end-of-stream marker
            eos = BootFrame(
                sequence=0xFFFFFFFF,
                chunk_offset=0,
                chunk_data=b'',
                checksum='0' * 64
            )
            await websocket.send(eos.to_bytes())

        finally:
            self.clients.discard(websocket)
```

### Step 4: Run test to verify it passes

Run: `python3 -m pytest tests/test_boot_bridge.py -v`
Expected: 6 passed

### Step 5: Commit

```bash
git add systems/visual_shell/api/boot_bridge.py tests/test_boot_bridge.py
git commit -m "feat(network-boot): add boot bridge protocol with SHA256 integrity"
```

---

## Task 2: Create Holographic Flattening Shader

**Files:**
- Modify: `systems/hypervisor/src/glyph_renderer.wgsl`
- Test: `tests/test_holographic_flatten.py`

### Step 1: Write the failing test

```python
# tests/test_holographic_flatten.py
"""
Tests for 3D Holographic Substrate flattening to 2D boot texture.
"""

import pytest
import numpy as np


class TestHolographicFlatten:
    """Tests for 3D-to-2D coordinate folding."""

    def test_flatten_module_exists(self):
        """Test that flatten module can be imported."""
        from systems.hypervisor import holographic_flatten
        assert holographic_flatten is not None

    def test_flatten_3d_to_2d_basic(self):
        """Test basic 3D to 2D coordinate mapping."""
        from systems.hypervisor.holographic_flatten import flatten_coordinate

        # 4x4x4 cube -> 16x16 plane
        # (0,0,0) should map to a valid 2D coordinate
        x2d, y2d = flatten_coordinate(0, 0, 0, order=4)

        assert 0 <= x2d < 16
        assert 0 <= y2d < 16

    def test_flatten_is_bijective(self):
        """Test that flatten is reversible (no data loss)."""
        from systems.hypervisor.holographic_flatten import flatten_coordinate, unflatten_coordinate

        # Test all coordinates in a small cube
        for z in range(4):
            for y in range(4):
                for x in range(4):
                    x2d, y2d = flatten_coordinate(x, y, z, order=4)
                    x3d, y3d, z3d = unflatten_coordinate(x2d, y2d, order=4)

                    assert (x, y, z) == (x3d, y3d, z3d), \
                        f"Round trip failed: ({x},{y},{z}) -> ({x2d},{y2d}) -> ({x3d},{y3d},{z3d})"

    def test_flatten_output_size(self):
        """Test that output texture has correct dimensions."""
        from systems.hypervisor.holographic_flatten import calculate_output_size

        # 256x256x256 -> should fit in power-of-2 2D texture
        width, height = calculate_output_size(order=8)

        # 256^3 = 16,777,216 voxels
        # sqrt(16777216) = 4096
        assert width * height >= 256 * 256 * 256
        assert width == 4096
        assert height == 4096


class TestFlattenPerformance:
    """Performance tests for flattening."""

    def test_flatten_256_cube_under_16ms(self):
        """Test that 256^3 cube flattens in <16ms (60 FPS target)."""
        import time
        from systems.hypervisor.holographic_flatten import flatten_texture

        # Create test 3D texture (256x256x256)
        texture_3d = np.zeros((256, 256, 256), dtype=np.uint8)

        start = time.perf_counter()
        texture_2d = flatten_texture(texture_3d)
        elapsed_ms = (time.perf_counter() - start) * 1000

        assert elapsed_ms < 16, f"Flatten took {elapsed_ms:.1f}ms (target: <16ms)"
        assert texture_2d.shape == (4096, 4096)


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

### Step 2: Run test to verify it fails

Run: `python3 -m pytest tests/test_holographic_flatten.py -v`
Expected: FAIL with "No module named 'systems.hypervisor.holographic_flatten'"

### Step 3: Implement Holographic Flatten

```python
# systems/hypervisor/holographic_flatten.py
"""
3D Holographic Substrate to 2D Boot Texture Flattening.

Uses coordinate folding to pack 3D Hilbert space into 2D texture
while preserving spatial locality for efficient boot streaming.
"""

import numpy as np
from typing import Tuple


def flatten_coordinate(x: int, y: int, z: int, order: int = 8) -> Tuple[int, int]:
    """
    Flatten a 3D coordinate to 2D using Z-order curve folding.

    Args:
        x, y, z: 3D coordinates (0 to 2^order - 1)
        order: Log2 of dimension (default 8 = 256)

    Returns:
        (x2d, y2d): 2D coordinates in flattened texture
    """
    # Interleave bits: x bits go to even positions, y to odd, z to positions mod 3
    # This creates a Z-order (Morton) curve in 3D, then folds to 2D

    x2d = 0
    y2d = 0

    for i in range(order):
        # Extract bits
        x_bit = (x >> i) & 1
        y_bit = (y >> i) & 1
        z_bit = (z >> i) & 1

        # Pack into 2D: z determines which 2D region, x,y are local coords
        # Bit layout: x2d gets x_bits and z_bits, y2d gets y_bits
        x2d |= (x_bit << (2 * i)) | (z_bit << (2 * i + 1))
        y2d |= (y_bit << (2 * i))

    return x2d, y2d


def unflatten_coordinate(x2d: int, y2d: int, order: int = 8) -> Tuple[int, int, int]:
    """
    Inverse of flatten_coordinate.

    Args:
        x2d, y2d: 2D coordinates in flattened texture
        order: Log2 of dimension

    Returns:
        (x, y, z): Original 3D coordinates
    """
    x = 0
    y = 0
    z = 0

    for i in range(order):
        # Extract bits from 2D
        x_bit = (x2d >> (2 * i)) & 1
        z_bit = (x2d >> (2 * i + 1)) & 1
        y_bit = (y2d >> (2 * i)) & 1

        # Reconstruct 3D
        x |= (x_bit << i)
        y |= (y_bit << i)
        z |= (z_bit << i)

    return x, y, z


def calculate_output_size(order: int = 8) -> Tuple[int, int]:
    """
    Calculate 2D output texture size for given 3D order.

    3D: (2^order)^3 = 2^(3*order) voxels
    2D: sqrt(2^(3*order)) = 2^(1.5*order)

    For order=8: 256^3 = 16M voxels -> 4096x4096 texture
    """
    dim_3d = 1 << order  # 2^order
    total_voxels = dim_3d ** 3
    dim_2d = int(np.ceil(np.sqrt(total_voxels)))

    # Round up to power of 2 for GPU efficiency
    dim_2d = 1 << int(np.ceil(np.log2(dim_2d)))

    return dim_2d, dim_2d


def flatten_texture(texture_3d: np.ndarray) -> np.ndarray:
    """
    Flatten a 3D texture to 2D for boot streaming.

    Args:
        texture_3d: 3D numpy array (D, H, W)

    Returns:
        2D numpy array suitable for PixelRTS encoding
    """
    d, h, w = texture_3d.shape
    assert d == h == w, "Only cubic textures supported"

    order = int(np.log2(d))
    out_w, out_h = calculate_output_size(order)

    texture_2d = np.zeros((out_h, out_w), dtype=texture_3d.dtype)

    for z in range(d):
        for y in range(h):
            for x in range(w):
                x2d, y2d = flatten_coordinate(x, y, z, order)
                texture_2d[y2d, x2d] = texture_3d[z, y, x]

    return texture_2d
```

### Step 4: Run test to verify it passes

Run: `python3 -m pytest tests/test_holographic_flatten.py -v`
Expected: 6 passed

### Step 5: Commit

```bash
git add systems/hypervisor/holographic_flatten.py tests/test_holographic_flatten.py
git commit -m "feat(holographic): add 3D-to-2D coordinate folding for boot texture"
```

---

## Task 3: Create Remote Hypervisor Loader

**Files:**
- Create: `systems/hypervisor/src/net_loader.rs`
- Create: `systems/hypervisor/src/boot_frame.rs`
- Test: `tests/test_net_loader.py`

### Step 1: Write the failing test

```python
# tests/test_net_loader.py
"""
Tests for remote hypervisor network loader.

Verifies the Rust-based boot client that receives
and reconstructs memory from the boot stream.
"""

import pytest
import subprocess
import os


class TestNetLoaderBuild:
    """Tests for net_loader Rust module."""

    def test_net_loader_crate_exists(self):
        """Test that net_loader module exists in Cargo.toml."""
        cargo_path = "systems/hypervisor/Cargo.toml"
        assert os.path.exists(cargo_path)

        with open(cargo_path) as f:
            content = f.read()

        assert "net_loader" in content or "boot_frame" in content

    def test_net_loader_compiles(self):
        """Test that net_loader compiles without errors."""
        result = subprocess.run(
            ["cargo", "check", "--package", "geometry-hypervisor"],
            cwd="systems/hypervisor",
            capture_output=True,
            text=True
        )

        assert result.returncode == 0, f"Cargo check failed: {result.stderr}"


class TestBootFrameRust:
    """Tests for BootFrame Rust implementation."""

    def test_boot_frame_module_exists(self):
        """Test that boot_frame.rs exists."""
        path = "systems/hypervisor/src/boot_frame.rs"
        assert os.path.exists(path), f"Missing {path}"

    def test_boot_frame_has_struct(self):
        """Test that BootFrame struct is defined."""
        with open("systems/hypervisor/src/boot_frame.rs") as f:
            content = f.read()

        assert "struct BootFrame" in content
        assert "sequence" in content
        assert "chunk_data" in content
        assert "checksum" in content


class TestNetLoaderFunction:
    """Tests for net_loader functionality."""

    def test_net_loader_module_exists(self):
        """Test that net_loader.rs exists."""
        path = "systems/hypervisor/src/net_loader.rs"
        assert os.path.exists(path), f"Missing {path}"

    def test_net_loader_has_connect_function(self):
        """Test that net_loader has connect function."""
        with open("systems/hypervisor/src/net_loader.rs") as f:
            content = f.read()

        assert "fn connect" in content or "async fn connect" in content
        assert "fn receive_frame" in content or "async fn receive" in content


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

### Step 2: Run test to verify it fails

Run: `python3 -m pytest tests/test_net_loader.py -v`
Expected: FAIL with "Missing systems/hypervisor/src/boot_frame.rs"

### Step 3: Implement Rust Boot Frame

```rust
// systems/hypervisor/src/boot_frame.rs
//! Boot Frame Protocol for Network Boot
//!
//! Binary format: [seq:4][len:4][offset:8][data:N][checksum:64]

use sha2::{Sha256, Digest};
use serde::{Deserialize, Serialize};

/// A single frame in the boot stream
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct BootFrame {
    /// Frame sequence number
    pub sequence: u32,
    /// Byte offset in total image
    pub chunk_offset: u64,
    /// Raw texture bytes
    pub chunk_data: Vec<u8>,
    /// SHA256 checksum (hex string)
    pub checksum: String,
}

impl BootFrame {
    /// Validate chunk data integrity
    pub fn validate_checksum(&self) -> bool {
        let mut hasher = Sha256::new();
        hasher.update(&self.chunk_data);
        let result = hasher.finalize();
        let computed = hex::encode(result);
        computed == self.checksum
    }

    /// Serialize to wire format
    pub fn to_bytes(&self) -> Vec<u8> {
        let mut buf = Vec::with_capacity(16 + self.chunk_data.len() + 64);

        // Header: sequence (4) + length (4) + offset (8)
        buf.extend_from_slice(&self.sequence.to_be_bytes());
        buf.extend_from_slice(&(self.chunk_data.len() as u32).to_be_bytes());
        buf.extend_from_slice(&self.chunk_offset.to_be_bytes());

        // Data
        buf.extend_from_slice(&self.chunk_data);

        // Checksum
        buf.extend_from_slice(self.checksum.as_bytes());

        buf
    }

    /// Deserialize from wire format
    pub fn from_bytes(data: &[u8]) -> Result<Self, &'static str> {
        if data.len() < 16 {
            return Err("Frame too short");
        }

        let sequence = u32::from_be_bytes([data[0], data[1], data[2], data[3]]);
        let data_len = u32::from_be_bytes([data[4], data[5], data[6], data[7]]) as usize;
        let chunk_offset = u64::from_be_bytes([
            data[8], data[9], data[10], data[11],
            data[12], data[13], data[14], data[15]
        ]);

        if data.len() < 16 + data_len + 64 {
            return Err("Frame truncated");
        }

        let chunk_data = data[16..16 + data_len].to_vec();
        let checksum = String::from_utf8(data[16 + data_len..16 + data_len + 64].to_vec())
            .map_err(|_| "Invalid checksum encoding")?;

        Ok(BootFrame {
            sequence,
            chunk_offset,
            chunk_data,
            checksum,
        })
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_checksum_validation() {
        let data = vec![0x00, 0x01, 0x02, 0x03];
        let mut hasher = Sha256::new();
        hasher.update(&data);
        let checksum = hex::encode(hasher.finalize());

        let frame = BootFrame {
            sequence: 0,
            chunk_offset: 0,
            chunk_data: data,
            checksum,
        };

        assert!(frame.validate_checksum());
    }

    #[test]
    fn test_serialize_roundtrip() {
        let original = BootFrame {
            sequence: 42,
            chunk_offset: 1024,
            chunk_data: vec![1, 2, 3, 4, 5],
            checksum: "a".repeat(64),
        };

        let bytes = original.to_bytes();
        let decoded = BootFrame::from_bytes(&bytes).unwrap();

        assert_eq!(original.sequence, decoded.sequence);
        assert_eq!(original.chunk_offset, decoded.chunk_offset);
        assert_eq!(original.chunk_data, decoded.chunk_data);
    }
}
```

```rust
// systems/hypervisor/src/net_loader.rs
//! Network Boot Loader
//!
//! Connects to boot_bridge WebSocket and reconstructs
//! memory from the boot stream.

use std::collections::HashMap;
use tokio_tungstenite::{connect_async, tungstenite::Message};
use futures_util::StreamExt;
use crate::boot_frame::BootFrame;

/// Network boot loader client
pub struct NetLoader {
    /// Server URL (e.g., "ws://localhost:3002/ws/v1/boot_stream")
    server_url: String,
    /// Reconstructed memory buffer
    memory: HashMap<u64, Vec<u8>>,
    /// Total frames received
    frames_received: u32,
    /// Total bytes received
    bytes_received: u64,
}

impl NetLoader {
    /// Create a new loader
    pub fn new(server_url: &str) -> Self {
        NetLoader {
            server_url: server_url.to_string(),
            memory: HashMap::new(),
            frames_received: 0,
            bytes_received: 0,
        }
    }

    /// Connect and receive boot stream
    pub async fn connect(&mut self) -> Result<(), Box<dyn std::error::Error>> {
        let (ws_stream, _) = connect_async(&self.server_url).await?;
        let (_, mut read) = ws_stream.split();

        while let Some(msg) = read.next().await {
            match msg? {
                Message::Binary(data) => {
                    let frame = BootFrame::from_bytes(&data)?;

                    // Check for end-of-stream
                    if frame.sequence == 0xFFFFFFFF {
                        break;
                    }

                    // Validate integrity
                    if !frame.validate_checksum() {
                        return Err("Checksum validation failed".into());
                    }

                    // Store in memory map
                    self.memory.insert(frame.chunk_offset, frame.chunk_data);
                    self.frames_received += 1;
                    self.bytes_received += frame.chunk_data.len() as u64;
                }
                _ => continue,
            }
        }

        Ok(())
    }

    /// Get reconstructed memory as contiguous buffer
    pub fn get_memory(&self) -> Vec<u8> {
        let total_size = self.memory.keys()
            .map(|&offset| offset + self.memory.get(&offset).map(|v| v.len() as u64).unwrap_or(0))
            .max()
            .unwrap_or(0);

        let mut buffer = vec![0u8; total_size as usize];

        for (&offset, data) in &self.memory {
            let start = offset as usize;
            let end = start + data.len();
            if end <= buffer.len() {
                buffer[start..end].copy_from_slice(data);
            }
        }

        buffer
    }

    /// Get loader statistics
    pub fn stats(&self) -> (u32, u64) {
        (self.frames_received, self.bytes_received)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_loader_creation() {
        let loader = NetLoader::new("ws://localhost:3002/ws/v1/boot_stream");
        assert_eq!(loader.frames_received, 0);
    }
}
```

### Step 4: Update Cargo.toml

```toml
# Add to systems/hypervisor/Cargo.toml dependencies
[dependencies]
sha2 = "0.10"
hex = "0.4"
serde = { version = "1.0", features = ["derive"] }
tokio-tungstenite = "0.21"
futures-util = "0.3"
```

### Step 5: Run test to verify it passes

Run: `python3 -m pytest tests/test_net_loader.py -v`
Expected: 8 passed

### Step 6: Commit

```bash
git add systems/hypervisor/src/boot_frame.rs systems/hypervisor/src/net_loader.rs systems/hypervisor/Cargo.toml tests/test_net_loader.py
git commit -m "feat(network-boot): add Rust net_loader with SHA256 validation"
```

---

## Task 4: E2E Integration Test

**Files:**
- Create: `tests/test_network_boot_e2e.py`

### Step 1: Write the failing test

```python
# tests/test_network_boot_e2e.py
"""
End-to-end test for Network Boot.

Simulates: Server streams boot texture -> Client receives -> Memory reconstructed
"""

import pytest
import asyncio
import numpy as np


class TestNetworkBootE2E:
    """E2E tests for complete boot pipeline."""

    @pytest.mark.asyncio
    async def test_boot_pipeline_complete(self):
        """Test complete boot pipeline from server to client."""
        from systems.visual_shell.api.boot_bridge import stream_boot_texture
        from systems.hypervisor.holographic_flatten import flatten_texture

        # 1. Create test 3D texture (16x16x16 for fast test)
        texture_3d = np.random.randint(0, 256, (16, 16, 16), dtype=np.uint8)

        # 2. Flatten to 2D
        texture_2d = flatten_texture(texture_3d)
        texture_bytes = texture_2d.tobytes()

        # 3. Stream as boot frames
        frames = []
        async for frame in stream_boot_texture(texture_bytes, chunk_size=256):
            frames.append(frame)

        # 4. Verify all frames received
        assert len(frames) > 0

        # 5. Verify all checksums valid
        for frame in frames:
            assert frame.validate_checksum(), f"Frame {frame.sequence} checksum failed"

        # 6. Reconstruct memory
        reconstructed = bytearray()
        for frame in sorted(frames, key=lambda f: f.chunk_offset):
            reconstructed.extend(frame.chunk_data)

        # 7. Verify reconstruction matches original
        assert bytes(reconstructed[:len(texture_bytes)]) == texture_bytes

    @pytest.mark.asyncio
    async def test_boot_frame_ordering(self):
        """Test that frames can be reordered and still reconstruct correctly."""
        from systems.visual_shell.api.boot_bridge import stream_boot_texture

        data = bytes(range(256))
        frames = []
        async for frame in stream_boot_texture(data, chunk_size=32):
            frames.append(frame)

        # Shuffle frames
        import random
        random.shuffle(frames)

        # Reconstruct using offset
        reconstructed = bytearray(256)
        for frame in frames:
            offset = frame.chunk_offset
            reconstructed[offset:offset + len(frame.chunk_data)] = frame.chunk_data

        assert bytes(reconstructed) == data

    def test_flatten_unflatten_roundtrip_e2e(self):
        """Test that 3D texture survives flatten/unflatten roundtrip."""
        from systems.hypervisor.holographic_flatten import (
            flatten_texture,
            unflatten_coordinate,
            flatten_coordinate,
            calculate_output_size
        )

        # Create test pattern
        original = np.arange(16**3, dtype=np.uint8).reshape(16, 16, 16)

        # Flatten
        flat = flatten_texture(original)

        # Unflatten
        order = 4  # log2(16)
        recovered = np.zeros_like(original)

        for z in range(16):
            for y in range(16):
                for x in range(16):
                    x2d, y2d = flatten_coordinate(x, y, z, order)
                    recovered[z, y, x] = flat[y2d, x2d]

        # Verify
        np.testing.assert_array_equal(original, recovered)


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

### Step 2: Run test to verify it fails

Run: `python3 -m pytest tests/test_network_boot_e2e.py -v`
Expected: FAIL (tests should pass after Tasks 1-3 complete)

### Step 3: Run test to verify it passes

Run: `python3 -m pytest tests/test_network_boot_e2e.py -v`
Expected: 3 passed

### Step 4: Commit

```bash
git add tests/test_network_boot_e2e.py
git commit -m "test(network-boot): add E2E integration tests for boot pipeline"
```

---

## Summary

| Task | Description | Files | Tests |
|------|-------------|-------|-------|
| 1 | Boot Bridge Protocol | `boot_bridge.py` | 6 |
| 2 | Holographic Flattening | `holographic_flatten.py` | 6 |
| 3 | Rust Net Loader | `net_loader.rs`, `boot_frame.rs` | 8 |
| 4 | E2E Integration | `test_network_boot_e2e.py` | 3 |

**Total: 4 tasks, 23 tests**

---

## Success Criteria

- [ ] Live 3D substrate can be flattened to 2D RTS texture in <16ms
- [ ] WebSocket stream maintains 100MB/s throughput (local/LAN)
- [ ] Remote client can reconstruct 1D memory from the 3D Hilbert stream
- [ ] All 23 tests passing

---

## Execution Handoff

**Plan complete and saved to `docs/plans/2026-03-09-phase-8-network-boot.md`. Two execution options:**

**1. Subagent-Driven (this session)** - I dispatch fresh subagent per task, review between tasks, fast iteration

**2. Parallel Session (separate)** - Open new session with executing-plans, batch execution with checkpoints

**Which approach?**

**If Subagent-Driven chosen:**
- **REQUIRED SUB-SKILL:** Use superpowers:subagent-driven-development
- Stay in this session
- Fresh subagent per task + code review

**If Parallel Session chosen:**
- Guide them to open new session in worktree
- **REQUIRED SUB-SKILL:** New session uses superpowers:executing-plans
