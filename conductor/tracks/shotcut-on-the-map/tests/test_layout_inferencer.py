"""
Tests for LayoutInferencer module.

Tests OpenCV-based UI structure detection including edges,
contours, lines, and panels.
"""
import pytest
import sys
import os
import numpy as np
import tempfile

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

# Check if cv2 is available for tests that require it
cv2 = pytest.importorskip("cv2", reason="OpenCV (cv2) not installed")


class TestLayoutInferencerImport:
    """Tests for module import and basic structure."""

    def test_import_layout_inferencer(self):
        """LayoutInferencer should be importable."""
        from layout_inferencer import LayoutInferencer
        assert LayoutInferencer is not None

    def test_layout_inferencer_instantiation(self):
        """LayoutInferencer should instantiate without errors."""
        from layout_inferencer import LayoutInferencer
        inferencer = LayoutInferencer()
        assert inferencer is not None


class TestLayoutResult:
    """Tests for LayoutResult dataclass."""

    def test_layout_result_structure(self):
        """LayoutResult should have expected fields."""
        from layout_inferencer import LayoutResult

        result = LayoutResult(
            edges=None,
            contours=[],
            lines=[],
            panels=[],
            buttons=[]
        )

        assert result.edges is None
        assert result.contours == []
        assert result.lines == []
        assert result.panels == []
        assert result.buttons == []

    def test_layout_result_to_dict(self):
        """LayoutResult should serialize to dict."""
        from layout_inferencer import LayoutResult

        result = LayoutResult(
            edges=None,
            contours=[[(0, 0), (10, 0), (10, 10), (0, 10)]],
            lines=[((0, 0), (100, 0))],
            panels=[{"bbox": [0, 0, 100, 50], "type": "panel"}],
            buttons=[{"bbox": [10, 10, 50, 30], "type": "button"}]
        )

        d = result.to_dict()
        assert "contours" in d
        assert "lines" in d
        assert "panels" in d
        assert "buttons" in d


class TestEdgeDetection:
    """Tests for Canny edge detection."""

    def test_detect_edges_on_simple_image(self):
        """Edge detection should find boundaries in a simple image."""
        from layout_inferencer import LayoutInferencer

        # Create a simple test image: white rectangle on black background
        img = np.zeros((100, 100, 3), dtype=np.uint8)
        cv2.rectangle(img, (20, 20), (80, 80), (255, 255, 255), -1)

        # Save to temp file
        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            cv2.imwrite(f.name, img)
            temp_path = f.name

        try:
            inferencer = LayoutInferencer()
            result = inferencer.analyze(temp_path)

            # Edges should be detected
            assert result.edges is not None
            assert result.edges.shape == (100, 100)

            # There should be some edge pixels (non-zero)
            edge_pixels = np.count_nonzero(result.edges)
            assert edge_pixels > 0
        finally:
            os.unlink(temp_path)

    def test_detect_edges_returns_binary(self):
        """Edge detection should return binary image (0 or 255)."""
        from layout_inferencer import LayoutInferencer

        # Create test image
        img = np.random.randint(0, 256, (50, 50, 3), dtype=np.uint8)

        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            cv2.imwrite(f.name, img)
            temp_path = f.name

        try:
            inferencer = LayoutInferencer()
            result = inferencer.analyze(temp_path)

            # Check binary values
            unique_values = np.unique(result.edges)
            for v in unique_values:
                assert v in [0, 255], f"Edge value {v} not binary"
        finally:
            os.unlink(temp_path)


class TestContourDetection:
    """Tests for contour detection."""

    def test_detect_rectangle_contour(self):
        """Should detect rectangular contour."""
        from layout_inferencer import LayoutInferencer

        # Create image with rectangle
        img = np.zeros((200, 200, 3), dtype=np.uint8)
        cv2.rectangle(img, (50, 50), (150, 150), (255, 255, 255), 2)

        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            cv2.imwrite(f.name, img)
            temp_path = f.name

        try:
            inferencer = LayoutInferencer()
            result = inferencer.analyze(temp_path)

            # Should detect at least one contour
            assert len(result.contours) >= 1
        finally:
            os.unlink(temp_path)

    def test_detect_button_sized_region(self):
        """Should detect button-sized regions."""
        from layout_inferencer import LayoutInferencer

        # Create image with button-sized rectangle (50x30)
        img = np.zeros((200, 200, 3), dtype=np.uint8)
        cv2.rectangle(img, (10, 10), (60, 40), (255, 255, 255), -1)

        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            cv2.imwrite(f.name, img)
            temp_path = f.name

        try:
            inferencer = LayoutInferencer()
            result = inferencer.analyze(temp_path)

            # Should classify as button (area < 5000)
            assert len(result.buttons) >= 1
            btn = result.buttons[0]
            assert btn["area"] < 5000
        finally:
            os.unlink(temp_path)

    def test_detect_panel_sized_region(self):
        """Should detect panel-sized regions."""
        from layout_inferencer import LayoutInferencer

        # Create image with panel-sized rectangle (200x150)
        img = np.zeros((300, 300, 3), dtype=np.uint8)
        cv2.rectangle(img, (10, 10), (210, 160), (255, 255, 255), -1)

        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            cv2.imwrite(f.name, img)
            temp_path = f.name

        try:
            inferencer = LayoutInferencer()
            result = inferencer.analyze(temp_path)

            # Should classify as panel (area >= 5000)
            assert len(result.panels) >= 1
            panel = result.panels[0]
            assert panel["area"] >= 5000
        finally:
            os.unlink(temp_path)


class TestLineDetection:
    """Tests for Hough line detection."""

    def test_detect_horizontal_line(self):
        """Should detect horizontal lines."""
        from layout_inferencer import LayoutInferencer

        # Create image with horizontal line
        img = np.zeros((100, 200, 3), dtype=np.uint8)
        cv2.line(img, (10, 50), (190, 50), (255, 255, 255), 2)

        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            cv2.imwrite(f.name, img)
            temp_path = f.name

        try:
            inferencer = LayoutInferencer()
            result = inferencer.analyze(temp_path)

            # Should detect at least one line
            assert len(result.lines) >= 1

            # Check line is roughly horizontal (y1 ≈ y2)
            line = result.lines[0]
            y1, y2 = line[0][1], line[1][1]
            assert abs(y1 - y2) < 10, "Line should be horizontal"
        finally:
            os.unlink(temp_path)

    def test_detect_vertical_line(self):
        """Should detect vertical lines."""
        from layout_inferencer import LayoutInferencer

        # Create image with vertical line
        img = np.zeros((200, 100, 3), dtype=np.uint8)
        cv2.line(img, (50, 10), (50, 190), (255, 255, 255), 2)

        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            cv2.imwrite(f.name, img)
            temp_path = f.name

        try:
            inferencer = LayoutInferencer()
            result = inferencer.analyze(temp_path)

            # Should detect at least one line
            assert len(result.lines) >= 1

            # Check line is roughly vertical (x1 ≈ x2)
            line = result.lines[0]
            x1, x2 = line[0][0], line[1][0]
            assert abs(x1 - x2) < 10, "Line should be vertical"
        finally:
            os.unlink(temp_path)

    def test_line_format(self):
        """Lines should be in ((x1,y1), (x2,y2)) format."""
        from layout_inferencer import LayoutInferencer

        # Create image with line
        img = np.zeros((100, 200, 3), dtype=np.uint8)
        cv2.line(img, (0, 50), (199, 50), (255, 255, 255), 2)

        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            cv2.imwrite(f.name, img)
            temp_path = f.name

        try:
            inferencer = LayoutInferencer()
            result = inferencer.analyze(temp_path)

            if result.lines:
                line = result.lines[0]
                assert len(line) == 2, "Line should have two points"
                assert len(line[0]) == 2, "Each point should have x,y"
                assert len(line[1]) == 2, "Each point should have x,y"
                assert isinstance(line[0][0], int), "x should be int"
                assert isinstance(line[0][1], int), "y should be int"
        finally:
            os.unlink(temp_path)
