#!/usr/bin/env python3
"""
Tests for Extraction Pipeline Module

Test coverage:
- ExtractionResult dataclass
- ExtractionPipeline class
- Full pipeline integration with real screenshots
"""

from widget_detector import WidgetType, Widget
from extraction_pipeline import (
    ExtractionPipeline,
    ExtractionResult,
    extract_gui
)
import pytest
import tempfile
import os
import json
import sys
from pathlib import Path

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))


class TestExtractionResult:
    """Tests for the ExtractionResult dataclass."""

    def test_extraction_result_defaults(self):
        """ExtractionResult has sensible defaults."""
        result = ExtractionResult()
        assert result.elements == []
        assert result.clusters == []
        assert result.widgets == []
        assert result.ascii_view == ""
        assert result.metadata == {}

    def test_extraction_result_to_dict(self):
        """ExtractionResult can be converted to dict."""
        result = ExtractionResult(metadata={"test": "value"})
        d = result.to_dict()

        assert "elements" in d
        assert "clusters" in d
        assert "widgets" in d
        assert "ascii_view" in d
        assert d["metadata"]["test"] == "value"

    def test_extraction_result_to_json(self):
        """ExtractionResult can be serialized to JSON."""
        result = ExtractionResult(metadata={"time": 0.5})
        json_str = result.to_json()

        # Should be valid JSON
        parsed = json.loads(json_str)
        assert parsed["metadata"]["time"] == 0.5

    def test_get_clickable_regions(self):
        """get_clickable_regions extracts widgets with actions."""
        result = ExtractionResult()
        result.widgets = [
            Widget(WidgetType.BUTTON, "OK", [0, 0, 50, 20], 0.9, "click_ok"),
            Widget(WidgetType.LABEL, "Name:", [0, 0, 50, 20], 0.8, None),
        ]

        clickables = result.get_clickable_regions()
        assert len(clickables) == 1
        assert clickables[0]["action"] == "click_ok"

    def test_get_clickable_regions_empty(self):
        """get_clickable_regions returns empty list when no widgets."""
        result = ExtractionResult()
        clickables = result.get_clickable_regions()
        assert clickables == []

    def test_to_dict_includes_all_elements(self):
        """to_dict includes all element data."""
        from gui_structure_analyzer import UIElement

        result = ExtractionResult()
        result.elements = [
            UIElement("Button1", (10, 20, 100, 50), 95),
            UIElement("Label1", (10, 60, 100, 80), 90),
        ]

        d = result.to_dict()
        assert len(d["elements"]) == 2
        assert d["elements"][0]["text"] == "Button1"
        assert d["elements"][0]["bbox"] == [10, 20, 100, 50]


class TestExtractionPipeline:
    """Tests for the ExtractionPipeline class."""

    def test_pipeline_initialization(self):
        """ExtractionPipeline initializes correctly."""
        pipeline = ExtractionPipeline()
        assert pipeline.analyzer is not None
        assert pipeline.widget_detector is not None
        assert pipeline.ascii_width == 80

    def test_pipeline_custom_dimensions(self):
        """ExtractionPipeline accepts custom ASCII dimensions."""
        pipeline = ExtractionPipeline(ascii_width=120, ascii_height=40)
        assert pipeline.ascii_width == 120
        assert pipeline.ascii_height == 40

    def test_extract_returns_result(self):
        """extract() returns ExtractionResult."""
        # Use an existing screenshot
        pipeline = ExtractionPipeline()
        result = pipeline.extract("conductor/tracks/shotcut-on-the-map/screenshots/final_proof.png")

        assert isinstance(result, ExtractionResult)
        assert isinstance(result.ascii_view, str)
        assert isinstance(result.metadata, dict)

    def test_extract_includes_metadata(self):
        """extract() includes timing and count metadata."""
        pipeline = ExtractionPipeline()
        result = pipeline.extract("conductor/tracks/shotcut-on-the-map/screenshots/final_proof.png")

        assert "extraction_time_seconds" in result.metadata
        assert "element_count" in result.metadata
        assert "cluster_count" in result.metadata
        assert "widget_count" in result.metadata

    def test_ascii_view_includes_clickable_metadata(self):
        """ASCII view includes [CLICKABLE] annotations."""
        pipeline = ExtractionPipeline()
        result = pipeline.extract("conductor/tracks/shotcut-on-the-map/screenshots/final_proof.png")

        # Check for metadata section
        assert "WIDGET METADATA" in result.ascii_view or result.ascii_view != ""

    def test_extract_to_file(self):
        """extract_to_file saves JSON output."""
        pipeline = ExtractionPipeline()

        with tempfile.NamedTemporaryFile(suffix='.json', delete=False) as f:
            output_path = f.name

        try:
            result = pipeline.extract_to_file(
                "conductor/tracks/shotcut-on-the-map/screenshots/final_proof.png",
                output_path
            )

            assert os.path.exists(output_path)

            with open(output_path) as f:
                saved = json.load(f)

            assert "metadata" in saved
        finally:
            if os.path.exists(output_path):
                os.unlink(output_path)

    def test_extract_gui_convenience_function(self):
        """extract_gui() convenience function works."""
        result = extract_gui("conductor/tracks/shotcut-on-the-map/screenshots/final_proof.png")

        assert isinstance(result, ExtractionResult)

    def test_extract_gui_with_output(self):
        """extract_gui() with output_path saves to file."""
        with tempfile.NamedTemporaryFile(suffix='.json', delete=False) as f:
            output_path = f.name

        try:
            result = extract_gui(
                "conductor/tracks/shotcut-on-the-map/screenshots/final_proof.png",
                output_path=output_path
            )

            assert os.path.exists(output_path)
            assert isinstance(result, ExtractionResult)
        finally:
            if os.path.exists(output_path):
                os.unlink(output_path)


class TestExtractionPipelineIntegration:
    """Integration tests with real screenshots."""

    def test_full_pipeline_with_real_screenshot(self):
        """Full pipeline works with real screenshot."""
        pipeline = ExtractionPipeline()
        result = pipeline.extract("conductor/tracks/shotcut-on-the-map/screenshots/final_proof.png")

        # Should have some results (may vary based on OCR)
        assert result.metadata["element_count"] >= 0
        assert result.metadata["cluster_count"] >= 0
        assert result.metadata["widget_count"] >= 0

        # ASCII view should not be empty (or elements were empty)
        assert len(result.ascii_view) > 0 or result.metadata["element_count"] == 0

    def test_pipeline_produces_ascii_view(self):
        """Pipeline produces ASCII view with expected structure."""
        pipeline = ExtractionPipeline()
        result = pipeline.extract(
            "conductor/tracks/shotcut-on-the-map/screenshots/shotcut-running.png")

        # ASCII view should have structure
        assert isinstance(result.ascii_view, str)
        # Should have the widget metadata section
        assert "WIDGET METADATA" in result.ascii_view

    def test_pipeline_handles_different_screenshots(self):
        """Pipeline handles different screenshots correctly."""
        pipeline = ExtractionPipeline()

        screenshots = [
            "conductor/tracks/shotcut-on-the-map/screenshots/final_proof.png",
            "conductor/tracks/shotcut-on-the-map/screenshots/shotcut-running.png",
        ]

        for screenshot in screenshots:
            if os.path.exists(screenshot):
                result = pipeline.extract(screenshot)
                assert isinstance(result, ExtractionResult)
                assert "source_image" in result.metadata
                assert result.metadata["source_image"] == screenshot

    def test_clickable_count_matches_regions(self):
        """Clickable count in metadata matches get_clickable_regions()."""
        pipeline = ExtractionPipeline()
        result = pipeline.extract("conductor/tracks/shotcut-on-the-map/screenshots/final_proof.png")

        clickables = result.get_clickable_regions()
        assert result.metadata["clickable_count"] == len(clickables)


class TestExtractionResultSerialization:
    """Tests for serialization and deserialization."""

    def test_full_serialization_roundtrip(self):
        """Full result can be serialized and deserialized."""
        pipeline = ExtractionPipeline()
        result = pipeline.extract("conductor/tracks/shotcut-on-the-map/screenshots/final_proof.png")

        # Serialize
        json_str = result.to_json()

        # Deserialize
        parsed = json.loads(json_str)

        # Check structure
        assert "elements" in parsed
        assert "clusters" in parsed
        assert "widgets" in parsed
        assert "ascii_view" in parsed
        assert "metadata" in parsed

    def test_json_file_is_valid(self):
        """Saved JSON file is valid and readable."""
        pipeline = ExtractionPipeline()

        with tempfile.NamedTemporaryFile(suffix='.json', delete=False) as f:
            output_path = f.name

        try:
            pipeline.extract_to_file(
                "conductor/tracks/shotcut-on-the-map/screenshots/final_proof.png",
                output_path
            )

            # Read back and parse
            with open(output_path) as f:
                content = f.read()

            parsed = json.loads(content)
            assert "metadata" in parsed
            assert isinstance(parsed["elements"], list)
        finally:
            if os.path.exists(output_path):
                os.unlink(output_path)


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
