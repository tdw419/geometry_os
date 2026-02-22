"""
Tests for Extraction Pipeline Integration.

Tests integration of layout inference with the extraction pipeline.
"""
import pytest
import sys
import os
import numpy as np
import tempfile

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

# Check if cv2 is available for tests that require it
cv2 = pytest.importorskip("cv2", reason="OpenCV (cv2) not installed")


class TestLayoutIntegration:
    """Tests for layout inference integration with extraction pipeline."""

    def test_extraction_result_has_layout(self):
        """ExtractionResult should include layout data."""
        from extraction_pipeline import ExtractionResult

        result = ExtractionResult()

        # Should have layout field
        assert hasattr(result, 'layout')
        assert result.layout is None  # Default is None

    def test_pipeline_includes_layout_analysis(self):
        """ExtractionPipeline should analyze layout."""
        from extraction_pipeline import ExtractionPipeline

        pipeline = ExtractionPipeline()

        # Should have layout_inferencer
        assert hasattr(pipeline, 'layout_inferencer')

    def test_layout_included_in_extract_result(self):
        """Extract should populate layout in result."""
        from extraction_pipeline import ExtractionPipeline

        # Create a test image with a panel
        img = np.zeros((200, 200, 3), dtype=np.uint8)
        cv2.rectangle(img, (10, 10), (110, 110), (255, 255, 255), -1)

        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            cv2.imwrite(f.name, img)
            temp_path = f.name

        try:
            pipeline = ExtractionPipeline()
            result = pipeline.extract(temp_path)

            # Layout should be populated
            assert result.layout is not None
            assert hasattr(result.layout, 'panels')
            assert hasattr(result.layout, 'buttons')
        finally:
            os.unlink(temp_path)

    def test_ascii_view_includes_layout_info(self):
        """ASCII view should contain layout summary."""
        from extraction_pipeline import ExtractionPipeline

        # Create a test image with a panel
        img = np.zeros((200, 200, 3), dtype=np.uint8)
        cv2.rectangle(img, (10, 10), (110, 110), (255, 255, 255), -1)

        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            cv2.imwrite(f.name, img)
            temp_path = f.name

        try:
            pipeline = ExtractionPipeline()
            result = pipeline.extract(temp_path)

            # ASCII view should have layout section
            assert "=== LAYOUT INFERENCE (OpenCV) ===" in result.ascii_view
            assert "Detected Panels:" in result.ascii_view
        finally:
            os.unlink(temp_path)
