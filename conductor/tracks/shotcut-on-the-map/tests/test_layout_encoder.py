"""
Tests for PixelRTS v3 Layout Encoder.

Tests encoding of layout detection results as geometric
RGBA textures that can be executed by the GeometricVM.
"""
import pytest
import sys
import os
import numpy as np
import tempfile

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


class TestLayoutEncoderImport:
    """Tests for module import and basic structure."""

    def test_import_layout_encoder(self):
        """LayoutEncoder should be importable."""
        from layout_encoder import LayoutEncoder
        assert LayoutEncoder is not None

    def test_layout_encoder_instantiation(self):
        """LayoutEncoder should instantiate without errors."""
        from layout_encoder import LayoutEncoder
        encoder = LayoutEncoder()
        assert encoder is not None


class TestLayoutEncoding:
    """Tests for layout-to-RGBA encoding."""

    def test_encode_empty_layout(self):
        """Empty layout should produce minimal image."""
        from layout_encoder import LayoutEncoder
        from layout_inferencer import LayoutResult

        encoder = LayoutEncoder()
        result = LayoutResult()

        img = encoder.encode(result)
        assert img is not None
        assert img.size[0] > 0
        assert img.size[1] > 0

    def test_encode_single_panel(self):
        """Single panel should produce one LDP instruction."""
        from layout_encoder import LayoutEncoder
        from layout_inferencer import LayoutResult

        encoder = LayoutEncoder()
        result = LayoutResult(
            panels=[{"bbox": [10, 20, 100, 80], "type": "panel"}]
        )

        img = encoder.encode(result)
        pixels = list(img.getdata())

        # First non-zero pixel should be LDP instruction
        # R=0x10 (LDP), G=0 (panel_id), B=10 (x), A=20 (y)
        ldp_found = False
        for p in pixels:
            if p[0] == 0x10:  # LDP opcode
                ldp_found = True
                break

        assert ldp_found, "Should find LDP instruction for panel"

    def test_encode_button(self):
        """Button should produce LDB instruction."""
        from layout_encoder import LayoutEncoder
        from layout_inferencer import LayoutResult

        encoder = LayoutEncoder()
        result = LayoutResult(
            buttons=[{"bbox": [5, 10, 50, 30], "type": "button"}]
        )

        img = encoder.encode(result)
        pixels = list(img.getdata())

        ldb_found = False
        for p in pixels:
            if p[0] == 0x11:  # LDB opcode
                ldb_found = True
                break

        assert ldb_found, "Should find LDB instruction for button"

    def test_encode_line(self):
        """Line should produce LDL instruction."""
        from layout_encoder import LayoutEncoder
        from layout_inferencer import LayoutResult

        encoder = LayoutEncoder()
        result = LayoutResult(
            lines=[((0, 50), (100, 50))]  # Horizontal line
        )

        img = encoder.encode(result)
        pixels = list(img.getdata())

        ldl_found = False
        for p in pixels:
            if p[0] == 0x12:  # LDL opcode
                ldl_found = True
                break

        assert ldl_found, "Should find LDL instruction for line"

    def test_encode_ends_with_halt(self):
        """Encoded layout should end with HALT instruction."""
        from layout_encoder import LayoutEncoder
        from layout_inferencer import LayoutResult

        encoder = LayoutEncoder()
        result = LayoutResult(
            panels=[{"bbox": [0, 0, 10, 10], "type": "panel"}]
        )

        img = encoder.encode(result)
        pixels = list(img.getdata())

        # Find last non-zero pixel
        halt_found = False
        for p in reversed(pixels):
            if p[0] != 0:
                halt_found = (p[0] == 0x07)  # HALT
                break

        assert halt_found, "Should end with HALT instruction"

    def test_encode_to_file(self):
        """Should be able to save encoded layout to file."""
        from layout_encoder import LayoutEncoder
        from layout_inferencer import LayoutResult

        encoder = LayoutEncoder()
        result = LayoutResult(
            panels=[{"bbox": [10, 20, 100, 80], "type": "panel"}]
        )

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            temp_path = f.name

        try:
            encoder.encode_to_file(result, temp_path)

            # File should exist and be a valid PNG
            assert os.path.exists(temp_path)

            from PIL import Image
            img = Image.open(temp_path)
            assert img.format == 'PNG'
        finally:
            if os.path.exists(temp_path):
                os.unlink(temp_path)

    def test_horizontal_vs_vertical_line_orientation(self):
        """Horizontal lines should have orientation=0, vertical=1."""
        from layout_encoder import LayoutEncoder
        from layout_inferencer import LayoutResult

        encoder = LayoutEncoder()

        # Horizontal line (y1 ≈ y2)
        result_h = LayoutResult(
            lines=[((0, 50), (100, 50))]
        )
        img_h = encoder.encode(result_h)
        pixels_h = [p for p in list(img_h.getdata()) if p[0] == 0x12]
        assert len(pixels_h) >= 1
        assert pixels_h[0][1] == 0, "Horizontal line should have orientation=0"

        # Vertical line (x1 ≈ x2)
        result_v = LayoutResult(
            lines=[((50, 0), (50, 100))]
        )
        img_v = encoder.encode(result_v)
        pixels_v = [p for p in list(img_v.getdata()) if p[0] == 0x12]
        assert len(pixels_v) >= 1
        assert pixels_v[0][1] == 1, "Vertical line should have orientation=1"
