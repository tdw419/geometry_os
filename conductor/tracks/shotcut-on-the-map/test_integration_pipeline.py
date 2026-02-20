#!/usr/bin/env python3
"""
Tests for integration_pipeline.py - Full pipeline orchestration.

TDD: Write failing tests first, then implement.
"""

import json
import pytest
from pathlib import Path
from unittest.mock import Mock, patch, MagicMock
from PIL import Image
import tempfile


class TestCaptureAndTransmute:
    """Tests for the main capture_and_transmute function."""

    def test_capture_and_transmute_returns_dict(self):
        """capture_and_transmute should return a result dict."""
        from integration_pipeline import capture_and_transmute

        with tempfile.TemporaryDirectory() as tmpdir:
            result = capture_and_transmute(
                vm_host="mock:5900",
                output_dir=Path(tmpdir),
                resolution=(1920, 1080),
                mock_mode=True  # Use mock for testing
            )

        assert isinstance(result, dict)
        assert "screenshot" in result
        assert "extraction" in result
        assert "wgsl" in result
        assert "widget_count" in result

    def test_pipeline_calls_extraction(self):
        """Pipeline should call extraction_pipeline.extract()."""
        from integration_pipeline import capture_and_transmute

        with tempfile.TemporaryDirectory() as tmpdir:
            with patch("integration_pipeline.extract") as mock_extract:
                mock_extract.return_value = {
                    "widgets": [{"type": "panel", "text": "Test", "bbox": [0, 0, 100, 100]}],
                    "metadata": {"source_image": "test.png"}
                }

                result = capture_and_transmute(
                    vm_host="mock:5900",
                    output_dir=Path(tmpdir),
                    mock_mode=True
                )

                assert mock_extract.called

    def test_pipeline_calls_transmute(self):
        """Pipeline should call ui_transmuter.transmute()."""
        from integration_pipeline import capture_and_transmute

        with tempfile.TemporaryDirectory() as tmpdir:
            with patch("integration_pipeline.transmute_extraction") as mock_transmute:
                mock_transmute.return_value = "// Generated WGSL"

                result = capture_and_transmute(
                    vm_host="mock:5900",
                    output_dir=Path(tmpdir),
                    mock_mode=True
                )

                assert mock_transmute.called

    def test_output_wgsl_file_is_valid(self):
        """Output WGSL file should contain valid shader code."""
        from integration_pipeline import capture_and_transmute

        with tempfile.TemporaryDirectory() as tmpdir:
            result = capture_and_transmute(
                vm_host="mock:5900",
                output_dir=Path(tmpdir),
                mock_mode=True
            )

            wgsl_path = result["wgsl"]
            assert wgsl_path.exists()

            content = wgsl_path.read_text()
            # Should have WGSL markers
            assert "fn" in content  # Function definitions
            assert "vec2f" in content or "vec4f" in content  # Vector types


class TestVMCapture:
    """Tests for VM screenshot capture."""

    def test_mock_capture_returns_image(self):
        """Mock capture should return a PIL Image."""
        from integration_pipeline import capture_vm_framebuffer

        img = capture_vm_framebuffer("mock:5900", mock_mode=True)

        assert isinstance(img, Image.Image)
        assert img.size == (1920, 1080)

    def test_capture_with_custom_resolution(self):
        """Capture should respect custom resolution."""
        from integration_pipeline import capture_vm_framebuffer

        img = capture_vm_framebuffer(
            "mock:5900",
            resolution=(1280, 720),
            mock_mode=True
        )

        assert img.size == (1280, 720)

    def test_capture_saves_screenshot(self):
        """Capture should save screenshot to output dir."""
        from integration_pipeline import capture_and_transmute

        with tempfile.TemporaryDirectory() as tmpdir:
            result = capture_and_transmute(
                vm_host="mock:5900",
                output_dir=Path(tmpdir),
                mock_mode=True
            )

            assert result["screenshot"].exists()
            assert result["screenshot"].suffix == ".png"


class TestEndToEnd:
    """End-to-end integration tests."""

    def test_full_pipeline_produces_valid_wgsl(self):
        """Full pipeline should produce valid WGSL with widgets."""
        from integration_pipeline import capture_and_transmute

        with tempfile.TemporaryDirectory() as tmpdir:
            result = capture_and_transmute(
                vm_host="mock:5900",
                output_dir=Path(tmpdir),
                resolution=(1920, 1080),
                mock_mode=True
            )

            # Should have detected widgets
            assert result["widget_count"] >= 0

            # WGSL should be generated
            wgsl_content = result["wgsl"].read_text()
            assert len(wgsl_content) > 100  # Non-trivial shader

    def test_pipeline_with_mock_widgets(self):
        """Pipeline with mock widgets should include them in output."""
        from integration_pipeline import capture_and_transmute

        mock_extraction = {
            "widgets": [
                {"type": "panel", "text": "Timeline", "bbox": [0, 800, 1920, 280], "action": None},
                {"type": "clip", "text": "Video Clip", "bbox": [100, 820, 300, 60], "action": None},
                {"type": "playhead", "text": "", "bbox": [500, 800, 2, 280], "action": None}
            ],
            "metadata": {"source_image": "shotcut_mock.png"}
        }

        with tempfile.TemporaryDirectory() as tmpdir:
            with patch("integration_pipeline.extract") as mock_extract:
                mock_extract.return_value = mock_extraction

                result = capture_and_transmute(
                    vm_host="mock:5900",
                    output_dir=Path(tmpdir),
                    mock_mode=True
                )

                assert result["widget_count"] == 3

                wgsl_content = result["wgsl"].read_text()
                # Should have SDF for each widget type
                assert "sdRoundedBox" in wgsl_content  # panel
                assert "sdBox" in wgsl_content  # clip
                assert "sdLine" in wgsl_content  # playhead


class TestCLI:
    """Tests for CLI interface."""

    def test_cli_parse_args(self):
        """CLI should parse arguments correctly."""
        from integration_pipeline import parse_args

        args = parse_args([
            "--vm", "localhost:5900",
            "--output", "./output/",
            "--resolution", "1280x720"
        ])

        assert args.vm == "localhost:5900"
        assert args.output == "./output/"
        assert args.resolution == (1280, 720)

    def test_cli_default_args(self):
        """CLI should have sensible defaults."""
        from integration_pipeline import parse_args

        args = parse_args([])

        assert args.vm == "localhost:5900"
        assert args.resolution == (1920, 1080)
        assert args.watch is False

    def test_cli_watch_flag(self):
        """CLI should support --watch flag for live sync."""
        from integration_pipeline import parse_args

        args = parse_args(["--watch"])

        assert args.watch is True


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
