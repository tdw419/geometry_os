"""
Tests for SemanticClusterer module.

Tests the ability to cluster adjacent OCR elements into semantic UI groups
like menu bars, button groups, and form fields.
"""

import pytest
import sys
import os

# Add parent directory to path for imports
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from semantic_clusterer import SemanticClusterer, OCRElement, UICluster


class TestSemanticClusterer:
    """Tests for the SemanticClusterer class."""

    def test_cluster_adjacent_elements(self):
        """Adjacent text elements should be grouped into a cluster."""
        elements = [
            OCRElement(text="File", x=0, y=0, width=30, height=20),
            OCRElement(text="Edit", x=35, y=0, width=30, height=20),
            OCRElement(text="View", x=70, y=0, width=30, height=20),
        ]

        clusterer = SemanticClusterer()
        clusters = clusterer.cluster(elements)

        assert len(clusters) == 1
        assert clusters[0].label == "menu_bar"
        assert len(clusters[0].elements) == 3

    def test_cluster_separate_regions(self):
        """Elements in different screen regions should form separate clusters."""
        elements = [
            OCRElement(text="File", x=0, y=0, width=30, height=20),
            OCRElement(text="OK", x=100, y=500, width=30, height=20),
        ]

        clusterer = SemanticClusterer()
        clusters = clusterer.cluster(elements)

        assert len(clusters) == 2

    def test_empty_elements(self):
        """Empty element list should return empty clusters."""
        clusterer = SemanticClusterer()
        clusters = clusterer.cluster([])

        assert len(clusters) == 0

    def test_single_element(self):
        """Single element should form its own cluster."""
        elements = [
            OCRElement(text="Button", x=100, y=100, width=60, height=30),
        ]

        clusterer = SemanticClusterer()
        clusters = clusterer.cluster(elements)

        assert len(clusters) == 1
        assert len(clusters[0].elements) == 1

    def test_vertical_clustering(self):
        """Vertically adjacent elements should cluster together."""
        elements = [
            OCRElement(text="Name:", x=0, y=0, width=50, height=20),
            OCRElement(text="Email:", x=0, y=30, width=50, height=20),
            OCRElement(text="Phone:", x=0, y=60, width=50, height=20),
        ]

        clusterer = SemanticClusterer()
        clusters = clusterer.cluster(elements)

        assert len(clusters) == 1
        assert clusters[0].label == "form"

    def test_cluster_bounds(self):
        """UICluster should calculate correct bounding box."""
        elements = [
            OCRElement(text="A", x=10, y=10, width=20, height=20),
            OCRElement(text="B", x=50, y=5, width=20, height=30),
            OCRElement(text="C", x=30, y=60, width=25, height=15),
        ]

        clusterer = SemanticClusterer()
        clusters = clusterer.cluster(elements)

        # All elements are close enough to cluster
        assert len(clusters) == 1
        bounds = clusters[0].bounds
        # min x=10, min y=5, max x+width=70, max y+height=75
        assert bounds == (10, 5, 70, 75)


class TestOCRElement:
    """Tests for the OCRElement dataclass."""

    def test_ocr_element_creation(self):
        """OCRElement should store all properties correctly."""
        elem = OCRElement(text="Hello", x=100, y=200, width=50, height=30)

        assert elem.text == "Hello"
        assert elem.x == 100
        assert elem.y == 200
        assert elem.width == 50
        assert elem.height == 30

    def test_ocr_element_center(self):
        """OCRElement should calculate center point correctly."""
        elem = OCRElement(text="Test", x=10, y=20, width=100, height=60)

        center_x, center_y = elem.center
        assert center_x == 60  # 10 + 100/2
        assert center_y == 50  # 20 + 60/2

    def test_ocr_element_right(self):
        """OCRElement should return right edge coordinate."""
        elem = OCRElement(text="Test", x=10, y=20, width=100, height=60)
        assert elem.right == 110  # x + width

    def test_ocr_element_bottom(self):
        """OCRElement should return bottom edge coordinate."""
        elem = OCRElement(text="Test", x=10, y=20, width=100, height=60)
        assert elem.bottom == 80  # y + height


class TestUICluster:
    """Tests for the UICluster dataclass."""

    def test_ui_cluster_creation(self):
        """UICluster should store label and elements."""
        elements = [
            OCRElement(text="File", x=0, y=0, width=30, height=20),
            OCRElement(text="Edit", x=35, y=0, width=30, height=20),
        ]
        cluster = UICluster(label="menu_bar", elements=elements)

        assert cluster.label == "menu_bar"
        assert len(cluster.elements) == 2

    def test_ui_cluster_bounds(self):
        """UICluster should calculate bounds from elements."""
        elements = [
            OCRElement(text="A", x=10, y=10, width=20, height=20),
            OCRElement(text="B", x=50, y=5, width=20, height=30),
        ]
        cluster = UICluster(label="test", elements=elements)

        bounds = cluster.bounds
        assert bounds == (10, 5, 70, 35)  # (min_x, min_y, max_right, max_bottom)

    def test_ui_cluster_empty_bounds(self):
        """UICluster with no elements should return zero bounds."""
        cluster = UICluster(label="empty", elements=[])
        assert cluster.bounds == (0, 0, 0, 0)

    def test_ui_cluster_center(self):
        """UICluster should calculate center of bounding box."""
        elements = [
            OCRElement(text="A", x=0, y=0, width=20, height=20),
            OCRElement(text="B", x=80, y=80, width=20, height=20),
        ]
        cluster = UICluster(label="test", elements=elements)

        cx, cy = cluster.center
        assert cx == 50  # (0 + 100) / 2
        assert cy == 50  # (0 + 100) / 2


if __name__ == "__main__":
    pytest.main([__file__, "-v"])


class TestVideoEditorClustering:
    """Tests for video editor specific clustering (Shotcut, etc.)."""

    def test_timeline_panel_detection(self):
        """Wide horizontal cluster with timeline keywords should be labeled timeline_panel."""
        # Elements close enough to cluster (within HORIZONTAL_THRESHOLD=50)
        # but spread wide horizontally (>400px total spread)
        elements = [
            OCRElement(text="Timeline", x=0, y=600, width=60, height=20),
            OCRElement(text="Track1", x=70, y=600, width=50, height=20),    # gap=10
            OCRElement(text="Clip", x=130, y=600, width=40, height=20),     # gap=10
            OCRElement(text="Marker", x=180, y=600, width=50, height=20),   # gap=10
            OCRElement(text="In", x=240, y=600, width=20, height=20),       # gap=10
            OCRElement(text="Out", x=270, y=600, width=25, height=20),      # gap=10
            OCRElement(text="Track2", x=305, y=600, width=50, height=20),   # gap=10
            OCRElement(text="Clip2", x=365, y=600, width=50, height=20),    # gap=10
            OCRElement(text="Track3", x=425, y=600, width=50, height=20),   # x_spread now 475>400
        ]

        clusterer = SemanticClusterer()
        clusters = clusterer.cluster(elements)

        # All elements should cluster together (adjacent horizontally)
        assert len(clusters) == 1
        assert clusters[0].label == "timeline_panel"

    def test_playback_controls_detection(self):
        """Cluster with playback keywords should be labeled playback_controls."""
        elements = [
            OCRElement(text="Play", x=100, y=100, width=30, height=20),
            OCRElement(text="Pause", x=140, y=100, width=30, height=20),
            OCRElement(text="Stop", x=180, y=100, width=30, height=20),
        ]

        clusterer = SemanticClusterer()
        clusters = clusterer.cluster(elements)

        assert len(clusters) == 1
        assert clusters[0].label == "playback_controls"

    def test_filters_panel_detection(self):
        """Cluster with filter keywords should be labeled filters_panel."""
        elements = [
            OCRElement(text="Filter", x=0, y=100, width=40, height=20),
            OCRElement(text="Blur", x=0, y=130, width=30, height=20),
        ]

        clusterer = SemanticClusterer()
        clusters = clusterer.cluster(elements)

        assert len(clusters) == 1
        assert clusters[0].label == "filters_panel"

    def test_media_panel_detection(self):
        """Cluster with media keywords should be labeled media_panel."""
        elements = [
            OCRElement(text="Media", x=0, y=100, width=40, height=20),
            OCRElement(text="Playlist", x=0, y=130, width=50, height=20),
            OCRElement(text="Import", x=0, y=160, width=45, height=20),
        ]

        clusterer = SemanticClusterer()
        clusters = clusterer.cluster(elements)

        assert len(clusters) == 1
        assert clusters[0].label == "media_panel"

    def test_properties_panel_detection(self):
        """Cluster with properties keywords should be labeled properties_panel."""
        elements = [
            OCRElement(text="Properties", x=0, y=100, width=70, height=20),
            OCRElement(text="Position", x=0, y=130, width=55, height=20),
        ]

        clusterer = SemanticClusterer()
        clusters = clusterer.cluster(elements)

        assert len(clusters) == 1
        assert clusters[0].label == "properties_panel"

    def test_cluster_with_regions_menu(self):
        """cluster_with_regions should detect menu bar from position."""
        elements = [
            OCRElement(text="File", x=0, y=10, width=30, height=20),
            OCRElement(text="Edit", x=35, y=10, width=30, height=20),
        ]

        clusterer = SemanticClusterer()
        clusters = clusterer.cluster_with_regions(elements, screen_width=1024, screen_height=768)

        assert len(clusters) == 1
        assert clusters[0].label == "menu_bar"

    def test_cluster_with_regions_timeline(self):
        """cluster_with_regions should detect timeline from position."""
        elements = [
            OCRElement(text="Track1", x=0, y=650, width=50, height=20),
            OCRElement(text="Track2", x=60, y=650, width=50, height=20),
        ]

        clusterer = SemanticClusterer()
        clusters = clusterer.cluster_with_regions(elements, screen_width=1024, screen_height=768)

        assert len(clusters) == 1
        assert clusters[0].label == "timeline_panel"

    def test_cluster_with_regions_side_panels(self):
        """cluster_with_regions should detect side panels from position."""
        # Use generic text that doesn't match specific panel types
        left_elements = [
            OCRElement(text="Item1", x=50, y=300, width=40, height=20),
            OCRElement(text="Item2", x=50, y=330, width=40, height=20),
        ]
        right_elements = [
            OCRElement(text="Info1", x=900, y=300, width=40, height=20),
            OCRElement(text="Info2", x=900, y=330, width=40, height=20),
        ]

        clusterer = SemanticClusterer()
        clusters = clusterer.cluster_with_regions(
            left_elements + right_elements,
            screen_width=1024,
            screen_height=768
        )

        assert len(clusters) == 2
        labels = {c.label for c in clusters}
        assert "side_panel_left" in labels
        assert "side_panel_right" in labels

    def test_timeline_not_detected_for_narrow_cluster(self):
        """Narrow cluster with timeline keywords should not be timeline_panel."""
        elements = [
            OCRElement(text="Timeline", x=0, y=600, width=60, height=20),
            OCRElement(text="Track", x=70, y=600, width=40, height=20),
        ]

        clusterer = SemanticClusterer()
        clusters = clusterer.cluster(elements)

        # x_spread is only 110 pixels (< 400), so not detected as timeline
        assert len(clusters) == 1
        assert clusters[0].label != "timeline_panel"
