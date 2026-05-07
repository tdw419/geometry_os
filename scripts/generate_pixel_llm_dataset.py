#!/usr/bin/env python3
import os
import numpy as np
import json
from pathlib import Path

def encode_pixelpack_raw3(text):
    """
    Encode source text into pixelpack seeds using Strategy 0xA (raw3).
    Each 32-bit seed: 0xA000_0000 | (b0 << 16) | (b1 << 8) | b2
    """
    bytes_data = text.encode('utf-8')
    seeds = []
    i = 0
    while i < len(bytes_data):
        # Extract up to 3 bytes
        chunk = bytes_data[i:i+3]
        seed = 0xA0000000
        if len(chunk) >= 1:
            seed |= (chunk[0] << 16)
        if len(chunk) >= 2:
            seed |= (chunk[1] << 8)
        if len(chunk) >= 3:
            seed |= chunk[2]
        seeds.append(seed)
        i += 3
    return np.array(seeds, dtype=np.uint32)

def generate_dataset(source_dirs, output_file):
    asm_files = []
    for d in source_dirs:
        source_path = Path(d)
        asm_files.extend(list(source_path.glob("*.asm")))
    
    print(f"Found {len(asm_files)} .asm files in {source_dirs}")
    
    dataset = {}
    metadata = []
    
    total_seeds = 0
    total_chars = 0
    
    for asm_file in asm_files:
        try:
            with open(asm_file, 'r', encoding='utf-8') as f:
                text = f.read()
            
            seeds = encode_pixelpack_raw3(text)
            dataset[asm_file.name] = seeds
            
            metadata.append({
                "name": asm_file.name,
                "char_count": len(text),
                "seed_count": len(seeds),
                "path": str(asm_file)
            })
            
            total_seeds += len(seeds)
            total_chars += len(text)
        except Exception as e:
            print(f"Error processing {asm_file.name}: {e}")
            
    # Save as .npz for efficient loading of variable-length arrays
    np.savez_compressed(output_file, **dataset)
    
    # Save metadata as JSON
    with open(output_file.replace(".npz", ".json"), 'w') as f:
        json.dump(metadata, f, indent=2)
        
    print(f"\nDataset generation complete!")
    print(f"Output: {output_file}")
    print(f"Total Programs: {len(metadata)}")
    print(f"Total Characters: {total_chars}")
    print(f"Total Pixel Seeds: {total_seeds}")
    print(f"Avg Seeds per Program: {total_seeds / len(metadata):.2f}")
    print(f"Compression Ratio: {total_chars / (total_seeds * 4):.2f}x (chars per byte-of-seeds)")

if __name__ == "__main__":
    generate_dataset(["programs", "lib", "synthetic_programs"], "pixel_llm_dataset.npz")
