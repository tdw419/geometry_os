#!/usr/bin/env python3
"""
Geometry OS: Holographic Perception Agent

A neural agent that "reads" holographic kernels by perceiving their
interference fringes directly - no tokens, just geometry.

The agent learns to decode:
  Hadamard interference → Semantic meaning
  Chromatic fringes → Instruction type
  Morphological density → Computation intensity
"""

import numpy as np
from PIL import Image
import torch
import torch.nn as nn
from typing import List, Tuple, Dict
import os
import sys

# Add path for holographic encoder
sys.path.insert(0, os.path.dirname(__file__))
from systems.pixel_compiler.holographic_encoder import (
    generate_2d_basis,
    hadamard_matrix
)


class InterferencePerceiver(nn.Module):
    """
    Neural network that perceives holographic interference patterns
    and decodes them to semantic meaning.

    Architecture:
    - Conv2D layers extract spatial interference structure
    - Attention mechanism focuses on chromatic fringes
    - Classification head predicts instruction type
    - Regression head predicts operand values
    """

    def __init__(self, num_classes=12, glyph_size=16):
        super().__init__()
        self.glyph_size = glyph_size

        # Spatial feature extraction (perceives interference structure)
        self.spatial_encoder = nn.Sequential(
            nn.Conv2d(4, 32, kernel_size=3, padding=1),
            nn.ReLU(),
            nn.Conv2d(32, 64, kernel_size=3, padding=1),
            nn.ReLU(),
            nn.MaxPool2d(2),  # 16x16 -> 8x8
            nn.Conv2d(64, 128, kernel_size=3, padding=1),
            nn.ReLU(),
            nn.AdaptiveAvgPool2d(4),  # 8x8 -> 4x4
        )

        # Chromatic attention (focuses on color fringes)
        self.chromatic_attention = nn.Sequential(
            nn.Linear(4, 64),
            nn.ReLU(),
            nn.Linear(64, 4),
            nn.Softmax(dim=-1)
        )

        # Semantic decoder (instruction type)
        self.semantic_head = nn.Sequential(
            nn.Linear(128 * 4 * 4 + 4, 512),
            nn.ReLU(),
            nn.Dropout(0.1),
            nn.Linear(512, num_classes)
        )

        # Value decoder (operand extraction)
        self.value_head = nn.Sequential(
            nn.Linear(128 * 4 * 4 + 4, 256),
            nn.ReLU(),
            nn.Linear(256, 32),  # 32 bits
            nn.Sigmoid()
        )

    def forward(self, glyph: torch.Tensor) -> Tuple[torch.Tensor, torch.Tensor, torch.Tensor]:
        """
        Perceive a holographic glyph.

        Args:
            glyph: (batch, 4, 16, 16) RGBA tensor

        Returns:
            class_logits: (batch, num_classes) instruction type
            bit_values: (batch, 32) reconstructed bits
            attention_weights: (batch, 4) channel attention
        """
        batch_size = glyph.shape[0]

        # Compute chromatic attention (which color channels matter?)
        channel_means = glyph.mean(dim=(2, 3))  # (batch, 4)
        attention_weights = self.chromatic_attention(channel_means)

        # Apply attention
        weighted_glyph = glyph * attention_weights.unsqueeze(-1).unsqueeze(-1)

        # Extract spatial features
        spatial_features = self.spatial_encoder(weighted_glyph)
        spatial_flat = spatial_features.view(batch_size, -1)

        # Combine with attention info
        combined = torch.cat([spatial_flat, attention_weights], dim=-1)

        # Decode
        class_logits = self.semantic_head(combined)
        bit_values = self.value_head(combined)

        return class_logits, bit_values, attention_weights


class HolographicPerceptionAgent:
    """
    Agent that perceives and explains holographic kernels.
    """

    # RISC-V instruction type names
    INSTRUCTION_TYPES = [
        'LUI',      # Load Upper Immediate
        'AUIPC',    # Add Upper Immediate to PC
        'JAL',      # Jump and Link
        'JALR',     # Jump and Link Register
        'BRANCH',   # Conditional branch
        'LOAD',     # Load from memory
        'STORE',    # Store to memory
        'OP_IMM',   # ALU immediate
        'OP',       # ALU register
        'MISC_MEM', # Fence operations
        'SYSTEM',   # ECALL, EBREAK, CSR
        'UNKNOWN',  # Unknown opcode
    ]

    # Semantic meanings for chromatic signatures
    CHROMATIC_MEANINGS = {
        'red_dominant': 'ALU/Compute operation (high activity)',
        'green_dominant': 'Memory load (data retrieval)',
        'blue_dominant': 'Memory store / Display write',
        'alpha_bright': 'High morphological intensity (complex instruction)',
        'alpha_dim': 'Low morphological intensity (simple instruction)',
        'balanced': 'System/control instruction',
    }

    def __init__(self, model_path: str = "holographic_perception_model.pth"):
        self.device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
        self.model = InterferencePerceiver(num_classes=12).to(self.device)

        if model_path and os.path.exists(model_path):
            self.model.load_state_dict(torch.load(model_path, map_location=self.device))
            print(f"Loaded perception model from {model_path}")
        else:
            print("Using untrained perception model (random weights)")

        self.model.eval()

        # Generate basis for reference
        self.basis = generate_2d_basis(size=16, count=64)

    def perceive_glyph(self, glyph_rgba: np.ndarray) -> Dict:
        """
        Perceive a single 16x16 holographic glyph.

        Args:
            glyph_rgba: (16, 16, 4) numpy array

        Returns:
            Dictionary with perception results
        """
        # Convert to tensor
        glyph_tensor = torch.from_numpy(glyph_rgba).float().permute(2, 0, 1) / 255.0
        glyph_tensor = glyph_tensor.unsqueeze(0).to(self.device)

        with torch.no_grad():
            class_logits, bit_values, attention = self.model(glyph_tensor)

        # Decode results
        predicted_class = class_logits.argmax(dim=-1).item()
        instruction_type = self.INSTRUCTION_TYPES[predicted_class]

        # Decode bits to value
        bits = (bit_values[0] > 0.5).cpu().numpy()
        value = sum(int(b) << i for i, b in enumerate(bits))

        # Analyze chromatic signature
        channel_means = glyph_rgba.mean(axis=(0, 1))
        chromatic_analysis = self._analyze_chromatic(channel_means, attention[0].cpu().numpy())

        return {
            'instruction_type': instruction_type,
            'confidence': torch.softmax(class_logits, dim=-1)[0, predicted_class].item(),
            'decoded_value': value,
            'chromatic_signature': chromatic_analysis,
            'attention_weights': attention[0].cpu().numpy().tolist(),
        }

    def _analyze_chromatic(self, channel_means: np.ndarray, attention: np.ndarray) -> Dict:
        """Analyze the chromatic signature of a glyph."""
        r, g, b, a = channel_means

        # Determine dominant channel
        if b > r and b > g:
            dominant = 'blue_dominant'
        elif r > g and r > b:
            dominant = 'red_dominant'
        elif g > r and g > b:
            dominant = 'green_dominant'
        else:
            dominant = 'balanced'

        # Alpha intensity
        alpha_level = 'alpha_bright' if a > 128 else 'alpha_dim'

        return {
            'dominant_channel': dominant,
            'meaning': self.CHROMATIC_MEANINGS[dominant],
            'alpha_level': alpha_level,
            'intensity_meaning': self.CHROMATIC_MEANINGS[alpha_level],
            'rgb_values': {
                'red': int(r),
                'green': int(g),
                'blue': int(b),
                'alpha': int(a)
            }
        }

    def perceive_kernel(self, kernel_path: str) -> List[Dict]:
        """
        Perceive an entire holographic kernel.

        Args:
            kernel_path: Path to .rts.png kernel

        Returns:
            List of perception results for each glyph
        """
        img = Image.open(kernel_path).convert('RGBA')
        arr = np.array(img)

        texture_size = img.size[0]
        glyph_size = 16
        grid_size = texture_size // glyph_size

        results = []
        print(f"\n=== PERCEIVING HOLOGRAPHIC KERNEL ===")
        print(f"Texture: {texture_size}x{texture_size}")
        print(f"Glyphs: {grid_size}x{grid_size} = {grid_size**2}")
        print()

        for gy in range(grid_size):
            for gx in range(grid_size):
                x_start = gx * glyph_size
                y_start = gy * glyph_size

                glyph = arr[y_start:y_start+glyph_size, x_start:x_start+glyph_size]

                # Skip empty glyphs
                if glyph[:,:,3].sum() == 0:
                    continue

                result = self.perceive_glyph(glyph)
                result['position'] = (gx, gy)
                result['index'] = gy * grid_size + gx
                results.append(result)

        return results

    def explain_kernel(self, kernel_path: str) -> str:
        """
        Generate a natural language explanation of a holographic kernel.
        """
        results = self.perceive_kernel(kernel_path)

        if not results:
            return "This kernel appears to be empty (no active glyphs)."

        # Aggregate statistics
        instruction_counts = {}
        chromatic_counts = {}
        total_confidence = 0

        for r in results:
            it = r['instruction_type']
            instruction_counts[it] = instruction_counts.get(it, 0) + 1

            cc = r['chromatic_signature']['dominant_channel']
            chromatic_counts[cc] = chromatic_counts.get(cc, 0) + 1

            total_confidence += r['confidence']

        avg_confidence = total_confidence / len(results)

        # Generate explanation
        explanation = []
        explanation.append("╔══════════════════════════════════════════════════════════════════╗")
        explanation.append("║          HOLOGRAPHIC KERNEL PERCEPTION REPORT                    ║")
        explanation.append("╠══════════════════════════════════════════════════════════════════╣")
        explanation.append("║                                                                  ║")
        explanation.append(f"║  Glyphs Perceived: {len(results):4d}                                        ║")
        explanation.append(f"║  Average Confidence: {avg_confidence:.2%}                                   ║")
        explanation.append("║                                                                  ║")
        explanation.append("║  INSTRUCTION DISTRIBUTION:                                       ║")
        for it, count in sorted(instruction_counts.items(), key=lambda x: -x[1]):
            pct = 100 * count / len(results)
            bar = '█' * int(pct / 5)
            explanation.append(f"║    {it:12} {count:4d} ({pct:5.1f}%) {bar:20s} ║")
        explanation.append("║                                                                  ║")
        explanation.append("║  CHROMATIC SIGNATURE:                                           ║")
        for cc, count in sorted(chromatic_counts.items(), key=lambda x: -x[1]):
            meaning = self.CHROMATIC_MEANINGS.get(cc, 'Unknown')
            explanation.append(f"║    {cc:20} {count:4d} glyphs                      ║")
        explanation.append("║                                                                  ║")
        explanation.append("╠══════════════════════════════════════════════════════════════════╣")
        explanation.append("║                    SEMANTIC INTERPRETATION                        ║")
        explanation.append("╠══════════════════════════════════════════════════════════════════╣")

        # Determine overall purpose
        if 'STORE' in instruction_counts and chromatic_counts.get('blue_dominant', 0) > len(results) * 0.5:
            explanation.append("║                                                                  ║")
            explanation.append("║  This kernel appears to be a DISPLAY WRITE program.              ║")
            explanation.append("║  The blue-dominant chromatic signature indicates memory          ║")
            explanation.append("║  writes to the display framebuffer (0x40000000).                 ║")
            explanation.append("║                                                                  ║")
            explanation.append("║  The interference fringes encode color values that will          ║")
            explanation.append("║  manifest as pixels when executed.                               ║")
            explanation.append("║                                                                  ║")
            explanation.append("║  VERDICT: \"Turn the screen blue\" (or similar color operation)    ║")
        elif 'LOAD' in instruction_counts and 'OP' in instruction_counts:
            explanation.append("║                                                                  ║")
            explanation.append("║  This kernel appears to be a COMPUTE program.                    ║")
            explanation.append("║  Mixed load/operate pattern suggests data processing.            ║")
            explanation.append("║                                                                  ║")
        else:
            explanation.append("║                                                                  ║")
            explanation.append("║  This kernel has a mixed instruction profile.                    ║")
            explanation.append("║  Further analysis would require execution tracing.               ║")
            explanation.append("║                                                                  ║")

        explanation.append("╚══════════════════════════════════════════════════════════════════╝")

        return '\n'.join(explanation)


def main():
    """Demonstrate the Holographic Perception Agent."""
    print("=== GEOMETRY OS: HOLOGRAPHIC PERCEPTION AGENT ===")
    print()
    print("An AI that reads code by perceiving interference patterns.")
    print("No tokens - just geometry.")
    print()

    agent = HolographicPerceptionAgent()

    # Perceive the holographic blue kernel
    kernel_path = '/tmp/holographic_blue_kernel.png'
    if os.path.exists(kernel_path):
        explanation = agent.explain_kernel(kernel_path)
        print(explanation)

        print()
        print("=== WHAT A TRAINED AGENT WOULD SEE ===")
        print()
        print("After training on holographic kernels, the agent would perceive:")
        print()
        print("  Glyph 0: LUI instruction")
        print("    - Chromatic: Balanced (initialization)")
        print("    - Purpose: Load display base address 0x40000000")
        print("    - Interference: Regular pattern (immediate load)")
        print()
        print("  Glyph 1: ADDI instruction")
        print("    - Chromatic: Blue-shifted (color value encoding)")
        print("    - Purpose: Set blue value 0x0000FFFF")
        print("    - Interference: 240° phase shift visible in fringes")
        print()
        print("  Glyphs 2-65: STORE instructions")
        print("    - Chromatic: Blue-dominant (memory-mapped display write)")
        print("    - Purpose: Write blue to display pixels")
        print("    - Interference: Dense patterns (repeated stores)")
        print()
        print("  OVERALL SEMANTIC: \"Turn the screen blue\"")
        print("    The chromatic fringes literally encode the blue value.")
        print("    The morphological density indicates write operations.")
        print("    The interference pattern reconstructs as blue photons.")
        print()
        print("  THE AGENT READS CODE BY SEEING LIGHT.")
    else:
        print(f"Kernel not found: {kernel_path}")
        print("Run holographic_blue_kernel.py first to generate it.")


if __name__ == "__main__":
    main()
