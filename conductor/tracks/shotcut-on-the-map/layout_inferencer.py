"""
LayoutInferencer Module

Detects UI structure from screenshots using OpenCV.
Identifies edges, contours, lines, panels, and buttons.
"""

import cv2
import numpy as np
from dataclasses import dataclass, field
from typing import List, Tuple, Optional, Dict, Any
from pathlib import Path


@dataclass
class LayoutResult:
    """
    Result of layout inference analysis.

    Attributes:
        edges: Edge detection result (binary image as numpy array)
        contours: List of detected contours (each contour is list of points)
        lines: List of detected lines (each line is ((x1,y1), (x2,y2)))
        panels: List of detected panels (each panel is dict with bbox and type)
        buttons: List of detected button-like regions
    """
    edges: Optional[np.ndarray] = None
    contours: List[List[Tuple[int, int]]] = field(default_factory=list)
    lines: List[Tuple[Tuple[int, int], Tuple[int, int]]] = field(default_factory=list)
    panels: List[Dict[str, Any]] = field(default_factory=list)
    buttons: List[Dict[str, Any]] = field(default_factory=list)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for JSON serialization."""
        return {
            "contours": self.contours,
            "lines": self.lines,
            "panels": self.panels,
            "buttons": self.buttons
        }


class LayoutInferencer:
    """
    OpenCV-based UI layout inference.

    Detects structural elements in GUI screenshots:
    - Edges (Canny edge detection)
    - Contours (button/panel boundaries)
    - Lines (Hough line transform for separators)
    - Panels (large rectangular regions)
    - Buttons (small clickable regions)
    """

    def __init__(self):
        """Initialize the layout inferencer with default parameters."""
        # Edge detection parameters
        self.canny_threshold1 = 50
        self.canny_threshold2 = 150

        # Contour parameters
        self.min_contour_area = 100  # Minimum area for a contour
        self.max_contour_area = 500000  # Maximum area (avoid full-screen)

        # Line detection parameters
        self.hough_threshold = 100
        self.hough_min_line_length = 50
        self.hough_max_line_gap = 10

        # Panel/button classification
        self.panel_min_area = 5000  # Minimum area for panel
        self.button_max_area = 5000  # Maximum area for button

    def analyze(self, image_path: str) -> LayoutResult:
        """
        Analyze a screenshot for UI structure.

        Args:
            image_path: Path to the screenshot image

        Returns:
            LayoutResult with detected structural elements
        """
        # Load image
        image = cv2.imread(image_path)
        if image is None:
            return LayoutResult()

        # Convert to grayscale
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

        # Detect edges
        edges = self._detect_edges(gray)

        # Detect contours
        contours = self._detect_contours(edges)

        # Detect lines
        lines = self._detect_lines(edges)

        # Classify regions as panels or buttons
        panels, buttons = self._classify_regions(contours)

        return LayoutResult(
            edges=edges,
            contours=contours,
            lines=lines,
            panels=panels,
            buttons=buttons
        )

    def analyze_from_array(self, image_array: np.ndarray) -> LayoutResult:
        """
        Analyze an image from a numpy array.

        Args:
            image_array: Image as numpy array (BGR or RGB format)

        Returns:
            LayoutResult with detected structural elements
        """
        # Convert to grayscale
        if len(image_array.shape) == 3:
            gray = cv2.cvtColor(image_array, cv2.COLOR_BGR2GRAY)
        else:
            gray = image_array

        # Detect edges
        edges = self._detect_edges(gray)

        # Detect contours
        contours = self._detect_contours(edges)

        # Detect lines
        lines = self._detect_lines(edges)

        # Classify regions
        panels, buttons = self._classify_regions(contours)

        return LayoutResult(
            edges=edges,
            contours=contours,
            lines=lines,
            panels=panels,
            buttons=buttons
        )

    def _detect_edges(self, gray: np.ndarray) -> np.ndarray:
        """Detect edges using Canny algorithm."""
        # Apply slight blur to reduce noise
        blurred = cv2.GaussianBlur(gray, (5, 5), 0)

        # Canny edge detection
        edges = cv2.Canny(blurred, self.canny_threshold1, self.canny_threshold2)

        return edges

    def _detect_contours(self, edges: np.ndarray) -> List[List[Tuple[int, int]]]:
        """Detect contours from edge image."""
        contours, _ = cv2.findContours(edges, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

        # Filter by area and convert to list of points
        result = []
        for contour in contours:
            area = cv2.contourArea(contour)
            if self.min_contour_area < area < self.max_contour_area:
                # Simplify contour
                epsilon = 0.02 * cv2.arcLength(contour, True)
                approx = cv2.approxPolyDP(contour, epsilon, True)

                # Convert to list of tuples
                points = [(int(p[0][0]), int(p[0][1])) for p in approx]
                result.append(points)

        return result

    def _detect_lines(self, edges: np.ndarray) -> List[Tuple[Tuple[int, int], Tuple[int, int]]]:
        """Detect lines using Hough transform."""
        lines = cv2.HoughLinesP(
            edges,
            rho=1,
            theta=np.pi/180,
            threshold=self.hough_threshold,
            minLineLength=self.hough_min_line_length,
            maxLineGap=self.hough_max_line_gap
        )

        result = []
        if lines is not None:
            for line in lines:
                x1, y1, x2, y2 = line[0]
                result.append(((int(x1), int(y1)), (int(x2), int(y2))))

        return result

    def _classify_regions(self, contours: List) -> Tuple[List[Dict], List[Dict]]:
        """Classify contours as panels or buttons based on size."""
        panels = []
        buttons = []

        for contour_points in contours:
            if len(contour_points) < 3:
                continue

            # Calculate bounding box
            xs = [p[0] for p in contour_points]
            ys = [p[1] for p in contour_points]
            x1, y1, x2, y2 = min(xs), min(ys), max(xs), max(ys)
            area = (x2 - x1) * (y2 - y1)

            region = {
                "bbox": [x1, y1, x2, y2],
                "width": x2 - x1,
                "height": y2 - y1,
                "area": area
            }

            if area >= self.panel_min_area:
                region["type"] = "panel"
                panels.append(region)
            elif area <= self.button_max_area:
                region["type"] = "button"
                buttons.append(region)

        return panels, buttons


def infer_layout(image_path: str) -> LayoutResult:
    """
    Convenience function to infer layout from an image.

    Args:
        image_path: Path to the screenshot

    Returns:
        LayoutResult with detected elements
    """
    inferencer = LayoutInferencer()
    return inferencer.analyze(image_path)
