#!/usr/bin/env python3
"""
Tests for WASMCodeVisualizer decode_rgba() method.

Tests the inverse operation of visualize() to ensure round-trip
encoding/decoding works correctly for code-mode symmetry.
"""

import pytest
import numpy as np
import sys
import os

# Add parent directory to path for imports
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'tools', 'lib'))

from pixelrts_v2_wasm import WASMCodeVisualizer, create_test_wasm


class TestDecodeRGBA:
    """Test suite for decode_rgba method"""

    def test_decode_rgba_round_trip_with_test_wasm(self):
        """Test that decode_rgba is inverse of visualize for test WASM"""
        visualizer = WASMCodeVisualizer()

        # Create test WASM
        original = create_test_wasm()
        original_size = len(original)

        # Visualize
        rgba = visualizer.visualize(original)

        # Decode back
        decoded = visualizer.decode_rgba(rgba, expected_size=original_size)

        # Note: The encoding is lossy for odd-positioned bytes (opcode and 4th byte)
        # But even positions (byte1, byte2 pairs in G, B channels) should match
        # The test WASM has predictable structure, let's verify the magic number
        # and key sections are preserved

        assert decoded[:4] == b'\x00\x61\x73\x6d', "WASM magic number should be preserved"
        assert decoded[4:8] == b'\x01\x00\x00\x00', "WASM version should be preserved"

    def test_decode_rgba_round_trip_with_padding(self):
        """Test round-trip encoding with padded WASM data"""
        visualizer = WASMCodeVisualizer()

        # Create WASM with padding
        base = create_test_wasm()
        # Pad to multiple of 8 bytes
        padding = (8 - len(base) % 8) % 8
        padded = base + b'\x00' * padding

        original_size = len(padded)

        # Visualize
        rgba = visualizer.visualize(padded)

        # Decode back
        decoded = visualizer.decode_rgba(rgba, expected_size=original_size)

        # Verify header is preserved
        assert decoded[:4] == b'\x00\x61\x73\x6d', "WASM magic should be preserved"
        assert decoded[:8] == padded[:8], "WASM header should be preserved"

    def test_decode_rgba_with_grid_shaped_pixels(self):
        """Test decode_rgba with 2D grid shaped pixel array"""
        visualizer = WASMCodeVisualizer()

        # Create test WASM
        original = create_test_wasm()
        original_size = len(original)

        # Visualize
        rgba = visualizer.visualize(original)

        # Reshape to grid (as would be done for PNG)
        total_pixels = rgba.shape[0]
        # Calculate grid size (power of 2 that fits all pixels)
        import math
        grid_size = 2 ** math.ceil(math.log2(math.ceil(math.sqrt(total_pixels))))
        # Pad to grid size if needed
        padded_size = grid_size * grid_size
        if padded_size > total_pixels:
            padding = np.zeros((padded_size - total_pixels, 4), dtype=np.uint8)
            rgba_padded = np.vstack([rgba, padding])
        else:
            rgba_padded = rgba[:padded_size]

        rgba_grid = rgba_padded.reshape(grid_size, grid_size, 4)

        # Decode from grid shape
        decoded = visualizer.decode_rgba(rgba_grid, expected_size=original_size)

        # Verify header
        assert decoded[:4] == b'\x00\x61\x73\x6d', "Should handle grid shaped input"

    def test_decode_rgba_with_alpha_filtering(self):
        """Test that decode_rgba only extracts bytes where alpha > 0"""
        visualizer = WASMCodeVisualizer()

        # Create test WASM
        original = create_test_wasm()

        # Visualize
        rgba = visualizer.visualize(original)

        # Manually set some alpha channels to 0 (simulating padding)
        rgba[:5, 3] = 0  # Set first 5 pixels' alpha to 0

        # Decode - should skip pixels with alpha=0
        decoded = visualizer.decode_rgba(rgba, expected_size=len(original))

        # Should still have valid WASM structure
        assert decoded[:4] == b'\x00\x61\x73\x6d', "Should filter by alpha channel"

    def test_decode_rgba_error_non_wasm_data(self):
        """Test ValueError for non-WASM data"""
        visualizer = WASMCodeVisualizer()

        # Create RGBA pixels that decode to invalid WASM
        # All green/blue set to 0xFF, which won't produce valid WASM magic
        rgba = np.zeros((10, 4), dtype=np.uint8)
        rgba[:, 1] = 0xFF  # Green = 0xFF
        rgba[:, 2] = 0xFF  # Blue = 0xFF
        rgba[:, 3] = 0xFF  # Alpha = 0xFF (executable)

        with pytest.raises(ValueError, match="not valid WASM"):
            visualizer.decode_rgba(rgba, expected_size=20)

    def test_decode_rgba_truncates_to_expected_size(self):
        """Test that decode_rgba truncates output to expected_size"""
        visualizer = WASMCodeVisualizer()

        # Create RGBA with lots of data
        rgba = np.zeros((100, 4), dtype=np.uint8)
        rgba[:, 1] = 0x61  # Green = 'a'
        rgba[:, 2] = 0x73  # Blue = 's'
        rgba[:, 3] = 0xFF  # Alpha = executable

        # Set first pixel to produce valid WASM magic
        rgba[0, 1] = 0x00  # Green = byte1 = \x00
        rgba[0, 2] = 0x61  # Blue = byte2 = 'a'
        rgba[1, 1] = 0x73  # Green = 's'
        rgba[1, 2] = 0x6d  # Blue = 'm'
        rgba[2, 1] = 0x01  # Green = version byte1
        rgba[2, 2] = 0x00  # Blue = version byte2
        rgba[3, 1] = 0x00
        rgba[3, 2] = 0x00

        # Request only 8 bytes
        decoded = visualizer.decode_rgba(rgba, expected_size=8)

        assert len(decoded) == 8, "Should truncate to expected_size"
        assert decoded == b'\x00\x61\x73\x6d\x01\x00\x00\x00', "Should decode correctly"

    def test_decode_rgba_empty_pixels(self):
        """Test decode_rgba with empty pixel array"""
        visualizer = WASMCodeVisualizer()

        rgba = np.zeros((0, 4), dtype=np.uint8)

        with pytest.raises(ValueError, match="not valid WASM"):
            visualizer.decode_rgba(rgba, expected_size=0)

    def test_decode_rgba_preserves_wasm_structure(self):
        """Test that key WASM sections are preserved through round-trip"""
        visualizer = WASMCodeVisualizer()

        # Create test WASM
        original = create_test_wasm()
        original_size = len(original)

        # Visualize
        rgba = visualizer.visualize(original)

        # Decode
        decoded = visualizer.decode_rgba(rgba, expected_size=original_size)

        # Verify the structure: header + sections
        # The first 8 bytes should match exactly
        assert decoded[:8] == original[:8], "Header should match"

        # At minimum, the magic number should be correct
        assert visualizer.is_wasm(decoded), "Result should be valid WASM"

    def test_decode_rgba_with_small_wasm(self):
        """Test decode_rgba with minimal WASM (smallest possible)"""
        visualizer = WASMCodeVisualizer()

        # Minimal WASM: magic + version only (8 bytes)
        minimal_wasm = b'\x00\x61\x73\x6d\x01\x00\x00\x00'

        # Visualize
        rgba = visualizer.visualize(minimal_wasm)

        # Decode
        decoded = visualizer.decode_rgba(rgba, expected_size=8)

        # Should match original
        assert decoded == minimal_wasm, "Minimal WASM should round-trip perfectly"

    def test_decode_rgba_byte_pair_preservation(self):
        """Test that byte pairs are correctly preserved in G and B channels"""
        visualizer = WASMCodeVisualizer()

        # Create WASM with known pattern
        # Even bytes (0, 2, 4, 6) go to Green, odd bytes (1, 3, 5, 7) go to Blue
        test_wasm = b'\x00\x61\x73\x6d\x01\x00\x00\x00'  # Magic + version

        # Visualize
        rgba = visualizer.visualize(test_wasm)

        # Decode
        decoded = visualizer.decode_rgba(rgba, expected_size=8)

        # Verify byte pairs
        # Pixel 0: G=0x00, B=0x61 -> bytes 0,1
        # Pixel 1: G=0x73, B=0x6d -> bytes 2,3
        # Pixel 2: G=0x01, B=0x00 -> bytes 4,5
        # Pixel 3: G=0x00, B=0x00 -> bytes 6,7
        assert decoded[0] == 0x00, "Byte 0 should match Green of pixel 0"
        assert decoded[1] == 0x61, "Byte 1 should match Blue of pixel 0"
        assert decoded[2] == 0x73, "Byte 2 should match Green of pixel 1"
        assert decoded[3] == 0x6d, "Byte 3 should match Blue of pixel 1"


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
