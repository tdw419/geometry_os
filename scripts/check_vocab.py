#!/usr/bin/env python3
"""Check model vocabularies."""
import torch
from pathlib import Path

MODEL_PATH = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os/models/syscall_synthesis_model.pt")
DEVICE = torch.device("cuda" if torch.cuda.is_available() else "cpu")

metadata = torch.load(MODEL_PATH, map_location=DEVICE)
sys_vocab = metadata["sys_vocab"]
op_vocab = metadata["op_vocab"]

print("Syscall vocabulary:")
for k in sorted(sys_vocab.keys()):
    print(f"  {k}: {sys_vocab[k]}")

print(f"\nSpatial ops vocabulary ({len(op_vocab)} ops):")
for k in sorted(op_vocab.keys()):
    print(f"  {k}: {op_vocab[k]}")

# Check for openat
print(f"\nChecking for openat in vocab: {'openat' in sys_vocab}")

# Check for our target ops
target_ops = ["traverse_directory_hilbert_tree", "load_inode_pixels"]
for op in target_ops:
    present = op in op_vocab
    idx = op_vocab.get(op, "N/A")
    print(f"  {op}: {'PRESENT' if present else 'MISSING'} (idx: {idx})")