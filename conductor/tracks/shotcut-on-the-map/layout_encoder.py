"""
Layout Encoder - PixelRTS v3 Integration

Encodes layout detection results as geometric RGBA textures
that can be processed by the GeometricVM.

PixelRTS v3 Layout Instruction Set:
  LDP (0x10): Load Panel - G=panel_id, B=x, A=y
  LDB (0x11): Load Button - G=button_id, B=x, A=y
  LDL (0x12): Load Line - G=orientation(0=H,1=V), B=x1, A=y1
  HALT (0x07): End of layout data
"""

import sys
from pathlib import Path
from typing import List, Dict, Any, Tuple
from io import BytesIO

from PIL import Image
import numpy as np

# Import HilbertCurve from pasm if available
try:
    sys.path.insert(0, str(Path(__file__).parent.parent.parent / "systems" / "pixel_compiler" / "pixelrts_v3"))
    from pasm import HilbertCurve
except ImportError:
    # Fallback Hilbert implementation
    class HilbertCurve:
        def __init__(self, n):
            self.n = n

        def d2xy(self, d):
            n = self.n
            x, y = 0, 0
            s = 1
            while s < n:
                rx = 1 & (d // 2)
                ry = 1 & (d ^ rx)
                if ry == 0:
                    if rx == 1:
                        x = s - 1 - x
                        y = s - 1 - y
                    x, y = y, x
                x += s * rx
                y += s * ry
                d //= 4
                s *= 2
            return x, y


# Layout Instruction Opcodes
LAYOUT_OPCODES = {
    "LDP": 0x10,  # Load Panel
    "LDB": 0x11,  # Load Button
    "LDL": 0x12,  # Load Line
    "HALT": 0x07,
}


class LayoutEncoder:
    """
    Encodes LayoutResult as PixelRTS v3 geometric texture.

    The encoded image can be:
    - Stored as .rts.png cartridge
    - Executed by GeometricVM for layout reconstruction
    - Used for efficient layout data transfer
    """

    def __init__(self):
        """Initialize the encoder."""
        pass

    def encode(self, layout_result) -> Image.Image:
        """
        Encode a LayoutResult as RGBA image using Hilbert mapping.

        Args:
            layout_result: LayoutResult from LayoutInferencer

        Returns:
            PIL Image with encoded layout instructions
        """
        instructions = []

        # Encode panels as LDP instructions
        for i, panel in enumerate(layout_result.panels[:255]):  # Max 255 panels
            bbox = panel.get("bbox", [0, 0, 0, 0])
            x, y = bbox[0], bbox[1]
            instructions.append((
                LAYOUT_OPCODES["LDP"],  # R: opcode
                i & 0xFF,               # G: panel_id
                x & 0xFF,               # B: x (clamped to 8-bit)
                y & 0xFF                # A: y (clamped to 8-bit)
            ))

        # Encode buttons as LDB instructions
        for i, button in enumerate(layout_result.buttons[:255]):
            bbox = button.get("bbox", [0, 0, 0, 0])
            x, y = bbox[0], bbox[1]
            instructions.append((
                LAYOUT_OPCODES["LDB"],  # R: opcode
                i & 0xFF,               # G: button_id
                x & 0xFF,               # B: x
                y & 0xFF                # A: y
            ))

        # Encode lines as LDL instructions
        for line in layout_result.lines[:255]:
            (x1, y1), (x2, y2) = line
            orientation = 0 if abs(y1 - y2) < 10 else 1  # 0=horizontal, 1=vertical
            instructions.append((
                LAYOUT_OPCODES["LDL"],  # R: opcode
                orientation,            # G: orientation
                x1 & 0xFF,              # B: x1
                y1 & 0xFF               # A: y1
            ))

        # Add HALT instruction
        instructions.append((LAYOUT_OPCODES["HALT"], 0, 0, 0))

        # Calculate grid size (power of 2)
        num_pixels = len(instructions)
        grid_size = 1
        while grid_size * grid_size < num_pixels:
            grid_size *= 2

        # Create image and map instructions via Hilbert curve
        img = Image.new('RGBA', (grid_size, grid_size), (0, 0, 0, 0))
        pixels = img.load()
        hilbert = HilbertCurve(grid_size)

        for i, rgba in enumerate(instructions):
            x, y = hilbert.d2xy(i)
            pixels[x, y] = rgba

        return img

    def encode_to_bytes(self, layout_result) -> bytes:
        """
        Encode layout result as PNG bytes.

        Args:
            layout_result: LayoutResult from LayoutInferencer

        Returns:
            PNG image as bytes
        """
        img = self.encode(layout_result)

        buffer = BytesIO()
        img.save(buffer, format='PNG')
        return buffer.getvalue()

    def encode_to_file(self, layout_result, output_path: str):
        """
        Encode layout result to .rts.png file.

        Args:
            layout_result: LayoutResult from LayoutInferencer
            output_path: Path to save the .rts.png file
        """
        img = self.encode(layout_result)
        img.save(output_path)


def encode_layout(layout_result, output_path: str = None) -> Image.Image:
    """
    Convenience function to encode a layout.

    Args:
        layout_result: LayoutResult from LayoutInferencer
        output_path: Optional path to save .rts.png

    Returns:
        PIL Image with encoded layout
    """
    encoder = LayoutEncoder()
    if output_path:
        encoder.encode_to_file(layout_result, output_path)
    return encoder.encode(layout_result)
