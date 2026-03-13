import numpy as np
import time
import argparse
from pathlib import Path

# Geometry OS - Swarm DNA Mutator (Evolution Edition)
# Phase 55: Recursive Self-Assembly (The Brain)

DNA_PATH = Path("apps/autoresearch/swarm_dna.bin")

def generate_genome(mode="brain"):
    num_agents = 10000
    dna = np.zeros((num_agents, 4), dtype=np.uint32)
    
    print(f"● Evolving Swarm into: {mode.upper()}...")
    
    if mode == "brain":
        # Form a Bilateral Digital Brain
        for i in range(num_agents):
            # Lobe selection (0=Left, 1=Right)
            side = 1 if i > 5000 else -1
            
            # Parametric Ellipse for Brain Lobes
            angle = np.random.uniform(0, 2 * np.pi)
            r_base = np.random.uniform(0, 1)
            
            # Warp the ellipse to look like a brain lobe
            x = side * (20 + r_base * 25 * np.cos(angle))
            y = r_base * 35 * np.sin(angle)
            
            # Neural Wrinkles (Sulci)
            wrinkle = np.sin(angle * 10) * 2.0
            x += wrinkle
            
            # Translate to grid center (50, 50)
            final_x = 50 + x
            final_y = 50 + y
            
            # DNA: [Color, PulseSpeed, SpatialX, SpatialY]
            # Cyan for Left Lobe, Magenta for Right Lobe
            color = 0x00FFFFFF if side == -1 else 0xFF00FFFF
            
            dna[i, 0] = color
            dna[i, 1] = 5 + (i % 15) # Neural firing rate
            dna[i, 2] = int(final_x) % 100
            dna[i, 3] = int(final_y) % 100
            
    elif mode == "glyph_ui":
        for i in range(num_agents):
            letter_idx = i // 2500
            local_i = i % 2500
            bx, by = 0, 0
            color = 0x00FF88FF
            if letter_idx == 0: bx, by = 15 + (local_i % 15), 20 + (local_i // 40); color = 0x00FF00FF
            elif letter_idx == 1: bx, by = 35 + (local_i % 15), 20 + (local_i // 40); color = 0x0088FFFF
            elif letter_idx == 2: bx, by = 55 + (local_i % 15), 20 + (local_i // 40); color = 0xFF00FFFF
            elif letter_idx == 3: bx, by = 75 + (local_i % 15), 20 + (local_i // 40); color = 0xFF8800FF
            dna[i, 0] = color
            dna[i, 1] = 20 + (i % 30)
            dna[i, 2] = bx % 100
            dna[i, 3] = by % 100
            
    dna.tofile(DNA_PATH)
    print(f"✓ Genome '{mode}' crystallized at {DNA_PATH}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--mode", type=str, default="brain", choices=["random", "tectonic", "glyph_ui", "brain"])
    args = parser.parse_args()
    generate_genome(args.mode)
