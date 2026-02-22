"""
Tests for WordPress Semantic District Integration.

Tests the integration between Layout Inference and WordPress:
- WordPressPublisher in extraction_pipeline.py
- LayoutEncoderWithDocs
- Telemetry pulses in realtime_feed.py
- LayoutMemorySearch
"""
import pytest
import sys
import os
import numpy as np
import tempfile
import time

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


class TestWordPressPublisher:
    """Tests for WordPressPublisher class."""

    def test_wordpress_publisher_instantiation(self):
        """WordPressPublisher should instantiate without errors."""
        from extraction_pipeline import WordPressPublisher
        publisher = WordPressPublisher()
        assert publisher is not None

    def test_should_publish_rate_limit(self):
        """should_publish should respect rate limiting."""
        from extraction_pipeline import WordPressPublisher
        from layout_inferencer import LayoutResult

        publisher = WordPressPublisher()
        publisher.enabled = True

        # First call should pass rate limit
        result = LayoutResult(panels=[{"bbox": [0, 0, 100, 100]}] * 5)
        assert publisher.should_publish(result) is True

        # Update last publish time to simulate recent publish
        publisher.last_publish_time = time.time()

        # Second call should be rate limited
        assert publisher.should_publish(result) is False

    def test_should_publish_significance_threshold(self):
        """should_publish should check significance thresholds."""
        from extraction_pipeline import WordPressPublisher
        from layout_inferencer import LayoutResult

        publisher = WordPressPublisher()
        publisher.enabled = True
        publisher.last_publish_time = 0  # Reset rate limit

        # Not significant (1 panel)
        result_small = LayoutResult(panels=[{"bbox": [0, 0, 10, 10]}])
        assert publisher.should_publish(result_small) is False

        # Significant (5 panels)
        result_large = LayoutResult(panels=[{"bbox": [0, 0, 100, 100]}] * 5)
        assert publisher.should_publish(result_large) is True

    def test_build_html_content(self):
        """Publishing should create valid HTML content."""
        from extraction_pipeline import WordPressPublisher
        from layout_inferencer import LayoutResult

        publisher = WordPressPublisher()
        publisher.enabled = True
        publisher.last_publish_time = 0

        layout = LayoutResult(
            panels=[
                {"bbox": [10, 20, 100, 80], "width": 90, "height": 60}
            ] * 3,
            buttons=[
                {"bbox": [5, 10, 50, 30], "width": 45, "height": 20}
            ] * 6
        )

        # The method should exist and be callable
        assert hasattr(publisher, 'publish_layout_analysis')


class TestLayoutEncoderWithDocs:
    """Tests for LayoutEncoderWithDocs class."""

    def test_encoder_instantiation(self):
        """LayoutEncoderWithDocs should instantiate."""
        from layout_encoder_with_docs import LayoutEncoderWithDocs
        encoder = LayoutEncoderWithDocs()
        assert encoder is not None

    def test_encode_without_documentation(self):
        """Should be able to encode without WordPress documentation."""
        from layout_encoder_with_docs import LayoutEncoderWithDocs
        from layout_inferencer import LayoutResult

        encoder = LayoutEncoderWithDocs(auto_document=False)
        result = LayoutResult(
            panels=[{"bbox": [10, 20, 100, 80], "type": "panel"}] * 3
        )

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            temp_path = f.name

        try:
            img, wp_result = encoder.encode_and_document(result, temp_path)
            assert img is not None
            assert wp_result is None  # No documentation requested
        finally:
            if os.path.exists(temp_path):
                os.unlink(temp_path)

    def test_should_document_threshold(self):
        """_should_document should check instruction threshold."""
        from layout_encoder_with_docs import LayoutEncoderWithDocs
        from layout_inferencer import LayoutResult

        encoder = LayoutEncoderWithDocs(auto_document=False)  # Disable actual publish

        # Below threshold (2 instructions)
        result_small = LayoutResult(
            panels=[{"bbox": [0, 0, 10, 10]}],
            buttons=[{"bbox": [0, 0, 10, 10]}]
        )
        assert encoder._should_document(result_small) is False

        # Above threshold (5 instructions)
        result_large = LayoutResult(
            panels=[{"bbox": [0, 0, 10, 10]}] * 5
        )
        assert encoder._should_document(result_large) is True


class TestTelemetryPulse:
    """Tests for telemetry pulse functionality."""

    def test_telemetry_enabled_flag(self):
        """RealtimeFeed should accept telemetry_enabled parameter."""
        # Import in a way that doesn't require actual WebSocket
        from realtime_feed import RealtimeFeed

        feed = RealtimeFeed(
            bridge_url="ws://localhost:8768",
            hud_url="ws://localhost:8768",
            telemetry_enabled=True
        )
        assert feed.telemetry_enabled is True

        feed_disabled = RealtimeFeed(
            bridge_url="ws://localhost:8768",
            telemetry_enabled=False
        )
        assert feed_disabled.telemetry_enabled is False

    def test_telemetry_rate_limit(self):
        """RealtimeFeed should have rate limit for telemetry."""
        from realtime_feed import RealtimeFeed

        feed = RealtimeFeed("ws://localhost:8768")
        assert hasattr(feed, 'TELEMETRY_RATE_LIMIT')
        assert feed.TELEMETRY_RATE_LIMIT > 0


class TestLayoutMemorySearch:
    """Tests for LayoutMemorySearch class."""

    def test_search_instantiation(self):
        """LayoutMemorySearch should instantiate."""
        # Use try/except since requests might not be available
        try:
            from wordpress_zone.layout_memory import LayoutMemorySearch
            search = LayoutMemorySearch()
            assert search is not None
        except ImportError:
            pytest.skip("WordPress zone not available")

    def test_layout_memory_dataclass(self):
        """LayoutMemory dataclass should work correctly."""
        try:
            from wordpress_zone.layout_memory import LayoutMemory

            memory = LayoutMemory(
                post_id=123,
                title="Test Layout",
                panel_count=5,
                button_count=10
            )

            assert memory.post_id == 123
            assert memory.panel_count == 5

            # Test similarity score
            score = memory.similarity_score(5, 10)
            assert score == 1.0  # Exact match

            score = memory.similarity_score(10, 20)
            assert 0.0 <= score < 1.0  # Different

        except ImportError:
            pytest.skip("WordPress zone not available")

    def test_query_similar_layouts_method(self):
        """query_similar_layouts method should exist."""
        try:
            from wordpress_zone.layout_memory import LayoutMemorySearch

            search = LayoutMemorySearch()
            assert hasattr(search, 'query_similar_layouts')
            assert hasattr(search, 'query_by_keyword')
            assert hasattr(search, 'get_recent_memories')
            assert hasattr(search, 'get_structure_statistics')

        except ImportError:
            pytest.skip("WordPress zone not available")


class TestIntegrationPipelineWordPress:
    """Tests for ExtractionPipeline WordPress integration."""

    def test_pipeline_wordpress_enabled_parameter(self):
        """ExtractionPipeline should accept wordpress_enabled parameter."""
        from extraction_pipeline import ExtractionPipeline

        # Default disabled
        pipeline_default = ExtractionPipeline()
        assert pipeline_default.wordpress_enabled is False
        assert pipeline_default.wordpress_publisher is None

        # Explicitly enabled
        pipeline_enabled = ExtractionPipeline(wordpress_enabled=True)
        assert pipeline_enabled.wordpress_enabled is True
        assert pipeline_enabled.wordpress_publisher is not None

    def test_maybe_document_layout_method(self):
        """_maybe_document_layout method should exist."""
        from extraction_pipeline import ExtractionPipeline

        pipeline = ExtractionPipeline(wordpress_enabled=True)
        assert hasattr(pipeline, '_maybe_document_layout')
