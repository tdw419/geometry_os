#!/usr/bin/env python3
"""
Neural Pixelpack Bridge

Converts PixelGPT opcode-level token IDs into hardware-native pixelpack seeds.
This allows the AI to generate instructions that are natively decodable by the GeOS kernel.
"""

import numpy as np
from PIL import Image
from opcode_tokenizer import OpcodeTokenizer

def pack_tokens_to_seeds(token_ids):
    """
    Pack token IDs into 32-bit pixelpack seeds using Strategy 0x4 (Neural Pack).
    Strategy 0x4: [4-bit Strategy][27-bit Params (3x 9-bit indices)][1-bit Unused]
    Actually, 4 + 3*9 = 31 bits. 1 bit left.
    """
    seeds = []
    # Process tokens in chunks of 3
    for i in range(0, len(token_ids), 3):
        chunk = token_ids[i:i+3]
        # Pad chunk if less than 3 tokens
        while len(chunk) < 3:
            chunk.append(0) # PAD token
        
        # Pack into 28-bit param space (we use 27 bits)
        params = (chunk[0] & 0x1FF) | ((chunk[1] & 0x1FF) << 9) | ((chunk[2] & 0x1FF) << 18)
        
        # Final seed: Strategy 0x4 in the top 4 bits
        seed = (0x4 << 28) | params
        seeds.append(seed)
    
    return np.array(seeds, dtype=np.uint32)

def seeds_to_png(seeds, output_path, width=32):
    """Save u32 seeds as an RGBA PNG."""
    height = (len(seeds) + width - 1) // width
    # Pad seeds to fill the grid
    pixel_data = np.zeros(width * height, dtype=np.uint32)
    pixel_data[:len(seeds)] = seeds
    
    # Convert u32 to RGBA bytes (Big-endian for standard pixel layout)
    # GeOS pixel.rs: R=chunk[0], G=chunk[1], B=chunk[2], A=chunk[3]
    # np.uint32 to uint8 view
    rgba = pixel_data.view(np.uint8).reshape(-1, 4)
    # Swap to match GeOS expected order if necessary. 
    # Usually np.uint32 is little-endian on x86, so view(uint8) is [B, G, R, A]
    # We want [R, G, B, A]
    img_data = np.zeros_like(rgba)
    img_data[:, 0] = rgba[:, 3] # R
    img_data[:, 1] = rgba[:, 2] # G
    img_data[:, 2] = rgba[:, 1] # B
    img_data[:, 3] = rgba[:, 0] # A
    
    img = Image.frombytes("RGBA", (width, height), img_data.tobytes())
    img.save(output_path)
    print(f"Saved {len(seeds)} seeds to {output_path} ({width}x{height})")

def demo():
    # 1. Generate some tokens (Mock PixelGPT output)
    tokenizer = OpcodeTokenizer()
    asm_text = """
    LDI r1, 10
    LDI r2, 20
    ADD r3, r1, r2
    HALT
    """
    print(f"Original ASM:\n{asm_text}")
    token_ids = tokenizer.encode(asm_text, add_bos=False, add_eos=False)
    print(f"Token IDs: {token_ids}")
    
    # 2. Pack to seeds
    seeds = pack_tokens_to_seeds(token_ids)
    print(f"Generated {len(seeds)} seeds (Strategy 0x4)")
    for s in seeds:
        print(f"  0x{s:08X}")
        
    # 3. Save as PNG
    seeds_to_png(seeds, "neural_program.png")
    
    # 4. Verify (Simulate Rust decoding)
    print("\nSimulated Kernel Expansion:")
    expanded_text = []
    for seed in seeds:
        strategy = (seed >> 28) & 0xF
        params = seed & 0x0FFFFFFF
        if strategy == 0x4:
            for i in range(3):
                idx = (params >> (9 * i)) & 0x1FF
                if idx < len(tokenizer.id2token):
                    tok = tokenizer.id2token[idx]
                    if not tok: continue
                    # Simple space logic for demo
                    if expanded_text and not expanded_text[-1].endswith('\n'):
                        expanded_text.append(" ")
                    expanded_text.append(tok)
    
    print("".join(expanded_text))

if __name__ == "__main__":
    demo()
