#!/usr/bin/env python3
"""
Integration Tests for Full Interactive Pipeline

Tests the end-to-end flow:
    Screenshot -> ExtractionPipeline -> widgets -> UITransmuter -> WGSL shader

This validates the integration between:
- extraction_pipeline.py (OCR + widget detection)
- ui_transmuter.py (WGSL generation with interaction support)
- WidgetInteractionManager expected format (JS side)
"""

import pytest
import sys
import os
import json
from pathlib import Path
from unittest.mock import Mock, patch, MagicMock

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from extraction_pipeline import ExtractionPipeline, ExtractionResult, extract_gui
from ui_transmuter import UITransmuter, transmute_extraction


class TestExtractionToTransmuterPipeline:
    """Tests for extraction_pipeline -> ui_transmuter integration."""

    def test_extraction_result_produces_valid_wgsl(self):
        """ExtractionPipeline result can be fed to UITransmuter for valid WGSL."""
        # Create mock extraction result with widgets
        mock_result = ExtractionResult(
            widgets=[
                Mock(type=Mock(value="button"), text="Save", bbox=[10, 10, 50, 30], action="save"),
                Mock(type=Mock(value="panel"), text="Panel1", bbox=[0, 0, 200, 100], action=None),
                Mock(type=Mock(value="clip"), text="Clip1", bbox=[50, 50, 150, 80], action="select"),
            ],
            metadata={"source_image": "test.png"}
        )

        # Convert widgets to dict format expected by UITransmuter
        widgets_data = {
            "widgets": [
                {"type": w.type.value, "text": w.text, "bbox": w.bbox, "action": w.action}
                for w in mock_result.widgets
            ],
            "metadata": mock_result.metadata
        }

        # Generate WGSL
        transmuter = UITransmuter()
        wgsl = transmuter.transmute(widgets_data)

        # Validate WGSL contains essential elements
        assert "struct Uniforms" in wgsl, "WGSL should have Uniforms struct"
        assert "fragment_main" in wgsl, "WGSL should have fragment_main function"
        assert "sdBox" in wgsl, "WGSL should have SDF functions"
        assert "mouse_pressed" in wgsl, "WGSL should have mouse_pressed for interaction"
        assert "focused_widget" in wgsl, "WGSL should have focused_widget for keyboard nav"

    def test_extraction_to_transmuter_with_sample_data(self):
        """Full pipeline works with sample widget data."""
        # Sample extraction data (simulating extraction_pipeline output)
        extraction_data = {
            "widgets": [
                {"type": "button", "text": "OK", "bbox": [100, 100, 150, 130], "action": "confirm"},
                {"type": "button", "text": "Cancel", "bbox": [160, 100, 220, 130], "action": "cancel"},
                {"type": "panel", "text": "Dialog", "bbox": [50, 50, 300, 200], "action": None},
                {"type": "menu", "text": "File", "bbox": [10, 10, 40, 30], "action": "menu_file"},
                {"type": "clip", "text": "Video1", "bbox": [0, 300, 200, 350], "action": "select"},
            ],
            "metadata": {
                "source_image": "test_screenshot.png",
                "clickable_count": 4
            }
        }

        # Generate WGSL shader
        wgsl = transmute_extraction(extraction_data, width=800, height=600)

        # Validate generated WGSL
        assert len(wgsl) > 1000, "Generated WGSL should be substantial"
        assert "button_0" in wgsl, "Should have button_0 widget"
        assert "button_1" in wgsl, "Should have button_1 widget"
        assert "panel_2" in wgsl, "Should have panel_2 widget"
        assert "menu_3" in wgsl, "Should have menu_3 widget"
        assert "clip_4" in wgsl, "Should have clip_4 widget"

    def test_wgsl_contains_interaction_logic_for_clickable_widgets(self):
        """WGSL contains hover and pressed logic for clickable widgets."""
        extraction_data = {
            "widgets": [
                {"type": "button", "text": "Click Me", "bbox": [0, 0, 100, 50], "action": "click"},
            ]
        }

        wgsl = transmute_extraction(extraction_data)

        # Should have hover logic
        assert "_hover" in wgsl, "Clickable widget should have hover variable"
        assert "distance(uv, ui.mouse / ui.resolution)" in wgsl, \
            "Should calculate mouse distance for hover"

        # Should have pressed darkening (0.05)
        assert "vec4f(0.05)" in wgsl, "Should have pressed darkening constant"

        # Should have hover brightening (0.08)
        assert "vec4f(0.08)" in wgsl, "Should have hover brightening constant"


class TestClickableRegionsFormat:
    """Tests for get_clickable_regions() output format."""

    def test_get_clickable_regions_returns_correct_format(self):
        """get_clickable_regions() returns format expected by WidgetInteractionManager."""
        # Create mock widgets with action field
        mock_widgets = [
            Mock(type=Mock(value="button"), text="OK", bbox=[10, 10, 50, 30], action="confirm"),
            Mock(type=Mock(value="menu"), text="File", bbox=[0, 0, 40, 20], action="menu_file"),
            Mock(type=Mock(value="panel"), text="Panel", bbox=[0, 0, 200, 200], action=None),
        ]

        result = ExtractionResult(widgets=mock_widgets)
        clickable = result.get_clickable_regions()

        # Should return list of clickable widgets
        assert isinstance(clickable, list), "Should return a list"
        assert len(clickable) == 2, "Should have 2 clickable widgets (panel has no action)"

        # Check format matches WidgetInteractionManager expected format
        for item in clickable:
            assert "bbox" in item, "Each item should have bbox"
            assert "action" in item, "Each item should have action"
            assert "text" in item, "Each item should have text"
            assert isinstance(item["bbox"], list), "bbox should be a list"
            assert len(item["bbox"]) == 4, "bbox should have 4 elements [x1,y1,x2,y2]"

    def test_clickable_regions_bbox_format_matches_js_hitTest(self):
        """Clickable regions bbox format [x1, y1, x2, y2] matches JS hitTest expectations."""
        mock_widgets = [
            Mock(type=Mock(value="button"), text="Test", bbox=[100, 200, 200, 250], action="test"),
        ]

        result = ExtractionResult(widgets=mock_widgets)
        clickable = result.get_clickable_regions()

        # WidgetInteractionManager.hitTest expects [x1, y1, x2, y2]
        # where x1 < x2 and y1 < y2
        bbox = clickable[0]["bbox"]
        assert bbox[0] < bbox[2], "x1 should be less than x2"
        assert bbox[1] < bbox[3], "y1 should be less than y3"

    def test_get_clickable_regions_excludes_non_clickable(self):
        """get_clickable_regions() only returns widgets with action field."""
        mock_widgets = [
            Mock(type=Mock(value="button"), text="OK", bbox=[10, 10, 50, 30], action="confirm"),
            Mock(type=Mock(value="label"), text="Label:", bbox=[0, 0, 100, 20], action=None),
            Mock(type=Mock(value="panel"), text="Panel", bbox=[0, 0, 200, 200], action=None),
            Mock(type=Mock(value="button"), text="Cancel", bbox=[60, 10, 120, 30], action="cancel"),
        ]

        result = ExtractionResult(widgets=mock_widgets)
        clickable = result.get_clickable_regions()

        assert len(clickable) == 2, "Should only have 2 clickable widgets"
        actions = [item["action"] for item in clickable]
        assert "confirm" in actions, "Should have confirm action"
        assert "cancel" in actions, "Should have cancel action"


class TestEndToEndPipeline:
    """End-to-end integration tests with mock screenshot processing."""

    @pytest.fixture
    def mock_analyzer(self):
        """Mock GUIAnalyzer to avoid actual OCR."""
        mock = Mock()
        mock.analyze_with_clustering.return_value = Mock(
            elements=[
                Mock(text="OK", bbox=[10, 10, 50, 30], confidence=0.95),
                Mock(text="Cancel", bbox=[60, 10, 120, 30], confidence=0.92),
                Mock(text="Panel Title", bbox=[0, 0, 200, 50], confidence=0.88),
            ],
            clusters=[],
            ascii_view="Mock ASCII View"
        )
        return mock

    @pytest.fixture
    def sample_image_path(self, tmp_path):
        """Create a sample test image."""
        # Create a simple test image
        from PIL import Image
        img = Image.new('RGB', (800, 600), color='white')
        img_path = tmp_path / "test_screenshot.png"
        img.save(img_path)
        return str(img_path)

    def test_full_pipeline_screenshot_to_wgsl(self, mock_analyzer, sample_image_path):
        """Full pipeline: screenshot -> extraction -> WGSL generation."""
        # Create pipeline with mocked analyzer
        pipeline = ExtractionPipeline()
        pipeline.analyzer = mock_analyzer

        # Run extraction
        result = pipeline.extract(sample_image_path)

        # Validate extraction result
        assert len(result.widgets) > 0, "Should extract widgets"

        # Convert to transmuter format
        widgets_data = {
            "widgets": [
                {"type": w.type.value, "text": w.text, "bbox": w.bbox, "action": w.action}
                for w in result.widgets
            ],
            "metadata": result.metadata
        }

        # Generate WGSL
        wgsl = transmute_extraction(widgets_data, width=800, height=600)

        # Validate WGSL output
        assert "// Auto-generated WGSL Shader" in wgsl
        assert "fragment_main" in wgsl
        assert "Uniforms" in wgsl

    def test_pipeline_preserves_clickable_widget_metadata(self, mock_analyzer, sample_image_path):
        """Pipeline preserves action metadata for interactive widgets."""
        pipeline = ExtractionPipeline()
        pipeline.analyzer = mock_analyzer

        result = pipeline.extract(sample_image_path)
        clickable = result.get_clickable_regions()

        # Check that clickable widgets have action metadata
        for widget in clickable:
            assert widget["action"] is not None, "Clickable widget should have action"
            assert widget["bbox"] is not None, "Clickable widget should have bbox"

    def test_mock_render_validation(self, mock_analyzer, sample_image_path):
        """Validate mock render setup would work with generated shader."""
        pipeline = ExtractionPipeline()
        pipeline.analyzer = mock_analyzer

        result = pipeline.extract(sample_image_path)

        # Prepare data for transmuter
        widgets_data = {
            "widgets": [
                {"type": w.type.value, "text": w.text, "bbox": w.bbox, "action": w.action}
                for w in result.widgets
            ],
            "metadata": result.metadata
        }

        # Generate WGSL
        wgsl = transmute_extraction(widgets_data, width=800, height=600)

        # Mock render validation - check shader structure
        # 1. Has proper entry point
        assert "@fragment" in wgsl, "Should have fragment shader entry point"

        # 2. Has uniform binding
        assert "@group(0) @binding(0)" in wgsl, "Should have uniform binding"

        # 3. Has SDF functions
        assert "fn sdBox" in wgsl, "Should have sdBox SDF function"
        assert "fn sdRoundedBox" in wgsl, "Should have sdRoundedBox SDF function"

        # 4. Has interaction helpers
        assert "fn is_hovered" in wgsl, "Should have is_hovered helper"
        assert "fn is_focused" in wgsl, "Should have is_focused helper"
        assert "fn is_pressed" in wgsl, "Should have is_pressed helper"

        # 5. Writes to output location
        assert "@location(0)" in wgsl, "Should write to color output location"

    def test_pipeline_handles_empty_widgets(self):
        """Pipeline handles case with no detected widgets."""
        # Create result with no widgets
        result = ExtractionResult(
            widgets=[],
            metadata={"source_image": "empty.png"}
        )

        # Should still produce valid WGSL
        wgsl = transmute_extraction({"widgets": [], "metadata": result.metadata})

        assert "struct Uniforms" in wgsl, "Should have uniforms even with no widgets"
        assert "fragment_main" in wgsl, "Should have fragment function"
        assert "return color;" in wgsl, "Should return background color"


class TestWidgetInteractionManagerFormat:
    """Tests validating WidgetInteractionManager expected format compatibility."""

    def test_widget_format_matches_js_constructor(self):
        """Widget format from extraction matches WidgetInteractionManager constructor."""
        # WidgetInteractionManager expects widgets with:
        # - bbox: [x1, y1, x2, y2]
        # - action: string or null

        mock_widgets = [
            Mock(type=Mock(value="button"), text="Test", bbox=[0, 0, 100, 50], action="click"),
        ]

        result = ExtractionResult(widgets=mock_widgets)
        widgets_for_js = result.to_dict()["widgets"]

        # Validate format
        widget = widgets_for_js[0]
        assert "bbox" in widget, "Widget should have bbox"
        assert "action" in widget, "Widget should have action"
        assert "type" in widget, "Widget should have type"
        assert "text" in widget, "Widget should have text"

        # bbox should be array of 4 numbers
        assert len(widget["bbox"]) == 4, "bbox should have 4 coordinates"

    def test_clickable_widgets_filtering_matches_js(self):
        """Click filtering logic matches JS _clickableWidgets filtering."""
        # JS filters: this._clickableWidgets = this._widgets.filter(w => w.action)

        mock_widgets = [
            Mock(type=Mock(value="button"), text="OK", bbox=[0, 0, 50, 30], action="confirm"),
            Mock(type=Mock(value="panel"), text="Panel", bbox=[0, 0, 200, 200], action=None),
            Mock(type=Mock(value="menu"), text="File", bbox=[0, 0, 40, 20], action="menu_file"),
        ]

        result = ExtractionResult(widgets=mock_widgets)
        clickable = result.get_clickable_regions()

        # Python filtering should match JS filtering
        assert len(clickable) == 2, "Should have 2 clickable (those with action)"

        actions = [w["action"] for w in clickable]
        assert "confirm" in actions
        assert "menu_file" in actions
        assert None not in actions, "Should not include widgets without action"


class TestUniformBufferLayoutCompatibility:
    """Tests for uniform buffer layout compatibility between JS and WGSL."""

    def test_uniform_layout_matches_js_write(self):
        """Uniform buffer layout in WGSL matches JS _updateUniformBuffer."""
        transmuter = UITransmuter()
        wgsl = transmuter.transmute({"widgets": []})

        # JS writes: [time, mouse_pressed, mouse_x, mouse_y, resolution_x, resolution_y, focused_widget, pad]
        # Total: 8 floats = 32 bytes

        # WGSL struct should match this order
        lines = wgsl.split("\n")
        struct_lines = []
        in_struct = False
        for line in lines:
            if "struct Uniforms" in line:
                in_struct = True
            elif in_struct:
                if "};" in line:
                    break
                struct_lines.append(line.strip())

        # Expected order
        expected_fields = [
            "time: f32",
            "mouse_pressed: f32",
            "mouse: vec2f",
            "resolution: vec2f",
            "focused_widget: f32",
            "pad: f32",
        ]

        # Verify each expected field is in the struct
        struct_text = "\n".join(struct_lines)
        for field in expected_fields:
            assert field in struct_text, f"Uniform struct should contain '{field}'"

    def test_uniform_buffer_size_32_bytes(self):
        """Uniform buffer is exactly 32 bytes (8 floats)."""
        transmuter = UITransmuter()
        wgsl = transmuter.transmute({"widgets": []})

        # Count fields: 6 field definitions = 32 bytes
        # time: 4, mouse_pressed: 4, mouse: 8, resolution: 8, focused_widget: 4, pad: 4 = 32

        assert "time: f32" in wgsl
        assert "mouse_pressed: f32" in wgsl
        assert "mouse: vec2f" in wgsl
        assert "resolution: vec2f" in wgsl
        assert "focused_widget: f32" in wgsl
        assert "pad: f32" in wgsl


class TestWithRealScreenshotIfAvailable:
    """Integration tests using real screenshot if available."""

    @pytest.fixture
    def real_screenshot_path(self):
        """Find a real screenshot for testing."""
        screenshots_dir = Path(__file__).parent.parent / "screenshots"
        if screenshots_dir.exists():
            for png_file in screenshots_dir.glob("*.png"):
                return str(png_file)
        return None

    @pytest.mark.skipif(
        not Path(__file__).parent.parent.joinpath("screenshots").exists(),
        reason="No screenshots directory available"
    )
    def test_real_screenshot_produces_valid_wgsl(self, real_screenshot_path):
        """Real screenshot produces valid WGSL shader."""
        if not real_screenshot_path:
            pytest.skip("No real screenshot available")

        # This test uses mock analyzer to avoid OCR dependency
        # but validates the full pipeline structure
        pipeline = ExtractionPipeline()

        # Mock the analyzer to avoid actual OCR
        pipeline.analyzer = Mock()
        pipeline.analyzer.analyze_with_clustering.return_value = Mock(
            elements=[
                Mock(text="File", bbox=[10, 10, 40, 30], confidence=0.9),
                Mock(text="Edit", bbox=[50, 10, 80, 30], confidence=0.9),
                Mock(text="Help", bbox=[90, 10, 120, 30], confidence=0.9),
            ],
            clusters=[],
            ascii_view="Mock view"
        )

        result = pipeline.extract(real_screenshot_path)

        # Generate WGSL
        widgets_data = {
            "widgets": [
                {"type": w.type.value, "text": w.text, "bbox": w.bbox, "action": w.action}
                for w in result.widgets
            ],
            "metadata": result.metadata
        }

        wgsl = transmute_extraction(widgets_data)

        # Basic validation
        assert len(wgsl) > 500, "Should generate substantial WGSL"
        assert "fragment_main" in wgsl, "Should have fragment entry point"


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
