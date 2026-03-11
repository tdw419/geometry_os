#!/usr/bin/env python3
"""
Tests for ui_transmuter.py - Converts extraction JSON to WGSL shaders.

TDD: Write failing tests first, then implement.
"""

import json
import pytest
from pathlib import Path
from ui_transmuter import UITransmuter, transmute_extraction


class TestUITransmuterBasics:
    """Basic initialization and structure tests."""

    def test_transmuter_initializes(self):
        """Transmuter should initialize with default resolution."""
        transmuter = UITransmuter()
        assert transmuter.width == 1920
        assert transmuter.height == 1080

    def test_transmuter_accepts_custom_resolution(self):
        """Transmuter should accept custom resolution."""
        transmuter = UITransmuter(width=1280, height=720)
        assert transmuter.width == 1280
        assert transmuter.height == 720


class TestPanelTransmutation:
    """Tests for panel → sdRoundedBox mapping."""

    def test_panel_becomes_sdRoundedBox(self):
        """A panel widget should generate sdRoundedBox SDF call."""
        extraction_data = {
            "widgets": [
                {"type": "panel", "text": "Timeline Panel",
                    "bbox": [0, 0, 1920, 200], "action": None}
            ],
            "metadata": {"source_image": "test.png"}
        }

        transmuter = UITransmuter()
        wgsl = transmuter.transmute(extraction_data)

        assert "sdRoundedBox" in wgsl
        assert "panel_0" in wgsl  # Named widget

    def test_panel_coordinates_normalized(self):
        """Panel bbox should be converted to UV coordinates."""
        extraction_data = {
            "widgets": [
                {"type": "panel", "text": "Test", "bbox": [100, 50, 400, 300], "action": None}
            ],
            "metadata": {"source_image": "test.png"}
        }

        transmuter = UITransmuter(width=1000, height=1000)
        wgsl = transmuter.transmute(extraction_data)

        # Check for normalized coordinates in shader
        # 100/1000 = 0.1, 50/1000 = 0.05
        assert "0.1" in wgsl or "0.05" in wgsl


class TestClipTransmutation:
    """Tests for clip → sdBox + texture mapping."""

    def test_clip_becomes_sdBox(self):
        """A clip widget should generate sdBox SDF call."""
        extraction_data = {
            "widgets": [
                {"type": "clip", "text": "Video Clip", "bbox": [50, 100, 300, 50], "action": None}
            ],
            "metadata": {"source_image": "test.png"}
        }

        transmuter = UITransmuter()
        wgsl = transmuter.transmute(extraction_data)

        assert "sdBox" in wgsl
        assert "clip_0" in wgsl

    def test_clip_with_texture_reference(self):
        """Clip should include texture binding placeholder."""
        extraction_data = {
            "widgets": [
                {"type": "clip", "text": "Clip1", "bbox": [0, 0, 100, 100], "action": None}
            ],
            "metadata": {"source_image": "test.png"}
        }

        transmuter = UITransmuter()
        wgsl = transmuter.transmute(extraction_data)

        # Should have texture sampling for clips
        assert "texture" in wgsl.lower() or "sampler" in wgsl.lower()


class TestPlayheadTransmutation:
    """Tests for playhead → sdLine mapping."""

    def test_playhead_becomes_sdLine(self):
        """A playhead widget should generate sdLine SDF call."""
        extraction_data = {
            "widgets": [
                {"type": "playhead", "text": "", "bbox": [500, 0, 2, 1080], "action": None}
            ],
            "metadata": {"source_image": "test.png"}
        }

        transmuter = UITransmuter()
        wgsl = transmuter.transmute(extraction_data)

        assert "sdLine" in wgsl
        assert "playhead_0" in wgsl

    def test_playhead_vertical_line(self):
        """Playhead should generate vertical line coordinates."""
        extraction_data = {
            "widgets": [
                {"type": "playhead", "text": "", "bbox": [500, 0, 2, 1080], "action": None}
            ],
            "metadata": {"source_image": "test.png"}
        }

        transmuter = UITransmuter(width=1000, height=1000)
        wgsl = transmuter.transmute(extraction_data)

        # Vertical line: a.y=0, b.y=1 (normalized height)
        assert "vec2f" in wgsl


class TestWGSLStructure:
    """Tests for valid WGSL shader structure."""

    def test_includes_sdf_functions(self):
        """Generated WGSL should include SDF helper functions."""
        extraction_data = {
            "widgets": [
                {"type": "panel", "text": "Test", "bbox": [0, 0, 100, 100], "action": None}
            ],
            "metadata": {"source_image": "test.png"}
        }

        transmuter = UITransmuter()
        wgsl = transmuter.transmute(extraction_data)

        # Should include the SDF functions
        assert "fn sdRoundedBox" in wgsl
        assert "fn sdBox" in wgsl
        assert "fn sdLine" in wgsl

    def test_includes_uniforms(self):
        """Generated WGSL should include uniform struct."""
        extraction_data = {
            "widgets": [],
            "metadata": {"source_image": "test.png"}
        }

        transmuter = UITransmuter()
        wgsl = transmuter.transmute(extraction_data)

        assert "struct Uniforms" in wgsl
        assert "resolution" in wgsl

    def test_includes_fragment_entry(self):
        """Generated WGSL should have fragment_main entry point."""
        extraction_data = {
            "widgets": [],
            "metadata": {"source_image": "test.png"}
        }

        transmuter = UITransmuter()
        wgsl = transmuter.transmute(extraction_data)

        assert "@fragment" in wgsl
        assert "fn fragment_main" in wgsl


class TestConvenienceFunction:
    """Tests for the convenience transmute_extraction function."""

    def test_transmute_extraction_from_dict(self):
        """Should accept dict input."""
        extraction_data = {
            "widgets": [
                {"type": "panel", "text": "Test", "bbox": [0, 0, 100, 100], "action": None}
            ],
            "metadata": {"source_image": "test.png"}
        }

        wgsl = transmute_extraction(extraction_data)
        assert "sdRoundedBox" in wgsl

    def test_transmute_extraction_from_json_string(self):
        """Should accept JSON string input."""
        extraction_data = {
            "widgets": [
                {"type": "panel", "text": "Test", "bbox": [0, 0, 100, 100], "action": None}
            ],
            "metadata": {"source_image": "test.png"}
        }

        wgsl = transmute_extraction(json.dumps(extraction_data))
        assert "sdRoundedBox" in wgsl

    def test_transmute_to_file(self):
        """Should write WGSL to file."""
        extraction_data = {
            "widgets": [
                {"type": "panel", "text": "Test", "bbox": [0, 0, 100, 100], "action": None}
            ],
            "metadata": {"source_image": "test.png"}
        }

        output_path = Path("/tmp/test_transmute.wgsl")
        wgsl = transmute_extraction(extraction_data, output_path=str(output_path))

        assert output_path.exists()
        content = output_path.read_text()
        assert "sdRoundedBox" in content

        # Cleanup
        output_path.unlink()


class TestInteractionFeatures:
    """Tests for mouse and time interaction features."""

    def test_mouse_highlighting_in_generated_shader(self):
        """Generated shader should include mouse-based highlighting."""
        extraction_data = {
            "widgets": [
                {"type": "panel", "text": "Test", "bbox": [0, 0, 100, 100], "action": None}
            ],
            "metadata": {"source_image": "test.png"}
        }

        transmuter = UITransmuter()
        wgsl = transmuter.transmute(extraction_data)

        # Should use ui.mouse for interaction
        assert "ui.mouse" in wgsl or "mouse" in wgsl

    def test_time_uniform_available(self):
        """Generated shader should have time uniform for animations."""
        extraction_data = {
            "widgets": [
                {"type": "playhead", "text": "", "bbox": [500, 0, 2, 1080], "action": None}
            ],
            "metadata": {"source_image": "test.png"}
        }

        transmuter = UITransmuter()
        wgsl = transmuter.transmute(extraction_data)

        # Time uniform should be available for animations
        assert "time" in wgsl.lower()

    def test_smooth_edge_blending(self):
        """Generated shader should use smoothstep for anti-aliased edges."""
        extraction_data = {
            "widgets": [
                {"type": "clip", "text": "Clip", "bbox": [0, 0, 100, 100], "action": None}
            ],
            "metadata": {"source_image": "test.png"}
        }

        transmuter = UITransmuter()
        wgsl = transmuter.transmute(extraction_data)

        # Should use smoothstep or similar for smooth edges
        assert "smoothstep" in wgsl or "mix(" in wgsl

    def test_hover_threshold_configurable(self):
        """Transmuter should allow configuring hover threshold."""
        transmuter = UITransmuter(hover_threshold=0.03)
        wgsl = transmuter.transmute({
            "widgets": [{"type": "panel", "text": "Test", "bbox": [0, 0, 100, 100], "action": None}],
            "metadata": {}
        })

        assert "0.03" in wgsl or "hover_threshold" in wgsl.lower()


class TestMultipleWidgets:
    """Tests for handling multiple widgets."""

    def test_multiple_widgets_generate_all_sdFs(self):
        """Multiple widgets should generate all their SDF calls."""
        extraction_data = {
            "widgets": [
                {"type": "panel", "text": "Panel", "bbox": [0, 0, 1920, 200], "action": None},
                {"type": "clip", "text": "Clip1", "bbox": [50, 50, 300, 50], "action": None},
                {"type": "playhead", "text": "", "bbox": [500, 0, 2, 1080], "action": None}
            ],
            "metadata": {"source_image": "test.png"}
        }

        transmuter = UITransmuter()
        wgsl = transmuter.transmute(extraction_data)

        assert "panel_0" in wgsl
        assert "clip_1" in wgsl
        assert "playhead_2" in wgsl

    def test_widget_z_ordering_comment(self):
        """Generated shader should comment widget order for clarity."""
        extraction_data = {
            "widgets": [
                {"type": "panel", "text": "Panel", "bbox": [0, 0, 100, 100], "action": None},
                {"type": "clip", "text": "Clip", "bbox": [10, 10, 50, 50], "action": None}
            ],
            "metadata": {"source_image": "test.png"}
        }

        transmuter = UITransmuter()
        wgsl = transmuter.transmute(extraction_data)

        # Should have comments indicating widget names
        assert "// Widget 0: panel" in wgsl.lower() or "// panel" in wgsl.lower()


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
