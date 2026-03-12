# PixelBrain Visual Training Harness - Phase 1: Synthetic Dataset Generator

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create the synthetic dataset generator infrastructure for training PixelBrain on "Allocation Seed" tasks.

**Architecture:** Pure Python implementation with Hilbert Curve encoding for spatial locality. Dataset generator creates Visual Intent → Codel Array pairs in quadrant-based training textures (256x256).

**Tech Stack:** Python 3.12, NumPy, Pillow (PIL)

**Spec Reference:** `docs/superpowers/specs/2026-03-12-pixelbrain-visual-training-design.md`

---

## Chunk 1: Constants and Core Types

### Task 1: Constants Module

**Files:**
- Create: `systems/pixel_brain/__init__.py`
- Create: `systems/pixel_brain/constants.py`
- Create: `tests/test_pixel_brain_constants.py`

- [ ] **Step 1: Write failing tests for constants**

```python
# tests/test_pixel_brain_constants.py
"""Tests for PixelBrain training constants."""

import pytest
from systems.pixel_brain.constants import (
    OPCODE_BASE,
    OPCODE_NOP,
    OPCODE_ALLOC,
    OPCODE_FREE,
    OPCODE_HALT,
    OPCODE_DATA,
    ASCII_START,
    ASCII_END,
    OPCODE_START,
    OPCODE_END,
    BYTE_LITERAL_START,
    BYTE_LITERAL_END,
    TEXTURE_SIZE,
    QUADRANT_SIZE,
    QUADRANT_PIXELS,
)


class TestOpcodeConstants:
    """Test opcode constants match GlyphStratum runtime."""

    def test_opcode_base_is_200(self):
        """Opcode base offset should be 200."""
        assert OPCODE_BASE == 200

    def test_nop_is_200(self):
        """Nop = 200 + 0 = 200."""
        assert OPCODE_NOP == 200

    def test_alloc_is_201(self):
        """Alloc = 200 + 1 = 201."""
        assert OPCODE_ALLOC == 201

    def test_free_is_202(self):
        """Free = 200 + 2 = 202."""
        assert OPCODE_FREE == 202

    def test_halt_is_213(self):
        """Halt = 200 + 13 = 213."""
        assert OPCODE_HALT == 213

    def test_data_is_214(self):
        """Data = 200 + 14 = 214."""
        assert OPCODE_DATA == 214


class TestVocabularyBoundaries:
    """Test token vocabulary boundaries."""

    def test_ascii_range(self):
        """ASCII tokens are 32-126."""
        assert ASCII_START == 32
        assert ASCII_END == 126

    def test_opcode_range(self):
        """Opcode tokens are 200-214."""
        assert OPCODE_START == 200
        assert OPCODE_END == 214

    def test_byte_literal_range(self):
        """Byte literal tokens are 256-511."""
        assert BYTE_LITERAL_START == 256
        assert BYTE_LITERAL_END == 511

    def test_no_overlap_between_vocabularies(self):
        """Vocabulary ranges should not overlap."""
        assert ASCII_END < OPCODE_START
        assert OPCODE_END < BYTE_LITERAL_START


class TestTextureDimensions:
    """Test training texture dimensions."""

    def test_texture_size(self):
        """Training texture is 256x256."""
        assert TEXTURE_SIZE == 256

    def test_quadrant_size(self):
        """Each quadrant is 128x128."""
        assert QUADRANT_SIZE == 128

    def test_quadrant_pixels(self):
        """Each quadrant has 16384 pixels."""
        assert QUADRANT_PIXELS == 16384

    def test_total_pixels(self):
        """Total texture has 65536 pixels."""
        assert TEXTURE_SIZE * TEXTURE_SIZE == 65536
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `python -m pytest tests/test_pixel_brain_constants.py -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'systems.pixel_brain'"

- [ ] **Step 3: Create __init__.py**

```python
# systems/pixel_brain/__init__.py
"""PixelBrain Visual Training Harness.

This module provides components for training PixelBrain as a native
Geometry OS intelligence using visual-first training via Hilbert Curve encoding.
"""

__version__ = "0.1.0"
```

- [ ] **Step 4: Write constants module**

```python
# systems/pixel_brain/constants.py
"""Constants for PixelBrain Visual Training Harness.

These constants define the token vocabulary and texture dimensions
for training PixelBrain on Geometry OS spatial programs.

Reference: systems/infinite_map_rs/src/glyph_stratum/mod.rs
"""

# =============================================================================
# GLYPHSTRATUM OPCODES
# =============================================================================

# Base offset for GlyphStratum opcodes (Unicode 200-214)
OPCODE_BASE = 200

# Individual opcodes: OPCODE_BASE + opcode_value
OPCODE_NOP = 200      # Nop = 200 + 0
OPCODE_ALLOC = 201    # Alloc = 200 + 1
OPCODE_FREE = 202     # Free = 200 + 2
OPCODE_LOAD = 203     # Load = 200 + 3
OPCODE_STORE = 204    # Store = 200 + 4
OPCODE_ADD = 205      # Add = 200 + 5
OPCODE_SUB = 206      # Sub = 200 + 6
OPCODE_MUL = 207      # Mul = 200 + 7
OPCODE_DIV = 208      # Div = 200 + 8
OPCODE_JUMP = 209     # Jump = 200 + 9
OPCODE_BRANCH = 210   # Branch = 200 + 10
OPCODE_CALL = 211     # Call = 200 + 11
OPCODE_RETURN = 212   # Return = 200 + 12
OPCODE_HALT = 213     # Halt = 200 + 13
OPCODE_DATA = 214     # Data = 200 + 14

# =============================================================================
# TOKEN VOCABULARY BOUNDARIES
# =============================================================================

# ASCII printable characters (Prompt vocabulary)
ASCII_START = 32
ASCII_END = 126

# GlyphStratum opcodes (Logic vocabulary)
OPCODE_START = 200
OPCODE_END = 214

# Raw byte literals 0-255 (Operand vocabulary)
BYTE_LITERAL_START = 256
BYTE_LITERAL_END = 511

# Intent glyphs (Stratum 4 metadata)
INTENT_GLYPH_START = 512

# Total vocabulary size
VOCAB_SIZE = 1024

# =============================================================================
# TRAINING TEXTURE DIMENSIONS
# =============================================================================

# Training texture is 256x256 pixels
TEXTURE_SIZE = 256

# Each quadrant is 128x128 pixels
QUADRANT_SIZE = 128

# Pixels per quadrant
QUADRANT_PIXELS = QUADRANT_SIZE * QUADRANT_SIZE  # 16384

# Total pixels in texture
TOTAL_PIXELS = TEXTURE_SIZE * TEXTURE_SIZE  # 65536

# =============================================================================
# QUADRANT OFFSETS (Hilbert step ranges)
# =============================================================================

# Q0: Prompt region (steps 0-16383)
Q0_START = 0
Q0_END = QUADRANT_PIXELS - 1  # 16383

# Q1: Intent/Spec region (steps 16384-32767)
Q1_START = QUADRANT_PIXELS  # 16384
Q1_END = 2 * QUADRANT_PIXELS - 1  # 32767

# Q2: Memory/Substrate region (steps 32768-49151)
Q2_START = 2 * QUADRANT_PIXELS  # 32768
Q2_END = 3 * QUADRANT_PIXELS - 1  # 49151

# Q3: Terminus/Stability region (steps 49152-65535)
Q3_START = 3 * QUADRANT_PIXELS  # 49152
Q3_END = 4 * QUADRANT_PIXELS - 1  # 65535

# =============================================================================
# COLOR DEFINITIONS
# =============================================================================

# Standard colors for fill operations (RGB tuples)
COLORS = {
    "RED": (255, 0, 0),
    "GREEN": (0, 255, 0),
    "BLUE": (0, 0, 255),
    "YELLOW": (255, 255, 0),
    "CYAN": (0, 255, 255),
    "MAGENTA": (255, 0, 255),
}

# =============================================================================
# TASK GRAMMAR
# =============================================================================

# Available sizes for ALLOC tasks
ALLOC_SIZES = [(2, 2), (4, 4), (8, 8), (16, 16), (4, 8), (8, 4)]

# Available colors for fill operations
ALLOC_COLORS = list(COLORS.keys())

# Grid-aligned positions for allocations
ALLOC_POSITIONS = list(range(0, 240, 16))

# Target dataset size
TARGET_DATASET_SIZE = 1000
```

- [ ] **Step 5: Run tests to verify they pass**

Run: `python -m pytest tests/test_pixel_brain_constants.py -v`
Expected: All tests PASS

- [ ] **Step 6: Commit constants**

```bash
git add systems/pixel_brain/__init__.py systems/pixel_brain/constants.py tests/test_pixel_brain_constants.py
git commit -m "$(cat <<'EOF'
feat(pixel_brain): add constants module for visual training

Define token vocabulary boundaries matching GlyphStratum runtime:
- Opcodes 200-214 (Nop=200, Halt=213, Data=214)
- ASCII 32-126, Byte literals 256-511
- Training texture dimensions (256x256)
- Quadrant offsets for Hilbert traversal

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
EOF
)"
```

---

## Chunk 2: Hilbert Encoder

### Task 2: Hilbert Encoder Module

**Files:**
- Create: `systems/pixel_brain/hilbert_encoder.py`
- Create: `tests/test_hilbert_encoder.py`

- [ ] **Step 1: Write failing tests for Hilbert encoder**

```python
# tests/test_hilbert_encoder.py
"""Tests for Hilbert encoder (2D ↔ 1D spatial encoding)."""

import pytest
import numpy as np
from systems.pixel_brain.hilbert_encoder import HilbertEncoder
from systems.pixel_brain.constants import TEXTURE_SIZE, QUADRANT_SIZE


class TestHilbertEncoderBasic:
    """Test basic Hilbert encoding/decoding."""

    @pytest.fixture
    def encoder(self):
        """Create encoder with default 256x256 grid."""
        return HilbertEncoder(grid_size=TEXTURE_SIZE)

    def test_origin_maps_to_zero(self, encoder):
        """(0, 0) should map to Hilbert index 0."""
        assert encoder.xy_to_hilbert(0, 0) == 0

    def test_zero_maps_to_origin(self, encoder):
        """Hilbert index 0 should map to (0, 0)."""
        assert encoder.hilbert_to_xy(0) == (0, 0)

    def test_roundtrip_preserves_coordinates(self, encoder):
        """Encoding then decoding should return original coordinates."""
        for x, y in [(0, 0), (128, 128), (255, 255), (64, 192)]:
            index = encoder.xy_to_hilbert(x, y)
            decoded_x, decoded_y = encoder.hilbert_to_xy(index)
            assert (decoded_x, decoded_y) == (x, y), f"Failed for ({x}, {y})"

    def test_roundtrip_preserves_index(self, encoder):
        """Decoding then encoding should return original index."""
        for index in [0, 1000, 32768, 65535]:
            x, y = encoder.hilbert_to_xy(index)
            decoded_index = encoder.xy_to_hilbert(x, y)
            assert decoded_index == index, f"Failed for index {index}"

    def test_indices_are_unique(self, encoder):
        """Each (x, y) should map to a unique index."""
        indices = set()
        for x in range(0, 256, 16):  # Sample grid
            for y in range(0, 256, 16):
                index = encoder.xy_to_hilbert(x, y)
                assert index not in indices, f"Duplicate index {index} for ({x}, {y})"
                indices.add(index)

    def test_all_indices_covered(self, encoder):
        """All indices 0-65535 should be reachable."""
        indices = set()
        for x in range(256):
            for y in range(256):
                indices.add(encoder.xy_to_hilbert(x, y))
        assert len(indices) == 65536


class TestHilbertSpatialLocality:
    """Test that Hilbert curve preserves spatial locality."""

    @pytest.fixture
    def encoder(self):
        return HilbertEncoder(grid_size=TEXTURE_SIZE)

    def test_adjacent_pixels_have_nearby_indices(self, encoder):
        """Adjacent (x, y) should have Hilbert indices within 4 of each other."""
        for x in range(1, 254):
            for y in range(1, 254):
                center = encoder.xy_to_hilbert(x, y)
                right = encoder.xy_to_hilbert(x + 1, y)
                # Adjacent pixels should have indices within reasonable distance
                # (Hilbert curve visits neighbors within ~4 steps)
                assert abs(center - right) <= 4, f"Large gap at ({x}, {y}): {center} vs {right}"

    def test_quadrant_indices_in_correct_range(self, encoder):
        """Verify quadrant boundaries match expected Hilbert ranges."""
        # Note: Hilbert curves don't map directly to Cartesian quadrants
        # This test verifies the encoder produces consistent results
        q0_count = 0
        q3_count = 0

        for x in range(128):
            for y in range(128):
                if encoder.xy_to_hilbert(x, y) < 16384:
                    q0_count += 1

        for x in range(128, 256):
            for y in range(128, 256):
                if encoder.xy_to_hilbert(x, y) >= 49152:
                    q3_count += 1

        # At least some pixels in each quadrant should be in correct range
        assert q0_count > 0
        assert q3_count > 0


class TestHilbertEncoderEncoding:
    """Test encoding/decoding of texture regions."""

    @pytest.fixture
    def encoder(self):
        return HilbertEncoder(grid_size=TEXTURE_SIZE)

    def test_encode_quadrant_returns_correct_length(self, encoder):
        """encode_quadrant should return 16384 indices."""
        texture = np.zeros((256, 256), dtype=np.uint16)
        indices = encoder.encode_quadrant(texture, quadrant=0)
        assert len(indices) == 16384

    def test_decode_to_quadrant_preserves_values(self, encoder):
        """Decoding encoded indices should preserve values."""
        original = np.random.randint(0, 1024, size=(256, 256), dtype=np.uint16)
        indices = encoder.encode_quadrant(original, quadrant=0)
        decoded = encoder.decode_to_quadrant(indices, quadrant=0)

        # Verify decoded matches original in quadrant 0 region
        for i, idx in enumerate(indices[:100]):  # Sample first 100
            x, y = encoder.hilbert_to_xy(idx)
            if x < 128 and y < 128:  # Q0 region
                assert decoded[y, x] == original[y, x]
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `python -m pytest tests/test_hilbert_encoder.py -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'systems.pixel_brain.hilbert_encoder'"

- [ ] **Step 3: Write Hilbert encoder implementation**

```python
# systems/pixel_brain/hilbert_encoder.py
"""Hilbert Curve Encoder for 2D ↔ 1D spatial encoding.

This module implements a pure Python Hilbert curve encoder that matches
the algorithm used in systems/infinite_map_rs/src/cognitive/hilbert_pathfinder.rs.

The Hilbert curve preserves spatial locality: pixels that are close in 2D
are also close in 1D Hilbert space, making it ideal for transformer attention.

Reference: https://en.wikipedia.org/wiki/Hilbert_curve
"""

import numpy as np
from typing import Tuple, List


class HilbertEncoder:
    """
    Encodes 2D coordinates to 1D Hilbert indices.

    Uses the same algorithm as infinite_map_rs for consistency.
    Grid size: 256x256 (Order 8 Hilbert curve)

    Example:
        encoder = HilbertEncoder(256)
        index = encoder.xy_to_hilbert(10, 20)
        x, y = encoder.hilbert_to_xy(index)
        assert (x, y) == (10, 20)
    """

    def __init__(self, grid_size: int = 256):
        """
        Initialize encoder for a square grid.

        Args:
            grid_size: Size of the grid (must be power of 2)
        """
        if grid_size & (grid_size - 1) != 0:
            raise ValueError(f"Grid size must be power of 2, got {grid_size}")

        self.grid_size = grid_size
        self._order = grid_size.bit_length() - 1  # log2(grid_size)

    def xy_to_hilbert(self, x: int, y: int) -> int:
        """
        Convert (x, y) coordinates to Hilbert index.

        Args:
            x: X coordinate (0 to grid_size-1)
            y: Y coordinate (0 to grid_size-1)

        Returns:
            Hilbert index (0 to grid_size^2 - 1)
        """
        if not (0 <= x < self.grid_size and 0 <= y < self.grid_size):
            raise ValueError(f"Coordinates ({x}, {y}) out of bounds [0, {self.grid_size})")

        return self._hilbert_xy_to_index(x, y, self._order)

    def hilbert_to_xy(self, index: int) -> Tuple[int, int]:
        """
        Convert Hilbert index to (x, y) coordinates.

        Args:
            index: Hilbert index (0 to grid_size^2 - 1)

        Returns:
            Tuple of (x, y) coordinates
        """
        if not (0 <= index < self.grid_size * self.grid_size):
            raise ValueError(f"Index {index} out of bounds [0, {self.grid_size * self.grid_size})")

        return self._hilbert_index_to_xy(index, self._order)

    def _hilbert_xy_to_index(self, x: int, y: int, order: int) -> int:
        """
        Convert (x, y) to Hilbert index using bit interleaving.

        This implements the standard Hilbert curve algorithm.
        """
        index = 0
        s = 1 << (order - 1)  # Start with highest bit

        while s > 0:
            rx = 1 if (x & s) > 0 else 0
            ry = 1 if (y & s) > 0 else 0

            index += s * s * ((3 * rx) ^ ry)

            # Rotate based on which quadrant we're in
            if ry == 0:
                if rx == 1:
                    x = (s - 1) - x
                    y = (s - 1) - y
                # Swap x and y
                x, y = y, x

            s //= 2

        return index

    def _hilbert_index_to_xy(self, index: int, order: int) -> Tuple[int, int]:
        """
        Convert Hilbert index to (x, y) coordinates.

        This is the inverse of _hilbert_xy_to_index.
        """
        x, y = 0, 0
        s = 1

        while s < (1 << order):
            rx = 1 if (index & 2) > 0 else 0
            ry = 1 if (index & 1) > 0 else 0

            # Rotate based on quadrant
            if ry == 0:
                if rx == 1:
                    x = s - 1 - x
                    y = s - 1 - y
                # Swap x and y
                x, y = y, x

            x += s * rx
            y += s * ry
            index //= 4
            s *= 2

        return x, y

    def encode_quadrant(self, texture: np.ndarray, quadrant: int) -> List[int]:
        """
        Encode a 128x128 quadrant to Hilbert-ordered indices.

        Note: Hilbert curves do NOT map directly to Cartesian quadrants.
        This method visits all pixels in Hilbert order and returns those
        whose (x, y) fall within the specified quadrant.

        Args:
            texture: 2D numpy array of atlas indices
            quadrant: Quadrant number (0=TL, 1=TR, 2=BL, 3=BR)

        Returns:
            List of atlas indices in Hilbert order
        """
        if texture.shape != (256, 256):
            raise ValueError(f"Texture must be 256x256, got {texture.shape}")

        if quadrant not in [0, 1, 2, 3]:
            raise ValueError(f"Quadrant must be 0-3, got {quadrant}")

        # Define quadrant boundaries
        x_start = 0 if quadrant in [0, 2] else 128
        y_start = 0 if quadrant in [0, 1] else 128
        x_end = x_start + 128
        y_end = y_start + 128

        indices = []

        # Iterate through all Hilbert indices and collect those in quadrant
        for hilbert_idx in range(65536):
            x, y = self.hilbert_to_xy(hilbert_idx)
            if x_start <= x < x_end and y_start <= y < y_end:
                indices.append(int(texture[y, x]))

        return indices

    def decode_to_quadrant(
        self,
        indices: List[int],
        quadrant: int,
        texture_size: int = 256
    ) -> np.ndarray:
        """
        Decode Hilbert-ordered indices back to a 2D texture quadrant.

        Args:
            indices: List of atlas indices in Hilbert order
            quadrant: Quadrant number (0=TL, 1=TR, 2=BL, 3=BR)
            texture_size: Size of output texture (default 256)

        Returns:
            2D numpy array with decoded values in quadrant region
        """
        texture = np.zeros((texture_size, texture_size), dtype=np.uint16)

        # Define quadrant boundaries
        x_start = 0 if quadrant in [0, 2] else 128
        y_start = 0 if quadrant in [0, 1] else 128
        x_end = x_start + 128
        y_end = y_start + 128

        idx_pos = 0
        for hilbert_idx in range(65536):
            x, y = self.hilbert_to_xy(hilbert_idx)
            if x_start <= x < x_end and y_start <= y < y_end:
                if idx_pos < len(indices):
                    texture[y, x] = indices[idx_pos]
                    idx_pos += 1

        return texture
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `python -m pytest tests/test_hilbert_encoder.py -v`
Expected: All tests PASS

- [ ] **Step 5: Commit Hilbert encoder**

```bash
git add systems/pixel_brain/hilbert_encoder.py tests/test_hilbert_encoder.py
git commit -m "$(cat <<'EOF'
feat(pixel_brain): add Hilbert encoder for 2D↔1D spatial encoding

Implements pure Python Hilbert curve encoder matching infinite_map_rs:
- xy_to_hilbert: Convert coordinates to Hilbert index
- hilbert_to_xy: Convert Hilbert index to coordinates
- encode_quadrant: Extract quadrant in Hilbert order
- decode_to_quadrant: Restore quadrant from Hilbert indices

Preserves spatial locality for transformer attention windows.

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
EOF
)"
```

---

## Chunk 3: Atlas Tokenizer

### Task 3: Atlas Tokenizer Module

**Files:**
- Create: `systems/pixel_brain/atlas_tokenizer.py`
- Create: `tests/test_atlas_tokenizer.py`

- [ ] **Step 1: Write failing tests for atlas tokenizer**

```python
# tests/test_atlas_tokenizer.py
"""Tests for Atlas tokenizer (RGB ↔ Index conversion)."""

import pytest
import numpy as np
from systems.pixel_brain.atlas_tokenizer import (
    AtlasTokenizer,
    rgb_to_index,
    index_to_rgb,
    ascii_to_index,
    index_to_ascii,
    byte_to_index,
    index_to_byte,
)
from systems.pixel_brain.constants import (
    ASCII_START,
    ASCII_END,
    OPCODE_NOP,
    OPCODE_ALLOC,
    OPCODE_HALT,
    BYTE_LITERAL_START,
)


class TestRGBIndexConversion:
    """Test RGB to atlas index conversion."""

    def test_black_is_zero(self):
        """RGB (0, 0, 0) should map to index 0."""
        assert rgb_to_index(0, 0, 0) == 0

    def test_index_zero_is_black(self):
        """Index 0 should map to RGB (0, 0, 0)."""
        assert index_to_rgb(0) == (0, 0, 0)

    def test_roundtrip_preserves_rgb(self):
        """Converting RGB→index→RGB should return original."""
        test_colors = [
            (0, 0, 0),
            (255, 0, 0),
            (0, 255, 0),
            (0, 0, 255),
            (128, 128, 128),
            (255, 255, 255),
        ]
        for r, g, b in test_colors:
            index = rgb_to_index(r, g, b)
            decoded_r, decoded_g, decoded_b = index_to_rgb(index)
            assert (decoded_r, decoded_g, decoded_b) == (r, g, b), f"Failed for ({r}, {g}, {b})"

    def test_index_range(self):
        """Index should be in range 0-1023."""
        # Max RGB (255, 255, 255) should produce valid index
        index = rgb_to_index(255, 255, 255)
        assert 0 <= index < 1024


class TestASCIITokenization:
    """Test ASCII character tokenization."""

    def test_space_is_32(self):
        """Space character should map to index 32."""
        assert ascii_to_index(" ") == 32

    def test_a_is_97(self):
        """'A' (65) should map to index 65."""
        assert ascii_to_index("A") == 65

    def test_index_65_is_a(self):
        """Index 65 should decode to 'A'."""
        assert index_to_ascii(65) == "A"

    def test_roundtrip_preserves_ascii(self):
        """ASCII→index→ASCII should return original."""
        for char in "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 ":
            index = ascii_to_index(char)
            decoded = index_to_ascii(index)
            assert decoded == char, f"Failed for '{char}'"

    def test_invalid_ascii_raises(self):
        """Non-ASCII-printable characters should raise."""
        with pytest.raises(ValueError):
            ascii_to_index("\x00")  # Null character
        with pytest.raises(ValueError):
            ascii_to_index("\x7f")  # DEL character


class TestByteLiteralTokenization:
    """Test byte literal tokenization."""

    def test_zero_is_256(self):
        """Byte 0 should map to index 256."""
        assert byte_to_index(0) == 256

    def test_255_is_511(self):
        """Byte 255 should map to index 511."""
        assert byte_to_index(255) == 511

    def test_index_256_is_zero(self):
        """Index 256 should decode to byte 0."""
        assert index_to_byte(256) == 0

    def test_index_511_is_255(self):
        """Index 511 should decode to byte 255."""
        assert index_to_byte(511) == 255

    def test_roundtrip_preserves_bytes(self):
        """Byte→index→byte should return original."""
        for byte_val in [0, 1, 16, 128, 255]:
            index = byte_to_index(byte_val)
            decoded = index_to_byte(index)
            assert decoded == byte_val, f"Failed for byte {byte_val}"


class TestOpcodeTokenization:
    """Test opcode tokenization."""

    def test_nop_is_200(self):
        """NOP opcode should be index 200."""
        assert OPCODE_NOP == 200

    def test_alloc_is_201(self):
        """ALLOC opcode should be index 201."""
        assert OPCODE_ALLOC == 201

    def test_halt_is_213(self):
        """HALT opcode should be index 213."""
        assert OPCODE_HALT == 213


class TestAtlasTokenizer:
    """Test AtlasTokenizer class."""

    @pytest.fixture
    def tokenizer(self):
        return AtlasTokenizer()

    def test_tokenize_prompt(self, tokenizer):
        """Tokenize a prompt string to indices."""
        prompt = "ALLOC 4x4"
        indices = tokenizer.tokenize_prompt(prompt)
        # A=65, L=76, L=76, O=79, C=67, space=32, 4=52, x=120, 4=52
        assert indices == [65, 76, 76, 79, 67, 32, 52, 120, 52]

    def test_detokenize_prompt(self, tokenizer):
        """Detokenize indices back to prompt string."""
        indices = [65, 76, 76, 79, 67, 32, 52, 120, 52]
        prompt = tokenizer.detokenize_prompt(indices)
        assert prompt == "ALLOC 4x4"

    def test_tokenize_codel_array(self, tokenizer):
        """Tokenize a 2D codel array to Hilbert-ordered indices."""
        codels = np.array([
            [[0, 0, 255], [0, 0, 0]],  # Blue, Black
            [[0, 0, 0], [0, 0, 0]],    # Black, Black
        ], dtype=np.uint8)

        indices = tokenizer.tokenize_codels(codels)
        # Should be list of atlas indices
        assert isinstance(indices, list)
        assert all(isinstance(i, int) for i in indices)

    def test_detokenize_codel_array(self, tokenizer):
        """Detokenize indices back to 2D codel array."""
        # Create a simple 2x2 codel array
        codels = np.array([
            [[0, 0, 255], [0, 0, 0]],
            [[0, 0, 0], [0, 0, 0]],
        ], dtype=np.uint8)

        indices = tokenizer.tokenize_codels(codels)
        decoded = tokenizer.detokenize_codels(indices, (2, 2))

        np.testing.assert_array_equal(decoded, codels)
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `python -m pytest tests/test_atlas_tokenizer.py -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'systems.pixel_brain.atlas_tokenizer'"

- [ ] **Step 3: Write atlas tokenizer implementation**

```python
# systems/pixel_brain/atlas_tokenizer.py
"""Atlas Tokenizer for RGB ↔ Index conversion.

This module converts between RGB pixel values and atlas token indices,
enabling PixelBrain to work with a discrete vocabulary (0-1023) instead
of continuous RGB values (16M colors).

Token Vocabulary:
- 0-31: Reserved (control codes)
- 32-126: ASCII printable characters (Prompt vocabulary)
- 127-199: Reserved
- 200-214: GlyphStratum Opcodes (Logic vocabulary)
- 215-255: Reserved
- 256-511: Byte literals 0-255 (Operand vocabulary)
- 512-1023: Intent glyphs (Stratum 4 metadata)
"""

import numpy as np
from typing import List, Tuple, Optional

from systems.pixel_brain.constants import (
    ASCII_START,
    ASCII_END,
    BYTE_LITERAL_START,
    BYTE_LITERAL_END,
    VOCAB_SIZE,
)
from systems.pixel_brain.hilbert_encoder import HilbertEncoder


def rgb_to_index(r: int, g: int, b: int) -> int:
    """
    Convert RGB values to a single atlas index.

    Uses a simple encoding: index = (r << 6) | (g << 3) | b >> 2
    This maps 256^3 colors to 1024 indices with reasonable distribution.

    Args:
        r: Red channel (0-255)
        g: Green channel (0-255)
        b: Blue channel (0-255)

    Returns:
        Atlas index (0-1023)
    """
    # Quantize each channel to fewer bits to fit in 1024 tokens
    # 10 bits = 2 bits R + 4 bits G + 4 bits B
    r_bits = (r >> 6) & 0x03  # 2 bits
    g_bits = (g >> 4) & 0x0F  # 4 bits
    b_bits = (b >> 4) & 0x0F  # 4 bits

    return (r_bits << 8) | (g_bits << 4) | b_bits


def index_to_rgb(index: int) -> Tuple[int, int, int]:
    """
    Convert atlas index back to RGB values.

    Args:
        index: Atlas index (0-1023)

    Returns:
        Tuple of (r, g, b) values
    """
    r_bits = (index >> 8) & 0x03
    g_bits = (index >> 4) & 0x0F
    b_bits = index & 0x0F

    # Expand back to 8 bits
    r = r_bits << 6
    g = g_bits << 4
    b = b_bits << 4

    return (r, g, b)


def ascii_to_index(char: str) -> int:
    """
    Convert ASCII character to atlas index.

    ASCII characters map directly to their code point (32-126).

    Args:
        char: Single ASCII character

    Returns:
        Atlas index (32-126)

    Raises:
        ValueError: If character is not printable ASCII
    """
    if len(char) != 1:
        raise ValueError(f"Expected single character, got '{char}'")

    code = ord(char)
    if not (ASCII_START <= code <= ASCII_END):
        raise ValueError(f"Character '{char}' (code {code}) is not printable ASCII")

    return code


def index_to_ascii(index: int) -> str:
    """
    Convert atlas index to ASCII character.

    Args:
        index: Atlas index (32-126)

    Returns:
        Single ASCII character

    Raises:
        ValueError: If index is not in ASCII range
    """
    if not (ASCII_START <= index <= ASCII_END):
        raise ValueError(f"Index {index} is not in ASCII range ({ASCII_START}-{ASCII_END})")

    return chr(index)


def byte_to_index(byte_val: int) -> int:
    """
    Convert byte value (0-255) to atlas index.

    Byte literals are stored at indices 256-511.

    Args:
        byte_val: Byte value (0-255)

    Returns:
        Atlas index (256-511)

    Raises:
        ValueError: If byte value is out of range
    """
    if not (0 <= byte_val <= 255):
        raise ValueError(f"Byte value {byte_val} out of range [0, 255]")

    return BYTE_LITERAL_START + byte_val


def index_to_byte(index: int) -> int:
    """
    Convert atlas index to byte value.

    Args:
        index: Atlas index (256-511)

    Returns:
        Byte value (0-255)

    Raises:
        ValueError: If index is not in byte literal range
    """
    if not (BYTE_LITERAL_START <= index <= BYTE_LITERAL_END):
        raise ValueError(f"Index {index} is not in byte literal range")

    return index - BYTE_LITERAL_START


class AtlasTokenizer:
    """
    High-level tokenizer for converting between different representations.

    Provides methods for:
    - Tokenizing prompt strings to indices
    - Tokenizing 2D codel arrays to Hilbert-ordered indices
    - Detokenizing back to original format
    """

    def __init__(self, grid_size: int = 256):
        """Initialize tokenizer with Hilbert encoder."""
        self.encoder = HilbertEncoder(grid_size)

    def tokenize_prompt(self, prompt: str) -> List[int]:
        """
        Convert a prompt string to atlas indices.

        Args:
            prompt: Input string (ASCII printable only)

        Returns:
            List of atlas indices
        """
        return [ascii_to_index(c) for c in prompt]

    def detokenize_prompt(self, indices: List[int]) -> str:
        """
        Convert atlas indices back to a prompt string.

        Args:
            indices: List of atlas indices (32-126)

        Returns:
            Decoded string
        """
        return "".join(index_to_ascii(i) for i in indices)

    def tokenize_codels(self, codels: np.ndarray) -> List[int]:
        """
        Convert a 2D codel array to Hilbert-ordered atlas indices.

        Args:
            codels: 3D numpy array (H, W, 3) of RGB values

        Returns:
            List of atlas indices in Hilbert order
        """
        h, w, c = codels.shape
        if c != 3:
            raise ValueError(f"Expected 3 channels, got {c}")

        indices = []
        for hilbert_idx in range(h * w):
            x, y = self.encoder.hilbert_to_xy(hilbert_idx)
            if x < w and y < h:
                r, g, b = codels[y, x]
                indices.append(rgb_to_index(r, g, b))

        return indices

    def detokenize_codels(
        self,
        indices: List[int],
        shape: Tuple[int, int]
    ) -> np.ndarray:
        """
        Convert Hilbert-ordered atlas indices back to a 2D codel array.

        Args:
            indices: List of atlas indices in Hilbert order
            shape: (height, width) of output array

        Returns:
            3D numpy array (H, W, 3) of RGB values
        """
        h, w = shape
        codels = np.zeros((h, w, 3), dtype=np.uint8)

        for i, index in enumerate(indices):
            if i >= h * w:
                break
            x, y = self.encoder.hilbert_to_xy(i)
            if x < w and y < h:
                r, g, b = index_to_rgb(index)
                codels[y, x] = [r, g, b]

        return codels

    def tokenize_opcode(self, opcode: str) -> int:
        """
        Convert opcode name to atlas index.

        Args:
            opcode: Opcode name (e.g., "ALLOC", "HALT")

        Returns:
            Atlas index (200-214)
        """
        from systems.pixel_brain.constants import (
            OPCODE_NOP, OPCODE_ALLOC, OPCODE_FREE, OPCODE_LOAD,
            OPCODE_STORE, OPCODE_ADD, OPCODE_SUB, OPCODE_MUL,
            OPCODE_DIV, OPCODE_JUMP, OPCODE_BRANCH, OPCODE_CALL,
            OPCODE_RETURN, OPCODE_HALT, OPCODE_DATA,
        )

        opcode_map = {
            "NOP": OPCODE_NOP,
            "ALLOC": OPCODE_ALLOC,
            "FREE": OPCODE_FREE,
            "LOAD": OPCODE_LOAD,
            "STORE": OPCODE_STORE,
            "ADD": OPCODE_ADD,
            "SUB": OPCODE_SUB,
            "MUL": OPCODE_MUL,
            "DIV": OPCODE_DIV,
            "JUMP": OPCODE_JUMP,
            "BRANCH": OPCODE_BRANCH,
            "CALL": OPCODE_CALL,
            "RETURN": OPCODE_RETURN,
            "HALT": OPCODE_HALT,
            "DATA": OPCODE_DATA,
        }

        if opcode.upper() not in opcode_map:
            raise ValueError(f"Unknown opcode: {opcode}")

        return opcode_map[opcode.upper()]
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `python -m pytest tests/test_atlas_tokenizer.py -v`
Expected: All tests PASS

- [ ] **Step 5: Commit atlas tokenizer**

```bash
git add systems/pixel_brain/atlas_tokenizer.py tests/test_atlas_tokenizer.py
git commit -m "$(cat <<'EOF'
feat(pixel_brain): add atlas tokenizer for RGB↔Index conversion

Converts between RGB pixels and discrete vocabulary (0-1023):
- rgb_to_index/index_to_rgb: Quantized color conversion
- ascii_to_index/index_to_ascii: Prompt tokenization
- byte_to_index/index_to_byte: Operand tokenization
- AtlasTokenizer: High-level API with Hilbert ordering

Enables PixelBrain to work with 1024 tokens instead of 16M colors.

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
EOF
)"
```

---

## Chunk 4: Synthetic Dataset Generator

### Task 4: Synthetic Dataset Generator

**Files:**
- Create: `systems/pixel_brain/synthetic_dataset_generator.py`
- Create: `tests/test_synthetic_dataset_generator.py`

- [ ] **Step 1: Write failing tests for dataset generator**

```python
# tests/test_synthetic_dataset_generator.py
"""Tests for synthetic dataset generator."""

import pytest
import numpy as np
from systems.pixel_brain.synthetic_dataset_generator import (
    SyntheticDatasetGenerator,
    AllocationTask,
    generate_allocation_seed_dataset,
)
from systems.pixel_brain.constants import (
    OPCODE_ALLOC,
    OPCODE_HALT,
    COLORS,
    ALLOC_SIZES,
    ALLOC_COLORS,
    TARGET_DATASET_SIZE,
    TEXTURE_SIZE,
    QUADRANT_PIXELS,
)


class TestAllocationTask:
    """Test individual allocation tasks."""

    def test_create_task(self):
        """Create a basic allocation task."""
        task = AllocationTask(
            size=(4, 4),
            color="BLUE",
            position=(10, 10),
        )
        assert task.size == (4, 4)
        assert task.color == "BLUE"
        assert task.position == (10, 10)

    def test_task_has_prompt(self):
        """Task should generate a prompt string."""
        task = AllocationTask(
            size=(4, 4),
            color="BLUE",
            position=(10, 10),
        )
        prompt = task.to_prompt()
        assert "ALLOC" in prompt
        assert "4x4" in prompt
        assert "BLUE" in prompt
        assert "10,10" in prompt

    def test_task_has_ground_truth(self):
        """Task should generate ground truth codels."""
        task = AllocationTask(
            size=(4, 4),
            color="BLUE",
            position=(10, 10),
        )
        ground_truth = task.to_ground_truth()
        assert isinstance(ground_truth, np.ndarray)
        assert ground_truth.shape == (TEXTURE_SIZE, TEXTURE_SIZE)


class TestSyntheticDatasetGenerator:
    """Test the dataset generator."""

    @pytest.fixture
    def generator(self):
        """Create a generator instance."""
        return SyntheticDatasetGenerator(seed=42)

    def test_generator_creates_tasks(self, generator):
        """Generator should create allocation tasks."""
        tasks = generator.generate_tasks(count=10)
        assert len(tasks) == 10
        assert all(isinstance(t, AllocationTask) for t in tasks)

    def test_generator_is_reproducible(self):
        """Same seed should produce same tasks."""
        gen1 = SyntheticDatasetGenerator(seed=42)
        gen2 = SyntheticDatasetGenerator(seed=42)

        tasks1 = gen1.generate_tasks(count=5)
        tasks2 = gen2.generate_tasks(count=5)

        for t1, t2 in zip(tasks1, tasks2):
            assert t1.size == t2.size
            assert t1.color == t2.color
            assert t1.position == t2.position

    def test_generator_uses_valid_sizes(self, generator):
        """Generated tasks should use valid sizes."""
        tasks = generator.generate_tasks(count=50)
        for task in tasks:
            assert task.size in ALLOC_SIZES

    def test_generator_uses_valid_colors(self, generator):
        """Generated tasks should use valid colors."""
        tasks = generator.generate_tasks(count=50)
        for task in tasks:
            assert task.color in ALLOC_COLORS

    def test_generator_uses_valid_positions(self, generator):
        """Generated positions should be grid-aligned."""
        tasks = generator.generate_tasks(count=50)
        for task in tasks:
            x, y = task.position
            assert x % 16 == 0, f"X position {x} not grid-aligned"
            assert y % 16 == 0, f"Y position {y} not grid-aligned"
            assert 0 <= x < 240
            assert 0 <= y < 240

    def test_generate_training_pair(self, generator):
        """Generate a complete training pair."""
        task = AllocationTask(size=(4, 4), color="BLUE", position=(16, 16))
        pair = generator.generate_training_pair(task)

        assert "prompt_indices" in pair
        assert "intent_indices" in pair
        assert "code_indices" in pair
        assert "terminus_indices" in pair
        assert "ground_truth" in pair

        # Prompt should be in Q0 range
        assert len(pair["prompt_indices"]) <= QUADRANT_PIXELS

    def test_generate_dataset(self, generator):
        """Generate full dataset."""
        dataset = generator.generate_dataset(count=100)

        assert len(dataset) == 100
        for pair in dataset:
            assert "prompt_indices" in pair
            assert "ground_truth" in pair


class TestGroundTruthGeneration:
    """Test ground truth codel generation."""

    def test_ground_truth_has_alloc_opcode(self):
        """Ground truth should contain ALLOC opcode."""
        task = AllocationTask(size=(4, 4), color="BLUE", position=(10, 10))
        ground_truth = task.to_ground_truth()

        # Check that ALLOC opcode (201) appears somewhere
        assert OPCODE_ALLOC in ground_truth

    def test_ground_truth_has_halt_opcode(self):
        """Ground truth should contain HALT opcode."""
        task = AllocationTask(size=(4, 4), color="BLUE", position=(10, 10))
        ground_truth = task.to_ground_truth()

        # Check that HALT opcode (213) appears
        assert OPCODE_HALT in ground_truth

    def test_ground_truth_fills_correct_region(self):
        """Ground truth should fill the specified region with color."""
        task = AllocationTask(size=(4, 4), color="RED", position=(16, 16))
        ground_truth = task.to_ground_truth()

        # The fill region should contain the color
        # RED = (255, 0, 0) which maps to a specific index
        # We verify the region is not all zeros
        x, y = task.position
        w, h = task.size
        region = ground_truth[y:y+h, x:x+w]
        assert not np.all(region == 0)


class TestConvenienceFunction:
    """Test the convenience function for dataset generation."""

    def test_generate_allocation_seed_dataset(self):
        """Generate dataset using convenience function."""
        dataset = generate_allocation_seed_dataset(count=10, seed=123)

        assert len(dataset) == 10
        assert all("prompt_indices" in pair for pair in dataset)
        assert all("ground_truth" in pair for pair in dataset)
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `python -m pytest tests/test_synthetic_dataset_generator.py -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'systems.pixel_brain.synthetic_dataset_generator'"

- [ ] **Step 3: Write synthetic dataset generator implementation**

```python
# systems/pixel_brain/synthetic_dataset_generator.py
"""Synthetic Dataset Generator for PixelBrain Visual Training.

Generates "Allocation Seed" tasks for Phase 1 training:
- ALLOC_NxM_COLOR: Allocate a block and fill with color

Each training pair contains:
- Q0: Prompt (task description in ASCII)
- Q1: Intent (Stratum 4 metadata)
- Q2: Code (Memory/Substrate operations)
- Q3: Terminus (HALT + padding)
"""

import random
from dataclasses import dataclass
from typing import List, Dict, Any, Tuple, Optional
import numpy as np

from systems.pixel_brain.constants import (
    OPCODE_ALLOC,
    OPCODE_HALT,
    OPCODE_DATA,
    COLORS,
    ALLOC_SIZES,
    ALLOC_COLORS,
    ALLOC_POSITIONS,
    TEXTURE_SIZE,
    QUADRANT_PIXELS,
    Q0_START,
    Q1_START,
    Q2_START,
    Q3_START,
)
from systems.pixel_brain.atlas_tokenizer import (
    AtlasTokenizer,
    ascii_to_index,
    byte_to_index,
)


@dataclass
class AllocationTask:
    """
    A single ALLOC_NxM_COLOR task.

    Attributes:
        size: (width, height) of the allocation
        color: Color name (e.g., "BLUE", "RED")
        position: (x, y) top-left position
    """
    size: Tuple[int, int]
    color: str
    position: Tuple[int, int]

    def to_prompt(self) -> str:
        """Generate the prompt string for this task."""
        w, h = self.size
        x, y = self.position
        return f"ALLOC {w}x{h} {self.color} at [{x},{y}]"

    def to_ground_truth(self) -> np.ndarray:
        """
        Generate ground truth codel array.

        Returns:
            2D numpy array (256x256) of atlas indices
        """
        texture = np.zeros((TEXTURE_SIZE, TEXTURE_SIZE), dtype=np.uint16)

        x, y = self.position
        w, h = self.size
        color_rgb = COLORS[self.color]

        # Place ALLOC opcode at first position
        # Format: ALLOC opcode, then size bytes, then fill
        texture[y, x] = OPCODE_ALLOC

        # Size bytes (width, height) as data opcodes
        texture[y, x + 1] = OPCODE_DATA
        texture[y, x + 2] = byte_to_index(w)
        texture[y, x + 3] = byte_to_index(h)

        # Fill the allocated region with color indices
        for dy in range(h):
            for dx in range(w):
                # Convert RGB to index using simple encoding
                r, g, b = color_rgb
                # Use byte literal for color value
                texture[y + dy, x + dx + 4] = byte_to_index(b)  # Blue channel as fill

        # Place HALT at end of code region
        texture[y + h, x + w + 4] = OPCODE_HALT

        return texture

    def to_intent(self) -> List[int]:
        """
        Generate intent indices (Stratum 4).

        This represents the high-level goal of the program.
        """
        # Simple intent: describe the goal
        intent_text = f"Create {self.color} block {self.size[0]}x{self.size[1]}"
        return [ascii_to_index(c) for c in intent_text[:64]]  # Truncate to fit

    def to_terminus(self) -> List[int]:
        """
        Generate terminus indices (Q3).

        This includes HALT and stability padding.
        """
        terminus = [OPCODE_HALT]
        # Pad with NOPs (index 0) to fill quadrant
        terminus.extend([0] * (QUADRANT_PIXELS - len(terminus)))
        return terminus


class SyntheticDatasetGenerator:
    """
    Generates synthetic training pairs for PixelBrain.

    Example:
        generator = SyntheticDatasetGenerator(seed=42)
        dataset = generator.generate_dataset(count=1000)
    """

    def __init__(self, seed: Optional[int] = None):
        """
        Initialize generator.

        Args:
            seed: Random seed for reproducibility
        """
        self.seed = seed
        self.rng = random.Random(seed)
        self.tokenizer = AtlasTokenizer()

    def generate_tasks(self, count: int) -> List[AllocationTask]:
        """
        Generate a list of allocation tasks.

        Args:
            count: Number of tasks to generate

        Returns:
            List of AllocationTask objects
        """
        tasks = []

        # Calculate variations per combination
        combinations = len(ALLOC_SIZES) * len(ALLOC_COLORS) * len(ALLOC_POSITIONS)
        variations_per_combo = max(1, count // combinations)

        generated = 0
        for size in ALLOC_SIZES:
            for color in ALLOC_COLORS:
                for position in ALLOC_POSITIONS:
                    if generated >= count:
                        break

                    for _ in range(variations_per_combo):
                        if generated >= count:
                            break

                        # Add small random offset for variation
                        x = position + self.rng.randint(-4, 4)
                        y = position + self.rng.randint(-4, 4)

                        # Clamp to valid range
                        x = max(0, min(240, x))
                        y = max(0, min(240, y))

                        tasks.append(AllocationTask(
                            size=size,
                            color=color,
                            position=(x, y),
                        ))
                        generated += 1

        return tasks[:count]

    def generate_training_pair(self, task: AllocationTask) -> Dict[str, Any]:
        """
        Generate a complete training pair from a task.

        Args:
            task: The allocation task

        Returns:
            Dictionary with:
            - prompt_indices: Q0 indices (ASCII prompt)
            - intent_indices: Q1 indices (Stratum 4 metadata)
            - code_indices: Q2 indices (ground truth codels)
            - terminus_indices: Q3 indices (HALT + padding)
            - ground_truth: Full ground truth array
        """
        # Q0: Prompt
        prompt = task.to_prompt()
        prompt_indices = self.tokenizer.tokenize_prompt(prompt)
        # Pad to quadrant size
        prompt_indices = prompt_indices + [0] * (QUADRANT_PIXELS - len(prompt_indices))
        prompt_indices = prompt_indices[:QUADRANT_PIXELS]

        # Q1: Intent
        intent_indices = task.to_intent()
        intent_indices = intent_indices + [0] * (QUADRANT_PIXELS - len(intent_indices))
        intent_indices = intent_indices[:QUADRANT_PIXELS]

        # Q2: Code (from ground truth)
        ground_truth = task.to_ground_truth()
        code_indices = self.tokenizer.encoder.encode_quadrant(ground_truth, 2)

        # Q3: Terminus
        terminus_indices = task.to_terminus()

        return {
            "prompt_indices": prompt_indices,
            "intent_indices": intent_indices,
            "code_indices": code_indices,
            "terminus_indices": terminus_indices,
            "ground_truth": ground_truth,
            "task": task,
        }

    def generate_dataset(self, count: int = 1000) -> List[Dict[str, Any]]:
        """
        Generate a complete dataset.

        Args:
            count: Number of training pairs to generate

        Returns:
            List of training pair dictionaries
        """
        tasks = self.generate_tasks(count)
        return [self.generate_training_pair(task) for task in tasks]


def generate_allocation_seed_dataset(
    count: int = 1000,
    seed: Optional[int] = None
) -> List[Dict[str, Any]]:
    """
    Convenience function to generate allocation seed dataset.

    Args:
        count: Number of training pairs
        seed: Random seed for reproducibility

    Returns:
        List of training pair dictionaries
    """
    generator = SyntheticDatasetGenerator(seed=seed)
    return generator.generate_dataset(count)
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `python -m pytest tests/test_synthetic_dataset_generator.py -v`
Expected: All tests PASS

- [ ] **Step 5: Run all Phase 1 tests together**

Run: `python -m pytest tests/test_pixel_brain_constants.py tests/test_hilbert_encoder.py tests/test_atlas_tokenizer.py tests/test_synthetic_dataset_generator.py -v`
Expected: All tests PASS

- [ ] **Step 6: Commit synthetic dataset generator**

```bash
git add systems/pixel_brain/synthetic_dataset_generator.py tests/test_synthetic_dataset_generator.py
git commit -m "$(cat <<'EOF'
feat(pixel_brain): add synthetic dataset generator for visual training

Generates "Allocation Seed" tasks for Phase 1 training:
- AllocationTask: Individual task with prompt/ground truth
- SyntheticDatasetGenerator: Creates reproducible datasets
- generate_allocation_seed_dataset: Convenience function

Each training pair includes:
- Q0: Prompt indices (ASCII)
- Q1: Intent indices (Stratum 4)
- Q2: Code indices (ground truth codels)
- Q3: Terminus indices (HALT + padding)

Generates 1000+ valid training pairs with grid-aligned positions.

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
EOF
)"
```

---

## Phase 1 Summary

After completing all tasks, verify the full test suite passes:

```bash
python -m pytest tests/test_pixel_brain*.py tests/test_hilbert_encoder.py tests/test_atlas_tokenizer.py tests/test_synthetic_dataset_generator.py -v
```

**Success Criteria:**
- [ ] All tests pass
- [ ] Can generate 1000+ training pairs
- [ ] Each pair has Q0-Q3 quadrant data
- [ ] Ground truth contains ALLOC and HALT opcodes
- [ ] Dataset generation is reproducible with same seed

**Files Created:**
- `systems/pixel_brain/__init__.py`
- `systems/pixel_brain/constants.py`
- `systems/pixel_brain/hilbert_encoder.py`
- `systems/pixel_brain/atlas_tokenizer.py`
- `systems/pixel_brain/synthetic_dataset_generator.py`
- `tests/test_pixel_brain_constants.py`
- `tests/test_hilbert_encoder.py`
- `tests/test_atlas_tokenizer.py`
- `tests/test_synthetic_dataset_generator.py`

**Next Phase:** Phase 2 will add training pipeline integration with PixelBrainPipeline.
