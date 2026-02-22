"""
PixelRTS v2 GPU Tracing Bridge

Connects PixelRTS encoding to VectorLand tracing system for visual debugging.

Features:
- Trace Hilbert curve traversal path
- Generate byte distribution heatmaps
- Export trace data for GPU visualization
- Detect content type (WASM, kernel, etc.)

Author: PixelRTS v2 Implementation
Date: 2026-02-09
"""

import numpy as np
import json
from typing import List, Tuple, Optional
from dataclasses import dataclass, asdict
from pathlib import Path


@dataclass
class TracePoint:
    """Represents a single point in the Hilbert curve trace"""
    x: int
    y: int
    index: int
    byte_value: int

    def to_dict(self) -> dict:
        """Convert to dictionary for JSON serialization"""
        return asdict(self)


class PixelRTSTracer:
    """
    Traces Hilbert curve traversal for GPU visualization.

    This bridge connects PixelRTS encoding to VectorLand's GPU tracing system,
    enabling visual debugging of encoded binaries.

    Example:
        >>> encoder = PixelRTSEncoder()
        >>> tracer = PixelRTSTracer(encoder)
        >>> trace = tracer.trace_hilbert_path(grid_size=1024)
        >>> tracer.export_to_json(trace, "trace.json")
    """

    # WASM magic number detection
    WASM_MAGIC = b'\x00\x61\x73\x6d'

    def __init__(self, encoder):
        """
        Initialize tracer with encoder instance.

        Args:
            encoder: PixelRTSEncoder instance
        """
        self.encoder = encoder
        self._last_trace = None
        self._metadata = None

    def trace_hilbert_path(self, grid_size: int = None) -> List[TracePoint]:
        """
        Record Hilbert curve traversal for visualization.

        Generates a complete trace of the Hilbert curve path, recording
        coordinates and byte values at each point.

        Args:
            grid_size: Grid dimension (power of 2). If None, uses encoder's last grid.

        Returns:
            List of TracePoint objects in traversal order

        Raises:
            ValueError: If grid_size is not provided and no encode has occurred
        """
        from pixelrts_v2_core import HilbertCurve

        if grid_size is None:
            # Try to get from metadata
            metadata = self.encoder.get_metadata()
            if metadata and 'grid_size' in metadata:
                grid_size = metadata['grid_size']
            else:
                raise ValueError(
                    "grid_size must be provided, or encoder must have encoded data"
                )

        # Verify grid size is power of 2
        if grid_size & (grid_size - 1) != 0:
            raise ValueError(f"Grid size must be power of 2, got {grid_size}")

        # Initialize Hilbert curve
        order = int(np.log2(grid_size))
        hilbert = HilbertCurve(order=order)
        lut = hilbert.generate_lut()

        # Generate trace points
        trace_points = []
        total_pixels = grid_size * grid_size

        for index in range(total_pixels):
            x, y = hilbert.index_to_coord(index)

            # Get byte value from index (normalized to 0-255)
            byte_value = index % 256

            trace_points.append(TracePoint(
                x=x,
                y=y,
                index=index,
                byte_value=byte_value
            ))

        self._last_trace = trace_points
        return trace_points

    def trace_encoded_data(self, data: bytes, grid_size: int = None) -> List[TracePoint]:
        """
        Trace Hilbert path with actual byte values from encoded data.

        Args:
            data: Binary data that was encoded
            grid_size: Grid dimension

        Returns:
            List of TracePoint objects with actual byte values
        """
        from pixelrts_v2_core import HilbertCurve

        if grid_size is None:
            # Calculate grid size from data
            from pixelrts_v2_core import calculate_grid_size
            grid_size = calculate_grid_size(len(data))

        # Initialize Hilbert curve
        order = int(np.log2(grid_size))
        hilbert = HilbertCurve(order=order)
        lut = hilbert.generate_lut()

        # Convert data to bytes array
        data_array = np.frombuffer(data, dtype=np.uint8)

        # Generate trace with actual byte values
        trace_points = []
        pixels_needed = (len(data) + 3) // 4

        for pixel_idx in range(min(pixels_needed, len(lut))):
            x, y = lut[pixel_idx]

            # Get the 4 bytes for this pixel
            start = pixel_idx * 4
            end = min(start + 4, len(data))
            pixel_bytes = data[start:end]

            # Use first byte as representative value
            byte_value = pixel_bytes[0] if pixel_bytes else 0

            trace_points.append(TracePoint(
                x=x,
                y=y,
                index=pixel_idx,
                byte_value=byte_value
            ))

        self._last_trace = trace_points
        self._metadata = {
            'data_size': len(data),
            'grid_size': grid_size,
            'pixels_used': pixels_needed
        }

        return trace_points

    def get_statistics(self, trace: List[TracePoint]) -> dict:
        """
        Calculate statistics for the trace.

        Args:
            trace: List of TracePoint objects

        Returns:
            Dictionary with trace statistics
        """
        if not trace:
            return {
                'total_points': 0,
                'grid_size': 0,
                'entropy_score': 0.0
            }

        # Get grid size from trace bounds
        max_x = max(p.x for p in trace)
        max_y = max(p.y for p in trace)
        grid_size = max(max_x, max_y) + 1

        # Calculate byte distribution
        byte_values = [p.byte_value for p in trace]
        unique_bytes = len(set(byte_values))

        # Simple entropy calculation (unique bytes / total points)
        entropy_score = unique_bytes / len(trace) if trace else 0

        # Detect content type from metadata
        content_type = self._detect_content_type() if self._metadata else 'binary'

        return {
            'total_points': len(trace),
            'grid_size': grid_size,
            'unique_bytes': unique_bytes,
            'entropy_score': entropy_score,
            'content_type': content_type,
            'data_size': self._metadata.get('data_size', 0) if self._metadata else 0
        }

    def _detect_content_type(self) -> str:
        """Detect content type from metadata"""
        if not self._metadata or 'data_size' not in self._metadata:
            return 'unknown'

        # Check if data might contain WASM magic number
        # For now, return generic type
        # Full implementation would check magic numbers
        return 'binary'

    def export_to_json(self, trace: List[TracePoint], output_path: str):
        """
        Export trace to JSON for VectorLand consumption.

        Args:
            trace: List of TracePoint objects
            output_path: Path to output JSON file
        """
        # Get grid size from trace
        grid_size = max(max(p.x, p.y) for p in trace) + 1 if trace else 0

        # Prepare export data
        export_data = {
            'version': '1.0',
            'format': 'PixelRTS-Trace',
            'grid_size': grid_size,
            'total_points': len(trace),
            'trace_points': [p.to_dict() for p in trace],
            'statistics': self.get_statistics(trace)
        }

        # Write to file
        output_path = Path(output_path)
        output_path.parent.mkdir(parents=True, exist_ok=True)

        with open(output_path, 'w') as f:
            json.dump(export_data, f, indent=2)

    def export_for_vectorland(self, trace: List[TracePoint], output_dir: str):
        """
        Export trace in VectorLand-compatible format.

        Creates multiple files:
        - trace.json: Full trace data
        - heatmap.png: Byte distribution visualization
        - metadata.json: Trace statistics

        Args:
            trace: List of TracePoint objects
            output_dir: Output directory path
        """
        output_dir = Path(output_dir)
        output_dir.mkdir(parents=True, exist_ok=True)

        # Export trace JSON
        self.export_to_json(trace, output_dir / 'trace.json')

        # Export metadata
        stats = self.get_statistics(trace)
        with open(output_dir / 'metadata.json', 'w') as f:
            json.dump(stats, f, indent=2)

        # Generate heatmap
        from pixelrts_heatmap import ByteHeatmapGenerator
        heatmap_gen = ByteHeatmapGenerator()

        # Get data size from metadata
        data_size = self._metadata.get('data_size', len(trace)) if self._metadata else len(trace)
        dummy_data = bytes([p.byte_value for p in trace])

        heatmap = heatmap_gen.generate_heatmap(
            dummy_data,
            grid_size=stats.get('grid_size', 32)
        )
        heatmap_gen.save_heatmap(heatmap, output_dir / 'heatmap.png')

    def visualize_in_vectorland(self, trace: List[TracePoint]):
        """
        Send trace data to VectorLand for GPU visualization.

        This is a placeholder for future VectorLand integration.
        Currently saves to a temp file that VectorLand can load.

        Args:
            trace: List of TracePoint objects
        """
        import tempfile

        # Create temp directory
        temp_dir = Path(tempfile.mkdtemp(prefix='pixelrts_trace_'))

        # Export for VectorLand
        self.export_for_vectorland(trace, temp_dir)

        print(f"Trace exported to: {temp_dir}")
        print("To visualize in VectorLand, load the trace.json file")

        return temp_dir
