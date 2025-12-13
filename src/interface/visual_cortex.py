"""
OMNI-GEOMETRY Visual Cortex
Translates High-Dimensional Vectors into Perceptual Pixels.
"""

import numpy as np
from typing import Tuple, Dict, Any, List

class VisualCortex:
    """
    The Visual Cortex is responsible for the 'Holographic' projection of the OS.
    It maps semantic vectors to visual properties (Color, Shape, Texture).
    """
    
    @staticmethod
    def vector_to_color(vector: List[float]) -> Tuple[int, int, int]:
        """
        Map a 32D semantic vector to an RGB color.
        Similar vectors will produce similar colors.
        """
        # Ensure vector is numpy array
        v = np.array(vector)
        
        # Split vector into 3 semantic channels
        # If vector is 32D:
        # R: 0-10, G: 11-20, B: 21-31
        
        # We perform a weighted sum and normalize to 0-255
        # We use absolute values to ensure energy contributes to brightness
        r_energy = np.sum(np.abs(v[0:10]))
        g_energy = np.sum(np.abs(v[10:21]))
        b_energy = np.sum(np.abs(v[21:32]))
        
        # Normalize assuming a typical max energy distribution
        # This constant might need tuning based on vectorizer output
        normalization = 2.0 
        
        r = min(255, int((r_energy / normalization) * 255))
        g = min(255, int((g_energy / normalization) * 255))
        b = min(255, int((b_energy / normalization) * 255))
        
        return (r, g, b)

    @staticmethod
    def vector_to_ansi(vector: List[float], text: str = "  ") -> str:
        """
        Return an ANSI escape sequence to render the vector as a colored block.
        """
        r, g, b = VisualCortex.vector_to_color(vector)
        # ANSI TrueColor background: \033[48;2;R;G;Bm
        return f"\033[48;2;{r};{g};{b}m{text}\033[0m"

    @staticmethod
    def render_node_pixel(node: Dict[str, Any]) -> str:
        """
        Render a single node as a pixel icon.
        """
        if 'vector' not in node or not node['vector']:
            return "⬜"
            
        return VisualCortex.vector_to_ansi(node['vector'], "  ")

    @staticmethod
    def get_hex_color(vector: List[float]) -> str:
        """Return Hex Color code for web rendering"""
        r, g, b = VisualCortex.vector_to_color(vector)
        return f"#{r:02x}{g:02x}{b:02x}"
