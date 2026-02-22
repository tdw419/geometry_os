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
