#!/usr/bin/env python3
import os
import re
import random
from pathlib import Path

DESCRIPTION_TEMPLATES = [
    "Draws a {color} {shape} at {pos} with {size_desc}.",
    "Render a {color} {shape} at {pos}.",
    "A {color} {shape} centered at {pos} with {size_desc}.",
    "Geometry OS program to draw a {color} {shape}.",
    "Display a {shape} using color {color} at {pos}.",
    "Draw {shape}: pos={pos}, color={color}, size={size_desc}."
]

def permute_registers(asm):
    # (previous permute_registers logic)
    regs = list(range(16))
    shuffled = regs[:]
    random.shuffle(shuffled)
    mapping = {f"r{i}": f"r{j}" for i, j in zip(regs, shuffled)}
    
    def replace_reg(match):
        reg = match.group(0)
        return mapping.get(reg, reg)
    
    return re.sub(r'\br\d+\b', replace_reg, asm)

def augment_program(path, num_variants=10):
    text = Path(path).read_text()
    
    # Extract original description if possible
    desc_match = re.search(r'; DESCRIPTION:\s*(.*)', text)
    original_desc = desc_match.group(1) if desc_match else "A Geometry OS program."
    
    # Try to extract keywords for templating (basic heuristic)
    color = "colored"
    if "red" in original_desc.lower(): color = "red"
    elif "green" in original_desc.lower(): color = "green"
    elif "blue" in original_desc.lower(): color = "blue"
    elif "white" in original_desc.lower(): color = "white"
    elif "yellow" in original_desc.lower(): color = "yellow"
    
    shape = "object"
    if "circle" in original_desc.lower(): shape = "circle"
    elif "rect" in original_desc.lower(): shape = "rectangle"
    elif "square" in original_desc.lower(): shape = "square"
    elif "line" in original_desc.lower(): shape = "line"
    
    variants = [text] # include original
    
    for _ in range(num_variants - 1):
        # Permute registers
        v_asm = permute_registers(text)
        
        # Permute description
        new_desc = random.choice(DESCRIPTION_TEMPLATES).format(
            color=color,
            shape=shape,
            pos="the screen", # simplistic
            size_desc="fixed size"
        )
        
        # Replace the description line
        v_asm = re.sub(r'; DESCRIPTION:.*', f'; DESCRIPTION: {new_desc}', v_asm)
        variants.append(v_asm)
    
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
