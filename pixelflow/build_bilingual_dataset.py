#!/usr/bin/env python3
"""
Bilingual Dataset Builder for Geometry OS.

Processes the annotated_dataset/ folder and creates an .npz file 
containing tokenized sequences using the BilingualTokenizer V4.
"""

import os
import sys
import argparse
import numpy as np
from pathlib import Path

# Add pixelflow to path
sys.path.insert(0, os.path.dirname(__file__))
from bilingual_tokenizer import BilingualTokenizer

def build_dataset(data_dir: str, output_file: str, tokenizer_path: str, context_len: int = 1024, stride: int = 512):
    """Build tokenized training dataset from .asm files."""
    
    # Load the production tokenizer (V4)
    if os.path.exists(tokenizer_path):
        print(f"Loading tokenizer from {tokenizer_path}...")
        tokenizer = BilingualTokenizer.load(tokenizer_path)
    else:
        print(f"Error: Tokenizer not found at {tokenizer_path}. Run bilingual_tokenizer.py first.")
        return

    data_path = Path(data_dir)
    asm_files = sorted(data_path.glob("*.asm"))

    print(f"Found {len(asm_files)} .asm files in {data_dir}")
    
    all_sequences = []
    total_tokens = 0

    for f in asm_files:
        try:
            text = f.read_text(encoding='utf-8')
            # Use BilingualTokenizer.encode (Atomic + Char + BPE)
            ids = tokenizer.encode(text, add_bos=True, add_eos=True)
            all_sequences.append(ids)
            total_tokens += len(ids)
        except Exception as e:
            print(f"  Skipping {f.name}: {e}")

    print(f"Total tokens across all programs: {total_tokens}")

    samples = []
    # OpcodeTokenizer's PAD is 0
    PAD_TOKEN = 0
    
    for seq in all_sequences:
        # Standard sliding window over sequences
        for i in range(0, len(seq) - 1, stride):
            chunk = seq[i:i + context_len]
            if len(chunk) < 16: continue # Skip tiny fragments
            
            # Padding
            if len(chunk) < context_len:
                chunk = chunk + [PAD_TOKEN] * (context_len - len(chunk))
            samples.append(chunk)

    print(f"Training samples: {len(samples)} (context_len={context_len}, stride={stride})")

    data = np.array(samples, dtype=np.int32)
    np.savez_compressed(output_file, tokens=data)
    print(f"Saved dataset to {output_file} ({data.nbytes / 1024 / 1024:.1f} MB)")

    return len(samples)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-dir", default="annotated_dataset")
    parser.add_argument("--tokenizer", default="pixelflow/bilingual_tokenizer_v4")
    parser.add_argument("--output", default="bilingual_dataset.npz")
    parser.add_argument("--context-len", type=int, default=1024)
    parser.add_argument("--stride", type=int, default=512)
    args = parser.parse_args()

    build_dataset(args.data_dir, args.output, args.tokenizer, args.context_len, args.stride)
