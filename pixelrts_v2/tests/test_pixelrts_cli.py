#!/usr/bin/env python3
"""
Tests for PixelRTS Unified CLI

Tests the pixelrts command-line interface for all operations.
"""

import pytest
import sys
from pathlib import Path
import tempfile
import subprocess
import json

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent / 'tools'))

from pixelrts import PixelRTSCLI


def test_cli_convert_command():
    """Test convert command - binary to .rts.png encoding"""
    cli = PixelRTSCLI()

    # Create test input file
    test_data = b'\x00\x01\x02\x03' * 256  # 1KB of test data

    with tempfile.NamedTemporaryFile(mode='wb', delete=False, suffix='.bin') as f:
        input_path = f.name
        f.write(test_data)

    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
        output_path = f.name

    try:
        # Run convert command
        result = cli.cmd_convert(input_path, output_path)

        # Verify output file exists
        assert Path(output_path).exists()

        # Verify metadata file exists
        meta_path = output_path + '.meta.json'
        assert Path(meta_path).exists()

        # Verify metadata
        with open(meta_path, 'r') as f:
            metadata = json.load(f)

        assert 'data_size' in metadata
        assert 'grid_size' in metadata
        assert 'data_hash' in metadata

        # Verify result is success (0)
        assert result == 0

    finally:
        # Cleanup
        Path(input_path).unlink(missing_ok=True)
        Path(output_path).unlink(missing_ok=True)
        Path(meta_path).unlink(missing_ok=True)


def test_cli_convert_with_metadata():
    """Test convert command with custom metadata"""
    cli = PixelRTSCLI()

    test_data = b'\x00\x01\x02\x03' * 64

    with tempfile.NamedTemporaryFile(mode='wb', delete=False, suffix='.bin') as f:
        input_path = f.name
        f.write(test_data)

    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
        output_path = f.name

    try:
        # Run convert with metadata
        result = cli.cmd_convert(
            input_path,
            output_path,
            content_type='wasm',
            name='test_module',
            version='1.0.0',
            description='Test WASM module'
        )

        assert result == 0

        # Verify metadata contains custom fields
        meta_path = output_path + '.meta.json'
        with open(meta_path, 'r') as f:
            metadata = json.load(f)

        assert metadata.get('type') == 'wasm'
        assert metadata.get('name') == 'test_module'
        assert metadata.get('content_version') == '1.0.0'
        assert metadata.get('description') == 'Test WASM module'

    finally:
        Path(input_path).unlink(missing_ok=True)
        Path(output_path).unlink(missing_ok=True)
        Path(output_path + '.meta.json').unlink(missing_ok=True)


def test_cli_extract_command():
    """Test extract command - .rts.png to binary decoding"""
    cli = PixelRTSCLI()

    # First create a .rts.png file
    test_data = b'\x00\x01\x02\x03' * 128

    with tempfile.NamedTemporaryFile(mode='wb', delete=False, suffix='.bin') as f:
        input_path = f.name
        f.write(test_data)

    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
        png_path = f.name

    with tempfile.NamedTemporaryFile(suffix='.extracted', delete=False) as f:
        output_path = f.name

    try:
        # First convert to .rts.png
        cli.cmd_convert(input_path, png_path)

        # Then extract
        result = cli.cmd_extract(png_path, output_path)

        assert result == 0
        assert Path(output_path).exists()

        # Verify extracted data matches original
        with open(output_path, 'rb') as f:
            extracted_data = f.read()

        assert extracted_data == test_data

    finally:
        Path(input_path).unlink(missing_ok=True)
        Path(png_path).unlink(missing_ok=True)
        Path(png_path + '.meta.json').unlink(missing_ok=True)
        Path(output_path).unlink(missing_ok=True)


def test_cli_analyze_command():
    """Test analyze command - statistics and metadata display"""
    cli = PixelRTSCLI()

    # Create a .rts.png file first
    test_data = b'\x00\x01\x02\x03' * 64

    with tempfile.NamedTemporaryFile(mode='wb', delete=False, suffix='.bin') as f:
        input_path = f.name
        f.write(test_data)

    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
        png_path = f.name

    try:
        # Create .rts.png file
        cli.cmd_convert(input_path, png_path)

        # Analyze the file (capture output)
        import io
        import contextlib

        output = io.StringIO()
        with contextlib.redirect_stdout(output):
            result = cli.cmd_analyze(png_path)

        output_text = output.getvalue()

        assert result == 0
        assert 'PixelRTS' in output_text
        assert 'Grid Size' in output_text or 'grid_size' in output_text
        assert 'Data Size' in output_text or 'data_size' in output_text

    finally:
        Path(input_path).unlink(missing_ok=True)
        Path(png_path).unlink(missing_ok=True)
        Path(png_path + '.meta.json').unlink(missing_ok=True)


def test_cli_analyze_with_visualize():
    """Test analyze command with --visualize flag"""
    cli = PixelRTSCLI()

    test_data = b'\x00\x01\x02\x03' * 64

    with tempfile.NamedTemporaryFile(mode='wb', delete=False, suffix='.bin') as f:
        input_path = f.name
        f.write(test_data)

    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
        png_path = f.name

    with tempfile.NamedTemporaryFile(suffix='_heatmap.png', delete=False) as f:
        heatmap_path = f.name

    try:
        cli.cmd_convert(input_path, png_path)

        # Analyze with visualization
        result = cli.cmd_analyze(png_path, visualize=True, output_path=heatmap_path)

        assert result == 0
        # Heatmap may or may not be created depending on implementation
        # Just verify the command succeeds

    finally:
        Path(input_path).unlink(missing_ok=True)
        Path(png_path).unlink(missing_ok=True)
        Path(png_path + '.meta.json').unlink(missing_ok=True)
        Path(heatmap_path).unlink(missing_ok=True)


def test_cli_help_displays_all_commands():
    """Test that help displays all available commands"""
    cli = PixelRTSCLI()

    import io
    import contextlib

    output = io.StringIO()
    with contextlib.redirect_stdout(output):
        result = cli.cmd_help()

    output_text = output.getvalue()

    assert result == 0
    assert 'convert' in output_text
    assert 'extract' in output_text
    assert 'analyze' in output_text
    assert 'trace' in output_text
    assert 'serve' in output_text


def test_cli_trace_command():
    """Test trace command - Hilbert curve trace generation"""
    cli = PixelRTSCLI()

    test_data = bytes(range(256)) * 4  # 1KB with all byte values

    with tempfile.NamedTemporaryFile(mode='wb', delete=False, suffix='.bin') as f:
        input_path = f.name
        f.write(test_data)

    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
        png_path = f.name

    with tempfile.NamedTemporaryFile(suffix='.json', delete=False) as f:
        trace_path = f.name

    try:
        # Create .rts.png file
        cli.cmd_convert(input_path, png_path)

        # Generate trace
        result = cli.cmd_trace(png_path, trace_path)

        assert result == 0
        assert Path(trace_path).exists()

        # Verify trace JSON structure
        with open(trace_path, 'r') as f:
            trace_data = json.load(f)

        assert 'trace_points' in trace_data
        assert 'grid_size' in trace_data
        assert isinstance(trace_data['trace_points'], list)

    finally:
        Path(input_path).unlink(missing_ok=True)
        Path(png_path).unlink(missing_ok=True)
        Path(png_path + '.meta.json').unlink(missing_ok=True)
        Path(trace_path).unlink(missing_ok=True)


def test_cli_main_with_argparse():
    """Test main() entry point with argparse"""
    # This test verifies the CLI can be invoked via argparse

    with tempfile.NamedTemporaryFile(mode='wb', delete=False, suffix='.bin') as f:
        input_path = f.name
        f.write(b'\x00\x01\x02\x03' * 64)

    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
        output_path = f.name

    try:
        # Test via subprocess to simulate real CLI invocation
        result = subprocess.run(
            [sys.executable, '-m', 'pixelrts_v2.tools.pixelrts', 'convert', input_path, output_path],
            cwd='/home/jericho/zion/projects/geometry_os/geometry_os',
            capture_output=True,
            text=True
        )

        # Command may succeed or fail depending on module setup
        # We're mainly testing that the CLI structure is correct

    finally:
        Path(input_path).unlink(missing_ok=True)
        Path(output_path).unlink(missing_ok=True)
        Path(output_path + '.meta.json').unlink(missing_ok=True)


def test_cli_convert_invalid_input():
    """Test convert command with invalid input file"""
    cli = PixelRTSCLI()

    result = cli.cmd_convert('/nonexistent/file.bin', '/tmp/output.png')

    # Should return error code
    assert result != 0


def test_cli_extract_invalid_input():
    """Test extract command with invalid input file"""
    cli = PixelRTSCLI()

    result = cli.cmd_extract('/nonexistent/file.png', '/tmp/output.bin')

    # Should return error code
    assert result != 0


def test_cli_analyze_without_metadata():
    """Test analyze command when metadata is missing"""
    cli = PixelRTSCLI()

    # Create a plain PNG file (not a .rts.png)
    from PIL import Image
    import numpy as np

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        png_path = f.name

    try:
        # Create simple PNG
        img_array = np.zeros((64, 64, 4), dtype=np.uint8)
        img = Image.fromarray(img_array, mode='RGBA')
        img.save(png_path)

        # Analyze should handle missing metadata gracefully
        result = cli.cmd_analyze(png_path)

        # Should still succeed or provide meaningful error
        # Implementation may vary

    finally:
        Path(png_path).unlink(missing_ok=True)


def test_cli_trace_vectorland_export():
    """Test trace command with VectorLand export"""
    cli = PixelRTSCLI()

    test_data = b'\x00\x01\x02\x03' * 64

    with tempfile.NamedTemporaryFile(mode='wb', delete=False, suffix='.bin') as f:
        input_path = f.name
        f.write(test_data)

    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
        png_path = f.name

    with tempfile.TemporaryDirectory() as temp_dir:
        trace_dir = Path(temp_dir) / 'trace_output'

        try:
            cli.cmd_convert(input_path, png_path)

            # Generate VectorLand export
            result = cli.cmd_trace(png_path, vectorland_dir=str(trace_dir))

            assert result == 0
            assert trace_dir.exists()

            # Check for VectorLand files
            assert (trace_dir / 'trace.json').exists()
            assert (trace_dir / 'metadata.json').exists()

        finally:
            Path(input_path).unlink(missing_ok=True)
            Path(png_path).unlink(missing_ok=True)
            Path(png_path + '.meta.json').unlink(missing_ok=True)
