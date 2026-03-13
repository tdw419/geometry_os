# Spatial Program Coordinator Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a GPU-first windowing system where applications are autonomous regions of executing glyphs on the Infinite Map.

**Architecture:** Three core services (Interrupt Injector, Region Allocator, Syscall Handler) coordinated by a main compute shader. Python implementations tested first, then translated to WGSL.

**Tech Stack:** Python 3.11+, pytest, WGSL/WebGPU, NumPy

**Spec:** `docs/superpowers/specs/2026-03-12-spatial-program-coordinator-design.md`

---

## File Structure

```
systems/spatial_coordinator/
├── __init__.py
├── types.py                    # Core types and constants
├── interrupt.py                # Interrupt packet and propagation
├── header.py                   # Application header parsing
├── allocator.py                # Region allocation (first-fit + compaction)
├── syscall.py                  # Syscall handling
├── coordinator.py              # Main coordinator loop
├── wgsl/
│   ├── coordinator.wgsl        # Main compute shader
│   ├── interrupt_injector.wgsl # INT injection & propagation
│   ├── app_loader.wgsl         # Header parsing, region allocation
│   └── syscall_handler.wgsl    # SYNC processing
├── tests/
│   ├── __init__.py
│   ├── test_types.py
│   ├── test_interrupt.py
│   ├── test_header.py
│   ├── test_allocator.py
│   ├── test_syscall.py
│   └── test_coordinator.py
├── apps/
│   └── test_app.glyph          # Minimal test app
└── README.md
```

---

## Chunk 1: Core Types and Constants

### Task 1: Core Types Module

**Files:**
- Create: `systems/spatial_coordinator/__init__.py`
- Create: `systems/spatial_coordinator/types.py`
- Create: `systems/spatial_coordinator/tests/__init__.py`
- Create: `systems/spatial_coordinator/tests/test_types.py`

- [ ] **Step 1: Write the failing test for InterruptType**

```python
# systems/spatial_coordinator/tests/test_types.py
"""Test core types for spatial coordinator."""
import pytest
from dataclasses import FrozenInstanceError


class TestInterruptType:
    """Test InterruptType enum."""

    def test_keyboard_type_value(self):
        """KEYBOARD should be 0x01."""
        from systems.spatial_coordinator.types import InterruptType

        assert InterruptType.KEYBOARD.value == 0x01

    def test_mouse_type_value(self):
        """MOUSE should be 0x02."""
        from systems.spatial_coordinator.types import InterruptType

        assert InterruptType.MOUSE.value == 0x02

    def test_all_types_defined(self):
        """Should have exactly KEYBOARD and MOUSE."""
        from systems.spatial_coordinator.types import InterruptType

        assert len(list(InterruptType)) == 2
```

- [ ] **Step 2: Run test to verify it fails**

Run: `pytest systems/spatial_coordinator/tests/test_types.py -v`
Expected: FAIL with "ModuleNotFoundError" or "ImportError"

- [ ] **Step 3: Write InterruptType enum**

```python
# systems/spatial_coordinator/types.py
"""Core types and constants for Spatial Program Coordinator."""
from enum import IntEnum


class InterruptType(IntEnum):
    """Interrupt type codes for spatial events."""
    KEYBOARD = 0x01
    MOUSE = 0x02
```

```python
# systems/spatial_coordinator/__init__.py
"""Spatial Program Coordinator - GPU-first windowing system for Geometry OS."""
from .types import InterruptType

__all__ = ["InterruptType"]
```

```python
# systems/spatial_coordinator/tests/__init__.py
"""Tests for spatial coordinator."""
```

- [ ] **Step 4: Run test to verify it passes**

Run: `pytest systems/spatial_coordinator/tests/test_types.py -v`
Expected: PASS (3 tests)

- [ ] **Step 5: Commit**

```bash
git add systems/spatial_coordinator/
git commit -m "feat(spatial_coordinator): add InterruptType enum

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

### Task 2: Capability Flags and Registers

**Files:**
- Modify: `systems/spatial_coordinator/types.py`
- Modify: `systems/spatial_coordinator/tests/test_types.py`

- [ ] **Step 1: Write the failing tests for CapabilityFlags**

```python
# Add to systems/spatial_coordinator/tests/test_types.py

class TestCapabilityFlags:
    """Test CapabilityFlags enum."""

    def test_wants_keyboard_bit(self):
        """WANTS_KEYBOARD should be bit 0."""
        from systems.spatial_coordinator.types import CapabilityFlags

        assert CapabilityFlags.WANTS_KEYBOARD.value == (1 << 0)

    def test_wants_mouse_bit(self):
        """WANTS_MOUSE should be bit 1."""
        from systems.spatial_coordinator.types import CapabilityFlags

        assert CapabilityFlags.WANTS_MOUSE.value == (1 << 1)

    def test_can_combine_flags(self):
        """Should be able to combine flags with bitwise OR."""
        from systems.spatial_coordinator.types import CapabilityFlags

        combined = CapabilityFlags.WANTS_KEYBOARD | CapabilityFlags.WANTS_MOUSE
        assert combined.value == 0x03


class TestSyscallID:
    """Test SyscallID enum."""

    def test_resize_id(self):
        """RESIZE should be 0x01."""
        from systems.spatial_coordinator.types import SyscallID

        assert SyscallID.RESIZE.value == 0x01

    def test_close_id(self):
        """CLOSE should be 0x02."""
        from systems.spatial_coordinator.types import SyscallID

        assert SyscallID.CLOSE.value == 0x02

    def test_spawn_id(self):
        """SPAWN should be 0x03."""
        from systems.spatial_coordinator.types import SyscallID

        assert SyscallID.SPAWN.value == 0x03
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `pytest systems/spatial_coordinator/tests/test_types.py -v`
Expected: FAIL with "ImportError: cannot import name 'CapabilityFlags'"

- [ ] **Step 3: Write CapabilityFlags and SyscallID enums**

```python
# Add to systems/spatial_coordinator/types.py

class CapabilityFlags(IntEnum):
    """Application capability flags for event subscription."""
    WANTS_KEYBOARD = 1 << 0   # 0x01
    WANTS_MOUSE = 1 << 1      # 0x02
    WANTS_HOVER = 1 << 2      # 0x04
    CAN_RESIZE = 1 << 3       # 0x08
    CAN_SPAWN = 1 << 4        # 0x10


class SyscallID(IntEnum):
    """Syscall identifiers for SYNC opcode."""
    RESIZE = 0x01
    CLOSE = 0x02
    SPAWN = 0x03
    READ_CLIP = 0x04
    WRITE_CLIP = 0x05
    GET_TIME = 0x06
    REQUEST_FOCUS = 0x07
    YIELD_FOCUS = 0x08
```

```python
# Update systems/spatial_coordinator/__init__.py
from .types import InterruptType, CapabilityFlags, SyscallID

__all__ = ["InterruptType", "CapabilityFlags", "SyscallID"]
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `pytest systems/spatial_coordinator/tests/test_types.py -v`
Expected: PASS (9 tests)

- [ ] **Step 5: Commit**

```bash
git add systems/spatial_coordinator/
git commit -m "feat(spatial_coordinator): add CapabilityFlags and SyscallID enums

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

### Task 3: Error Codes and Opcodes

**Files:**
- Modify: `systems/spatial_coordinator/types.py`
- Modify: `systems/spatial_coordinator/tests/test_types.py`

- [ ] **Step 1: Write the failing tests**

```python
# Add to systems/spatial_coordinator/tests/test_types.py

class TestErrorCode:
    """Test ErrorCode enum."""

    def test_success_is_zero(self):
        """SUCCESS should be 0."""
        from systems.spatial_coordinator.types import ErrorCode

        assert ErrorCode.SUCCESS.value == 0

    def test_invalid_args_is_one(self):
        """INVALID_ARGS should be 1."""
        from systems.spatial_coordinator.types import ErrorCode

        assert ErrorCode.INVALID_ARGS.value == 1

    def test_out_of_memory_is_two(self):
        """OUT_OF_MEMORY should be 2."""
        from systems.spatial_coordinator.types import ErrorCode

        assert ErrorCode.OUT_OF_MEMORY.value == 2


class TestOpcode:
    """Test Opcode constants."""

    def test_sync_opcode(self):
        """SYNC should be 0xFE (254)."""
        from systems.spatial_coordinator.types import Opcode

        assert Opcode.SYNC == 0xFE

    def test_halt_opcode(self):
        """HALT should be 0xFF (255)."""
        from systems.spatial_coordinator.types import Opcode

        assert Opcode.HALT == 0xFF

    def test_int_opcode(self):
        """INT should be 0x10."""
        from systems.spatial_coordinator.types import Opcode

        assert Opcode.INT == 0x10
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `pytest systems/spatial_coordinator/tests/test_types.py -v`
Expected: FAIL with "ImportError: cannot import name 'ErrorCode'"

- [ ] **Step 3: Write ErrorCode and Opcode**

```python
# Add to systems/spatial_coordinator/types.py

class ErrorCode(IntEnum):
    """Syscall return codes."""
    SUCCESS = 0
    INVALID_ARGS = 1
    OUT_OF_MEMORY = 2
    PERMISSION_DENIED = 3
    NOT_FOUND = 4


class Opcode:
    """Glyph opcode constants."""
    INT = 0x10      # Interrupt
    SYNC = 0xFE     # Syscall (254)
    HALT = 0xFF     # Halt (255)
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `pytest systems/spatial_coordinator/tests/test_types.py -v`
Expected: PASS (15 tests)

- [ ] **Step 5: Commit**

```bash
git add systems/spatial_coordinator/
git commit -m "feat(spatial_coordinator): add ErrorCode and Opcode constants

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Chunk 2: Interrupt Protocol

### Task 4: Interrupt Packet

**Files:**
- Create: `systems/spatial_coordinator/interrupt.py`
- Create: `systems/spatial_coordinator/tests/test_interrupt.py`

- [ ] **Step 1: Write the failing tests for InterruptPacket**

```python
# systems/spatial_coordinator/tests/test_interrupt.py
"""Test interrupt protocol."""
import pytest


class TestInterruptPacket:
    """Test InterruptPacket dataclass."""

    def test_create_keyboard_packet(self):
        """Should create keyboard interrupt packet."""
        from systems.spatial_coordinator.interrupt import InterruptPacket
        from systems.spatial_coordinator.types import InterruptType

        packet = InterruptPacket(
            type=InterruptType.KEYBOARD,
            payload=0x20,  # spacebar
            timestamp=100,
            source=0
        )

        assert packet.type == InterruptType.KEYBOARD
        assert packet.payload == 0x20
        assert packet.timestamp == 100
        assert packet.source == 0

    def test_packet_is_frozen(self):
        """Packets should be immutable."""
        from systems.spatial_coordinator.interrupt import InterruptPacket
        from systems.spatial_coordinator.types import InterruptType

        packet = InterruptPacket(
            type=InterruptType.KEYBOARD,
            payload=0x20,
            timestamp=100,
            source=0
        )

        with pytest.raises(AttributeError):
            packet.payload = 0x41

    def test_pack_to_bytes(self):
        """Should pack to 5-byte format."""
        from systems.spatial_coordinator.interrupt import InterruptPacket
        from systems.spatial_coordinator.types import InterruptType

        packet = InterruptPacket(
            type=InterruptType.KEYBOARD,
            payload=0x20,
            timestamp=0x1234,
            source=0x01
        )

        data = packet.pack()

        assert len(data) == 5
        assert data[0] == 0x01  # type
        assert data[1] == 0x20  # payload
        assert data[2] == 0x34  # timestamp low byte
        assert data[3] == 0x12  # timestamp high byte
        assert data[4] == 0x01  # source

    def test_unpack_from_bytes(self):
        """Should unpack from 5-byte format."""
        from systems.spatial_coordinator.interrupt import InterruptPacket
        from systems.spatial_coordinator.types import InterruptType

        data = bytes([0x02, 0x01, 0x00, 0x01, 0x00])  # mouse, left click, timestamp=256

        packet = InterruptPacket.unpack(data)

        assert packet.type == InterruptType.MOUSE
        assert packet.payload == 0x01
        assert packet.timestamp == 256
        assert packet.source == 0
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `pytest systems/spatial_coordinator/tests/test_interrupt.py -v`
Expected: FAIL with "ModuleNotFoundError"

- [ ] **Step 3: Write InterruptPacket**

```python
# systems/spatial_coordinator/interrupt.py
"""Interrupt protocol for spatial event injection."""
from dataclasses import dataclass
from .types import InterruptType


@dataclass(frozen=True, slots=True)
class InterruptPacket:
    """5-byte interrupt packet for spatial event injection."""
    type: InterruptType
    payload: int      # Keycode or button ID
    timestamp: int    # Frame counter (u16)
    source: int       # Device seat

    def pack(self) -> bytes:
        """Pack to 5-byte binary format."""
        return bytes([
            self.type.value,
            self.payload,
            self.timestamp & 0xFF,
            (self.timestamp >> 8) & 0xFF,
            self.source
        ])

    @classmethod
    def unpack(cls, data: bytes) -> "InterruptPacket":
        """Unpack from 5-byte binary format."""
        if len(data) != 5:
            raise ValueError(f"Expected 5 bytes, got {len(data)}")

        return cls(
            type=InterruptType(data[0]),
            payload=data[1],
            timestamp=data[2] | (data[3] << 8),
            source=data[4]
        )
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `pytest systems/spatial_coordinator/tests/test_interrupt.py -v`
Expected: PASS (4 tests)

- [ ] **Step 5: Commit**

```bash
git add systems/spatial_coordinator/
git commit -m "feat(spatial_coordinator): add InterruptPacket with pack/unpack

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

### Task 5: Interrupt Propagation

**Files:**
- Modify: `systems/spatial_coordinator/interrupt.py`
- Modify: `systems/spatial_coordinator/tests/test_interrupt.py`

- [ ] **Step 1: Write the failing tests for propagation**

```python
# Add to systems/spatial_coordinator/tests/test_interrupt.py

class TestInterruptPropagation:
    """Test spatial interrupt propagation."""

    def test_propagate_to_neighbors(self):
        """Should get 4-connected neighbors for propagation."""
        from systems.spatial_coordinator.interrupt import get_neighbors

        neighbors = get_neighbors(10, 10, 5, 5)  # x=10, y=10, in 5x5 grid

        assert len(neighbors) == 4
        assert (4, 5) in neighbors   # left
        assert (6, 5) in neighbors   # right
        assert (5, 4) in neighbors   # up
        assert (5, 6) in neighbors   # down

    def test_propagate_at_boundary(self):
        """Should not propagate outside grid bounds."""
        from systems.spatial_coordinator.interrupt import get_neighbors

        neighbors = get_neighbors(0, 0, 10, 10)  # corner

        assert len(neighbors) == 2  # only right and down
        assert (-1, 0) not in neighbors
        assert (0, -1) not in neighbors

    def test_max_ttl_is_64(self):
        """Max propagation TTL should be 64."""
        from systems.spatial_coordinator.interrupt import MAX_PROPAGATION_TTL

        assert MAX_PROPAGATION_TTL == 64
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `pytest systems/spatial_coordinator/tests/test_interrupt.py::TestInterruptPropagation -v`
Expected: FAIL with "ImportError: cannot import name 'get_neighbors'"

- [ ] **Step 3: Write propagation helpers**

```python
# Add to systems/spatial_coordinator/interrupt.py
from typing import List, Tuple

MAX_PROPAGATION_TTL = 64


def get_neighbors(x: int, y: int, width: int, height: int) -> List[Tuple[int, int]]:
    """Get 4-connected neighbors within grid bounds."""
    neighbors = []

    if x > 0:
        neighbors.append((x - 1, y))  # left
    if x < width - 1:
        neighbors.append((x + 1, y))  # right
    if y > 0:
        neighbors.append((x, y - 1))  # up
    if y < height - 1:
        neighbors.append((x, y + 1))  # down

    return neighbors
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `pytest systems/spatial_coordinator/tests/test_interrupt.py -v`
Expected: PASS (7 tests)

- [ ] **Step 5: Commit**

```bash
git add systems/spatial_coordinator/
git commit -m "feat(spatial_coordinator): add interrupt propagation helpers

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Chunk 3: Application Header

### Task 6: Application Header Parsing

**Files:**
- Create: `systems/spatial_coordinator/header.py`
- Create: `systems/spatial_coordinator/tests/test_header.py`

- [ ] **Step 1: Write the failing tests for AppHeader**

```python
# systems/spatial_coordinator/tests/test_header.py
"""Test application header parsing."""
import pytest


class TestAppHeader:
    """Test AppHeader parsing and validation."""

    def test_parse_valid_header(self):
        """Should parse a valid 16-byte header."""
        from systems.spatial_coordinator.header import AppHeader

        # "GEOS" + width(64) + height(32) + mem(256) + entry(0) + handlers(0) + flags(0x03)
        data = b'GEOS' + b'\x40\x00' + b'\x20\x00' + b'\x00\x01' + b'\x00\x00' + b'\x00\x00' + b'\x03\x00'

        header = AppHeader.parse(data)

        assert header.magic == "GEOS"
        assert header.width == 64
        assert header.height == 32
        assert header.mem_size == 256
        assert header.entry_x == 0
        assert header.entry_y == 0

    def test_header_size_is_16(self):
        """HEADER_SIZE constant should be 16."""
        from systems.spatial_coordinator.header import HEADER_SIZE

        assert HEADER_SIZE == 16

    def test_parse_rejects_wrong_magic(self):
        """Should reject headers without GEOS magic."""
        from systems.spatial_coordinator.header import AppHeader, InvalidHeaderError

        data = b'XXXX' + b'\x00' * 12

        with pytest.raises(InvalidHeaderError, match="Invalid magic"):
            AppHeader.parse(data)

    def test_parse_rejects_short_data(self):
        """Should reject data shorter than 16 bytes."""
        from systems.spatial_coordinator.header import AppHeader, InvalidHeaderError

        data = b'GEOS' + b'\x00' * 8  # only 12 bytes

        with pytest.raises(InvalidHeaderError, match="too short"):
            AppHeader.parse(data)

    def test_has_capability(self):
        """Should check capability flags correctly."""
        from systems.spatial_coordinator.header import AppHeader
        from systems.spatial_coordinator.types import CapabilityFlags

        data = b'GEOS' + b'\x00' * 10 + b'\x03\x00'  # flags = 0x03

        header = AppHeader.parse(data)

        assert header.has_capability(CapabilityFlags.WANTS_KEYBOARD)
        assert header.has_capability(CapabilityFlags.WANTS_MOUSE)
        assert not header.has_capability(CapabilityFlags.WANTS_HOVER)
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `pytest systems/spatial_coordinator/tests/test_header.py -v`
Expected: FAIL with "ModuleNotFoundError"

- [ ] **Step 3: Write AppHeader**

```python
# systems/spatial_coordinator/header.py
"""Application header parsing for spatial coordinator."""
from dataclasses import dataclass
from .types import CapabilityFlags


HEADER_SIZE = 16


class InvalidHeaderError(Exception):
    """Raised when header parsing fails."""
    pass


@dataclass
class AppHeader:
    """Parsed application header (first 16 bytes of glyph program)."""
    magic: str
    width: int
    height: int
    mem_size: int
    entry_x: int
    entry_y: int
    handler_table_offset: int
    flags: int

    @classmethod
    def parse(cls, data: bytes) -> "AppHeader":
        """Parse 16-byte header from binary data."""
        if len(data) < HEADER_SIZE:
            raise InvalidHeaderError(f"Header too short: {len(data)} bytes")

        magic = data[0:4].decode('ascii')
        if magic != "GEOS":
            raise InvalidHeaderError(f"Invalid magic: {magic!r}")

        # Little-endian 16-bit values
        width = data[4] | (data[5] << 8)
        height = data[6] | (data[7] << 8)
        mem_size = data[8] | (data[9] << 8)
        entry = data[10] | (data[11] << 8)
        handler_offset = data[12] | (data[13] << 8)
        flags = data[14] | (data[15] << 8)

        return cls(
            magic=magic,
            width=width,
            height=height,
            mem_size=mem_size,
            entry_x=entry & 0xFF,
            entry_y=(entry >> 8) & 0xFF,
            handler_table_offset=handler_offset,
            flags=flags
        )

    def has_capability(self, flag: CapabilityFlags) -> bool:
        """Check if app has a specific capability flag."""
        return bool(self.flags & flag.value)
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `pytest systems/spatial_coordinator/tests/test_header.py -v`
Expected: PASS (5 tests)

- [ ] **Step 5: Commit**

```bash
git add systems/spatial_coordinator/
git commit -m "feat(spatial_coordinator): add AppHeader parsing

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Chunk 4: Region Allocator

### Task 7: Region Allocation

**Files:**
- Create: `systems/spatial_coordinator/allocator.py`
- Create: `systems/spatial_coordinator/tests/test_allocator.py`

- [ ] **Step 1: Write the failing tests for RegionAllocator**

```python
# systems/spatial_coordinator/tests/test_allocator.py
"""Test region allocation."""
import pytest


class TestFreeRegion:
    """Test FreeRegion dataclass."""

    def test_create_free_region(self):
        """Should create free region with coordinates."""
        from systems.spatial_coordinator.allocator import FreeRegion

        region = FreeRegion(origin_x=0, origin_y=0, width=100, height=100)

        assert region.origin_x == 0
        assert region.origin_y == 0
        assert region.width == 100
        assert region.height == 100
        assert region.area == 10000


class TestRegionAllocator:
    """Test first-fit region allocator."""

    def test_allocate_first_region(self):
        """Should allocate from free list."""
        from systems.spatial_coordinator.allocator import RegionAllocator, FreeRegion

        allocator = RegionAllocator()
        allocator.free_list.append(FreeRegion(0, 0, 1024, 1024))

        region = allocator.allocate(64, 32)

        assert region is not None
        assert region.width == 64
        assert region.height == 32

    def test_allocate_fails_when_too_small(self):
        """Should return None when no region is large enough."""
        from systems.spatial_coordinator.allocator import RegionAllocator, FreeRegion

        allocator = RegionAllocator()
        allocator.free_list.append(FreeRegion(0, 0, 10, 10))

        region = allocator.allocate(64, 32)

        assert region is None

    def test_allocate_splits_region(self):
        """Should split free region if larger than needed."""
        from systems.spatial_coordinator.allocator import RegionAllocator, FreeRegion

        allocator = RegionAllocator()
        allocator.free_list.append(FreeRegion(0, 0, 100, 100))

        region = allocator.allocate(64, 32)

        # Check allocated region
        assert region.origin_x == 0
        assert region.origin_y == 0

        # Check remaining free region
        assert len(allocator.free_list) == 1
        remaining = allocator.free_list[0]
        assert remaining.origin_x == 64
        assert remaining.origin_y == 0
        assert remaining.width == 36
        assert remaining.height == 32

    def test_allocate_triggers_compaction(self):
        """Should compact when allocation fails initially."""
        from systems.spatial_coordinator.allocator import RegionAllocator, FreeRegion

        allocator = RegionAllocator()
        # Two small non-contiguous regions
        allocator.free_list.append(FreeRegion(0, 0, 32, 32))
        allocator.free_list.append(FreeRegion(100, 0, 32, 32))

        # Track allocated apps for compaction
        allocator.allocated_apps = [
            FreeRegion(32, 0, 68, 32)  # App in the middle
        ]

        # Request needs 64x32, should trigger compaction
        region = allocator.allocate(64, 32)

        # After compaction, should succeed
        assert region is not None
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `pytest systems/spatial_coordinator/tests/test_allocator.py -v`
Expected: FAIL with "ModuleNotFoundError"

- [ ] **Step 3: Write RegionAllocator**

```python
# systems/spatial_coordinator/allocator.py
"""Region allocation for spatial coordinator."""
from dataclasses import dataclass, field
from typing import List, Optional


@dataclass
class FreeRegion:
    """A free region on the Infinite Map."""
    origin_x: int
    origin_y: int
    width: int
    height: int

    @property
    def area(self) -> int:
        return self.width * self.height

    def can_fit(self, width: int, height: int) -> bool:
        return self.width >= width and self.height >= height


@dataclass
class RegionAllocator:
    """First-fit allocator with compaction."""
    free_list: List[FreeRegion] = field(default_factory=list)
    allocated_apps: List[FreeRegion] = field(default_factory=list)

    def allocate(self, width: int, height: int) -> Optional[FreeRegion]:
        """Allocate a region using first-fit strategy."""
        required_area = width * height

        # Find first region that fits
        for i, free in enumerate(self.free_list):
            if free.can_fit(width, height):
                # Allocate from this region
                allocated = FreeRegion(
                    origin_x=free.origin_x,
                    origin_y=free.origin_y,
                    width=width,
                    height=height
                )

                # Split remaining space
                remaining_width = free.width - width
                remaining_height = free.height - height

                if remaining_width > 0:
                    # Put remainder to the right
                    self.free_list[i] = FreeRegion(
                        origin_x=free.origin_x + width,
                        origin_y=free.origin_y,
                        width=remaining_width,
                        height=height
                    )
                else:
                    # Remove exhausted region
                    self.free_list.pop(i)

                self.allocated_apps.append(allocated)
                return allocated

        # No fit found - try compaction
        self._compact()

        # Retry allocation
        for i, free in enumerate(self.free_list):
            if free.can_fit(width, height):
                return self.allocate(width, height)

        return None

    def _compact(self):
        """Compact allocated apps to eliminate gaps."""
        if not self.allocated_apps:
            return

        # Sort by origin
        self.allocated_apps.sort(key=lambda r: (r.origin_y, r.origin_x))

        # Slide apps to eliminate gaps (simplified 1D for now)
        current_x = 0
        for app in self.allocated_apps:
            if app.origin_x > current_x:
                # Slide left
                app.origin_x = current_x
            current_x = app.origin_x + app.width

        # Rebuild free list
        self._rebuild_free_list()

    def _rebuild_free_list(self):
        """Rebuild free list after compaction."""
        # Simplified: assume single row, rebuild gap after last app
        self.free_list.clear()

        if self.allocated_apps:
            last = max(self.allocated_apps, key=lambda r: r.origin_x + r.width)
            end_x = last.origin_x + last.width
            # Add free region after last app
            self.free_list.append(FreeRegion(end_x, 0, 1024 - end_x, 1024))
        else:
            # Everything is free
            self.free_list.append(FreeRegion(0, 0, 1024, 1024))
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `pytest systems/spatial_coordinator/tests/test_allocator.py -v`
Expected: PASS (4 tests)

- [ ] **Step 5: Commit**

```bash
git add systems/spatial_coordinator/
git commit -m "feat(spatial_coordinator): add RegionAllocator with first-fit and compaction

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Chunk 5: Syscall Handler

### Task 8: Syscall Processing

**Files:**
- Create: `systems/spatial_coordinator/syscall.py`
- Create: `systems/spatial_coordinator/tests/test_syscall.py`

- [ ] **Step 1: Write the failing tests for SyscallHandler**

```python
# systems/spatial_coordinator/tests/test_syscall.py
"""Test syscall handling."""
import pytest


class TestSyscallRequest:
    """Test SyscallRequest dataclass."""

    def test_create_syscall_request(self):
        """Should create syscall request."""
        from systems.spatial_coordinator.syscall import SyscallRequest
        from systems.spatial_coordinator.types import SyscallID

        request = SyscallRequest(
            app_id=1,
            syscall_id=SyscallID.RESIZE,
            arg1=80,
            arg2=40
        )

        assert request.app_id == 1
        assert request.syscall_id == SyscallID.RESIZE
        assert request.arg1 == 80
        assert request.arg2 == 40


class TestSyscallHandler:
    """Test SyscallHandler."""

    def test_queue_syscall(self):
        """Should queue syscall for processing."""
        from systems.spatial_coordinator.syscall import SyscallHandler, SyscallRequest
        from systems.spatial_coordinator.types import SyscallID

        handler = SyscallHandler()
        request = SyscallRequest(app_id=1, syscall_id=SyscallID.GET_TIME, arg1=0, arg2=0)

        handler.queue(request)

        assert handler.queue_depth == 1

    def test_queue_overflow_drops_oldest(self):
        """Should drop oldest syscall on overflow."""
        from systems.spatial_coordinator.syscall import SyscallHandler, SyscallRequest, MAX_QUEUE_DEPTH
        from systems.spatial_coordinator.types import SyscallID

        handler = SyscallHandler()

        # Fill queue
        for i in range(MAX_QUEUE_DEPTH):
            handler.queue(SyscallRequest(app_id=i, syscall_id=SyscallID.GET_TIME, arg1=0, arg2=0))

        # Add one more
        handler.queue(SyscallRequest(app_id=999, syscall_id=SyscallID.GET_TIME, arg1=0, arg2=0))

        # First request should be dropped
        assert handler.queue[0].app_id == 1
        assert handler.queue[-1].app_id == 999

    def test_process_resize(self):
        """Should process RESIZE syscall."""
        from systems.spatial_coordinator.syscall import SyscallHandler, SyscallRequest
        from systems.spatial_coordinator.types import SyscallID, ErrorCode

        handler = SyscallHandler()
        handler.allocated_regions = {1: (0, 0, 64, 32)}  # app_id -> (x, y, w, h)

        request = SyscallRequest(app_id=1, syscall_id=SyscallID.RESIZE, arg1=80, arg2=40)
        result = handler.process(request)

        assert result == ErrorCode.SUCCESS

    def test_process_get_time(self):
        """Should process GET_TIME syscall."""
        from systems.spatial_coordinator.syscall import SyscallHandler, SyscallRequest
        from systems.spatial_coordinator.types import SyscallID, ErrorCode

        handler = SyscallHandler()
        handler.frame_count = 12345

        request = SyscallRequest(app_id=1, syscall_id=SyscallID.GET_TIME, arg1=0, arg2=0)
        result, return_value = handler.process_with_return(request)

        assert result == ErrorCode.SUCCESS
        assert return_value == 12345
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `pytest systems/spatial_coordinator/tests/test_syscall.py -v`
Expected: FAIL with "ModuleNotFoundError"

- [ ] **Step 3: Write SyscallHandler**

```python
# systems/spatial_coordinator/syscall.py
"""Syscall handling for spatial coordinator."""
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Tuple, Any
from .types import SyscallID, ErrorCode


MAX_QUEUE_DEPTH = 16


@dataclass
class SyscallRequest:
    """A queued syscall request."""
    app_id: int
    syscall_id: SyscallID
    arg1: int
    arg2: int


@dataclass
class SyscallHandler:
    """Processes SYNC syscalls from apps."""
    queue: List[SyscallRequest] = field(default_factory=list)
    allocated_regions: Dict[int, Tuple[int, int, int, int]] = field(default_factory=dict)
    frame_count: int = 0
    focus_stack: List[int] = field(default_factory=list)

    @property
    def queue_depth(self) -> int:
        return len(self.queue)

    def queue(self, request: SyscallRequest):
        """Queue a syscall for processing."""
        if len(self.queue) >= MAX_QUEUE_DEPTH:
            # Drop oldest
            self.queue.pop(0)
        self.queue.append(request)

    def process(self, request: SyscallRequest) -> ErrorCode:
        """Process a syscall and return error code."""
        result, _ = self.process_with_return(request)
        return result

    def process_with_return(self, request: SyscallRequest) -> Tuple[ErrorCode, int]:
        """Process a syscall and return (error_code, return_value)."""
        if request.syscall_id == SyscallID.RESIZE:
            return self._handle_resize(request)
        elif request.syscall_id == SyscallID.CLOSE:
            return self._handle_close(request)
        elif request.syscall_id == SyscallID.GET_TIME:
            return (ErrorCode.SUCCESS, self.frame_count)
        elif request.syscall_id == SyscallID.REQUEST_FOCUS:
            return self._handle_request_focus(request)
        elif request.syscall_id == SyscallID.YIELD_FOCUS:
            return self._handle_yield_focus(request)
        else:
            return (ErrorCode.INVALID_ARGS, 0)

    def _handle_resize(self, request: SyscallRequest) -> Tuple[ErrorCode, int]:
        """Handle RESIZE syscall."""
        if request.app_id not in self.allocated_regions:
            return (ErrorCode.NOT_FOUND, 0)

        new_width, new_height = request.arg1, request.arg2
        if new_width <= 0 or new_height <= 0:
            return (ErrorCode.INVALID_ARGS, 0)

        # Update region (simplified - real impl would check space)
        x, y, _, _ = self.allocated_regions[request.app_id]
        self.allocated_regions[request.app_id] = (x, y, new_width, new_height)
        return (ErrorCode.SUCCESS, 1)

    def _handle_close(self, request: SyscallRequest) -> Tuple[ErrorCode, int]:
        """Handle CLOSE syscall."""
        if request.app_id in self.allocated_regions:
            del self.allocated_regions[request.app_id]
        return (ErrorCode.SUCCESS, 0)

    def _handle_request_focus(self, request: SyscallRequest) -> Tuple[ErrorCode, int]:
        """Handle REQUEST_FOCUS syscall."""
        if request.app_id in self.focus_stack:
            self.focus_stack.remove(request.app_id)
        self.focus_stack.append(request.app_id)
        return (ErrorCode.SUCCESS, 1)

    def _handle_yield_focus(self, request: SyscallRequest) -> Tuple[ErrorCode, int]:
        """Handle YIELD_FOCUS syscall."""
        if request.app_id in self.focus_stack:
            self.focus_stack.remove(request.app_id)
        return (ErrorCode.SUCCESS, 1)
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `pytest systems/spatial_coordinator/tests/test_syscall.py -v`
Expected: PASS (5 tests)

- [ ] **Step 5: Commit**

```bash
git add systems/spatial_coordinator/
git commit -m "feat(spatial_coordinator): add SyscallHandler with queue and processing

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Chunk 6: WGSL Shaders

### Task 9: Interrupt Injector WGSL

**Files:**
- Create: `systems/spatial_coordinator/wgsl/interrupt_injector.wgsl`

- [ ] **Step 1: Write the WGSL interrupt injector**

```wgsl
// systems/spatial_coordinator/wgsl/interrupt_injector.wgsl
// Interrupt Injection and Propagation for Spatial Coordinator

const MAX_TTL: u32 = 64u;
const INT_OPCODE: u32 = 16u;  // 0x10

struct Interrupt {
    int_type: u32,      // KEYBOARD=1, MOUSE=2
    payload: u32,       // Keycode or button
    timestamp: u32,     // Frame counter
    source: u32,        // Device seat
    x: u32,
    y: u32,
    ttl: u32,           // Time-to-live for propagation
}

@group(0) @binding(0) var<storage, read_write> infinite_map: array<u32>;
@group(0) @binding(1) var<storage, read> interrupts: array<Interrupt>;
@group(0) @binding(2) var<uniform> map_width: u32;
@group(0) @binding(3) var<uniform> map_height: u32;

fn coord_to_index(x: u32, y: u32) -> u32 {
    return y * map_width + x;
}

fn pack_interrupt(int_type: u32, payload: u32, timestamp: u32, source: u32) -> u32 {
    // Pack 5-byte interrupt into u32 (truncated for storage)
    // Full packet stored across 2 cells
    return (int_type << 24u) | (payload << 16u) | (timestamp & 0xFFFFu);
}

@compute @workgroup_size(64)
fn inject_interrupts(@builtin(global_invocation_id) gid: vec3<u32>) {
    let idx = gid.x;
    let interrupt = interrupts[idx];

    if (interrupt.int_type == 0u) { return; }  // Empty slot

    // Write INT glyph at target location
    let target_idx = coord_to_index(interrupt.x, interrupt.y);
    infinite_map[target_idx] = INT_OPCODE;

    // Write payload to next cell
    let payload_idx = target_idx + 1u;
    infinite_map[payload_idx] = pack_interrupt(
        interrupt.int_type,
        interrupt.payload,
        interrupt.timestamp,
        interrupt.source
    );
}

@compute @workgroup_size(64)
fn propagate_interrupts(@builtin(global_invocation_id) gid: vec3<u32>) {
    let x = gid.x % map_width;
    let y = gid.x / map_width;
    let idx = coord_to_index(x, y);

    let glyph = infinite_map[idx];

    // Check if this is an INT glyph with TTL > 0
    if (glyph != INT_OPCODE) { return; }

    // Check neighbor cells for propagation
    // Left
    if (x > 0u) {
        let left_idx = coord_to_index(x - 1u, y);
        let left_glyph = infinite_map[left_idx];
        if (left_glyph != INT_OPCODE && left_glyph != 0u) {
            // Check if neighbor is a handler (opcode >= 0x80 indicates handler)
            if (left_glyph < 0x80u) {
                // Propagate
                infinite_map[left_idx] = INT_OPCODE;
            }
        }
    }

    // Right, Up, Down similar...
}
```

- [ ] **Step 2: Commit**

```bash
git add systems/spatial_coordinator/wgsl/
git commit -m "feat(spatial_coordinator): add interrupt_injector.wgsl

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

### Task 10: Main Coordinator WGSL

**Files:**
- Create: `systems/spatial_coordinator/wgsl/coordinator.wgsl`

- [ ] **Step 1: Write the main coordinator shader**

```wgsl
// systems/spatial_coordinator/wgsl/coordinator.wgsl
// Main Spatial Program Coordinator Compute Shader

#include "interrupt_injector.wgsl"
#include "app_loader.wgsl"
#include "syscall_handler.wgsl"

struct CoordinatorUniforms {
    map_width: u32,
    map_height: u32,
    frame_count: u32,
    app_count: u32,
}

struct AppRegion {
    origin_x: u32,
    origin_y: u32,
    width: u32,
    height: u32,
    entry_x: u32,
    entry_y: u32,
    flags: u32,
    app_id: u32,
}

@group(0) @binding(0) var<uniform> uniforms: CoordinatorUniforms;
@group(0) @binding(1) var<storage, read_write> infinite_map: array<u32>;
@group(0) @binding(2) var<storage, read> app_registry: array<AppRegion>;
@group(0) @binding(3) var<storage, read> interrupts: array<Interrupt>;
@group(0) @binding(4) var<storage, read_write> syscall_queue: array<SyscallRequest>;

const OP_SYNC: u32 = 254u;  // 0xFE
const OP_HALT: u32 = 255u;  // 0xFF

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) gid: vec3<u32>) {
    let cell_idx = gid.x;

    if (cell_idx >= uniforms.map_width * uniforms.map_height) {
        return;
    }

    // Phase 1: Inject pending interrupts
    inject_interrupts(gid);

    // Phase 2: Propagate interrupts spatially
    propagate_interrupts(gid);

    // Phase 3: Execute glyph at this cell
    let glyph = infinite_map[cell_idx];

    if (glyph == OP_SYNC) {
        // Queue syscall for host processing
        queue_syscall(cell_idx);
    } else if (glyph == OP_HALT) {
        // App halted - no further execution
        return;
    }

    // Phase 4: Execute microcode (delegated to existing glyph_vm.wgsl)
    execute_glyph_microcode(cell_idx, glyph);
}

fn queue_syscall(cell_idx: u32) {
    // Read syscall arguments from registers
    // This would interface with the register file
    // For now, placeholder
}

fn execute_glyph_microcode(cell_idx: u32, opcode: u32) {
    // Delegate to existing glyph execution logic
    // See: glyph_vm.wgsl, glyph_microcode.wgsl
}
```

- [ ] **Step 2: Commit**

```bash
git add systems/spatial_coordinator/wgsl/
git commit -m "feat(spatial_coordinator): add main coordinator.wgsl

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Chunk 7: Test Application and Integration

### Task 11: Test Application

**Files:**
- Create: `systems/spatial_coordinator/apps/test_app.glyph`

- [ ] **Step 1: Write the test app binary**

Create a minimal test app that:
- Has valid GEOS header
- Wants keyboard events
- Changes color on spacebar press

```python
# Generate test_app.glyph using Python
# systems/spatial_coordinator/apps/generate_test_app.py

def generate_test_app() -> bytes:
    """Generate minimal test app binary."""
    header = bytearray(16)

    # Magic
    header[0:4] = b'GEOS'

    # Width: 16, Height: 16
    header[4] = 16
    header[6] = 16

    # Mem size: 64
    header[8] = 64

    # Entry point: (0, 0)
    header[10] = 0
    header[11] = 0

    # Handler table offset: 0
    header[12] = 0
    header[13] = 0

    # Flags: WANTS_KEYBOARD
    header[14] = 0x01
    header[15] = 0

    # Code section (simplified - would be actual opcodes)
    code = bytearray(256)  # 16x16 grid

    return bytes(header + code)


if __name__ == "__main__":
    data = generate_test_app()
    with open("test_app.glyph", "wb") as f:
        f.write(data)
    print(f"Generated test_app.glyph ({len(data)} bytes)")
```

- [ ] **Step 2: Generate and commit**

```bash
python systems/spatial_coordinator/apps/generate_test_app.py
git add systems/spatial_coordinator/apps/
git commit -m "feat(spatial_coordinator): add test_app.glyph generator

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

### Task 12: Integration Tests

**Files:**
- Create: `systems/spatial_coordinator/tests/test_coordinator.py`

- [ ] **Step 1: Write integration tests**

```python
# systems/spatial_coordinator/tests/test_coordinator.py
"""Integration tests for spatial coordinator."""
import pytest


class TestCoordinatorIntegration:
    """End-to-end coordinator tests."""

    def test_load_and_allocate_app(self):
        """Should load app from header and allocate region."""
        from systems.spatial_coordinator.coordinator import Coordinator
        from systems.spatial_coordinator.apps.generate_test_app import generate_test_app

        coordinator = Coordinator(map_width=1024, map_height=1024)
        app_data = generate_test_app()

        app_id = coordinator.load_app(app_data)

        assert app_id is not None
        assert app_id >= 0

    def test_inject_keyboard_interrupt(self):
        """Should inject and route keyboard interrupt."""
        from systems.spatial_coordinator.coordinator import Coordinator
        from systems.spatial_coordinator.interrupt import InterruptPacket
        from systems.spatial_coordinator.types import InterruptType

        coordinator = Coordinator(map_width=1024, map_height=1024)
        coordinator.load_app(b'GEOS' + b'\x10\x00' * 6 + b'\x01\x00')  # minimal app

        packet = InterruptPacket(
            type=InterruptType.KEYBOARD,
            payload=0x20,  # spacebar
            timestamp=1,
            source=0
        )

        coordinator.inject_interrupt(packet)

        assert coordinator.interrupt_queue_depth == 1

    def test_process_syscall_queue(self):
        """Should process pending syscalls."""
        from systems.spatial_coordinator.coordinator import Coordinator
        from systems.spatial_coordinator.syscall import SyscallRequest
        from systems.spatial_coordinator.types import SyscallID

        coordinator = Coordinator(map_width=1024, map_height=1024)
        coordinator.frame_count = 100

        request = SyscallRequest(
            app_id=1,
            syscall_id=SyscallID.GET_TIME,
            arg1=0,
            arg2=0
        )
        coordinator.syscall_handler.queue(request)

        coordinator.process_syscalls()

        # GET_TIME should have been processed
        assert coordinator.syscall_handler.queue_depth == 0
```

- [ ] **Step 2: Write Coordinator class**

```python
# systems/spatial_coordinator/coordinator.py
"""Main Spatial Program Coordinator."""
from typing import Optional
from .allocator import RegionAllocator
from .header import AppHeader, HEADER_SIZE
from .interrupt import InterruptPacket
from .syscall import SyscallHandler


class Coordinator:
    """GPU-first windowing system coordinator."""

    def __init__(self, map_width: int = 1024, map_height: int = 1024):
        self.map_width = map_width
        self.map_height = map_height
        self.allocator = RegionAllocator()
        self.syscall_handler = SyscallHandler()
        self.frame_count = 0
        self._interrupt_queue = []
        self._next_app_id = 0

    @property
    def interrupt_queue_depth(self) -> int:
        return len(self._interrupt_queue)

    def load_app(self, app_data: bytes) -> Optional[int]:
        """Load app from binary data, return app_id or None on failure."""
        if len(app_data) < HEADER_SIZE:
            return None

        header = AppHeader.parse(app_data[:HEADER_SIZE])

        # Allocate region
        region = self.allocator.allocate(header.width, header.height)
        if region is None:
            return None

        app_id = self._next_app_id
        self._next_app_id += 1

        # Track region for syscall handler
        self.syscall_handler.allocated_regions[app_id] = (
            region.origin_x, region.origin_y,
            region.width, region.height
        )

        return app_id

    def inject_interrupt(self, packet: InterruptPacket):
        """Queue an interrupt for injection."""
        self._interrupt_queue.append(packet)

    def process_syscalls(self):
        """Process all pending syscalls."""
        while self.syscall_handler.queue_depth > 0:
            request = self.syscall_handler.queue.pop(0)
            self.syscall_handler.process(request)

    def tick(self):
        """Advance coordinator by one frame."""
        self.frame_count += 1
        self.syscall_handler.frame_count = self.frame_count
        self.process_syscalls()
```

- [ ] **Step 3: Run integration tests**

Run: `pytest systems/spatial_coordinator/tests/test_coordinator.py -v`
Expected: PASS (3 tests)

- [ ] **Step 4: Commit**

```bash
git add systems/spatial_coordinator/
git commit -m "feat(spatial_coordinator): add Coordinator class and integration tests

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

### Task 13: Final Verification and README

**Files:**
- Create: `systems/spatial_coordinator/README.md`

- [ ] **Step 1: Write README**

```markdown
# Spatial Program Coordinator

GPU-first windowing system for Geometry OS where applications are autonomous regions of executing glyphs on the Infinite Map.

## Architecture

- **Interrupt Protocol**: Events become spatial glyphs that propagate to handlers
- **Application Header**: 16-byte header declares spatial requirements
- **Syscall Interface**: Apps communicate via SYNC opcode

## Usage

```python
from systems.spatial_coordinator import Coordinator, InterruptPacket, InterruptType

# Create coordinator
coordinator = Coordinator(map_width=1024, map_height=1024)

# Load app
with open("app.glyph", "rb") as f:
    app_id = coordinator.load_app(f.read())

# Inject keyboard event
packet = InterruptPacket(
    type=InterruptType.KEYBOARD,
    payload=0x20,  # spacebar
    timestamp=1,
    source=0
)
coordinator.inject_interrupt(packet)

# Run frame
coordinator.tick()
```

## Files

| File | Purpose |
|------|---------|
| `types.py` | Core types and constants |
| `interrupt.py` | Interrupt packet and propagation |
| `header.py` | Application header parsing |
| `allocator.py` | Region allocation |
| `syscall.py` | Syscall handling |
| `coordinator.py` | Main coordinator loop |
| `wgsl/` | GPU shaders |

## Tests

Run: `pytest systems/spatial_coordinator/tests/ -v`

## Spec

See: `docs/superpowers/specs/2026-03-12-spatial-program-coordinator-design.md`
```

- [ ] **Step 2: Run all tests**

Run: `pytest systems/spatial_coordinator/tests/ -v`
Expected: All tests pass

- [ ] **Step 3: Final commit**

```bash
git add systems/spatial_coordinator/README.md
git commit -m "docs(spatial_coordinator): add README

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Success Criteria

| Criterion | Test |
|-----------|------|
| Apps load from headers | `test_load_and_allocate_app` passes |
| Interrupts propagate | `test_inject_keyboard_interrupt` passes |
| Syscalls work | `test_process_syscall_queue` passes |
| All tests pass | `pytest systems/spatial_coordinator/tests/ -v` returns 0 |
| README documents usage | README.md exists with examples |

---

## Execution Handoff

Plan complete. Ready to execute?
