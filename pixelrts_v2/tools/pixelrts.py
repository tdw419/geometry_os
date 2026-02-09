#!/usr/bin/env python3
"""
PixelRTS v2 Unified CLI

Single command-line interface for all PixelRTS v2 operations:
- convert: Binary to .rts.png encoding
- extract: .rts.png to binary decoding
- analyze: Statistics and metadata display
- trace: Hilbert curve trace generation
- serve: Web dashboard launcher

Usage:
    pixelrts convert <input> <output.rts.png>
    pixelrts extract <input.rts.png> --output <output.bin>
    pixelrts analyze <input.rts.png> --visualize
    pixelrts trace <input.rts.png> --output <trace.json>
    pixelrts serve --port 8080

Author: PixelRTS v2 Implementation
Date: 2026-02-09
"""

import sys
import argparse
import json
import hashlib
from pathlib import Path
from typing import Optional, Dict, Any
import numpy as np
from PIL import Image
from io import BytesIO

# Add lib directory to path
sys.path.insert(0, str(Path(__file__).parent / 'lib'))

from pixelrts_v2_core import (
    PixelRTSEncoder,
    PixelRTSDecoder,
    PixelRTSMetadata,
    HilbertCurve,
    calculate_grid_size
)


class PixelRTSCLI:
    """
    Unified CLI for PixelRTS v2 operations.

    Provides a single entry point for all PixelRTS v2 functionality:
    - Converting binaries to .rts.png format
    - Extracting binaries from .rts.png
    - Analyzing .rts.png containers
    - Generating Hilbert curve traces
    - Launching web dashboard
    """

    def __init__(self):
        """Initialize the CLI"""
        self.encoder = None
        self.decoder = None

    def cmd_convert(
        self,
        input_path: str,
        output_path: str,
        content_type: Optional[str] = None,
        name: Optional[str] = None,
        version: Optional[str] = None,
        description: Optional[str] = None,
        grid_size: Optional[int] = None,
        mode: str = 'standard',
        verbose: bool = False
    ) -> int:
        """
        Convert binary file to .rts.png format.

        Args:
            input_path: Input binary file path
            output_path: Output .rts.png file path
            content_type: Content type (kernel, os, wasm, binary, etc.)
            name: Content name
            version: Content version
            description: Content description
            grid_size: Explicit grid size (power of 2)
            mode: Encoding mode (standard or code)
            verbose: Enable verbose output

        Returns:
            0 on success, non-zero on error
        """
        # Validate input file
        input_file = Path(input_path)
        if not input_file.exists():
            print(f"Error: Input file not found: {input_path}", file=sys.stderr)
            return 1

        if not input_file.is_file():
            print(f"Error: Input path is not a file: {input_path}", file=sys.stderr)
            return 1

        # Read input data
        try:
            with open(input_path, 'rb') as f:
                data = f.read()
        except IOError as e:
            print(f"Error: Failed to read input file: {e}", file=sys.stderr)
            return 1

        data_size = len(data)
        if verbose:
            print(f"Input size: {data_size} bytes ({data_size / 1024:.2f} KB)")

        # Create metadata
        metadata = self._create_metadata(
            input_path,
            data,
            content_type,
            name,
            version,
            description
        )

        # Calculate grid size
        if grid_size is None:
            grid_size = calculate_grid_size(data_size)
            if verbose:
                print(f"Auto-calculated grid size: {grid_size}x{grid_size}")

        # Verify data fits
        max_capacity = grid_size * grid_size * 4
        if data_size > max_capacity:
            print(f"Error: Data size ({data_size}) exceeds grid capacity ({max_capacity})", file=sys.stderr)
            return 1

        # Encode
        try:
            encoder = PixelRTSEncoder(mode=mode)
            png_bytes = encoder.encode(data, metadata=metadata, grid_size=grid_size)

            if verbose:
                print("Encoding complete.")

        except ValueError as e:
            print(f"Error: {e}", file=sys.stderr)
            return 1

        # Save PNG
        try:
            Path(output_path).parent.mkdir(parents=True, exist_ok=True)
            with open(output_path, 'wb') as f:
                f.write(png_bytes)

            print(f"Successfully created: {output_path}")

        except IOError as e:
            print(f"Error: Failed to write output: {e}", file=sys.stderr)
            return 1

        # Save sidecar metadata
        try:
            encoder_metadata = encoder.get_metadata()
            if encoder_metadata:
                meta_path = self._get_sidecar_path(output_path)
                with open(meta_path, 'w') as f:
                    json.dump(encoder_metadata, f, indent=2)
                print(f"Metadata saved to: {meta_path}")

        except Exception as e:
            print(f"Warning: Failed to save metadata: {e}", file=sys.stderr)

        # Print summary
        print(f"\nSummary:")
        print(f"  Input:  {input_path} ({data_size} bytes)")
        print(f"  Output: {output_path}")
        print(f"  Grid:   {grid_size}x{grid_size}")
        print(f"  Mode:   {mode}")

        return 0

    def cmd_extract(
        self,
        input_path: str,
        output_path: Optional[str] = None,
        verify: bool = False,
        verbose: bool = False
    ) -> int:
        """
        Extract binary data from .rts.png file.

        Args:
            input_path: Input .rts.png file path
            output_path: Output binary file path
            verify: Verify SHA256 hash
            verbose: Enable verbose output

        Returns:
            0 on success, non-zero on error
        """
        # Validate input
        input_file = Path(input_path)
        if not input_file.exists():
            print(f"Error: Input file not found: {input_path}", file=sys.stderr)
            return 1

        # Determine output path
        if output_path is None:
            output_path = str(input_file) + '.extracted'

        # Initialize decoder
        decoder = PixelRTSDecoder()

        # Load metadata
        meta_path = self._get_sidecar_path(input_path)
        if meta_path.exists():
            try:
                with open(meta_path, 'r') as f:
                    metadata = json.load(f)
                    decoder.set_metadata(metadata)
                    if verbose:
                        print(f"Loaded metadata from: {meta_path}")
            except Exception as e:
                print(f"Warning: Failed to load metadata: {e}", file=sys.stderr)

        # Extract
        try:
            data = decoder.load(str(input_path), verify_hash=verify)

            if verbose:
                print(f"Extracted {len(data)} bytes")

        except ValueError as e:
            print(f"Error: {e}", file=sys.stderr)
            return 1
        except Exception as e:
            print(f"Error: Failed to extract: {e}", file=sys.stderr)
            return 1

        # Save output
        try:
            Path(output_path).parent.mkdir(parents=True, exist_ok=True)
            with open(output_path, 'wb') as f:
                f.write(data)

            print(f"Extracted {len(data)} bytes to {output_path}")

        except IOError as e:
            print(f"Error: Failed to write output: {e}", file=sys.stderr)
            return 1

        return 0

    def cmd_analyze(
        self,
        input_path: str,
        visualize: bool = False,
        entropy: bool = False,
        output_path: Optional[str] = None,
        verbose: bool = False
    ) -> int:
        """
        Analyze .rts.png file and display statistics.

        Args:
            input_path: Input .rts.png file path
            visualize: Generate visualization
            entropy: Calculate entropy heatmap
            output_path: Output path for visualization
            verbose: Enable verbose output

        Returns:
            0 on success, non-zero on error
        """
        # Validate input
        input_file = Path(input_path)
        if not input_file.exists():
            print(f"Error: Input file not found: {input_path}", file=sys.stderr)
            return 1

        # Load metadata
        meta_path = self._get_sidecar_path(input_path)
        metadata = None

        if meta_path.exists():
            try:
                with open(meta_path, 'r') as f:
                    metadata = json.load(f)
            except Exception as e:
                print(f"Warning: Failed to load metadata: {e}", file=sys.stderr)

        # Print analysis
        print(f"PixelRTS v2 Container Analysis")
        print(f"=" * 50)
        print(f"File: {input_path}")

        if metadata:
            print(f"\nMetadata:")
            print(f"  Format: {metadata.get('format', 'Unknown')}")
            print(f"  Version: {metadata.get('format_version', 'Unknown')}")
            print(f"  Grid Size: {metadata.get('grid_size', 'Unknown')}x{metadata.get('grid_size', 'Unknown')}")
            print(f"  Encoding: {metadata.get('encoding', {}).get('type', 'Unknown')}")
            print(f"  Data Size: {metadata.get('data_size', 'Unknown')} bytes")

            if 'data_hash' in metadata:
                print(f"  SHA256: {metadata['data_hash']}")

            if 'type' in metadata:
                print(f"  Content Type: {metadata['type']}")

            if 'name' in metadata:
                print(f"  Name: {metadata['name']}")

            if 'content_version' in metadata:
                print(f"  Content Version: {metadata['content_version']}")

            if 'description' in metadata:
                print(f"  Description: {metadata['description']}")

            # Calculate statistics
            data_size = metadata.get('data_size', 0)
            grid_size = metadata.get('grid_size', 1)
            capacity = grid_size * grid_size * 4
            usage = (data_size / capacity * 100) if capacity > 0 else 0

            print(f"\nStatistics:")
            print(f"  Capacity: {capacity} bytes")
            print(f"  Usage: {usage:.1f}%")

        else:
            print(f"\nNo metadata found. File may not be a valid PixelRTS container.")

        # Generate visualization if requested
        if visualize:
            try:
                decoder = PixelRTSDecoder()
                data = decoder.load(str(input_path))

                # Generate visualization
                self._generate_visualization(data, metadata, output_path or str(input_file) + '_viz.png')

                if output_path:
                    print(f"\nVisualization saved to: {output_path}")

            except Exception as e:
                print(f"Warning: Failed to generate visualization: {e}", file=sys.stderr)

        # Generate entropy heatmap if requested
        if entropy:
            try:
                decoder = PixelRTSDecoder()
                data = decoder.load(str(input_path))

                entropy_path = output_path or str(input_file) + '_entropy.png'
                self._generate_entropy_heatmap(data, metadata, entropy_path)

                if entropy_path:
                    print(f"\nEntropy heatmap saved to: {entropy_path}")

            except Exception as e:
                print(f"Warning: Failed to generate entropy heatmap: {e}", file=sys.stderr)

        return 0

    def cmd_trace(
        self,
        input_path: str,
        output_path: Optional[str] = None,
        vectorland_dir: Optional[str] = None,
        verbose: bool = False
    ) -> int:
        """
        Generate Hilbert curve trace for .rts.png file.

        Args:
            input_path: Input .rts.png file path
            output_path: Output JSON trace file path
            vectorland_dir: Export directory for VectorLand
            verbose: Enable verbose output

        Returns:
            0 on success, non-zero on error
        """
        # Validate input
        input_file = Path(input_path)
        if not input_file.exists():
            print(f"Error: Input file not found: {input_path}", file=sys.stderr)
            return 1

        # Load metadata
        meta_path = self._get_sidecar_path(input_path)
        metadata = None

        if meta_path.exists():
            try:
                with open(meta_path, 'r') as f:
                    metadata = json.load(f)
            except Exception as e:
                print(f"Warning: Failed to load metadata: {e}", file=sys.stderr)

        # Extract data
        try:
            decoder = PixelRTSDecoder()
            if metadata:
                decoder.set_metadata(metadata)

            data = decoder.load(str(input_path))

        except Exception as e:
            print(f"Error: Failed to extract data: {e}", file=sys.stderr)
            return 1

        # Get grid size
        grid_size = metadata.get('grid_size', 1024) if metadata else 1024

        # Generate trace
        try:
            trace = self._generate_hilbert_trace(data, grid_size)

            if verbose:
                print(f"Generated trace with {len(trace)} points")

        except Exception as e:
            print(f"Error: Failed to generate trace: {e}", file=sys.stderr)
            return 1

        # Calculate statistics
        stats = self._calculate_trace_stats(trace, data)

        # Export trace
        if vectorland_dir:
            # VectorLand export
            vectorland_path = Path(vectorland_dir)
            vectorland_path.mkdir(parents=True, exist_ok=True)

            # Export trace.json
            trace_json = {
                'version': '1.0',
                'format': 'PixelRTS-Trace',
                'grid_size': grid_size,
                'total_points': len(trace),
                'trace_points': [t.to_dict() if hasattr(t, 'to_dict') else t for t in trace],
                'statistics': stats
            }

            with open(vectorland_path / 'trace.json', 'w') as f:
                json.dump(trace_json, f, indent=2)

            # Export metadata
            with open(vectorland_path / 'metadata.json', 'w') as f:
                json.dump(stats, f, indent=2)

            print(f"VectorLand export created: {vectorland_dir}")
            print(f"  trace.json: {len(trace)} points")
            print(f"  metadata.json: statistics")

        elif output_path:
            # Single JSON export
            trace_data = {
                'version': '1.0',
                'format': 'PixelRTS-Trace',
                'grid_size': grid_size,
                'total_points': len(trace),
                'trace_points': [t.to_dict() if hasattr(t, 'to_dict') else t for t in trace],
                'statistics': stats
            }

            with open(output_path, 'w') as f:
                json.dump(trace_data, f, indent=2)

            print(f"Trace saved to: {output_path}")

        else:
            # Print summary
            print(f"Hilbert Curve Trace")
            print(f"=" * 50)
            print(f"Grid Size: {grid_size}x{grid_size}")
            print(f"Total Points: {len(trace)}")
            print(f"Data Size: {stats.get('data_size', len(data))} bytes")
            print(f"Unique Bytes: {stats.get('unique_bytes', 0)}")
            print(f"Entropy Score: {stats.get('entropy_score', 0):.3f}")

        return 0

    def cmd_serve(
        self,
        port: int = 8080,
        host: str = 'localhost',
        debug: bool = False
    ) -> int:
        """
        Launch web dashboard server.

        Args:
            port: HTTP port
            host: Bind address
            debug: Enable debug mode

        Returns:
            0 on success (server runs until interrupted)
        """
        print(f"PixelRTS v2 Web Dashboard")
        print(f"=" * 50)
        print(f"Starting server on http://{host}:{port}")
        print(f"\nNote: Web dashboard feature coming in Phase 3")
        print(f"Current implementation provides CLI access only.")

        # For now, just return
        # Full implementation would launch Flask/Streamlit server
        return 0

    def cmd_help(self) -> int:
        """Display help information"""
        help_text = """
PixelRTS v2 Unified CLI

Commands:
  convert    Convert binary to .rts.png format
  extract    Extract binary from .rts.png
  analyze    Analyze .rts.png container
  trace      Generate Hilbert curve trace
  serve      Launch web dashboard (coming soon)

Usage:
  pixelrts convert <input> <output.rts.png> [options]
  pixelrts extract <input.rts.png> [--output <output.bin>] [options]
  pixelrts analyze <input.rts.png> [--visualize] [--entropy] [options]
  pixelrts trace <input.rts.png> [--output <trace.json>] [--vectorland <dir>]
  pixelrts serve [--port PORT] [--host HOST]

Examples:
  # Convert binary to .rts.png
  pixelrts convert kernel.bin kernel.rts.png

  # Convert with metadata
  pixelrts convert module.wasm module.rts.png --type wasm --name "My Module"

  # Extract from .rts.png
  pixelrts extract kernel.rts.png --output restored.bin

  # Analyze container
  pixelrts analyze kernel.rts.png --visualize

  # Generate trace for VectorLand
  pixelrts trace kernel.rts.png --vectorland ./trace_output

For more information, use:
  pixelrts <command> --help
"""
        print(help_text)
        return 0

    # Private helper methods

    def _create_metadata(
        self,
        input_path: str,
        data: bytes,
        content_type: Optional[str],
        name: Optional[str],
        version: Optional[str],
        description: Optional[str]
    ) -> dict:
        """Create metadata dictionary"""
        metadata = {}

        if content_type:
            metadata['type'] = content_type
        if name:
            metadata['name'] = name
        if version:
            metadata['version'] = version
        if description:
            metadata['description'] = description

        # Calculate hash
        data_hash = hashlib.sha256(data).hexdigest()
        file_size = Path(input_path).stat().st_size

        # Create segment info
        segment_name = name or Path(input_path).stem
        metadata['segments'] = {
            segment_name: {
                'type': content_type or 'binary',
                'size': file_size,
                'sha256': data_hash
            }
        }

        if version:
            metadata['segments'][segment_name]['version'] = version
        if description:
            metadata['segments'][segment_name]['description'] = description

        return metadata

    def _get_sidecar_path(self, file_path: str) -> Path:
        """Get sidecar metadata path"""
        path = Path(file_path)
        return Path(str(path) + '.meta.json')

    def _generate_visualization(
        self,
        data: bytes,
        metadata: Optional[dict],
        output_path: str
    ):
        """Generate visualization of encoded data"""
        grid_size = metadata.get('grid_size', 1024) if metadata else 1024

        # Calculate order
        order = int(np.log2(grid_size))
        hilbert = HilbertCurve(order=order)
        lut = hilbert.generate_lut()

        # Create pixel array
        pixel_array = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)

        # Map data to pixels
        data_array = np.frombuffer(data, dtype=np.uint8)
        pixels_needed = min((len(data) + 3) // 4, len(lut))

        for pixel_idx in range(pixels_needed):
            x, y = lut[pixel_idx]
            start = pixel_idx * 4

            # Get RGBA values
            r = data_array[start] if start < len(data_array) else 0
            g = data_array[start + 1] if start + 1 < len(data_array) else 0
            b = data_array[start + 2] if start + 2 < len(data_array) else 0
            a = data_array[start + 3] if start + 3 < len(data_array) else 0

            pixel_array[y, x] = [r, g, b, a]

        # Save image
        img = Image.fromarray(pixel_array, mode='RGBA')
        img.save(output_path)

    def _generate_entropy_heatmap(
        self,
        data: bytes,
        metadata: Optional[dict],
        output_path: str
    ):
        """Generate entropy heatmap"""
        grid_size = metadata.get('grid_size', 1024) if metadata else 1024

        # Calculate byte entropy
        data_array = np.frombuffer(data, dtype=np.uint8)
        window_size = max(1, min(256, len(data_array) // 10))

        entropy = np.zeros(len(data_array), dtype=np.float32)

        for i in range(len(data_array)):
            start = max(0, i - window_size // 2)
            end = min(len(data_array), i + window_size // 2 + 1)
            window = data_array[start:end]

            if len(window) > 0:
                unique, counts = np.unique(window, return_counts=True)
                probs = counts / len(window)
                ent = -np.sum(probs * np.log2(probs + 1e-10))
                entropy[i] = ent

        # Normalize to 0-255
        if entropy.max() > 0:
            entropy = (entropy / entropy.max() * 255).astype(np.uint8)

        # Map to Hilbert curve
        order = int(np.log2(grid_size))
        hilbert = HilbertCurve(order=order)
        lut = hilbert.generate_lut()

        pixel_array = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)

        pixels_needed = min((len(data) + 3) // 4, len(lut))

        for pixel_idx in range(pixels_needed):
            x, y = lut[pixel_idx]
            start = pixel_idx * 4
            ent_value = entropy[start] if start < len(entropy) else 0

            # Color map: blue (low) to red (high)
            r = ent_value
            g = 0
            b = 255 - ent_value
            a = 255

            pixel_array[y, x] = [r, g, b, a]

        # Save image
        img = Image.fromarray(pixel_array, mode='RGBA')
        img.save(output_path)

    def _generate_hilbert_trace(self, data: bytes, grid_size: int):
        """Generate Hilbert curve trace points"""
        from dataclasses import dataclass

        @dataclass
        class TracePoint:
            x: int
            y: int
            index: int
            byte_value: int

            def to_dict(self):
                return {
                    'x': self.x,
                    'y': self.y,
                    'index': self.index,
                    'byte_value': self.byte_value
                }

        # Initialize Hilbert curve
        order = int(np.log2(grid_size))
        hilbert = HilbertCurve(order=order)
        lut = hilbert.generate_lut()

        # Generate trace points
        data_array = np.frombuffer(data, dtype=np.uint8)
        pixels_needed = (len(data) + 3) // 4

        trace_points = []
        for pixel_idx in range(min(pixels_needed, len(lut))):
            x, y = lut[pixel_idx]

            # Get representative byte value
            start = pixel_idx * 4
            byte_value = data_array[start] if start < len(data_array) else 0

            trace_points.append(TracePoint(
                x=x,
                y=y,
                index=pixel_idx,
                byte_value=int(byte_value)
            ))

        return trace_points

    def _calculate_trace_stats(self, trace, data: bytes) -> dict:
        """Calculate trace statistics"""
        if not trace:
            return {
                'total_points': 0,
                'data_size': 0,
                'unique_bytes': 0,
                'entropy_score': 0.0
            }

        # Get byte values
        byte_values = [t.byte_value for t in trace]
        unique_bytes = len(set(byte_values))

        # Calculate entropy
        entropy_score = unique_bytes / len(trace) if trace else 0

        return {
            'total_points': len(trace),
            'data_size': len(data),
            'unique_bytes': unique_bytes,
            'entropy_score': float(entropy_score)
        }


def main():
    """Main entry point for CLI"""
    parser = argparse.ArgumentParser(
        description='PixelRTS v2 Unified CLI - Binary to PNG converter',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  pixelrts convert kernel.bin kernel.rts.png
  pixelrts convert module.wasm module.rts.png --type wasm --name "My Module"
  pixelrts extract kernel.rts.png --output restored.bin
  pixelrts analyze kernel.rts.png --visualize
  pixelrts trace kernel.rts.png --vectorland ./trace_output
        """
    )

    subparsers = parser.add_subparsers(dest='command', help='Available commands')

    # Convert command
    convert_parser = subparsers.add_parser('convert', help='Convert binary to .rts.png')
    convert_parser.add_argument('input', help='Input binary file')
    convert_parser.add_argument('output', help='Output .rts.png file')
    convert_parser.add_argument('--type', help='Content type (kernel, os, wasm, binary)')
    convert_parser.add_argument('--name', help='Content name')
    convert_parser.add_argument('--version', help='Content version')
    convert_parser.add_argument('--description', help='Content description')
    convert_parser.add_argument('--grid-size', type=int, help='Grid size (power of 2)')
    convert_parser.add_argument('--mode', choices=['standard', 'code'], default='standard',
                                help='Encoding mode')
    convert_parser.add_argument('-v', '--verbose', action='store_true', help='Verbose output')

    # Extract command
    extract_parser = subparsers.add_parser('extract', help='Extract binary from .rts.png')
    extract_parser.add_argument('input', help='Input .rts.png file')
    extract_parser.add_argument('-o', '--output', help='Output binary file')
    extract_parser.add_argument('--verify', action='store_true', help='Verify SHA256 hash')
    extract_parser.add_argument('-v', '--verbose', action='store_true', help='Verbose output')

    # Analyze command
    analyze_parser = subparsers.add_parser('analyze', help='Analyze .rts.png container')
    analyze_parser.add_argument('input', help='Input .rts.png file')
    analyze_parser.add_argument('--visualize', action='store_true', help='Generate visualization')
    analyze_parser.add_argument('--entropy', action='store_true', help='Generate entropy heatmap')
    analyze_parser.add_argument('-o', '--output', help='Output path for visualization')
    analyze_parser.add_argument('-v', '--verbose', action='store_true', help='Verbose output')

    # Trace command
    trace_parser = subparsers.add_parser('trace', help='Generate Hilbert curve trace')
    trace_parser.add_argument('input', help='Input .rts.png file')
    trace_parser.add_argument('-o', '--output', help='Output trace JSON file')
    trace_parser.add_argument('--vectorland', help='Export directory for VectorLand')
    trace_parser.add_argument('-v', '--verbose', action='store_true', help='Verbose output')

    # Serve command
    serve_parser = subparsers.add_parser('serve', help='Launch web dashboard')
    serve_parser.add_argument('--port', type=int, default=8080, help='HTTP port')
    serve_parser.add_argument('--host', default='localhost', help='Bind address')
    serve_parser.add_argument('--debug', action='store_true', help='Debug mode')

    args = parser.parse_args()

    # Show help if no command
    if not args.command:
        parser.print_help()
        return 0

    # Create CLI instance
    cli = PixelRTSCLI()

    # Execute command
    if args.command == 'convert':
        return cli.cmd_convert(
            args.input,
            args.output,
            content_type=args.type,
            name=args.name,
            version=args.version,
            description=args.description,
            grid_size=args.grid_size,
            mode=args.mode,
            verbose=args.verbose
        )

    elif args.command == 'extract':
        return cli.cmd_extract(
            args.input,
            output_path=args.output,
            verify=args.verify,
            verbose=args.verbose
        )

    elif args.command == 'analyze':
        return cli.cmd_analyze(
            args.input,
            visualize=args.visualize,
            entropy=args.entropy,
            output_path=args.output,
            verbose=args.verbose
        )

    elif args.command == 'trace':
        return cli.cmd_trace(
            args.input,
            output_path=args.output,
            vectorland_dir=args.vectorland,
            verbose=args.verbose
        )

    elif args.command == 'serve':
        return cli.cmd_serve(
            port=args.port,
            host=args.host,
            debug=args.debug
        )

    else:
        parser.print_help()
        return 1


if __name__ == '__main__':
    sys.exit(main())
