#!/usr/bin/env python3
import os
import re
import random
from pathlib import Path

def permute_registers(asm):
    # Find all rN (where N is 0-29)
    # We leave r30 (SP) and r31 (LR) alone for stability
    # Also leave r27, r28, r29 (reserved for macros) alone
    regs = list(range(16)) # Focus on the most common ones
    shuffled = regs[:]
    random.shuffle(shuffled)
    mapping = {f"r{i}": f"r{j}" for i, j in zip(regs, shuffled)}
    
    # Simple replacement avoiding partial matches (e.g. r1 in r10)
    def replace_reg(match):
        reg = match.group(0)
        return mapping.get(reg, reg)
    
    # Match r followed by digits, but only if not followed by more digits
    # and not preceded by [a-zA-Z0-9]
    return re.sub(r'\br\d+\b', replace_reg, asm)

def augment_program(path, num_variants=10):
    text = Path(path).read_text()
    variants = [text] # include original
    
    for _ in range(num_variants - 1):
        variants.append(permute_registers(text))
    
    return variants

def main():
    src_dir = Path("annotated_dataset")
    out_dir = Path("golden_dataset")
    out_dir.mkdir(exist_ok=True)
    
    # Identify golden programs (those that exist in programs/ directory)
    golden_files = []
    for f in Path("programs").glob("*.asm"):
        ann_f = src_dir / f"programs_{f.name}"
        if ann_f.exists():
            golden_files.append(ann_f)
    
    print(f"[*] Found {len(golden_files)} golden programs.")
    
    total_samples = 0
    for f in golden_files:
        variants = augment_program(f, num_variants=10)
        for i, v in enumerate(variants):
            out_name = f"golden_{f.stem}_{i}.asm"
            (out_dir / out_name).write_text(v)
            total_samples += 1
            
    print(f"[*] Generated {total_samples} samples in {out_dir}/")

if __name__ == "__main__":
    main()
