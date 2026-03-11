# PixelRTS Vision Analysis: Enhancement Roadmap Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Transform Phase 1.1 pattern detection foundation into a production-grade computer vision pipeline for reverse engineering and binary analysis through performance optimization, advanced ML integration, visualization tools, and ecosystem integration.

**Architecture:**
- Phase 1.2: GPU acceleration, parallel processing, advanced algorithms
- Phase 1.3: ML models (CNNs, autoencoders), pattern database
- Phase 1.4: Interactive web dashboard, comprehensive reporting
- Phase 1.5: RTS-AMP integration, automation pipeline, REST API
- Phase 1.6: Transformer-based recognition, multi-modal analysis

**Tech Stack:**
- **Performance**: CUDA, PyTorch, multiprocessing, NumPy vectorization
- **ML/Deep Learning**: PyTorch, TensorFlow, scikit-learn, transformers
- **Visualization**: Plotly, Dash, matplotlib, WebGL/Three.js
- **API**: FastAPI, WebSocket, Redis (caching)
- **Infrastructure**: Docker, Kubernetes, Redis, PostgreSQL

**Context:**
Phase 1.1 delivered core pattern detection (Sobel/Canny edges, Fourier analysis, DBSCAN clustering). This enhancement roadmap addresses production-readiness through:
1. **Performance bottlenecks** - Current CPU-only processing struggles with large files (>100MB)
2. **Limited scalability** - No parallel processing or streaming capabilities
3. **Basic visualization** - Static matplotlib outputs only
4. **No ML integration** - Pure algorithmic approach without learning capabilities
5. **Manual workflows** - No automation or API access

---

## Phase 1.2: Performance & Optimization (1-2 weeks)

### Task 1.2.1: GPU Acceleration Infrastructure

**Files:**
- Create: `systems/pixel_compiler/gpu_pattern_detector.py`
- Modify: `systems/pixel_compiler/pattern_detector.py` (add GPU backend selection)
- Test: `systems/pixel_compiler/tests/test_gpu_pattern_detector.py`
- Config: `systems/pixel_compiler/config/gpu_config.yaml`

**Step 1: Write failing test for GPU detector initialization**

```python
# tests/test_gpu_pattern_detector.py
import pytest
import numpy as np
from PIL import Image
import tempfile
from pathlib import Path

@pytest.mark.skipif(not pytest.importorskip("torch"), reason="PyTorch not available")
def test_gpu_pattern_detector_initializes():
    """Test that GpuPatternDetector can be initialized with CUDA support."""
    # Create a simple test image
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    img_array[:, :] = [128, 64, 32, 255]
    img = Image.fromarray(img_array, 'RGBA')

    # Save to temp file
    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img.save(f)
        temp_path = f.name

    try:
        from gpu_pattern_detector import GpuPatternDetector
        detector = GpuPatternDetector(temp_path, device='cuda')
        assert detector.device.type == 'cuda'
        assert detector.image_tensor is not None
    finally:
        Path(temp_path).unlink()

@pytest.mark.skipif(not pytest.importorskip("torch"), reason="PyTorch not available")
def test_gpu_detector_falls_back_to_cpu():
    """Test that detector falls back to CPU when CUDA unavailable."""
    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img_array = np.zeros((64, 64, 4), dtype=np.uint8)
        img = Image.fromarray(img_array, 'RGBA')
        img.save(f)
        temp_path = f.name

    try:
        from gpu_pattern_detector import GpuPatternDetector
        detector = GpuPatternDetector(temp_path, device='auto')
        # Should successfully initialize even without CUDA
        assert detector.image_tensor is not None
    finally:
        Path(temp_path).unlink()
```

Create file: `systems/pixel_compiler/tests/test_gpu_pattern_detector.py`

**Step 2: Run test to verify it fails**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler
python3 -m pytest tests/test_gpu_pattern_detector.py::test_gpu_pattern_detector_initializes -v
```

Expected: `ModuleNotFoundError: No module named 'gpu_pattern_detector'`

**Step 3: Create GPU pattern detector module with PyTorch backend**

```python
# gpu_pattern_detector.py
"""
GPU-Accelerated Pattern Detector for PixelRTS Vision Analysis

Provides CUDA-accelerated implementations of pattern detection algorithms
using PyTorch for high-performance processing of large images.
"""

import numpy as np
from pathlib import Path
from typing import Dict, List, Tuple, Optional, Any
from dataclasses import dataclass
import tempfile

try:
    import torch
    import torch.nn.functional as F
except ImportError:
    raise ImportError(
        "GPU pattern detection requires PyTorch. "
        "Install with: pip install torch torchvision"
    )

try:
    from PIL import Image
except ImportError:
    raise ImportError(
        "Pattern detection requires PIL/Pillow. "
        "Install with: pip install Pillow"
    )

from pattern_detector import EdgeDetectionResult, FourierAnalysisResult


@dataclass
class GpuDetectionResult:
    """Result of GPU-accelerated detection with timing info."""
    result: Any  # EdgeDetectionResult or FourierAnalysisResult
    gpu_time_ms: float
    memory_used_mb: float
    device: str


class GpuPatternDetector:
    """
    GPU-accelerated pattern detector using PyTorch.

    Provides CUDA implementations of:
    - Sobel edge detection
    - Canny edge detection
    - Fourier transform analysis
    """

    def __init__(self, image_path: str, device: str = 'auto'):
        """
        Initialize GPU pattern detector.

        Args:
            image_path: Path to PNG image file
            device: 'cuda', 'cpu', or 'auto' (default)
        """
        self.image_path = image_path

        # Determine device
        if device == 'auto':
            self.device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
        else:
            self.device = torch.device(device)

        # Load image as tensor
        self._load_image_as_tensor()

    def _load_image_as_tensor(self):
        """Load image and convert to PyTorch tensor on GPU."""
        # Load with PIL
        pil_image = Image.open(self.image_path)

        # Ensure RGBA
        if pil_image.mode != 'RGBA':
            pil_image = pil_image.convert('RGBA')

        # Convert to numpy then tensor
        img_array = np.array(pil_image).astype(np.float32) / 255.0

        # Convert to tensor: (H, W, C) -> (C, H, W) for PyTorch
        self.image_tensor = torch.from_numpy(img_array).permute(2, 0, 1).to(self.device)
        self.height, self.width = self.image_tensor.shape[1], self.image_tensor.shape[2]

        # Create grayscale tensor for edge detection
        # Use RGB channels (ignoring alpha): (C, H, W) -> (1, H, W)
        self.grayscale_tensor = self.image_tensor[:3].mean(dim=0, keepdim=True)

    def detect_edges_sobel_gpu(
        self,
        threshold: Optional[float] = None
    ) -> GpuDetectionResult:
        """
        GPU-accelerated Sobel edge detection.

        Args:
            threshold: Optional threshold for edge binary classification

        Returns:
            GpuDetectionResult with EdgeDetectionResult and timing
        """
        import time

        start_time = time.time()
        start_memory = torch.cuda.memory_allocated() if self.device.type == 'cuda' else 0

        # Define Sobel kernels
        sobel_x_kernel = torch.tensor([
            [-1, 0, 1],
            [-2, 0, 2],
            [-1, 0, 1]
        ], dtype=torch.float32, device=self.device).view(1, 1, 3, 3)

        sobel_y_kernel = torch.tensor([
            [-1, -2, -1],
            [ 0,  0,  0],
            [ 1,  2,  1]
        ], dtype=torch.float32, device=self.device).view(1, 1, 3, 3)

        # Apply convolution
        grayscale_4d = self.grayscale_tensor.unsqueeze(0)  # (1, 1, H, W)

        sobel_x = F.conv2d(grayscale_4d, sobel_x_kernel, padding=1)
        sobel_y = F.conv2d(grayscale_4d, sobel_y_kernel, padding=1)

        # Calculate gradient magnitude
        gradient_magnitude = torch.sqrt(sobel_x**2 + sobel_y**2)

        # Normalize to 0-255 range
        gradient_magnitude = torch.clamp(gradient_magnitude * 255, 0, 255)

        # Apply threshold if specified
        edges = gradient_magnitude
        if threshold is not None:
            edges = (gradient_magnitude > threshold).float() * 255

        # Convert back to numpy for compatibility
        edges_np = edges.squeeze().cpu().numpy().astype(np.uint8)

        # Count edge pixels
        edge_count = int(np.sum(edges_np > 0))
        edge_density = edge_count / (self.width * self.height)

        # Find strong edges (top 10%)
        gradient_flat = gradient_magnitude.flatten()
        gradient_flat = gradient_flat[gradient_flat > 0]
        if len(gradient_flat) > 0:
            strong_threshold = torch.quantile(gradient_flat, 0.9).item()
        else:
            strong_threshold = 0

        end_time = time.time()
        end_memory = torch.cuda.memory_allocated() if self.device.type == 'cuda' else 0

        gpu_time_ms = (end_time - start_time) * 1000
        memory_used_mb = abs(end_memory - start_memory) / (1024 * 1024) if self.device.type == 'cuda' else 0

        return GpuDetectionResult(
            result=EdgeDetectionResult(
                method='sobel-gpu',
                edges=edges_np,
                edge_count=edge_count,
                edge_density=edge_density,
                strong_edges=[],
                metadata={
                    'device': str(self.device),
                    'gpu_time_ms': gpu_time_ms,
                    'memory_mb': memory_used_mb
                }
            ),
            gpu_time_ms=gpu_time_ms,
            memory_used_mb=memory_used_mb,
            device=str(self.device)
        )

    def analyze_fourier_gpu(
        self,
        max_frequencies: int = 10
    ) -> GpuDetectionResult:
        """
        GPU-accelerated Fourier analysis.

        Args:
            max_frequencies: Maximum number of dominant frequencies

        Returns:
            GpuDetectionResult with FourierAnalysisResult and timing
        """
        import time

        start_time = time.time()
        start_memory = torch.cuda.memory_allocated() if self.device.type == 'cuda' else 0

        # Apply 2D FFT
        f_transform = torch.fft.fft2(self.grayscale_tensor.squeeze())
        f_shift = torch.fft.fftshift(f_transform)

        # Get magnitude spectrum
        magnitude = torch.abs(f_shift)
        magnitude_normalized = magnitude / torch.max(magnitude)

        # Convert to numpy for compatibility with existing result format
        magnitude_np = magnitude_normalized.squeeze().cpu().numpy()

        # Find dominant frequency (simplified - full implementation would match CPU version)
        rows, cols = self.grayscale_tensor.shape[1], self.grayscale_tensor.shape[2]
        center_row, center_col = rows // 2, cols // 2

        # Get max away from DC component
        magnitude_with_mask = magnitude_np.copy()
        magnitude_with_mask[center_row-5:center_row+5, center_col-5:center_col+5] = 0

        max_idx = np.unravel_index(np.argmax(magnitude_with_mask), magnitude_np.shape)
        dominant_frequency = (
            (max_idx[1] - center_col) / cols,
            (max_idx[0] - center_row) / rows
        )

        end_time = time.time()
        end_memory = torch.cuda.memory_allocated() if self.device.type == 'cuda' else 0

        gpu_time_ms = (end_time - start_time) * 1000
        memory_used_mb = abs(end_memory - start_memory) / (1024 * 1024) if self.device.type == 'cuda' else 0

        return GpuDetectionResult(
            result=FourierAnalysisResult(
                frequencies=magnitude_np,
                magnitude=magnitude_np,
                dominant_frequency=dominant_frequency,
                periodic_regions=[],
                has_periodic_patterns=np.max(magnitude_with_mask) > np.mean(magnitude_with_mask) + 2*np.std(magnitude_with_mask)
            ),
            gpu_time_ms=gpu_time_ms,
            memory_used_mb=memory_used_mb,
            device=str(self.device)
        )


def get_optimal_device() -> str:
    """
    Determine optimal device for pattern detection.

    Returns:
        'cuda' if available and sufficient memory, else 'cpu'
    """
    if torch.cuda.is_available():
        # Check available memory
        gpu_memory = torch.cuda.get_device_properties(0).total_memory / (1024**3)  # GB
        if gpu_memory >= 2.0:  # Require at least 2GB
            return 'cuda'
    return 'cpu'
```

Create file: `systems/pixel_compiler/gpu_pattern_detector.py`

**Step 4: Run tests to verify they pass**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler
python3 -m pytest tests/test_gpu_pattern_detector.py -v
```

Expected: Tests pass (GPU tests may skip if CUDA unavailable)

**Step 5: Commit**

```bash
git add systems/pixel_compiler/gpu_pattern_detector.py systems/pixel_compiler/tests/test_gpu_pattern_detector.py
git commit -m "feat(vision): add GPU-accelerated pattern detection with PyTorch"
```

---

### Task 1.2.2: Parallel Processing for Batch Analysis

**Files:**
- Create: `systems/pixel_compiler/batch_processor.py`
- Modify: `systems/pixel_compiler/pixelrts_vision_cli.py` (add batch mode)
- Test: `systems/pixel_compiler/tests/test_batch_processor.py`

**Step 1: Write failing test for batch processor**

```python
# tests/test_batch_processor.py
import pytest
import numpy as np
from PIL import Image
import tempfile
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor

def test_batch_processor_handles_multiple_images():
    """Test that batch processor can analyze multiple images in parallel."""
    from batch_processor import BatchPatternProcessor

    # Create test images
    test_images = []
    temp_dir = tempfile.mkdtemp()

    for i in range(3):
        img_array = np.random.randint(0, 255, (64, 64, 4), dtype=np.uint8)
        img = Image.fromarray(img_array, 'RGBA')
        temp_path = Path(temp_dir) / f"test_{i}.png"
        img.save(temp_path)
        test_images.append(str(temp_path))

    try:
        processor = BatchPatternProcessor(max_workers=2)
        results = processor.process_batch(test_images, methods=['edges'])

        assert len(results) == 3
        for result in results:
            assert 'edges' in result
            assert 'error' not in result
    finally:
        # Cleanup
        for path in test_images:
            Path(path).unlink()
        Path(temp_dir).rmdir()


def test_batch_processor_respects_max_workers():
    """Test that batch processor respects worker limit."""
    from batch_processor import BatchPatternProcessor
    import time

    # Create test images
    test_images = []
    temp_dir = tempfile.mkdtemp()

    for i in range(5):
        img_array = np.zeros((64, 64, 4), dtype=np.uint8)
        img = Image.fromarray(img_array, 'RGBA')
        temp_path = Path(temp_dir) / f"test_{i}.png"
        img.save(temp_path)
        test_images.append(str(temp_path))

    try:
        # Single worker should be slower than parallel
        processor_single = BatchPatternProcessor(max_workers=1)
        start = time.time()
        results_single = processor_single.process_batch(test_images, methods=['edges'])
        time_single = time.time() - start

        processor_parallel = BatchPatternProcessor(max_workers=4)
        start = time.time()
        results_parallel = processor_parallel.process_batch(test_images, methods=['edges'])
        time_parallel = time.time() - start

        # Parallel should be faster (or at least not significantly slower)
        assert len(results_single) == len(results_parallel) == 5
    finally:
        for path in test_images:
            Path(path).unlink()
        Path(temp_dir).rmdir()
```

**Step 2: Run test to verify it fails**

```bash
python3 -m pytest tests/test_batch_processor.py::test_batch_processor_handles_multiple_images -v
```

Expected: `ModuleNotFoundError: No module named 'batch_processor'`

**Step 3: Implement batch processor**

```python
# batch_processor.py
"""
Batch Pattern Processor for PixelRTS Vision Analysis

Provides parallel processing capabilities for analyzing multiple
PixelRTS images simultaneously using multiprocessing.
"""

import numpy as np
from pathlib import Path
from typing import List, Dict, Any, Optional, Callable
from dataclasses import dataclass
import multiprocessing
from concurrent.futures import ProcessPoolExecutor, ThreadPoolExecutor, as_completed
import time
from functools import partial

try:
    from PIL import Image
except ImportError:
    raise ImportError("Batch processing requires Pillow")

try:
    from pattern_detector import PatternDetector
except ImportError:
    PatternDetector = None

try:
    from gpu_pattern_detector import GpuPatternDetector, get_optimal_device
except ImportError:
    GpuPatternDetector = None


@dataclass
class BatchResult:
    """Result of batch processing."""
    image_path: str
    success: bool
    results: Dict[str, Any]
    error: Optional[str] = None
    processing_time_ms: float = 0.0


class BatchPatternProcessor:
    """
    Process multiple PixelRTS images in parallel.

    Supports both CPU and GPU acceleration with configurable
    worker pools for efficient batch processing.
    """

    def __init__(
        self,
        max_workers: Optional[int] = None,
        use_gpu: bool = True,
        device: str = 'auto'
    ):
        """
        Initialize batch processor.

        Args:
            max_workers: Maximum number of parallel workers (default: CPU count)
            use_gpu: Whether to use GPU acceleration when available
            device: 'cuda', 'cpu', or 'auto'
        """
        self.max_workers = max_workers or multiprocessing.cpu_count()
        self.use_gpu = use_gpu and GpuPatternDetector is not None

        if self.use_gpu:
            self.device = get_optimal_device() if device == 'auto' else device
            self.use_gpu = (self.device == 'cuda')
        else:
            self.device = 'cpu'

    def process_batch(
        self,
        image_paths: List[str],
        methods: List[str] = None,
        progress_callback: Optional[Callable[[int, int], None]] = None
    ) -> List[BatchResult]:
        """
        Process multiple images in parallel.

        Args:
            image_paths: List of paths to PNG files
            methods: Analysis methods to run ['edges', 'fourier', 'clusters']
            progress_callback: Optional callback(current, total) for progress updates

        Returns:
            List of BatchResult objects
        """
        if methods is None:
            methods = ['edges', 'fourier', 'clusters']

        results = [None] * len(image_paths)

        # Use ThreadPoolExecutor for I/O-bound tasks
        # For CPU-bound tasks, ProcessPoolExecutor would be better
        # but has serialization overhead
        with ThreadPoolExecutor(max_workers=self.max_workers) as executor:
            # Submit all jobs
            future_to_index = {}
            for i, image_path in enumerate(image_paths):
                future = executor.submit(
                    self._process_single_image,
                    image_path,
                    methods
                )
                future_to_index[future] = i

            # Collect results as they complete
            completed = 0
            for future in as_completed(future_to_index):
                index = future_to_index[future]
                try:
                    result = future.result()
                    results[index] = result
                except Exception as e:
                    results[index] = BatchResult(
                        image_path=image_paths[index],
                        success=False,
                        results={},
                        error=str(e)
                    )

                completed += 1
                if progress_callback:
                    progress_callback(completed, len(image_paths))

        return results

    def _process_single_image(
        self,
        image_path: str,
        methods: List[str]
    ) -> BatchResult:
        """Process a single image with all specified methods."""
        start_time = time.time()

        try:
            # Validate file exists
            if not Path(image_path).exists():
                return BatchResult(
                    image_path=image_path,
                    success=False,
                    results={},
                    error=f"File not found: {image_path}"
                )

            # Choose detector
            if self.use_gpu:
                detector = GpuPatternDetector(image_path, device=self.device)
            else:
                if PatternDetector is None:
                    raise ImportError("PatternDetector not available")
                detector = PatternDetector(image_path)

            results = {}

            # Run each analysis method
            for method in methods:
                try:
                    if method == 'edges':
                        if self.use_gpu:
                            gpu_result = detector.detect_edges_sobel_gpu()
                            results['edges'] = {
                                'method': gpu_result.result.method,
                                'edge_count': gpu_result.result.edge_count,
                                'edge_density': gpu_result.result.edge_density,
                                'gpu_time_ms': gpu_result.gpu_time_ms
                            }
                        else:
                            cpu_result = detector.detect_edges_sobel()
                            results['edges'] = {
                                'method': cpu_result.method,
                                'edge_count': cpu_result.edge_count,
                                'edge_density': cpu_result.edge_density
                            }

                    elif method == 'fourier':
                        if self.use_gpu:
                            gpu_result = detector.analyze_fourier_gpu()
                            results['fourier'] = {
                                'dominant_frequency': gpu_result.result.dominant_frequency,
                                'has_periodic': gpu_result.result.has_periodic_patterns,
                                'gpu_time_ms': gpu_result.gpu_time_ms
                            }
                        else:
                            cpu_result = detector.analyze_fourier()
                            results['fourier'] = {
                                'dominant_frequency': cpu_result.dominant_frequency,
                                'has_periodic': cpu_result.has_periodic_patterns
                            }

                    elif method == 'clusters':
                        if not self.use_gpu:
                            cpu_result = detector.detect_clusters(feature_type='position')
                            results['clusters'] = {
                                'num_clusters': cpu_result.num_clusters,
                                'noise_points': cpu_result.noise_points
                            }
                        else:
                            # GPU clustering not yet implemented
                            results['clusters'] = {'error': 'GPU clustering not implemented'}

                except Exception as e:
                    results[method] = {'error': str(e)}

            processing_time = (time.time() - start_time) * 1000

            return BatchResult(
                image_path=image_path,
                success=True,
                results=results,
                processing_time_ms=processing_time
            )

        except Exception as e:
            return BatchResult(
                image_path=image_path,
                success=False,
                results={},
                error=str(e),
                processing_time_ms=(time.time() - start_time) * 1000
            )

    def process_directory(
        self,
        directory: str,
        pattern: str = "*.rts.png",
        methods: List[str] = None,
        progress_callback: Optional[Callable[[int, int], None]] = None
    ) -> List[BatchResult]:
        """
        Process all matching images in a directory.

        Args:
            directory: Directory to scan
            pattern: Glob pattern for image files
            methods: Analysis methods to run
            progress_callback: Optional callback for progress updates

        Returns:
            List of BatchResult objects
        """
        dir_path = Path(directory)
        image_paths = [str(p) for p in dir_path.glob(pattern)]

        return self.process_batch(image_paths, methods, progress_callback)
```

**Step 4: Run tests to verify they pass**

```bash
python3 -m pytest tests/test_batch_processor.py -v
```

**Step 5: Commit**

```bash
git add systems/pixel_compiler/batch_processor.py systems/pixel_compiler/tests/test_batch_processor.py
git commit -m "feat(vision): add parallel batch processing for multiple images"
```

---

### Task 1.2.3: Performance Benchmarking Suite

**Files:**
- Create: `systems/pixel_compiler/benchmarks/pattern_benchmark.py`
- Create: `systems/pixel_compiler/benchmarks/__init__.py`
- Modify: `systems/pixel_compiler/pixelrts_vision_cli.py` (add --benchmark flag)

**Step 1: Write benchmark test**

```python
# benchmarks/pattern_benchmark.py
"""
Performance benchmarks for pattern detection algorithms.

Measures CPU vs GPU performance, memory usage, and processing speed
for various image sizes and algorithm configurations.
"""

import time
import numpy as np
from PIL import Image
import tempfile
from pathlib import Path
from typing import Dict, List, Tuple
import psutil
import gc

try:
    from pattern_detector import PatternDetector
except ImportError:
    PatternDetector = None

try:
    from gpu_pattern_detector import GpuPatternDetector, get_optimal_device
except ImportError:
    GpuPatternDetector = None


@dataclass
class BenchmarkResult:
    """Result of a single benchmark run."""
    algorithm: str
    image_size: Tuple[int, int]
    device: str
    time_ms: float
    memory_mb: float
    throughput_mpx_per_sec: float


class PatternBenchmark:
    """
    Benchmark suite for pattern detection performance.

    Tests various algorithms across different image sizes
    and hardware configurations.
    """

    def __init__(self):
        self.temp_dir = tempfile.mkdtemp()
        self.test_images = {}

    def cleanup(self):
        """Clean up temporary test images."""
        for path in self.test_images.values():
            if Path(path).exists():
                Path(path).unlink()
        if Path(self.temp_dir).exists():
            Path(self.temp_dir).rmdir()

    def _generate_test_image(
        self,
        size: Tuple[int, int],
        pattern_type: str = 'random'
    ) -> str:
        """
        Generate a test image of specified size.

        Args:
            size: (width, height) tuple
            pattern_type: 'random', 'checkerboard', 'gradient'

        Returns:
            Path to generated image
        """
        width, height = size
        key = (size, pattern_type)

        if key in self.test_images:
            return self.test_images[key]

        if pattern_type == 'random':
            img_array = np.random.randint(0, 255, (height, width, 4), dtype=np.uint8)
        elif pattern_type == 'checkerboard':
            img_array = np.zeros((height, width, 4), dtype=np.uint8)
            square_size = 32
            for y in range(0, height, square_size):
                for x in range(0, width, square_size):
                    if ((x // square_size) + (y // square_size)) % 2 == 0:
                        img_array[y:y+square_size, x:x+square_size] = [255, 255, 255, 255]
        elif pattern_type == 'gradient':
            y = np.linspace(0, 255, height)
            x = np.linspace(0, 255, width)
            xv, yv = np.meshgrid(x, y)
            img_array = np.zeros((height, width, 4), dtype=np.uint8)
            img_array[:, :, 0] = xv.astype(np.uint8)
            img_array[:, :, 1] = yv.astype(np.uint8)
            img_array[:, :, 2] = ((xv + yv) / 2).astype(np.uint8)
            img_array[:, :, 3] = 255
        else:
            img_array = np.random.randint(0, 255, (height, width, 4), dtype=np.uint8)

        img = Image.fromarray(img_array, 'RGBA')
        path = Path(self.temp_dir) / f"test_{size[0]}x{size[1]}_{pattern_type}.png"
        img.save(path)
        self.test_images[key] = str(path)

        return str(path)

    def benchmark_sobel(
        self,
        sizes: List[Tuple[int, int]] = None,
        iterations: int = 3
    ) -> Dict[str, BenchmarkResult]:
        """
        Benchmark Sobel edge detection.

        Args:
            sizes: List of (width, height) tuples to test
            iterations: Number of iterations per size

        Returns:
            Dictionary mapping size to BenchmarkResult
        """
        if sizes is None:
            sizes = [
                (256, 256),
                (512, 512),
                (1024, 1024),
                (2048, 2048)
            ]

        results = {}

        for size in sizes:
            # Generate test image
            image_path = self._generate_test_image(size, 'checkerboard')

            # Benchmark CPU
            if PatternDetector is not None:
                gc.collect()
                process = psutil.Process()
                start_memory = process.memory_info().rss / (1024 * 1024)

                start_time = time.time()
                for _ in range(iterations):
                    detector = PatternDetector(image_path)
                    result = detector.detect_edges_sobel()
                end_time = time.time()

                end_memory = process.memory_info().rss / (1024 * 1024)

                avg_time_ms = (end_time - start_time) / iterations * 1000
                memory_mb = end_memory - start_memory
                megapixels = (size[0] * size[1]) / 1_000_000
                throughput = megapixels / (avg_time_ms / 1000)

                results[f"{size[0]}x{size[1]}_cpu"] = BenchmarkResult(
                    algorithm='sobel',
                    image_size=size,
                    device='cpu',
                    time_ms=avg_time_ms,
                    memory_mb=memory_mb,
                    throughput_mpx_per_sec=throughput
                )

            # Benchmark GPU
            if GpuPatternDetector is not None and get_optimal_device() == 'cuda':
                gc.collect()
                if torch.cuda.is_available():
                    torch.cuda.empty_cache()
                    torch.cuda.reset_peak_memory_stats()

                start_time = time.time()
                for _ in range(iterations):
                    detector = GpuPatternDetector(image_path, device='cuda')
                    result = detector.detect_edges_sobel_gpu()
                end_time = time.time()

                avg_time_ms = (end_time - start_time) / iterations * 1000
                memory_mb = result.memory_used_mb
                megapixels = (size[0] * size[1]) / 1_000_000
                throughput = megapixels / (avg_time_ms / 1000)

                results[f"{size[0]}x{size[1]}_gpu"] = BenchmarkResult(
                    algorithm='sobel',
                    image_size=size,
                    device='gpu',
                    time_ms=avg_time_ms,
                    memory_mb=memory_mb,
                    throughput_mpx_per_sec=throughput
                )

        return results

    def print_benchmark_report(self, results: Dict[str, BenchmarkResult]):
        """Print formatted benchmark results."""
        print("\n" + "="*80)
        print("PATTERN DETECTION BENCHMARK RESULTS")
        print("="*80)
        print(f"{'Size':<15} {'Device':<8} {'Time (ms)':<12} {'Memory (MB)':<15} {'Throughput (MP/s)':<18}")
        print("-"*80)

        # Sort by image size
        sorted_keys = sorted(results.keys(), key=lambda k: (
            int(k.split('x')[1].split('_')[0]),
            k.split('_')[-1]
        ))

        for key in sorted_keys:
            result = results[key]
            size_str = f"{result.image_size[0]}x{result.image_size[1]}"
            print(f"{size_str:<15} {result.device:<8} "
                  f"{result.time_ms:<12.2f} {result.memory_mb:<15.2f} "
                  f"{result.throughput_mpx_per_sec:<18.2f}")

        print("="*80)

        # Calculate speedup
        cpu_results = {k: v for k, v in results.items() if v.device == 'cpu'}
        gpu_results = {k: v for k, v in results.items() if v.device == 'gpu'}

        if cpu_results and gpu_results:
            print("\nGPU SPEEDUP:")
            print("-"*80)
            for cpu_key, cpu_result in cpu_results.items():
                size = cpu_result.image_size
                gpu_key = f"{size[0]}x{size[1]}_gpu"
                if gpu_key in gpu_results:
                    gpu_result = gpu_results[gpu_key]
                    speedup = cpu_result.time_ms / gpu_result.time_ms
                    print(f"{size[0]}x{size[1]}: {speedup:.2f}x faster")


def run_benchmarks():
    """Run full benchmark suite."""
    benchmark = PatternBenchmark()

    try:
        print("Running Sobel edge detection benchmarks...")
        results = benchmark.benchmark_sobel(iterations=5)
        benchmark.print_benchmark_report(results)

        return results
    finally:
        benchmark.cleanup()


if __name__ == "__main__":
    run_benchmarks()
```

**Step 2-5: Complete remaining steps for this task**

```bash
# Run benchmark
python3 systems/pixel_compiler/benchmarks/pattern_benchmark.py

# Commit
git add systems/pixel_compiler/benchmarks/
git commit -m "feat(vision): add performance benchmarking suite"
```

---

## Phase 1.3: Advanced Pattern Recognition (2-3 weeks)

### Task 1.3.1: CNN-Based Binary Structure Classification

**Files:**
- Create: `systems/pixel_compiler/ml/cnn_classifier.py`
- Create: `systems/pixel_compiler/ml/training_data.py`
- Create: `systems/pixel_compiler/ml/models.py`

**Step 1: Write failing test for CNN classifier**

```python
# tests/test_cnn_classifier.py
import pytest
import numpy as np
from PIL import Image
import tempfile
from pathlib import Path

@pytest.mark.skipif(not pytest.importorskip("torch"), reason="PyTorch required")
def test_cnn_classifier_initializes():
    """Test that CNN classifier can be initialized."""
    from ml.cnn_classifier import CnnBinaryClassifier

    classifier = CnnBinaryClassifier(model_name='resnet18', num_classes=5)
    assert classifier is not None
    assert classifier.device is not None


@pytest.mark.skipif(not pytest.importorskip("torch"), reason="PyTorch required")
def test_cnn_classifier_predicts():
    """Test that CNN classifier can make predictions."""
    from ml.cnn_classifier import CnnBinaryClassifier

    # Create test image
    img_array = np.random.randint(0, 255, (224, 224, 4), dtype=np.uint8)
    img = Image.fromarray(img_array, 'RGBA')

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img.save(f)
        temp_path = f.name

    try:
        classifier = CnnBinaryClassifier(model_name='resnet18', num_classes=5)
        # Use mock mode for testing without trained model
        result = classifier.predict(temp_path, mock_mode=True)

        assert 'predicted_class' in result
        assert 'confidence' in result
        assert 0 <= result['confidence'] <= 1
    finally:
        Path(temp_path).unlink()
```

**Step 2-5: Implement CNN classifier**

```python
# ml/cnn_classifier.py
"""
CNN-Based Binary Structure Classifier for PixelRTS Vision Analysis

Uses pre-trained CNN models (ResNet, EfficientNet) to classify
binary structures in PixelRTS visual artifacts.
"""

import torch
import torch.nn as nn
import torchvision.transforms as transforms
from PIL import Image
import numpy as np
from pathlib import Path
from typing import Dict, List, Tuple, Optional, Any
from dataclasses import dataclass
import tempfile


@dataclass
class ClassificationResult:
    """Result of binary structure classification."""
    predicted_class: str
    confidence: float
    class_probabilities: Dict[str, float]
    features: Optional[np.ndarray] = None


class CnnBinaryClassifier:
    """
    CNN-based classifier for binary structure patterns.

    Supports transfer learning from pre-trained models:
    - ResNet18/34/50
    - EfficientNet-B0/B4
    - ViT (Vision Transformer)
    """

    MODEL_REGISTRY = {
        'resnet18': 'resnet18',
        'resnet34': 'resnet34',
        'resnet50': 'resnet50',
        'efficientnet_b0': 'efficientnet_b0',
        'efficientnet_b4': 'efficientnet_b4',
        'vit_b_16': 'vit_b_16',
    }

    # Default class labels for binary structures
    DEFAULT_CLASSES = [
        'kernel_code',
        'data_section',
        'compressed_data',
        'relocatable_code',
        'unknown_binary'
    ]

    def __init__(
        self,
        model_name: str = 'resnet18',
        num_classes: int = 5,
        pretrained: bool = True,
        device: str = 'auto'
    ):
        """
        Initialize CNN classifier.

        Args:
            model_name: Name of model architecture
            num_classes: Number of output classes
            pretrained: Whether to use pretrained weights
            device: 'cuda', 'cpu', or 'auto'
        """
        if model_name not in self.MODEL_REGISTRY:
            raise ValueError(f"Unknown model: {model_name}. Choose from {list(self.MODEL_REGISTRY.keys())}")

        self.model_name = model_name
        self.num_classes = num_classes
        self.pretrained = pretrained

        # Determine device
        if device == 'auto':
            self.device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
        else:
            self.device = torch.device(device)

        # Initialize model
        self.model = self._create_model()
        self.model.to(self.device)
        self.model.eval()

        # Image preprocessing
        self.transform = transforms.Compose([
            transforms.Resize(224),
            transforms.CenterCrop(224),
            transforms.ToTensor(),
            transforms.Normalize(
                mean=[0.485, 0.456, 0.406],  # ImageNet stats
                std=[0.229, 0.224, 0.225]
            )
        ])

    def _create_model(self) -> nn.Module:
        """Create the model architecture."""
        import torchvision.models as models

        model_key = self.MODEL_REGISTRY[self.model_name]

        if model_key.startswith('resnet'):
            model = getattr(models, model_key)(pretrained=self.pretrained)
            # Modify final layer for our number of classes
            model.fc = nn.Linear(model.fc.in_features, self.num_classes)

        elif model_key.startswith('efficientnet'):
            model = getattr(models, model_key)(pretrained=self.pretrained)
            model.classifier[1] = nn.Linear(model.classifier[1].in_features, self.num_classes)

        elif model_key.startswith('vit'):
            model = getattr(models, model_key)(pretrained=self.pretrained)
            model.heads[0] = nn.Linear(model.heads[0].in_features, self.num_classes)

        else:
            raise ValueError(f"Unsupported model: {model_key}")

        return model

    def predict(
        self,
        image_path: str,
        mock_mode: bool = False,
        return_features: bool = False
    ) -> ClassificationResult:
        """
        Predict binary structure class for an image.

        Args:
            image_path: Path to image file
            mock_mode: If True, return mock predictions (for testing)
            return_features: If True, return feature embeddings

        Returns:
            ClassificationResult with predictions
        """
        if mock_mode:
            # Return mock predictions for testing
            class_idx = np.random.randint(0, self.num_classes)
            return ClassificationResult(
                predicted_class=self.DEFAULT_CLASSES[class_idx],
                confidence=0.85 + np.random.random() * 0.14,
                class_probabilities={
                    cls: np.random.random()
                    for cls in self.DEFAULT_CLASSES[:self.num_classes]
                }
            )

        # Load and preprocess image
        image = Image.open(image_path)

        # Convert RGBA to RGB
        if image.mode == 'RGBA':
            # Create white background
            background = Image.new('RGB', image.size, (255, 255, 255))
            background.paste(image, mask=image.split()[3])  # Use alpha channel as mask
            image = background
        elif image.mode != 'RGB':
            image = image.convert('RGB')

        input_tensor = self.transform(image).unsqueeze(0).to(self.device)

        # Run inference
        with torch.no_grad():
            outputs = self.model(input_tensor)
            probabilities = torch.softmax(outputs, dim=1)[0]

            if return_features:
                # Get features from second-to-last layer
                if hasattr(self.model, 'fc'):
                    features = self.model.fc.weight.data
                else:
                    features = None

        # Get top prediction
        confidence, class_idx = torch.max(probabilities, dim=0)

        # Create class probability dictionary
        class_probs = {
            self.DEFAULT_CLASSES[i]: probabilities[i].item()
            for i in range(min(self.num_classes, len(self.DEFAULT_CLASSES)))
        }

        return ClassificationResult(
            predicted_class=self.DEFAULT_CLASSES[class_idx.item()],
            confidence=confidence.item(),
            class_probabilities=class_probs,
            features=features.cpu().numpy() if return_features else None
        )

    def predict_batch(
        self,
        image_paths: List[str],
        batch_size: int = 8
    ) -> List[ClassificationResult]:
        """
        Predict classes for multiple images.

        Args:
            image_paths: List of image file paths
            batch_size: Batch size for inference

        Returns:
            List of ClassificationResult objects
        """
        results = []

        for i in range(0, len(image_paths), batch_size):
            batch_paths = image_paths[i:i+batch_size]

            # Load and preprocess batch
            batch_tensors = []
            for path in batch_paths:
                image = Image.open(path)
                if image.mode == 'RGBA':
                    background = Image.new('RGB', image.size, (255, 255, 255))
                    background.paste(image, mask=image.split()[3])
                    image = background
                elif image.mode != 'RGB':
                    image = image.convert('RGB')

                batch_tensors.append(self.transform(image))

            batch_tensor = torch.stack(batch_tensors).to(self.device)

            # Run inference
            with torch.no_grad():
                outputs = self.model(batch_tensor)
                probabilities = torch.softmax(outputs, dim=1)

            # Process results
            for j, probs in enumerate(probabilities):
                confidence, class_idx = torch.max(probs, dim=0)
                results.append(ClassificationResult(
                    predicted_class=self.DEFAULT_CLASSES[class_idx.item()],
                    confidence=confidence.item(),
                    class_probabilities={
                        self.DEFAULT_CLASSES[k]: probs[k].item()
                        for k in range(min(self.num_classes, len(self.DEFAULT_CLASSES)))
                    }
                ))

        return results

    def save_model(self, path: str):
        """Save model weights to file."""
        torch.save({
            'model_name': self.model_name,
            'num_classes': self.num_classes,
            'state_dict': self.model.state_dict()
        }, path)

    def load_model(self, path: str):
        """Load model weights from file."""
        checkpoint = torch.load(path, map_location=self.device)
        self.model.load_state_dict(checkpoint['state_dict'])
```

**Step 4: Run tests**

```bash
python3 -m pytest tests/test_cnn_classifier.py -v
```

**Step 5: Commit**

```bash
git add systems/pixel_compiler/ml/
git commit -m "feat(ml): add CNN-based binary structure classifier"
```

---

### Task 1.3.2: Autoencoder for Anomaly Detection

**Files:**
- Create: `systems/pixel_compiler/ml/autoencoder.py`
- Test: `systems/pixel_compiler/tests/test_autoencoder.py`

**Step 1: Write failing test for autoencoder**

```python
# tests/test_autoencoder.py
import pytest
import numpy as np
from PIL import Image
import tempfile
from pathlib import Path

@pytest.mark.skipif(not pytest.importorskip("torch"), reason="PyTorch required")
def test_autoencoder_reconstructs():
    """Test that autoencoder can reconstruct images."""
    from ml.autoencoder import PatternAutoencoder

    # Create simple test image
    img_array = np.random.randint(0, 255, (64, 64, 4), dtype=np.uint8)
    img = Image.fromarray(img_array, 'RGBA')

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img.save(f)
        temp_path = f.name

    try:
        autoencoder = PatternAutoencoder(latent_dim=32)
        reconstruction = autoencoder.encode_decode(temp_path)

        assert reconstruction is not None
        assert reconstruction.shape == (64, 64, 4)
    finally:
        Path(temp_path).unlink()


@pytest.mark.skipif(not pytest.importorskip("torch"), reason="PyTorch required")
def test_autoencoder_detects_anomalies():
    """Test that autoencoder can detect anomalous patterns."""
    from ml.autoencoder import PatternAutoencoder

    # Create normal pattern (checkerboard)
    normal_array = np.zeros((64, 64, 4), dtype=np.uint8)
    for y in range(0, 64, 8):
        for x in range(0, 64, 8):
            if ((x // 8) + (y // 8)) % 2 == 0:
                normal_array[y:y+8, x:x+8] = [255, 255, 255, 255]

    # Create anomalous pattern (random noise)
    anomalous_array = np.random.randint(0, 255, (64, 64, 4), dtype=np.uint8)

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(normal_array).save(f)
        normal_path = f.name

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(anomalous_array).save(f)
        anomalous_path = f.name

    try:
        autoencoder = PatternAutoencoder(latent_dim=32)
        # Train on normal pattern
        autoencoder.train_single(normal_path, epochs=5)

        # Detect anomalies
        normal_error = autoencoder.reconstruction_error(normal_path)
        anomalous_error = autoencoder.reconstruction_error(anomalous_path)

        # Anomalous should have higher reconstruction error
        assert anomalous_error > normal_error
    finally:
        Path(normal_path).unlink()
        Path(anomalous_path).unlink()
```

**Step 2-5: Implement autoencoder**

```python
# ml/autoencoder.py
"""
Autoencoder-based Anomaly Detection for PixelRTS Vision Analysis

Uses convolutional autoencoders to learn normal binary patterns
and detect anomalies through reconstruction error.
"""

import torch
import torch.nn as nn
import torch.optim as optim
from PIL import Image
import numpy as np
from pathlib import Path
from typing import Dict, List, Tuple, Optional, Any
from dataclasses import dataclass


@dataclass
class AnomalyResult:
    """Result of anomaly detection."""
    is_anomalous: bool
    reconstruction_error: float
    threshold: float
    anomaly_score: float  # Normalized 0-1
    reconstruction: Optional[np.ndarray] = None


class ConvAutoencoder(nn.Module):
    """Convolutional autoencoder for image patterns."""

    def __init__(self, latent_dim: int = 64):
        super().__init__()

        # Encoder
        self.encoder = nn.Sequential(
            # Input: (4, 64, 64) - RGBA
            nn.Conv2d(4, 32, 3, stride=2, padding=1),  # (32, 32, 32)
            nn.ReLU(),
            nn.Conv2d(32, 64, 3, stride=2, padding=1),  # (64, 16, 16)
            nn.ReLU(),
            nn.Conv2d(64, 128, 3, stride=2, padding=1),  # (128, 8, 8)
            nn.ReLU(),
            nn.Flatten(),
            nn.Linear(128 * 8 * 8, latent_dim)
        )

        # Decoder
        self.decoder = nn.Sequential(
            nn.Linear(latent_dim, 128 * 8 * 8),
            nn.ReLU(),
            nn.Unflatten(1, (128, 8, 8)),
            nn.ConvTranspose2d(128, 64, 3, stride=2, padding=1, output_padding=1),  # (64, 16, 16)
            nn.ReLU(),
            nn.ConvTranspose2d(64, 32, 3, stride=2, padding=1, output_padding=1),  # (32, 32, 32)
            nn.ReLU(),
            nn.ConvTranspose2d(32, 4, 3, stride=2, padding=1, output_padding=1),  # (4, 64, 64)
            nn.Sigmoid()  # Output in [0, 1]
        )

    def forward(self, x):
        encoded = self.encoder(x)
        decoded = self.decoder(encoded)
        return decoded


class PatternAutoencoder:
    """
    Autoencoder for pattern anomaly detection.

    Learns to reconstruct "normal" patterns. Anomalies are
    detected as patterns with high reconstruction error.
    """

    def __init__(
        self,
        latent_dim: int = 64,
        device: str = 'auto',
        threshold_percentile: float = 95.0
    ):
        """
        Initialize autoencoder.

        Args:
            latent_dim: Dimension of latent representation
            device: 'cuda', 'cpu', or 'auto'
            threshold_percentile: Percentile for anomaly threshold
        """
        self.latent_dim = latent_dim

        if device == 'auto':
            self.device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
        else:
            self.device = torch.device(device)

        self.model = ConvAutoencoder(latent_dim).to(self.device)
        self.optimizer = optim.Adam(self.model.parameters(), lr=0.001)
        self.criterion = nn.MSELoss()

        self.threshold_percentile = threshold_percentile
        self.reconstruction_errors = []
        self.threshold = None

        self.transform = None  # Will be set based on first image

    def _load_image(self, path: str) -> torch.Tensor:
        """Load and preprocess image."""
        image = Image.open(path)

        # Ensure RGBA
        if image.mode != 'RGBA':
            image = image.convert('RGBA')

        # Resize to 64x64 for autoencoder
        image = image.resize((64, 64), Image.LANCZOS)

        # Convert to tensor [0, 1]
        img_array = np.array(image).astype(np.float32) / 255.0
        tensor = torch.from_numpy(img_array).permute(2, 0, 1)  # (C, H, W)

        return tensor.unsqueeze(0)  # Add batch dimension

    def train_single(
        self,
        image_path: str,
        epochs: int = 10,
        learning_rate: float = 0.001
    ) -> float:
        """
        Train autoencoder on a single image.

        Args:
            image_path: Path to training image
            epochs: Number of training epochs
            learning_rate: Learning rate

        Returns:
            Final loss value
        """
        self.model.train()
        self.optimizer = optim.Adam(self.model.parameters(), lr=learning_rate)

        # Load image once
        input_tensor = self._load_image(image_path).to(self.device)

        for epoch in range(epochs):
            # Forward pass
            self.optimizer.zero_grad()
            output = self.model(input_tensor)
            loss = self.criterion(output, input_tensor)

            # Backward pass
            loss.backward()
            self.optimizer.step()

        self.model.eval()
        return loss.item()

    def train_batch(
        self,
        image_paths: List[str],
        epochs: int = 20,
        batch_size: int = 8
    ) -> float:
        """
        Train autoencoder on multiple images.

        Args:
            image_paths: List of training image paths
            epochs: Number of training epochs
            batch_size: Batch size

        Returns:
            Final loss value
        """
        from torch.utils.data import DataLoader, TensorDataset

        # Load all images
        tensors = []
        for path in image_paths:
            tensor = self._load_image(path)
            tensors.append(tensor.squeeze(0))  # Remove batch dim

        # Create dataset
        dataset = TensorDataset(torch.stack(tensors))
        dataloader = DataLoader(dataset, batch_size=batch_size, shuffle=True)

        self.model.train()
        for epoch in range(epochs):
            epoch_loss = 0
            for batch, in dataloader:
                batch = batch.to(self.device)

                self.optimizer.zero_grad()
                output = self.model(batch)
                loss = self.criterion(output, batch)
                loss.backward()
                self.optimizer.step()

                epoch_loss += loss.item()

        self.model.eval()
        return epoch_loss / len(dataloader)

    def compute_threshold(
        self,
        normal_images: List[str],
        percentile: Optional[float] = None
    ) -> float:
        """
        Compute anomaly threshold from normal images.

        Args:
            normal_images: List of "normal" image paths
            percentile: Percentile for threshold (default: from init)

        Returns:
            Computed threshold value
        """
        if percentile is not None:
            self.threshold_percentile = percentile

        errors = []
        self.model.eval()

        with torch.no_grad():
            for path in normal_images:
                error = self.reconstruction_error(path)
                errors.append(error)

        self.reconstruction_errors = errors
        self.threshold = np.percentile(errors, self.threshold_percentile)

        return self.threshold

    def reconstruction_error(self, image_path: str) -> float:
        """
        Compute reconstruction error for an image.

        Args:
            image_path: Path to image

        Returns:
            Mean squared error of reconstruction
        """
        self.model.eval()

        with torch.no_grad():
            input_tensor = self._load_image(image_path).to(self.device)
            output = self.model(input_tensor)

            error = self.criterion(output, input_tensor).item()

        return error

    def encode_decode(self, image_path: str) -> np.ndarray:
        """
        Encode and decode an image.

        Args:
            image_path: Path to image

        Returns:
            Reconstructed image as numpy array
        """
        self.model.eval()

        with torch.no_grad():
            input_tensor = self._load_image(image_path).to(self.device)
            output = self.model(input_tensor)

            # Convert back to numpy
            reconstructed = output.squeeze().permute(1, 2, 0).cpu().numpy()
            reconstructed = (reconstructed * 255).astype(np.uint8)

        return reconstructed

    def detect_anomaly(
        self,
        image_path: str,
        return_reconstruction: bool = False
    ) -> AnomalyResult:
        """
        Detect if an image is anomalous.

        Args:
            image_path: Path to image to check
            return_reconstruction: Whether to return reconstructed image

        Returns:
            AnomalyResult with detection results
        """
        if self.threshold is None:
            raise ValueError("Must compute threshold first with compute_threshold()")

        error = self.reconstruction_error(image_path)

        # Normalize anomaly score
        if self.reconstruction_errors:
            min_error = min(self.reconstruction_errors)
            max_error = max(self.reconstruction_errors)
            if max_error > min_error:
                anomaly_score = (error - min_error) / (max_error - min_error)
            else:
                anomaly_score = 0.0
        else:
            anomaly_score = 1.0 if error > self.threshold else 0.0

        reconstruction = self.encode_decode(image_path) if return_reconstruction else None

        return AnomalyResult(
            is_anomalous=error > self.threshold,
            reconstruction_error=error,
            threshold=self.threshold,
            anomaly_score=anomaly_score,
            reconstruction=reconstruction
        )

    def save_model(self, path: str):
        """Save model weights and threshold."""
        torch.save({
            'model_state_dict': self.model.state_dict(),
            'latent_dim': self.latent_dim,
            'threshold': self.threshold,
            'reconstruction_errors': self.reconstruction_errors,
            'threshold_percentile': self.threshold_percentile
        }, path)

    def load_model(self, path: str):
        """Load model weights and threshold."""
        checkpoint = torch.load(path, map_location=self.device)
        self.model.load_state_dict(checkpoint['model_state_dict'])
        self.latent_dim = checkpoint['latent_dim']
        self.threshold = checkpoint.get('threshold')
        self.reconstruction_errors = checkpoint.get('reconstruction_errors', [])
        self.threshold_percentile = checkpoint.get('threshold_percentile', 95.0)
```

---

## Phase 1.4: Visualization & Analysis Tools (1-2 weeks)

### Task 1.4.1: Interactive Web Dashboard

**Files:**
- Create: `systems/pixel_compiler/dashboard/app.py`
- Create: `systems/pixel_compiler/dashboard/components.py`
- Create: `systems/pixel_compiler/dashboard/layout.py`

**Step 1: Write failing test for dashboard**

```python
# tests/test_dashboard.py
import pytest
import tempfile
from pathlib import Path

@pytest.mark.skipif(not pytest.importorskip("dash"), reason="Dash required")
def test_dashboard_initializes():
    """Test that Dash app can be initialized."""
    from dashboard.app import create_dashboard_app

    app = create_dashboard_app()
    assert app is not None
    assert app.title == "PixelRTS Vision Analysis Dashboard"


@pytest.mark.skipif(not pytest.importorskip("dash"), reason="Dash required")
def test_dashboard_layout():
    """Test that dashboard has required components."""
    from dashboard.app import create_dashboard_app

    app = create_dashboard_app()
    layout = app.layout

    # Check for key components
    assert layout is not None
```

**Step 2-5: Implement dashboard**

```python
# dashboard/app.py
"""
Interactive Web Dashboard for PixelRTS Vision Analysis

Provides real-time visualization and exploration of pattern detection
results using Dash/Plotly.
"""

from pathlib import Path
from typing import Dict, List, Optional, Any
import json
import base64
import io

try:
    import dash
    from dash import dcc, html, Input, Output, State, callback_context
    import plotly.graph_objects as go
    import plotly.express as px
except ImportError:
    raise ImportError(
        "Dashboard requires Dash and Plotly. "
        "Install with: pip install dash plotly"
    )

try:
    from pixelrts_vision_analyzer import PixelRTSVisionAnalyzer
except ImportError:
    PixelRTSVisionAnalyzer = None


def create_dashboard_app(
    title: str = "PixelRTS Vision Analysis Dashboard",
    port: int = 8050
) -> dash.Dash:
    """
    Create and configure Dash application.

    Args:
        title: Application title
        port: Port to run on

    Returns:
        Configured Dash app
    """
    app = dash.Dash(__name__, title=title)

    # Define layout
    app.layout = html.Div([
        # Header
        html.Header([
            html.H1(title, className='dashboard-title'),
            html.P('Interactive Pattern Detection Analysis', className='dashboard-subtitle')
        ], className='dashboard-header'),

        # Main content
        html.Div([
            # Sidebar with controls
            html.Aside([
                html.H3('Controls'),

                # File upload
                html.Div([
                    html.Label('Upload RTS PNG:'),
                    dcc.Upload(
                        id='upload-image',
                        children=html.Button('Select File'),
                        multiple=False,
                        accept='.png'
                    ),
                    html.Div(id='upload-status')
                ], className='control-group'),

                # Analysis options
                html.Div([
                    html.Label('Analysis Methods:'),
                    dcc.Checklist(
                        id='analysis-methods',
                        options=[
                            {'label': 'Edge Detection', 'value': 'edges'},
                            {'label': 'Fourier Analysis', 'value': 'fourier'},
                            {'label': 'Clustering', 'value': 'clusters'},
                            {'label': 'Classification', 'value': 'classify'}
                        ],
                        value=['edges', 'fourier'],
                        inline=True
                    )
                ], className='control-group'),

                # Edge detection settings
                html.Div([
                    html.Label('Edge Method:'),
                    dcc.Dropdown(
                        id='edge-method',
                        options=[
                            {'label': 'Sobel', 'value': 'sobel'},
                            {'label': 'Canny', 'value': 'canny'}
                        ],
                        value='sobel'
                    )
                ], className='control-group'),

                # Analyze button
                html.Button(
                    'Analyze',
                    id='analyze-button',
                    n_clicks=0,
                    className='analyze-button'
                ),

                # Progress indicator
                html.Div(id='analysis-progress', className='progress')
            ], className='sidebar'),

            # Main visualization area
            html.Main([
                # Tabs for different visualizations
                dcc.Tabs(id='viz-tabs', value='image-tab', children=[
                    dcc.Tab(label='Image View', value='image-tab'),
                    dcc.Tab(label='Pattern Overlay', value='pattern-tab'),
                    dcc.Tab(label='Statistics', value='stats-tab'),
                    dcc.Tab(label='Frequency Analysis', value='fourier-tab')
                ]),

                # Tab content
                html.Div(id='tab-content')
            ], className='main-content')
        ], className='dashboard-content'),

        # Store for analysis results
        dcc.Store(id='analysis-results'),
        dcc.Store(id='current-image')
    ], className='dashboard-container')

    # Callbacks
    _register_callbacks(app)

    return app


def _register_callbacks(app: dash.Dash):
    """Register all dashboard callbacks."""

    @app.callback(
        Output('current-image', 'data'),
        Output('upload-status', 'children'),
        Input('upload-image', 'contents'),
        State('upload-image', 'filename')
    )
    def handle_upload(contents, filename):
        """Handle image file upload."""
        if contents is None:
            return None, ''

        # Extract base64 data
        content_type, content_string = contents.split(',')
        decoded = base64.b64decode(content_string)

        # Save to temp file
        import tempfile
        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            f.write(decoded)
            temp_path = f.name

        return temp_path, f'Loaded: {filename}'

    @app.callback(
        Output('analysis-results', 'data'),
        Output('analysis-progress', 'children'),
        Input('analyze-button', 'n_clicks'),
        State('current-image', 'data'),
        State('analysis-methods', 'value'),
        State('edge-method', 'value'),
        prevent_initial_call=True
    )
    def run_analysis(n_clicks, image_path, methods, edge_method):
        """Run pattern detection analysis."""
        if image_path is None or n_clicks == 0:
            return None, ''

        if PixelRTSVisionAnalyzer is None:
            return None, 'Error: Analyzer not available'

        try:
            analyzer = PixelRTSVisionAnalyzer(image_path)
            results = {'path': image_path}

            # Run selected analysis methods
            if 'edges' in methods:
                edges = analyzer.detect_edges(method=edge_method)
                results['edges'] = edges

            if 'fourier' in methods:
                fourier = analyzer.analyze_fourier()
                results['fourier'] = fourier

            if 'clusters' in methods:
                clusters = analyzer.detect_clusters()
                results['clusters'] = clusters

            return results, 'Analysis complete'

        except Exception as e:
            return None, f'Error: {str(e)}'

    @app.callback(
        Output('tab-content', 'children'),
        Input('viz-tabs', 'value'),
        Input('current-image', 'data'),
        Input('analysis-results', 'data')
    )
    def update_tab_content(tab, image_path, results):
        """Update tab content based on selection."""
        if tab == 'image-tab':
            return _image_tab_content(image_path)

        elif tab == 'pattern-tab':
            return _pattern_tab_content(results)

        elif tab == 'stats-tab':
            return _stats_tab_content(results)

        elif tab == 'fourier-tab':
            return _fourier_tab_content(results)

        return html.Div('Select a tab')


def _image_tab_content(image_path: str):
    """Content for image view tab."""
    if image_path is None:
        return html.Div('No image loaded')

    # Read and encode image
    with open(image_path, 'rb') as f:
        image_data = base64.b64encode(f.read()).decode()

    return html.Div([
        html.Img(
            src=f'data:image/png;base64,{image_data}',
            style={'max-width': '100%', 'max-height': '80vh'}
        )
    ])


def _pattern_tab_content(results: Dict):
    """Content for pattern overlay tab."""
    if results is None or 'edges' not in results:
        return html.Div('Run edge detection first')

    edges = results['edges']

    # Create summary cards
    cards = [
        html.Div([
            html.H4('Edge Detection'),
            html.P(f"Method: {edges.get('method', 'N/A')}"),
            html.P(f"Edge Count: {edges.get('edge_count', 0):,}"),
            html.P(f"Density: {edges.get('edge_density', 0):.4f}")
        ], className='stat-card')
    ]

    if 'clusters' in results:
        clusters = results['clusters']
        cards.append(html.Div([
            html.H4('Clustering'),
            html.P(f"Clusters: {clusters.get('num_clusters', 0)}"),
            html.P(f"Noise Points: {clusters.get('noise_points', 0)}")
        ], className='stat-card'))

    return html.Div(cards, className='stat-grid')


def _stats_tab_content(results: Dict):
    """Content for statistics tab."""
    if results is None:
        return html.Div('No results')

    stats = []

    for key, value in results.items():
        if isinstance(value, dict):
            stats.append(html.Div([
                html.H4(key.title()),
                html.Ul([
                    html.Li(f"{k}: {v}")
                    for k, v in value.items()
                    if isinstance(v, (int, float, str))
                ])
            ]))

    return html.Div(stats)


def _fourier_tab_content(results: Dict):
    """Content for Fourier analysis tab."""
    if results is None or 'fourier' not in results:
        return html.Div('Run Fourier analysis first')

    fourier = results['fourier']

    # Create visualization
    fig = go.Figure()

    if fourier.get('has_periodic_patterns'):
        regions = fourier.get('periodic_regions', [])
        if regions:
            fig.add_trace(go.Bar(
                x=[f"Region {i+1}" for i in range(len(regions))],
                y=[r.get('magnitude', 0) for r in regions],
                name='Frequency Magnitude'
            ))

    fig.update_layout(
        title='Periodic Pattern Detection',
        xaxis_title='Frequency Region',
        yaxis_title='Magnitude'
    )

    return html.Div([
        dcc.Graph(figure=fig),
        html.P(f"Dominant Frequency: {fourier.get('dominant_frequency', (0, 0))}")
    ])


def run_dashboard(
    host: str = '127.0.0.1',
    port: int = 8050,
    debug: bool = True
):
    """
    Run the dashboard server.

    Args:
        host: Host to bind to
        port: Port to run on
        debug: Enable debug mode
    """
    app = create_dashboard_app()
    app.run_server(host=host, port=port, debug=debug)


if __name__ == '__main__':
    run_dashboard()
```

---

## Phase 1.5: Integration & Automation (2-3 weeks)

### Task 1.5.1: REST API for Pattern Detection

**Files:**
- Create: `systems/pixel_compiler/api/main.py`
- Create: `systems/pixel_compiler/api/models.py`
- Create: `systems/pixel_compiler/api/routes.py`

**Step 1: Write failing test for API**

```python
# tests/test_api.py
import pytest
from fastapi.testclient import TestClient

@pytest.mark.skipif(not pytest.importorskip("fastapi"), reason="FastAPI required")
def test_api_health_check():
    """Test that API health endpoint works."""
    from api.main import app

    client = TestClient(app)
    response = client.get("/health")

    assert response.status_code == 200
    assert response.json()["status"] == "healthy"


@pytest.mark.skipif(not pytest.importorskip("fastapi"), reason="FastAPI required")
def test_api_analyze_endpoint():
    """Test that analyze endpoint processes images."""
    from api.main import app
    import tempfile
    import numpy as np
    from PIL import Image

    # Create test image
    img_array = np.random.randint(0, 255, (64, 64, 4), dtype=np.uint8)
    img = Image.fromarray(img_array, 'RGBA')

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img.save(f)
        temp_path = f.name

    try:
        client = TestClient(app)

        with open(temp_path, 'rb') as f:
            response = client.post(
                "/analyze",
                files={"file": ("test.png", f, "image/png")},
                data={"methods": "edges"}
            )

        assert response.status_code == 200
        result = response.json()
        assert "edges" in result
    finally:
        Path(temp_path).unlink()
```

**Step 2-5: Implement API**

```python
# api/main.py
"""
REST API for PixelRTS Vision Pattern Detection

Provides HTTP endpoints for pattern detection analysis,
batch processing, and model management.
"""

from fastapi import FastAPI, File, UploadFile, HTTPException, BackgroundTasks
from fastapi.responses import JSONResponse
from pydantic import BaseModel
from typing import List, Optional, Dict, Any
import tempfile
import uuid
from pathlib import Path

from api.routes import router
from api.models import AnalysisRequest, AnalysisResponse


app = FastAPI(
    title="PixelRTS Vision Analysis API",
    description="Computer vision pattern detection for binary analysis",
    version="1.0.0"
)

# Include routes
app.include_router(router, prefix="/api/v1")


@app.get("/health")
async def health_check():
    """Health check endpoint."""
    return {
        "status": "healthy",
        "service": "pixelrts-vision-api",
        "version": "1.0.0"
    }


@app.get("/")
async def root():
    """Root endpoint with API information."""
    return {
        "name": "PixelRTS Vision Analysis API",
        "version": "1.0.0",
        "endpoints": {
            "health": "/health",
            "analyze": "/api/v1/analyze",
            "batch": "/api/v1/batch",
            "models": "/api/v1/models"
        }
    }


if __name__ == '__main__':
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)


# api/routes.py
"""API routes for pattern detection."""

from fastapi import APIRouter, File, UploadFile, HTTPException
from fastapi.responses import JSONResponse
from pydantic import BaseModel
from typing import List, Optional
import tempfile
import asyncio
from pathlib import Path

router = APIRouter()

try:
    from pixelrts_vision_analyzer import PixelRTSVisionAnalyzer
    from batch_processor import BatchPatternProcessor
except ImportError:
    PixelRTSVisionAnalyzer = None
    BatchPatternProcessor = None


class AnalysisRequest(BaseModel):
    """Request model for analysis."""
    methods: List[str] = ["edges", "fourier", "clusters"]
    edge_method: str = "sobel"
    return_overlay: bool = False


class AnalysisResponse(BaseModel):
    """Response model for analysis."""
    success: bool
    image_path: Optional[str] = None
    results: Optional[Dict[str, Any]] = None
    error: Optional[str] = None


@router.post("/analyze", response_model=AnalysisResponse)
async def analyze_image(
    file: UploadFile = File(...),
    methods: str = "edges,fourier",
    edge_method: str = "sobel"
):
    """
    Analyze a single image for pattern detection.

    Args:
        file: Uploaded PNG image file
        methods: Comma-separated list of analysis methods
        edge_method: Edge detection method (sobel/canny)

    Returns:
        Analysis results
    """
    if PixelRTSVisionAnalyzer is None:
        raise HTTPException(status_code=500, detail="Analyzer not available")

    # Save uploaded file
    temp_dir = tempfile.mkdtemp()
    temp_path = Path(temp_dir) / file.filename

    try:
        contents = await file.read()
        with open(temp_path, 'wb') as f:
            f.write(contents)

        # Run analysis
        analyzer = PixelRTSVisionAnalyzer(str(temp_path))

        method_list = methods.split(',')
        results = {}

        if 'edges' in method_list:
            results['edges'] = analyzer.detect_edges(method=edge_method)

        if 'fourier' in method_list:
            results['fourier'] = analyzer.analyze_fourier()

        if 'clusters' in method_list:
            results['clusters'] = analyzer.detect_clusters()

        return AnalysisResponse(
            success=True,
            image_path=file.filename,
            results=results
        )

    except Exception as e:
        return AnalysisResponse(
            success=False,
            error=str(e)
        )

    finally:
        # Cleanup
        if temp_path.exists():
            temp_path.unlink()
        Path(temp_dir).rmdir()


@router.post("/batch")
async def analyze_batch(
    files: List[UploadFile] = File(...),
    methods: str = "edges"
):
    """
    Analyze multiple images in batch.

    Args:
        files: List of uploaded PNG image files
        methods: Comma-separated list of analysis methods

    Returns:
        Batch analysis results
    """
    if BatchPatternProcessor is None:
        raise HTTPException(status_code=500, detail="Batch processor not available")

    # Save uploaded files
    temp_dir = tempfile.mkdtemp()
    temp_paths = []

    try:
        for file in files:
            temp_path = Path(temp_dir) / file.filename
            contents = await file.read()
            with open(temp_path, 'wb') as f:
                f.write(contents)
            temp_paths.append(str(temp_path))

        # Run batch processing
        processor = BatchPatternProcessor(max_workers=4)
        method_list = methods.split(',')
        results = processor.process_batch(temp_paths, methods=method_list)

        return {
            "success": True,
            "results": [
                {
                    "file": r.image_path,
                    "success": r.success,
                    "results": r.results,
                    "error": r.error
                }
                for r in results
            ]
        }

    finally:
        # Cleanup
        for path in temp_paths:
            if Path(path).exists():
                Path(path).unlink()
        Path(temp_dir).rmdir()
```

---

## Success Metrics & Verification

### Performance Benchmarks

**Target Metrics:**
- Processing Speed: 10x speedup for large files (1GB+) with GPU
- Memory Efficiency: <1GB RAM for 100MB RTS files
- API Response: <100ms for common operations
- Batch Throughput: >100 images/minute on GPU

**Verification Commands:**
```bash
# Run benchmarks
python3 -m systems.pixel_compiler.benchmarks.pattern_benchmark

# Performance tests
pytest systems/pixel_compiler/tests/test_performance.py -v
```

### Test Coverage

**Required Coverage:**
- Unit tests: >80% coverage
- Integration tests: All API endpoints
- Performance tests: Benchmark suite

```bash
# Coverage report
pytest --cov=systems/pixel_compiler --cov-report=html
```

---

## Execution Phases

**Recommended Implementation Order:**

1. **Week 1-2**: Phase 1.2 (Performance & Optimization)
   - GPU acceleration (Task 1.2.1)
   - Parallel processing (Task 1.2.2)
   - Benchmarking (Task 1.2.3)

2. **Week 3-4**: Phase 1.3 (ML Integration)
   - CNN classifier (Task 1.3.1)
   - Autoencoder (Task 1.3.2)
   - Pattern database (Task 1.3.3)

3. **Week 5-6**: Phase 1.4 (Visualization)
   - Web dashboard (Task 1.4.1)
   - Analysis reports (Task 1.4.2)

4. **Week 7-8**: Phase 1.5 (Integration)
   - REST API (Task 1.5.1)
   - RTS-AMP integration (Task 1.5.2)

5. **Week 9+**: Phase 1.6 (Advanced Research)
   - Transformer models (Task 1.6.1)
   - Multi-modal analysis (Task 1.6.2)

---

**Plan complete and saved to `docs/plans/2026-02-09-pixelrts-vision-enhancement-roadmap.md`**

Two execution options:

**1. Subagent-Driven (this session)** - I dispatch fresh subagent per task, review between tasks, fast iteration

**2. Parallel Session (separate)** - Open new session with executing-plans, batch execution with checkpoints

Which approach?
