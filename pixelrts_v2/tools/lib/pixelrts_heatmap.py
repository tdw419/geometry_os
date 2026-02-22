"""
PixelRTS v2 Byte Distribution Heatmap Generator

Generates visual heatmaps showing byte value distribution across
the Hilbert curve-encoded image.

Author: PixelRTS v2 Implementation
Date: 2026-02-09
"""

import numpy as np
from PIL import Image
from typing import Tuple
from pathlib import Path


class ByteHeatmapGenerator:
    """
    Generates heatmaps for byte distribution visualization.

    Color Mapping:
    - Low values (0-85): Purple/Blue to Cyan
    - Mid values (86-170): Green to Yellow
    - High values (171-255): Orange to Yellow

    Example:
        >>> gen = ByteHeatmapGenerator()
        >>> heatmap = gen.generate_heatmap(data, grid_size=1024)
        >>> gen.save_heatmap(heatmap, "output.png")
    """

    def __init__(self, colormap: str = 'viridis'):
        """
        Initialize heatmap generator.

        Args:
            colormap: Color scheme ('viridis', 'jet', 'hot', 'cool')
        """
        self.colormap = colormap

    def value_to_color(self, value: int) -> Tuple[int, int, int, int]:
        """
        Convert byte value (0-255) to RGBA color.

        Uses a perceptual colormap that makes it easy to distinguish
        different byte values.

        Args:
            value: Byte value (0-255)

        Returns:
            Tuple of (R, G, B, A) values
        """
        value = max(0, min(255, value))

        if self.colormap == 'viridis':
            # Viridis-like colormap (purple -> yellow)
            if value < 85:
                r = int(68 + (33 - 68) * value / 85)
                g = int(1 + (144 - 1) * value / 85)
                b = int(119 + (140 - 119) * value / 85)
            elif value < 170:
                v = value - 85
                r = int(33 + (34 - 33) * v / 85)
                g = int(144 + (196 - 144) * v / 85)
                b = int(140 + (83 - 140) * v / 85)
            else:
                v = value - 170
                r = int(34 + (253 - 34) * v / 85)
                g = int(196 + (231 - 196) * v / 85)
                b = int(83 + (37 - 83) * v / 85)

        elif self.colormap == 'jet':
            if value < 64:
                r, g, b = 0, value * 4, 255
            elif value < 128:
                r, g, b = 0, 255, 255 - (value - 64) * 4
            elif value < 192:
                r, g, b = (value - 128) * 4, 255, 0
            else:
                r, g, b = 255, 255 - (value - 192) * 4, 0

        elif self.colormap == 'hot':
            if value < 85:
                r, g, b = value * 3, 0, 0
            elif value < 170:
                r, g, b = 255, (value - 85) * 3, 0
            else:
                r, g, b = 255, 255, (value - 170) * 3

        else:  # cool
            r = value
            g = 255 - value
            b = 255

        return (r, g, b, 255)

    def generate_heatmap(self, data: bytes, grid_size: int) -> np.ndarray:
        """Generate byte distribution heatmap."""
        from pixelrts_v2_core import HilbertCurve

        order = int(np.log2(grid_size))
        hilbert = HilbertCurve(order=order)
        lut = hilbert.generate_lut()

        pixel_array = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)
        data_array = np.frombuffer(data, dtype=np.uint8)
        pixels_needed = min((len(data) + 3) // 4, len(lut))

        for pixel_idx in range(pixels_needed):
            x, y = lut[pixel_idx]
            start = pixel_idx * 4
            byte_value = data_array[start] if start < len(data_array) else 0
            r, g, b, a = self.value_to_color(byte_value)
            pixel_array[y, x] = [r, g, b, a]

        return pixel_array

    def generate_entropy_heatmap(self, data: bytes, grid_size: int,
                                 window_size: int = 256) -> np.ndarray:
        """Generate entropy-based heatmap."""
        from pixelrts_v2_core import HilbertCurve

        data_array = np.frombuffer(data, dtype=np.uint8)
        entropy = np.zeros(len(data_array), dtype=np.float32)

        for i in range(len(data_array)):
            start = max(0, i - window_size // 2)
            end = min(len(data_array), i + window_size // 2 + 1)
            window = data_array[start:end]
            unique, counts = np.unique(window, return_counts=True)
            probs = counts / len(window)
            ent = -np.sum(probs * np.log2(probs + 1e-10))
            entropy[i] = ent

        if entropy.max() > 0:
            entropy = (entropy / entropy.max() * 255).astype(np.uint8)

        order = int(np.log2(grid_size))
        hilbert = HilbertCurve(order=order)
        lut = hilbert.generate_lut()

        pixel_array = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)
        pixels_needed = min((len(data) + 3) // 4, len(lut))

        for pixel_idx in range(pixels_needed):
            x, y = lut[pixel_idx]
            start = pixel_idx * 4
            ent_value = entropy[start] if start < len(entropy) else 0
            r, g, b, a = self.value_to_color(ent_value)
            pixel_array[y, x] = [r, g, b, a]

        return pixel_array

    def save_heatmap(self, heatmap: np.ndarray, output_path: str):
        """Save heatmap to PNG file."""
        output_path = Path(output_path)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        image = Image.fromarray(heatmap, mode='RGBA')
        image.save(output_path)
