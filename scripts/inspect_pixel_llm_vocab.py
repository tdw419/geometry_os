
import torch
from pathlib import Path

def seeds_to_text(seeds: list[int]) -> str:
    raw = bytearray()
    for s in seeds:
        raw.append((s >> 16) & 0xFF)
        raw.append((s >> 8) & 0xFF)
        raw.append(s & 0xFF)
    return raw.rstrip(b"\x00").decode("utf-8", errors="replace")

def inspect_vocab(ckpt_path):
    ckpt = torch.load(ckpt_path, map_location="cpu", weights_only=False)
    idx_to_seed = ckpt["idx_to_seed"]
    
    print(f"Vocab size: {len(idx_to_seed)}")
    
    opcodes = ["LDI", "ADD", "SUB", "CMP", "JZ", "JNZ", "JMP", "HALT", "FILL", "RECTF"]
    opcode_indices = []
    
    for idx, seed in idx_to_seed.items():
        text = seeds_to_text([seed])
        for op in opcodes:
            if op in text:
                opcode_indices.append((idx, text))
                break
                
    print(f"Found {len(opcode_indices)} opcode-related tokens:")
    for idx, text in opcode_indices[:20]:
        print(f"  {idx}: {repr(text)}")

if __name__ == "__main__":
    inspect_vocab("pixel_llm_ckpt.pt")
