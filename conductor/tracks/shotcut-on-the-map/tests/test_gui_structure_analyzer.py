"""
Tests for GUI Structure Analyzer integration with SemanticClusterer.

Tests that analyze_screenshot returns clustered UI components with bounds metadata.
"""

import pytest
import sys
import os

# Add parent directory to path for imports
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from gui_structure_analyzer import analyze_screenshot, AnalysisResult, GUIAnalyzer

# Use a screenshot that has more text content
TEST_IMAGE = "conductor/tracks/shotcut-on-the-map/screenshots/shotcut_gui_test.png"


class TestAnalyzeScreenshotClusters:
    """Tests for analyze_screenshot returning clusters."""

    def test_analyze_returns_clusters(self):
        """analyze_screenshot should return clustered UI components."""
        image_path = TEST_IMAGE

        # Skip if image doesn't exist (for CI environments without screenshots)
        if not os.path.exists(image_path):
            pytest.skip(f"Test image not found: {image_path}")

        result = analyze_screenshot(image_path)

        assert hasattr(result, 'clusters')
        assert len(result.clusters) > 0

    def test_cluster_has_bounds(self):
        """Each cluster should have bounds metadata."""
        image_path = TEST_IMAGE

        # Skip if image doesn't exist
        if not os.path.exists(image_path):
            pytest.skip(f"Test image not found: {image_path}")

        result = analyze_screenshot(image_path)

        for cluster in result.clusters:
            assert cluster.label is not None
            assert cluster.bounds is not None

    def test_cluster_labels_are_strings(self):
        """Cluster labels should be strings."""
        image_path = TEST_IMAGE

        if not os.path.exists(image_path):
            pytest.skip(f"Test image not found: {image_path}")

        result = analyze_screenshot(image_path)

        for cluster in result.clusters:
            assert isinstance(cluster.label, str)

    def test_cluster_bounds_are_tuples(self):
        """Cluster bounds should be tuples of 4 integers."""
        image_path = TEST_IMAGE

        if not os.path.exists(image_path):
            pytest.skip(f"Test image not found: {image_path}")

        result = analyze_screenshot(image_path)

        for cluster in result.clusters:
            assert isinstance(cluster.bounds, tuple)
            assert len(cluster.bounds) == 4
            assert all(isinstance(v, int) for v in cluster.bounds)


class TestAnalysisResult:
    """Tests for the AnalysisResult dataclass."""

    def test_analysis_result_has_elements(self):
        """AnalysisResult should contain raw elements."""
        image_path = TEST_IMAGE

        if not os.path.exists(image_path):
            pytest.skip(f"Test image not found: {image_path}")

        result = analyze_screenshot(image_path)

        assert hasattr(result, 'elements')
        assert len(result.elements) > 0

    def test_analysis_result_has_ascii_view(self):
        """AnalysisResult should contain ASCII view."""
        image_path = TEST_IMAGE

        if not os.path.exists(image_path):
            pytest.skip(f"Test image not found: {image_path}")

        result = analyze_screenshot(image_path)

        assert hasattr(result, 'ascii_view')
        assert isinstance(result.ascii_view, str)


class TestGUIAnalyzerIntegration:
    """Tests for GUIAnalyzer class integration with clustering."""

    def test_analyzer_returns_clusters(self):
        """GUIAnalyzer.analyze_with_clustering should return clusters."""
        image_path = TEST_IMAGE

        if not os.path.exists(image_path):
            pytest.skip(f"Test image not found: {image_path}")

        analyzer = GUIAnalyzer()
        elements = analyzer.analyze_image(image_path)
        clusters = analyzer.cluster_elements(elements)

        assert len(clusters) > 0

    def test_analyzer_clusters_match_elements(self):
        """Total elements in clusters should equal total elements analyzed."""
        image_path = TEST_IMAGE

        if not os.path.exists(image_path):
            pytest.skip(f"Test image not found: {image_path}")

        analyzer = GUIAnalyzer()
        elements = analyzer.analyze_image(image_path)
        clusters = analyzer.cluster_elements(elements)

        total_in_clusters = sum(len(c.elements) for c in clusters)
        assert total_in_clusters == len(elements)


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
