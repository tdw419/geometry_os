# PixelRTS Vision Analysis Phase 1.1: Advanced Pattern Detection Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add computer vision algorithms (edge detection, Fourier analysis, clustering) to the PixelRTS Vision Analyzer for automated binary structure pattern detection.

**Architecture:**
- Extend `pixelrts_vision_analyzer.py` with pattern detection methods using OpenCV/scikit-image
- Add new `pattern_detector.py` module with specialized algorithms for binary patterns
- Create analysis result dataclasses for structured pattern findings
- Generate annotated overlays with detected patterns highlighted

**Tech Stack:**
- OpenCV (cv2) - Edge detection, image processing
- NumPy - Array operations for pixel data
- scikit-learn - DBSCAN clustering
- SciPy - FFT for periodic pattern detection
- matplotlib - Visualization of detected patterns

**Context:**
This extends the existing `PixelRTSVisionAnalyzer` class in `systems/pixel_compiler/pixelrts_vision_analyzer.py`. Current implementation provides basic entropy overlay generation. This plan adds:
1. Structural edge detection (Sobel, Canny)
2. Fourier transform for periodic patterns
3. DBSCAN clustering for region detection

---

## Task 1: Add Dependencies and Create Pattern Detector Module

**Files:**
- Create: `systems/pixel_compiler/pattern_detector.py`
- Test: `systems/pixel_compiler/tests/test_pattern_detector.py`

**Step 1: Write failing test for pattern detector initialization**

```python
# tests/test_pattern_detector.py
import pytest
import numpy as np
from PIL import Image
import tempfile
from pathlib import Path

def test_pattern_detector_initializes():
    """Test that PatternDetector can be initialized with an image."""
    # Create a simple test image
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    img_array[:, :] = [128, 64, 32, 255]
    img = Image.fromarray(img_array, 'RGBA')

    # Save to temp file
    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img.save(f)
        temp_path = f.name

    try:
        from pattern_detector import PatternDetector
        detector = PatternDetector(temp_path)
        assert detector.image is not None
        assert detector.width == 64
        assert detector.height == 64
    finally:
        Path(temp_path).unlink()
```

Create file: `systems/pixel_compiler/tests/test_pattern_detector.py`

**Step 2: Run test to verify it fails**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler
python3 -m pytest tests/test_pattern_detector.py::test_pattern_detector_initializes -v
```

Expected: `ModuleNotFoundError: No module named 'pattern_detector'`

**Step 3: Create pattern detector module with minimal implementation**

```python
# pattern_detector.py
"""
Pattern Detector for PixelRTS Vision Analysis

Provides computer vision algorithms for detecting structural patterns
in binary visualizations encoded as PixelRTS artifacts.
"""

import numpy as np
from pathlib import Path
from typing import Dict, List, Tuple, Optional, Any
from dataclasses import dataclass, field
import tempfile

try:
    import cv2
except ImportError:
    raise ImportError(
        "Pattern detection requires OpenCV. "
        "Install with: pip install opencv-python"
    )

try:
    from PIL import Image
except ImportError:
    raise ImportError(
        "Pattern detection requires PIL/Pillow. "
        "Install with: pip install Pillow"
    )

try:
    from sklearn.cluster import DBSCAN
except ImportError:
    DBSCAN = None
    raise ImportError(
        "Clustering requires scikit-learn. "
        "Install with: pip install scikit-learn"
    )

try:
    from scipy import fft
except ImportError:
    fft = None
    raise ImportError(
        "Fourier analysis requires scipy. "
        "Install with: pip install scipy"
    )


@dataclass
class EdgeDetectionResult:
    """Result of edge detection analysis."""
    method: str
    edges: np.ndarray
    edge_count: int
    edge_density: float
    strong_edges: List[Tuple[int, int]] = field(default_factory=list)
    metadata: Dict[str, Any] = field(default_factory=dict)


@dataclass
class FourierAnalysisResult:
    """Result of Fourier transform analysis."""
    frequencies: np.ndarray
    magnitude: np.ndarray
    dominant_frequency: Tuple[float, float]
    periodic_regions: List[Dict[str, Any]]
    has_periodic_patterns: bool


@dataclass
class ClusterResult:
    """Result of clustering analysis."""
    num_clusters: int
    cluster_labels: np.ndarray
    cluster_centers: List[Tuple[float, float]]
    regions_of_interest: List[Dict[str, Any]]
    noise_points: int


class PatternDetector:
    """
    Detects structural patterns in PixelRTS visual artifacts.

    Features:
    - Edge detection (Sobel, Canny) for boundary identification
    - Fourier transform for periodic pattern detection
    - DBSCAN clustering for region of interest detection
    """

    def __init__(self, image_path: str):
        """
        Initialize pattern detector with an image.

        Args:
            image_path: Path to PNG image file
        """
        self.image_path = image_path

        # Load and convert image
        self._load_image()

    def _load_image(self):
        """Load the image and convert to grayscale for analysis."""
        # Load with PIL
        pil_image = Image.open(self.image_path)

        # Ensure RGBA
        if pil_image.mode != 'RGBA':
            pil_image = pil_image.convert('RGBA')

        self.image = np.array(pil_image)
        self.height, self.width = self.image.shape[:2]

        # Convert to grayscale for edge detection
        # Use RGB channels (ignoring alpha)
        if len(self.image.shape) == 3:
            # RGB or RGBA
            self.grayscale = cv2.cvtColor(
                self.image[:, :, :3],
                cv2.COLOR_RGB2GRAY
            )
        else:
            self.grayscale = self.image

    def detect_edges_sobel(
        self,
        threshold: Optional[float] = None
    ) -> EdgeDetectionResult:
        """
        Detect edges using Sobel operator.

        Args:
            threshold: Optional threshold for edge binary classification

        Returns:
            EdgeDetectionResult with detected edges
        """
        raise NotImplementedError("Implement in Task 2")

    def detect_edges_canny(
        self,
        low_threshold: float = 50,
        high_threshold: float = 150
    ) -> EdgeDetectionResult:
        """
        Detect edges using Canny algorithm.

        Args:
            low_threshold: Lower boundary for hysteresis thresholding
            high_threshold: Upper boundary for hysteresis thresholding

        Returns:
            EdgeDetectionResult with detected edges
        """
        raise NotImplementedError("Implement in Task 2")

    def analyze_fourier(
        self,
        max_frequencies: int = 10
    ) -> FourierAnalysisResult:
        """
        Analyze periodic patterns using Fourier transform.

        Args:
            max_frequencies: Maximum number of dominant frequencies to return

        Returns:
            FourierAnalysisResult with frequency domain analysis
        """
        raise NotImplementedError("Implement in Task 3")

    def detect_clusters(
        self,
        eps: float = 5.0,
        min_samples: int = 10,
        feature_type: str = "position"
    ) -> ClusterResult:
        """
        Detect clusters of similar pixels using DBSCAN.

        Args:
            eps: Maximum distance between samples in cluster
            min_samples: Minimum samples in cluster
            feature_type: "position" (spatial) or "color" (RGB similarity)

        Returns:
            ClusterResult with detected clusters
        """
        raise NotImplementedError("Implement in Task 4")
```

Create file: `systems/pixel_compiler/pattern_detector.py`

**Step 4: Run test to verify it passes**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler
python3 -m pytest tests/test_pattern_detector.py::test_pattern_detector_initializes -v
```

Expected: `PASSED`

**Step 5: Commit**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os
git add systems/pixel_compiler/pattern_detector.py systems/pixel_compiler/tests/test_pattern_detector.py
git commit -m "feat(vision): add pattern detector module structure"
```

---

## Task 2: Implement Edge Detection (Sobel and Canny)

**Files:**
- Modify: `systems/pixel_compiler/pattern_detector.py` (implement detect_edges_sobel and detect_edges_canny)
- Test: `systems/pixel_compiler/tests/test_pattern_detector.py`

**Step 1: Write failing test for Sobel edge detection**

```python
# tests/test_pattern_detector.py

def test_sobel_edge_detection_returns_edges():
    """Test that Sobel edge detection returns edge array."""
    from pattern_detector import PatternDetector

    # Create image with clear edge (left half dark, right half light)
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    img_array[:, :32, :] = [0, 0, 0, 255]      # Left half: black
    img_array[:, 32:, :] = [255, 255, 255, 255]  # Right half: white

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        detector = PatternDetector(temp_path)
        result = detector.detect_edges_sobel()

        assert hasattr(result, 'edges')
        assert isinstance(result.edges, np.ndarray)
        assert result.edges.shape == (64, 64)
        assert result.method == 'sobel'
    finally:
        Path(temp_path).unlink()


def test_sobel_edge_count():
    """Test that Sobel detects expected number of edges in test pattern."""
    from pattern_detector import PatternDetector

    # Create checkerboard pattern (should have many edges)
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    for i in range(8):
        for j in range(8):
            if (i + j) % 2 == 0:
                img_array[i*8:(i+1)*8, j*8:(j+1)*8, :] = [255, 255, 255, 255]
            else:
                img_array[i*8:(i+1)*8, j*8:(j+1)*8, :] = [0, 0, 0, 255]

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        detector = PatternDetector(temp_path)
        result = detector.detect_edges_sobel()

        assert result.edge_count > 100  # Checkerboard has many edges
        assert 0 < result.edge_density < 1
    finally:
        Path(temp_path).unlink()
```

Add to file: `systems/pixel_compiler/tests/test_pattern_detector.py`

**Step 2: Run tests to verify they fail**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler
python3 -m pytest tests/test_pattern_detector.py::test_sobel_edge_detection_returns_edges -v
```

Expected: `NotImplementedError: Implement in Task 2`

**Step 3: Implement Sobel edge detection**

```python
# pattern_detector.py - Add to PatternDetector class

    def detect_edges_sobel(
        self,
        threshold: Optional[float] = None
    ) -> EdgeDetectionResult:
        """
        Detect edges using Sobel operator.

        Args:
            threshold: Optional threshold for edge binary classification.
                      If None, returns raw gradient magnitude.

        Returns:
            EdgeDetectionResult with detected edges
        """
        # Apply Sobel operators
        sobel_x = cv2.Sobel(self.grayscale, cv2.CV_64F, 1, 0, ksize=3)
        sobel_y = cv2.Sobel(self.grayscale, cv2.CV_64F, 0, 1, ksize=3)

        # Calculate gradient magnitude
        gradient_magnitude = np.sqrt(sobel_x**2 + sobel_y**2)

        # Normalize to 0-255 range
        gradient_magnitude = np.clip(gradient_magnitude, 0, 255).astype(np.uint8)

        # Apply threshold if specified
        edges = gradient_magnitude
        if threshold is not None:
            edges = (gradient_magnitude > threshold).astype(np.uint8) * 255

        # Count edge pixels
        edge_pixels = np.sum(edges > 0)
        edge_count = int(edge_pixels)
        edge_density = edge_count / (self.width * self.height)

        # Find strong edges (top 10% by magnitude)
        strong_threshold = np.percentile(gradient_magnitude[gradient_magnitude > 0], 90) if edge_count > 0 else 0
        strong_edge_indices = np.where(gradient_magnitude >= strong_threshold)
        strong_edges = list(zip(strong_edge_indices[1], strong_edge_indices[0]))  # (x, y) format

        return EdgeDetectionResult(
            method='sobel',
            edges=edges,
            edge_count=edge_count,
            edge_density=edge_density,
            strong_edges=strong_edges[:100],  # Limit to 100 strongest
            metadata={
                'gradient_mean': float(np.mean(gradient_magnitude)),
                'gradient_std': float(np.std(gradient_magnitude)),
                'gradient_max': float(np.max(gradient_magnitude)),
                'threshold_applied': threshold is not None
            }
        )
```

Add to `detect_edges_sobel` method in `systems/pixel_compiler/pattern_detector.py`

**Step 4: Run tests to verify they pass**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler
python3 -m pytest tests/test_pattern_detector.py::test_sobel_edge_detection_returns_edges tests/test_pattern_detector.py::test_sobel_edge_count -v
```

Expected: Both tests `PASSED`

**Step 5: Write failing test for Canny edge detection**

```python
# tests/test_pattern_detector.py

def test_canny_edge_detection():
    """Test that Canny edge detection works."""
    from pattern_detector import PatternDetector

    # Create image with rectangle (should have clear edges)
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    img_array[16:48, 16:48, :] = [255, 255, 255, 255]  # White rectangle

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        detector = PatternDetector(temp_path)
        result = detector.detect_edges_canny()

        assert result.method == 'canny'
        assert result.edges.shape == (64, 64)
        # Rectangle should have edges
        assert result.edge_count > 0
    finally:
        Path(temp_path).unlink()
```

Add to file: `systems/pixel_compiler/tests/test_pattern_detector.py`

**Step 6: Run test to verify it fails**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler
python3 -m pytest tests/test_pattern_detector.py::test_canny_edge_detection -v
```

Expected: `NotImplementedError: Implement in Task 2`

**Step 7: Implement Canny edge detection**

```python
# pattern_detector.py - Add to PatternDetector class

    def detect_edges_canny(
        self,
        low_threshold: float = 50,
        high_threshold: float = 150
    ) -> EdgeDetectionResult:
        """
        Detect edges using Canny algorithm.

        Args:
            low_threshold: Lower boundary for hysteresis thresholding
            high_threshold: Upper boundary for hysteresis thresholding

        Returns:
            EdgeDetectionResult with detected edges
        """
        # Apply Canny edge detection
        edges = cv2.Canny(
            self.grayscale,
            threshold1=low_threshold,
            threshold2=high_threshold
        )

        # Count edge pixels
        edge_pixels = np.sum(edges > 0)
        edge_count = int(edge_pixels)
        edge_density = edge_count / (self.width * self.height)

        # Find strong edge points
        edge_indices = np.where(edges > 0)
        strong_edges = list(zip(edge_indices[1], edge_indices[0]))

        return EdgeDetectionResult(
            method='canny',
            edges=edges,
            edge_count=edge_count,
            edge_density=edge_density,
            strong_edges=strong_edges[:100],
            metadata={
                'low_threshold': low_threshold,
                'high_threshold': high_threshold
            }
        )
```

Add to `detect_edges_canny` method in `systems/pixel_compiler/pattern_detector.py`

**Step 8: Run test to verify it passes**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler
python3 -m pytest tests/test_pattern_detector.py::test_canny_edge_detection -v
```

Expected: `PASSED`

**Step 9: Commit**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os
git add systems/pixel_compiler/pattern_detector.py systems/pixel_compiler/tests/test_pattern_detector.py
git commit -m "feat(vision): implement Sobel and Canny edge detection"
```

---

## Task 3: Implement Fourier Analysis for Periodic Patterns

**Files:**
- Modify: `systems/pixel_compiler/pattern_detector.py` (implement analyze_fourier)
- Test: `systems/pixel_compiler/tests/test_pattern_detector.py`

**Step 1: Write failing test for Fourier analysis**

```python
# tests/test_pattern_detector.py

def test_fourier_analysis_detects_periodicity():
    """Test that Fourier analysis detects periodic patterns."""
    from pattern_detector import PatternDetector

    # Create image with horizontal stripes (periodic pattern)
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    for i in range(64):
        if (i // 8) % 2 == 0:  # 8-pixel wide stripes
            img_array[i, :, :] = [255, 255, 255, 255]
        else:
            img_array[i, :, :] = [0, 0, 0, 255]

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        detector = PatternDetector(temp_path)
        result = detector.analyze_fourier()

        assert hasattr(result, 'frequencies')
        assert hasattr(result, 'magnitude')
        assert hasattr(result, 'dominant_frequency')
        assert len(result.dominant_frequency) == 2
        # Should detect periodicity in y direction (stripes are horizontal)
        assert result.has_periodic_patterns
        assert len(result.periodic_regions) > 0
    finally:
        Path(temp_path).unlink()


def test_fourier_analysis_on_noise():
    """Test that Fourier analysis correctly identifies no periodicity in noise."""
    from pattern_detector import PatternDetector

    # Create random noise image
    np.random.seed(42)
    img_array = np.random.randint(0, 256, (64, 64, 4), dtype=np.uint8)

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        detector = PatternDetector(temp_path)
        result = detector.analyze_fourier()

        # Noise should not have strong periodic components
        assert not result.has_periodic_patterns or len(result.periodic_regions) == 0
    finally:
        Path(temp_path).unlink()
```

Add to file: `systems/pixel_compiler/tests/test_pattern_detector.py`

**Step 2: Run tests to verify they fail**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler
python3 -m pytest tests/test_pattern_detector.py::test_fourier_analysis_detects_periodicity -v
```

Expected: `NotImplementedError: Implement in Task 3`

**Step 3: Implement Fourier analysis**

```python
# pattern_detector.py - Add to PatternDetector class

    def analyze_fourier(
        self,
        max_frequencies: int = 10
    ) -> FourierAnalysisResult:
        """
        Analyze periodic patterns using Fourier transform.

        Detects repeating structures in the image by analyzing
        the frequency domain. High magnitude at specific frequencies
        indicates periodic patterns.

        Args:
            max_frequencies: Maximum number of dominant frequencies to return

        Returns:
            FourierAnalysisResult with frequency domain analysis
        """
        # Apply 2D FFT
        f_transform = fft.fft2(self.grayscale)
        f_shift = fft.fftshift(f_transform)

        # Get magnitude spectrum
        magnitude = np.abs(f_shift)

        # Normalize for display/analysis
        magnitude_normalized = magnitude / np.max(magnitude)

        # Find dominant frequencies (excluding DC component at center)
        rows, cols = self.grayscale.shape
        center_row, center_col = rows // 2, cols // 2

        # Create mask to exclude DC component and low frequencies
        mask = np.ones_like(magnitude, dtype=bool)
        mask[center_row-5:center_row+5, center_col-5:center_col+5] = False

        # Find peaks in frequency domain
        masked_magnitude = magnitude_normalized.copy()
        masked_magnitude[~mask] = 0

        # Get indices of top frequencies
        flat_magnitude = masked_magnitude.flatten()
        top_indices = np.argpartition(flat_magnitude, -max_frequencies)[-max_frequencies:]

        # Convert back to 2D coordinates and then to frequency values
        dominant_freqs = []
        for idx in top_indices:
            if flat_magnitude[idx] > 0.01:  # Threshold for significance
                y, x = np.unravel_index(idx, magnitude.shape)
                # Convert to frequency (relative to center)
                freq_y = (y - center_row) / rows
                freq_x = (x - center_col) / cols
                dominant_freqs.append((freq_x, freq_y))

        # Find the dominant frequency (highest magnitude)
        if dominant_freqs:
            # Get the actual max frequency
            max_idx = np.unravel_index(np.argmax(masked_magnitude), magnitude.shape)
            dominant_frequency = (
                (max_idx[1] - center_col) / cols,
                (max_idx[0] - center_row) / rows
            )
        else:
            dominant_frequency = (0.0, 0.0)

        # Detect periodic regions
        # High magnitude away from DC indicates periodicity
        periodic_threshold = np.mean(masked_magnitude) + 2 * np.std(masked_magnitude)
        has_periodic = np.max(masked_magnitude) > periodic_threshold

        periodic_regions = []
        if has_periodic:
            # Find regions with significant frequency content
            from scipy.ndimage import label as ndimage_label
            binary_regions = masked_magnitude > periodic_threshold
            labeled, num_features = ndimage_label(binary_regions)

            for i in range(1, min(num_features + 1, max_frequencies)):
                region_mask = labeled == i
                region_magnitude = masked_magnitude[region_mask]
                center_of_mass = np.mean(np.argwhere(region_mask), axis=0)

                # Convert center of mass to frequency
                freq_y = (center_of_mass[0] - center_row) / rows
                freq_x = (center_of_mass[1] - center_col) / cols

                periodic_regions.append({
                    'frequency_x': float(freq_x),
                    'frequency_y': float(freq_y),
                    'magnitude': float(np.max(region_magnitude)),
                    'size_pixels': int(np.sum(region_mask))
                })

        # Sort by magnitude
        periodic_regions.sort(key=lambda x: x['magnitude'], reverse=True)

        return FourierAnalysisResult(
            frequencies=masked_magnitude,
            magnitude=magnitude_normalized,
            dominant_frequency=dominant_frequency,
            periodic_regions=periodic_regions[:max_frequencies],
            has_periodic_patterns=has_periodic
        )
```

Add to `analyze_fourier` method in `systems/pixel_compiler/pattern_detector.py`

**Step 4: Run tests to verify they pass**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler
python3 -m pytest tests/test_pattern_detector.py::test_fourier_analysis_detects_periodicity tests/test_pattern_detector.py::test_fourier_analysis_on_noise -v
```

Expected: Both tests `PASSED`

**Step 5: Commit**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os
git add systems/pixel_compiler/pattern_detector.py systems/pixel_compiler/tests/test_pattern_detector.py
git commit -m "feat(vision): implement Fourier analysis for periodic pattern detection"
```

---

## Task 4: Implement DBSCAN Clustering for Region Detection

**Files:**
- Modify: `systems/pixel_compiler/pattern_detector.py` (implement detect_clusters)
- Test: `systems/pixel_compiler/tests/test_pattern_detector.py`

**Step 1: Write failing test for spatial clustering**

```python
# tests/test_pattern_detector.py

def test_spatial_clustering_detects_regions():
    """Test that DBSCAN detects spatial clusters of similar pixels."""
    from pattern_detector import PatternDetector

    # Create image with two distinct bright regions
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    # Region 1: top-left quadrant
    img_array[0:32, 0:32, :] = [200, 200, 200, 255]
    # Region 2: bottom-right quadrant
    img_array[32:64, 32:64, :] = [200, 200, 200, 255]
    # Background: dark
    # (already zeros)

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        detector = PatternDetector(temp_path)
        result = detector.detect_clusters(eps=5, min_samples=20, feature_type="position")

        assert hasattr(result, 'num_clusters')
        assert result.num_clusters >= 2  # Should detect at least the two bright regions
        assert hasattr(result, 'cluster_centers')
        assert len(result.cluster_centers) >= 2
    finally:
        Path(temp_path).unlink()


def test_color_clustering_groups_similar_colors():
    """Test that color-based clustering groups pixels with similar colors."""
    from pattern_detector import PatternDetector

    # Create image with three color regions
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    # Red region
    img_array[0:21, :, :] = [255, 0, 0, 255]
    # Green region
    img_array[21:43, :, :] = [0, 255, 0, 255]
    # Blue region
    img_array[43:64, :, :] = [0, 0, 255, 255]

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        detector = PatternDetector(temp_path)
        result = detector.detect_clusters(eps=10, min_samples=50, feature_type="color")

        # Should detect the three color bands
        assert result.num_clusters >= 2
    finally:
        Path(temp_path).unlink()
```

Add to file: `systems/pixel_compiler/tests/test_pattern_detector.py`

**Step 2: Run tests to verify they fail**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler
python3 -m pytest tests/test_pattern_detector.py::test_spatial_clustering_detects_regions -v
```

Expected: `NotImplementedError: Implement in Task 4`

**Step 3: Implement DBSCAN clustering**

```python
# pattern_detector.py - Add to PatternDetector class

    def detect_clusters(
        self,
        eps: float = 5.0,
        min_samples: int = 10,
        feature_type: str = "position"
    ) -> ClusterResult:
        """
        Detect clusters of similar pixels using DBSCAN.

        Args:
            eps: Maximum distance between samples in cluster
            min_samples: Minimum samples in cluster
            feature_type: "position" (spatial clustering) or "color" (RGB similarity)

        Returns:
            ClusterResult with detected clusters
        """
        if feature_type == "position":
            return self._cluster_by_position(eps, min_samples)
        elif feature_type == "color":
            return self._cluster_by_color(eps, min_samples)
        else:
            raise ValueError(f"Unknown feature_type: {feature_type}")

    def _cluster_by_position(self, eps: float, min_samples: int) -> ClusterResult:
        """Cluster pixels by spatial position and brightness."""
        # Get bright pixels (above mean brightness)
        grayscale_normalized = self.grayscale.astype(np.float32) / 255.0
        mean_brightness = np.mean(grayscale_normalized)
        bright_mask = grayscale_normalized > mean_brightness

        # Get coordinates of bright pixels
        bright_coords = np.column_stack(np.where(bright_mask))

        if len(bright_coords) < min_samples:
            return ClusterResult(
                num_clusters=0,
                cluster_labels=np.array([]),
                cluster_centers=[],
                regions_of_interest=[],
                noise_points=len(bright_coords)
            )

        # Apply DBSCAN
        clustering = DBSCAN(eps=eps, min_samples=min_samples).fit(bright_coords)
        labels = clustering.labels_

        # Count clusters (noise is labeled -1)
        unique_labels = set(labels)
        n_clusters = len(unique_labels) - (1 if -1 in labels else 0)
        noise_count = np.sum(labels == -1)

        # Find cluster centers
        cluster_centers = []
        regions_of_interest = []

        for label in unique_labels:
            if label == -1:
                continue

            cluster_mask = labels == label
            cluster_points = bright_coords[cluster_mask]

            # Calculate center (mean of points)
            center = np.mean(cluster_points, axis=0)
            cluster_centers.append((float(center[1]), float(center[0])))  # (x, y)

            # Calculate bounding box
            min_y, min_x = np.min(cluster_points, axis=0)
            max_y, max_x = np.max(cluster_points, axis=0)

            # Calculate average brightness in cluster
            cluster_brightness = np.mean([
                grayscale_normalized[y, x]
                for y, x in cluster_points
            ])

            regions_of_interest.append({
                'cluster_id': int(label),
                'center_x': float(center[1]),
                'center_y': float(center[0]),
                'bounding_box': {
                    'min_x': int(min_x),
                    'max_x': int(max_x),
                    'min_y': int(min_y),
                    'max_y': int(max_y)
                },
                'pixel_count': int(np.sum(cluster_mask)),
                'avg_brightness': float(cluster_brightness)
            })

        return ClusterResult(
            num_clusters=n_clusters,
            cluster_labels=labels,
            cluster_centers=cluster_centers,
            regions_of_interest=regions_of_interest,
            noise_points=int(noise_count)
        )

    def _cluster_by_color(self, eps: float, min_samples: int) -> ClusterResult:
        """Cluster pixels by RGB color similarity."""
        # Reshape image to list of RGB pixels
        rgb_pixels = self.image[:, :, :3].reshape(-1, 3)

        # Apply DBSCAN on RGB values
        clustering = DBSCAN(eps=eps, min_samples=min_samples).fit(rgb_pixels)
        labels = clustering.labels_

        # Count clusters
        unique_labels = set(labels)
        n_clusters = len(unique_labels) - (1 if -1 in labels else 0)
        noise_count = np.sum(labels == -1)

        # Find cluster centers in RGB space
        cluster_centers = []
        regions_of_interest = []

        for label in unique_labels:
            if label == -1:
                continue

            cluster_mask = labels == label
            cluster_pixels = rgb_pixels[cluster_mask]

            # Mean RGB color
            mean_color = np.mean(cluster_pixels, axis=0)
            cluster_centers.append(tuple(mean_color))

            # Get spatial extent of this color cluster
            cluster_indices = np.where(cluster_mask.reshape(self.height, self.width))
            min_y, min_x = np.min(cluster_indices, axis=1)
            max_y, max_x = np.max(cluster_indices, axis=1)

            regions_of_interest.append({
                'cluster_id': int(label),
                'rgb_center': [float(c) for c in mean_color],
                'pixel_count': int(np.sum(cluster_mask)),
                'spatial_extent': {
                    'min_x': int(min_x),
                    'max_x': int(max_x),
                    'min_y': int(min_y),
                    'max_y': int(max_y)
                }
            })

        return ClusterResult(
            num_clusters=n_clusters,
            cluster_labels=labels,
            cluster_centers=cluster_centers,
            regions_of_interest=regions_of_interest,
            noise_points=int(noise_count)
        )
```

Add to `detect_clusters` method in `systems/pixel_compiler/pattern_detector.py`

**Step 4: Run tests to verify they pass**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler
python3 -m pytest tests/test_pattern_detector.py::test_spatial_clustering_detects_regions tests/test_pattern_detector.py::test_color_clustering_groups_similar_colors -v
```

Expected: Both tests `PASSED`

**Step 5: Commit**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os
git add systems/pixel_compiler/pattern_detector.py systems/pixel_compiler/tests/test_pattern_detector.py
git commit -m "feat(vision): implement DBSCAN clustering for region detection"
```

---

## Task 5: Integrate Pattern Detection with Vision Analyzer

**Files:**
- Modify: `systems/pixel_compiler/pixelrts_vision_analyzer.py` (add pattern detection methods)
- Test: `systems/pixel_compiler/tests/test_pixelrts_vision_analyzer_integration.py`

**Step 1: Write failing test for integrated pattern detection**

```python
# tests/test_pixelrts_vision_analyzer_integration.py

def test_vision_analyzer_detects_patterns():
    """Test that vision analyzer can use pattern detector."""
    import tempfile
    from pathlib import Path
    from pixelrts_vision_analyzer import PixelRTSVisionAnalyzer

    # Create test image with patterns
    import numpy as np
    from PIL import Image
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)

    # Add gradient pattern
    for y in range(64):
        for x in range(64):
            img_array[y, x] = [x * 4, y * 4, 128, 255]

    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    # Create metadata sidecar
    import json
    meta_path = Path(temp_path).with_suffix('.meta.json')
    with open(meta_path, 'w') as f:
        json.dump({"format": "test"}, f)

    try:
        analyzer = PixelRTSVisionAnalyzer(temp_path)

        # Test edge detection
        edges = analyzer.detect_edges(method='sobel')
        assert 'edges' in edges
        assert 'edge_count' in edges

        # Test Fourier analysis
        fourier = analyzer.analyze_fourier()
        assert 'dominant_frequency' in fourier

        # Test clustering
        clusters = analyzer.detect_clusters(feature_type='position')
        assert 'num_clusters' in clusters

    finally:
        Path(temp_path).unlink()
        meta_path.unlink()
```

Add to file: `systems/pixel_compiler/tests/test_pixelrts_vision_analyzer_integration.py`

**Step 2: Run test to verify it fails**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler
python3 -m pytest tests/test_pixelrts_vision_analyzer_integration.py::test_vision_analyzer_detects_patterns -v
```

Expected: `AttributeError: 'PixelRTSVisionAnalyzer' object has no attribute 'detect_edges'`

**Step 3: Integrate pattern detection into vision analyzer**

```python
# pixelrts_vision_analyzer.py - Add to PixelRTSVisionAnalyzer class

try:
    from pattern_detector import PatternDetector, EdgeDetectionResult, FourierAnalysisResult, ClusterResult
except ImportError:
    PatternDetector = None
    EdgeDetectionResult = None
    FourierAnalysisResult = None
    ClusterResult = None

# Add after the __init__ method:

    def detect_edges(
        self,
        method: str = 'sobel',
        **kwargs
    ) -> Dict[str, Any]:
        """
        Detect edges in the PixelRTS image.

        Args:
            method: 'sobel' or 'canny'
            **kwargs: Additional arguments passed to the detection method

        Returns:
            Dictionary with detection results

        Raises:
            ImportError: If pattern_detector is not available
        """
        if PatternDetector is None:
            raise ImportError(
                "Pattern detection requires opencv-python, scikit-learn, and scipy. "
                "Install with: pip install opencv-python scikit-learn scipy"
            )

        detector = PatternDetector(self.rts_path)

        if method == 'sobel':
            result = detector.detect_edges_sobel(**kwargs)
        elif method == 'canny':
            result = detector.detect_edges_canny(**kwargs)
        else:
            raise ValueError(f"Unknown edge detection method: {method}")

        # Convert to dict for JSON serialization
        return {
            'method': result.method,
            'edge_count': result.edge_count,
            'edge_density': result.edge_density,
            'strong_edges_count': len(result.strong_edges),
            'metadata': result.metadata
        }

    def analyze_fourier(
        self,
        max_frequencies: int = 10
    ) -> Dict[str, Any]:
        """
        Analyze periodic patterns using Fourier transform.

        Args:
            max_frequencies: Maximum number of dominant frequencies to return

        Returns:
            Dictionary with Fourier analysis results

        Raises:
            ImportError: If pattern_detector is not available
        """
        if PatternDetector is None:
            raise ImportError(
                "Pattern detection requires opencv-python, scikit-learn, and scipy. "
                "Install with: pip install opencv-python scikit-learn scipy"
            )

        detector = PatternDetector(self.rts_path)
        result = detector.analyze_fourier(max_frequencies=max_frequencies)

        return {
            'dominant_frequency': result.dominant_frequency,
            'has_periodic_patterns': result.has_periodic_patterns,
            'periodic_regions': result.periodic_regions
        }

    def detect_clusters(
        self,
        eps: float = 5.0,
        min_samples: int = 10,
        feature_type: str = "position"
    ) -> Dict[str, Any]:
        """
        Detect clusters of similar pixels.

        Args:
            eps: Maximum distance between samples in cluster
            min_samples: Minimum samples in cluster
            feature_type: 'position' or 'color'

        Returns:
            Dictionary with clustering results

        Raises:
            ImportError: If pattern_detector is not available
        """
        if PatternDetector is None:
            raise ImportError(
                "Pattern detection requires opencv-python, scikit-learn, and scipy. "
                "Install with: pip install opencv-python scikit-learn scipy"
            )

        detector = PatternDetector(self.rts_path)
        result = detector.detect_clusters(eps=eps, min_samples=min_samples, feature_type=feature_type)

        return {
            'num_clusters': result.num_clusters,
            'cluster_centers': result.cluster_centers,
            'regions_of_interest': result.regions_of_interest,
            'noise_points': result.noise_points
        }

    def generate_pattern_overlay(
        self,
        output_dir: str,
        edge_method: str = 'sobel',
        show_clusters: bool = True,
        show_edges: bool = True
    ) -> str:
        """
        Generate overlay visualization with detected patterns.

        Args:
            output_dir: Directory to save overlay
            edge_method: Edge detection method to use
            show_clusters: Whether to highlight cluster regions
            show_edges: Whether to highlight detected edges

        Returns:
            Path to generated overlay image

        Raises:
            ImportError: If pattern_detector is not available
        """
        if PatternDetector is None:
            raise ImportError(
                "Pattern detection requires opencv-python, scikit-learn, and scipy. "
                "Install with: pip install opencv-python scikit-learn scipy"
            )

        import matplotlib.pyplot as plt
        import matplotlib.patches as patches

        detector = PatternDetector(self.rts_path)

        # Create figure with subplots
        fig, axes = plt.subplots(1, 2, figsize=(14, 6))

        # Original image
        axes[0].imshow(self.image)
        axes[0].set_title('Original')
        axes[0].axis('off')

        # Pattern overlay
        axes[1].imshow(self.image)
        axes[1].set_title('Detected Patterns')
        axes[1].axis('off')

        # Add edge detection overlay
        if show_edges:
            if edge_method == 'sobel':
                edge_result = detector.detect_edges_sobel()
            else:
                edge_result = detector.detect_edges_canny()

            # Create semi-transparent edge overlay
            edge_overlay = np.zeros_like(self.image)
            edge_overlay[edge_result.edges > 0] = [255, 255, 0, 128]  # Yellow edges

        # Add cluster overlay
        if show_clusters:
            cluster_result = detector.detect_clusters(feature_type='position')

            for region in cluster_result.regions_of_interest:
                bbox = region['bounding_box']
                # Draw rectangle around cluster
                rect = patches.Rectangle(
                    (bbox['min_x'], bbox['min_y']),
                    bbox['max_x'] - bbox['min_x'],
                    bbox['max_y'] - bbox['min_y'],
                    linewidth=2,
                    edgecolor='red',
                    facecolor='none'
                )
                axes[1].add_patch(rect)

                # Add cluster label
                axes[1].text(
                    region['center_x'],
                    region['center_y'],
                    f"C{region['cluster_id']}",
                    color='white',
                    fontsize=8,
                    bbox=dict(boxstyle='round,pad=0.3', facecolor='red', alpha=0.7)
                )

        plt.tight_layout()

        # Save figure
        output_path = Path(output_dir)
        output_path.mkdir(parents=True, exist_ok=True)

        overlay_file = output_path / f"{Path(self.rts_path).stem}_pattern_overlay.png"
        plt.savefig(overlay_file, bbox_inches='tight', dpi=150)
        plt.close(fig)

        return str(overlay_file)
```

Add to `systems/pixel_compiler/pixelrts_vision_analyzer.py`

**Step 4: Run test to verify it passes**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler
python3 -m pytest tests/test_pixelrts_vision_analyzer_integration.py::test_vision_analyzer_detects_patterns -v
```

Expected: `PASSED`

**Step 5: Commit**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os
git add systems/pixel_compiler/pixelrts_vision_analyzer.py systems/pixel_compiler/tests/test_pixelrts_vision_analyzer_integration.py
git commit -m "feat(vision): integrate pattern detection with vision analyzer"
```

---

## Task 6: Add Pattern Detection to CLI

**Files:**
- Modify: `systems/pixel_compiler/pixelrts_vision_cli.py`
- Test: `systems/pixel_compiler/tests/test_pixelrts_vision_cli.py`

**Step 1: Write failing test for CLI pattern detection**

```python
# tests/test_pixelrts_vision_cli.py

def test_cli_generates_pattern_overlay():
    """Test that CLI can generate pattern overlay."""
    import subprocess
    import tempfile
    from pathlib import Path
    from PIL import Image
    import numpy as np

    # Create test image
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    img_array[16:48, 16:48, :] = [255, 255, 255, 255]

    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False, dir='.') as f:
        Image.fromarray(img_array).save(f)
        rts_path = f.name

    # Create metadata
    import json
    meta_path = Path(rts_path).with_suffix('.meta.json')
    with open(meta_path, 'w') as f:
        json.dump({"format": "test"}, f)

    # Create output directory
    out_dir = tempfile.mkdtemp()

    try:
        result = subprocess.run(
            ['python3', CLI_PATH, rts_path, '--patterns-only', '--output', out_dir],
            capture_output=True,
            text=True
        )

        # Should not error
        assert result.returncode == 0, f"CLI failed: {result.stderr}"

        # Check overlay file exists
        overlay_path = Path(out_dir) / f"{Path(rts_path).stem}_pattern_overlay.png"
        assert overlay_path.exists(), f"Overlay not created: {overlay_path}"

    finally:
        Path(rts_path).unlink()
        meta_path.unlink()
        import shutil
        shutil.rmtree(out_dir)
```

Add to file: `systems/pixel_compiler/tests/test_pixelrts_vision_cli.py`

**Step 2: Run test to verify it fails**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler
python3 -m pytest tests/test_pixelrts_vision_cli.py::test_cli_generates_pattern_overlay -v
```

Expected: `SystemExit: 2` (unrecognized argument: --patterns-only)

**Step 3: Add pattern detection options to CLI**

```python
# pixelrts_vision_cli.py - Modify argument parser

def parse_args(argv=None):
    """Parse command-line arguments."""
    parser = argparse.ArgumentParser(
        description="Analyze PixelRTS artifacts with vision models"
    )
    parser.add_argument(
        'rts_file',
        type=str,
        help='Path to .rts.png file'
    )
    parser.add_argument(
        '--provider',
        choices=['lm_studio', 'openai', 'anthropic'],
        default='lm_studio',
        help='Vision model provider'
    )
    parser.add_argument(
        '--api-key',
        type=str,
        default=None,
        help='API key for provider'
    )
    parser.add_argument(
        '--output',
        type=str,
        default='output',
        help='Output directory'
    )
    parser.add_argument(
        '--dry-run',
        action='store_true',
        help='Skip vision model API calls'
    )
    parser.add_argument(
        '--overlays-only',
        action='store_true',
        help='Generate overlays only, skip vision analysis'
    )
    # ADD NEW ARGUMENTS:
    parser.add_argument(
        '--patterns-only',
        action='store_true',
        help='Generate pattern detection overlay only'
    )
    parser.add_argument(
        '--edge-method',
        choices=['sobel', 'canny'],
        default='sobel',
        help='Edge detection method'
    )
    parser.add_argument(
        '--show-clusters',
        action='store_true',
        default=True,
        help='Show cluster regions in overlay'
    )
    parser.add_argument(
        '--no-clusters',
        action='store_true',
        help='Hide cluster regions in overlay'
    )

    return parser.parse_args(argv)
```

Modify `parse_args` in `systems/pixel_compiler/pixelrts_vision_cli.py`

**Step 4: Add pattern detection to main function**

```python
# pixelrts_vision_cli.py - Modify main function

def main(argv=None):
    """Main CLI entry point."""
    args = parse_args(argv)

    # Validate rts_file is string (not PosixPath)
    rts_file = str(args.rts_file)

    if not Path(rts_file).exists():
        print(f"Error: File not found: {rts_file}")
        return 1

    # Create output directory
    output_dir = Path(args.output)
    output_dir.mkdir(parents=True, exist_ok=True)
    output_dir_str = str(output_dir)

    # Load analyzer
    try:
        analyzer = PixelRTSVisionAnalyzer(rts_file)
    except Exception as e:
        print(f"Error loading RTS file: {e}")
        return 1

    # ADD: Pattern-only mode
    if args.patterns_only:
        print(f"[*] Generating pattern detection overlay...")
        try:
            show_clusters = args.show_clusters and not args.no_clusters
            overlay_path = analyzer.generate_pattern_overlay(
                output_dir_str,
                edge_method=args.edge_method,
                show_clusters=show_clusters,
                show_edges=True
            )
            print(f"    Saved: {overlay_path}")

            # Also output pattern statistics
            print("\n[*] Pattern Statistics:")

            # Edge detection
            edges = analyzer.detect_edges(method=args.edge_method)
            print(f"    Edge Detection ({args.edge_method}):")
            print(f"      - Edge count: {edges['edge_count']}")
            print(f"      - Edge density: {edges['edge_density']:.3f}")

            # Fourier analysis
            fourier = analyzer.analyze_fourier()
            print(f"    Fourier Analysis:")
            print(f"      - Periodic patterns: {fourier['has_periodic_patterns']}")
            if fourier['dominant_frequency'] != (0.0, 0.0):
                print(f"      - Dominant frequency: {fourier['dominant_frequency']}")

            # Clustering
            clusters = analyzer.detect_clusters(feature_type='position')
            print(f"    Spatial Clustering:")
            print(f"      - Clusters found: {clusters['num_clusters']}")
            print(f"      - Noise points: {clusters['noise_points']}")

            return 0
        except Exception as e:
            print(f"    Error: {e}")
            return 1

    # ... existing code continues ...
```

Modify `main` function in `systems/pixel_compiler/pixelrts_vision_cli.py`

**Step 5: Run test to verify it passes**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler
python3 -m pytest tests/test_pixelrts_vision_cli.py::test_cli_generates_pattern_overlay -v
```

Expected: `PASSED`

**Step 6: Commit**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os
git add systems/pixel_compiler/pixelrts_vision_cli.py systems/pixel_compiler/tests/test_pixelrts_vision_cli.py
git commit -m "feat(vision): add pattern detection options to CLI"
```

---

## Task 7: Documentation and Usage Guide

**Files:**
- Create: `docs/pixelrts/PATTERN_DETECTION_GUIDE.md`
- Update: `docs/pixelrts/VISION_ANALYSIS_GUIDE.md`

**Step 1: Write pattern detection guide**

```markdown
# PixelRTS Pattern Detection Guide

## Overview

The Pattern Detection module provides computer vision algorithms for analyzing structural patterns in PixelRTS visual artifacts. It can detect edges, identify periodic patterns, and cluster similar regions.

## Features

### 1. Edge Detection
- **Sobel**: Gradient-based edge detection
- **Canny**: Multi-stage edge detection with hysteresis thresholding

### 2. Fourier Analysis
- Detects periodic/repeating structures
- Identifies dominant frequencies in the image
- Finds regions with regular patterns

### 3. Clustering
- **Spatial Clustering**: Groups nearby bright pixels into regions
- **Color Clustering**: Groups pixels with similar RGB values

## Installation

Pattern detection requires additional dependencies:

```bash
pip install opencv-python scikit-learn scipy
```

## Usage

### Python API

```python
from pixelrts_vision_analyzer import PixelRTSVisionAnalyzer

# Load an artifact
analyzer = PixelRTSVisionAnalyzer("ubuntu_kernel.rts.png")

# Detect edges
edges = analyzer.detect_edges(method='sobel')
print(f"Found {edges['edge_count']} edge pixels")
print(f"Edge density: {edges['edge_density']:.3f}")

# Analyze periodic patterns
fourier = analyzer.analyze_fourier()
if fourier['has_periodic_patterns']:
    print("Periodic patterns detected!")
    print(f"Dominant frequency: {fourier['dominant_frequency']}")
    for region in fourier['periodic_regions']:
        print(f"  - Region at freq ({region['frequency_x']:.3f}, {region['frequency_y']:.3f})")

# Detect clusters
clusters = analyzer.detect_clusters(feature_type='position')
print(f"Found {clusters['num_clusters']} clusters")
for region in clusters['regions_of_interest']:
    print(f"  - Cluster {region['cluster_id']}: {region['pixel_count']} pixels")

# Generate pattern overlay
overlay_path = analyzer.generate_pattern_overlay(
    output_dir="./output",
    edge_method='sobel',
    show_clusters=True,
    show_edges=True
)
print(f"Overlay saved to: {overlay_path}")
```

### CLI Usage

```bash
# Generate pattern overlay only
python3 systems/pixel_compiler/pixelrts_vision_cli.py \
    ubuntu_kernel.rts.png \
    --patterns-only \
    --output ./output

# Use Canny edge detection
python3 systems/pixel_compiler/pixelrts_vision_cli.py \
    ubuntu_kernel.rts.png \
    --patterns-only \
    --edge-method canny

# Hide cluster regions
python3 systems/pixel_compiler/pixelrts_vision_cli.py \
    ubuntu_kernel.rts.png \
    --patterns-only \
    --no-clusters
```

## Interpreting Results

### Edge Detection
- **Edge count**: Total number of edge pixels detected
- **Edge density**: Proportion of image that is edges (0-1)
- **High edge density**: May indicate complex structure or noise
- **Low edge density**: May indicate uniform regions

### Fourier Analysis
- **Periodic patterns**: True if strong frequency components detected
- **Dominant frequency**: (x, y) frequency with highest magnitude
- **Periodic regions**: List of significant frequency components

### Clustering
- **Number of clusters**: Distinct regions detected
- **Cluster centers**: Central coordinates of each cluster
- **Bounding boxes**: Spatial extent of each cluster

## Common Patterns in Binary Visualizations

### Structured Code
- Regular grid patterns (detected by Fourier analysis)
- Clear boundaries between sections (detected by edge detection)

### Compressed Data
- High entropy throughout (few clear edges)
- Uniform color distribution (few clusters)

### Metadata/Headers
- Distinct regions at image boundaries
- Different color/entropy than surrounding areas

## Performance Considerations

- Edge detection: O(n) where n is number of pixels
- Fourier analysis: O(n log n) due to FFT
- Clustering: O(n²) in worst case, depends on eps parameter

For large images (>1024x1024), consider downsampling first.
```

Create file: `docs/pixelrts/PATTERN_DETECTION_GUIDE.md`

**Step 2: Update vision analysis guide to include patterns**

```markdown
# Vision Analysis Guide

## Pattern Detection

[Link to PATTERN_DETECTION_GUIDE.md]

## Quick Reference

| Feature | Method | Use Case |
|---------|--------|----------|
| Edge Detection | `detect_edges(method='sobel')` | Find boundaries in binary structures |
| Fourier Analysis | `analyze_fourier()` | Detect repeating patterns (compressed data, arrays) |
| Clustering | `detect_clusters(feature_type='position')` | Find distinct regions (code sections, data segments) |
| Pattern Overlay | `generate_pattern_overlay()` | Visual summary of all patterns |
```

Append to `docs/pixelrts/VISION_ANALYSIS_GUIDE.md`

**Step 3: Commit**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os
git add docs/pixelrts/PATTERN_DETECTION_GUIDE.md docs/pixelrts/VISION_ANALYSIS_GUIDE.md
git commit -m "docs(vision): add pattern detection guide and update vision analysis docs"
```

---

## Summary

This plan implements Phase 1.1: Advanced Pattern Detection for the PixelRTS Vision Analysis pipeline.

**Total tasks**: 7
**Estimated time**: 4-6 hours
**Key technologies**: OpenCV, scikit-learn, SciPy, NumPy

### Deliverables

1. **pattern_detector.py** - Core pattern detection module
   - Sobel and Canny edge detection
   - Fourier transform for periodic patterns
   - DBSCAN clustering for region detection

2. **Integration** - Extended vision analyzer
   - New methods: `detect_edges()`, `analyze_fourier()`, `detect_clusters()`
   - Pattern overlay generation

3. **CLI Enhancement**
   - `--patterns-only` flag for pattern analysis
   - `--edge-method` selection
   - `--show-clusters` / `--no-clusters` options

4. **Documentation**
   - Pattern Detection Guide
   - Updated Vision Analysis Guide
   - Usage examples

### Testing

- 10+ new tests in `test_pattern_detector.py`
- Integration tests in `test_pixelrts_vision_analyzer_integration.py`
- CLI tests in `test_pixelrts_vision_cli.py`

### Next Steps (Phase 1.2)

After completing this plan, the next phase would be:
- Machine learning integration (binary region classification)
- Unsupervised learning (dimensionality reduction, pattern discovery)
- Transfer learning with pre-trained vision transformers

---

Plan complete and saved to `docs/plans/2026-02-09-pixelrts-vision-phase1.1-advanced-pattern-detection.md`.

**Two execution options:**

**1. Subagent-Driven (this session)** - I dispatch fresh subagent per task, review between tasks, fast iteration

**2. Parallel Session (separate)** - Open new session with executing-plans, batch execution with checkpoints

**Which approach?**
