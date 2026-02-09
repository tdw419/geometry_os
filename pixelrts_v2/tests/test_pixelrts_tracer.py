#!/usr/bin/env python3
"""Tests for PixelRTS GPU Tracing Bridge"""
import pytest
import sys
from pathlib import Path
import tempfile
import json

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent / 'tools' / 'lib'))

from pixelrts_v2_core import PixelRTSEncoder, HilbertCurve


def test_tracer_initialization():
    """Test that tracer can be initialized"""
    from pixelrts_tracer import PixelRTSTracer

    encoder = PixelRTSEncoder()
    tracer = PixelRTSTracer(encoder)
    assert tracer is not None
    assert tracer.encoder == encoder


def test_trace_hilbert_path_small():
    """Test Hilbert curve path tracing for small grid"""
    from pixelrts_tracer import PixelRTSTracer

    encoder = PixelRTSEncoder()
    encoder.mode = "standard"
    tracer = PixelRTSTracer(encoder)

    # Create small test data
    test_data = b'\x00\x01\x02\x03' * 4  # 16 bytes
    grid_size = 4  # 4x4 = 16 pixels

    # Encode to get the Hilbert curve
    png_bytes = encoder.encode(test_data, grid_size=grid_size)

    # Trace the path
    trace = tracer.trace_hilbert_path(grid_size=grid_size)

    assert len(trace) == 16
    # First point should be at Hilbert index 0
    assert trace[0].index == 0
    assert trace[0].x >= 0 and trace[0].x < grid_size
    assert trace[0].y >= 0 and trace[0].y < grid_size


def test_trace_point_dataclass():
    """Test TracePoint dataclass"""
    from pixelrts_tracer import TracePoint

    # Create trace point
    point = TracePoint(x=5, y=10, index=42, byte_value=255)

    assert point.x == 5
    assert point.y == 10
    assert point.index == 42
    assert point.byte_value == 255


def test_heatmap_generation():
    """Test byte distribution heatmap generation"""
    from pixelrts_heatmap import ByteHeatmapGenerator

    test_data = bytes(range(256)) * 4  # All byte values

    heatmap_gen = ByteHeatmapGenerator()
    heatmap = heatmap_gen.generate_heatmap(test_data, grid_size=32)

    assert heatmap.shape == (32, 32, 4)
    # Should have non-zero values since we have diverse data
    assert heatmap.max() > 0


def test_tracer_export_to_json():
    """Test exporting trace to JSON for VectorLand"""
    from pixelrts_tracer import PixelRTSTracer

    encoder = PixelRTSEncoder()
    tracer = PixelRTSTracer(encoder)

    # Create small test
    test_data = b'\x00\x01\x02\x03' * 4
    png_bytes = encoder.encode(test_data, grid_size=4)
    trace = tracer.trace_hilbert_path(grid_size=4)

    # Export to temp file
    with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
        output_path = f.name

    try:
        tracer.export_to_json(trace, output_path)

        # Verify JSON structure
        with open(output_path, 'r') as f:
            data = json.load(f)

        assert 'trace_points' in data
        assert 'grid_size' in data
        assert len(data['trace_points']) == 16
    finally:
        Path(output_path).unlink()


def test_tracer_get_statistics():
    """Test trace statistics generation"""
    from pixelrts_tracer import PixelRTSTracer

    encoder = PixelRTSEncoder()
    tracer = PixelRTSTracer(encoder)

    test_data = b'\x00\x01\x02\x03' * 16  # 64 bytes
    png_bytes = encoder.encode(test_data, grid_size=8)
    trace = tracer.trace_hilbert_path(grid_size=8)

    stats = tracer.get_statistics(trace)

    assert 'total_points' in stats
    assert 'grid_size' in stats
    assert 'entropy_score' in stats
    assert stats['total_points'] == 64
    assert stats['grid_size'] == 8


def test_heatmap_color_map():
    """Test heatmap color mapping"""
    from pixelrts_heatmap import ByteHeatmapGenerator

    heatmap_gen = ByteHeatmapGenerator()

    # Test low value (should be blue/purple in viridis)
    rgba_low = heatmap_gen.value_to_color(0)
    assert len(rgba_low) == 4  # RGBA
    assert rgba_low[3] == 255  # Alpha should be 255

    # Test high value (should be yellow in viridis)
    rgba_high = heatmap_gen.value_to_color(255)
    assert len(rgba_high) == 4
    assert rgba_high[3] == 255


def test_tracer_with_wasm_detection():
    """Test tracer detects and handles WASM bytecode"""
    from pixelrts_tracer import PixelRTSTracer

    # WASM magic number
    wasm_magic = b'\x00\x61\x73\x6d'
    test_data = wasm_magic + b'\x01\x00\x00\x00' + b'\x00' * 20

    encoder = PixelRTSEncoder()
    tracer = PixelRTSTracer(encoder)

    png_bytes = encoder.encode(test_data, grid_size=4)
    trace = tracer.trace_encoded_data(test_data, grid_size=4)

    # Should have trace points
    assert len(trace) > 0

    # Stats should include content type
    stats = tracer.get_statistics(trace)
    assert 'content_type' in stats
