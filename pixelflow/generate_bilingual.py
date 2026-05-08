#!/usr/bin/env python3
"""
PixelGPT Bilingual Inference Pipeline.

Takes a natural language prompt, generates Geometry OS assembly,
and prepares it for execution.
"""

import argparse
import os
import sys
import torch
from pathlib import Path

# Add current dir to path
sys.path.insert(0, os.path.dirname(__file__))
from bilingual_tokenizer import BilingualTokenizer
from train_opcode_llm import OpcodeGPT, generate_asm

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("prompt", type=str, help="Natural language prompt (e.g., '; Draw a red circle')")
    parser.add_argument("--checkpoint", default="pixelflow/bilingual_llm_ckpt.pt")
    parser.add_argument("--tokenizer", default="pixelflow/bilingual_tokenizer_v4")
    parser.add_argument("--max-tokens", type=int, default=256)
    parser.add_argument("--temp", type=float, default=0.7)
    parser.add_argument("--top-k", type=int, default=40)
    parser.add_argument("--out", type=str, default="generated.asm", help="Output assembly file")
    args = parser.parse_args()

    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"[*] Device: {device}")

    # 1. Load tokenizer
    if not os.path.exists(args.tokenizer):
        print(f"[!] Tokenizer not found at {args.tokenizer}")
        return
    tokenizer = BilingualTokenizer.load(args.tokenizer)

    # 2. Load model
    if not os.path.exists(args.checkpoint):
        print(f"[!] Checkpoint not found at {args.checkpoint}")
        return
    
    checkpoint = torch.load(args.checkpoint, map_location=device)
    m_args = checkpoint["args"]
    
    model = OpcodeGPT(
        vocab_size=m_args["vocab_size"],
        n_embd=m_args["embd"],
        n_head=m_args["heads"],
        n_layer=m_args["layers"],
        block_size=m_args["context_len"]
    ).to(device)
    
    model.load_state_dict(checkpoint["model"])
    model.eval()
    print(f"[*] Model loaded: {model.param_count():,} parameters")

    # 3. Generate
    print(f"[*] Prompt: {args.prompt}")
    # Ensure prompt starts with a semicolon if it's natural language
    p = args.prompt
    if not p.startswith(";") and not p.startswith("LDI") and not p.startswith("RECTF"):
        p = "; " + p
        
    generated = generate_asm(
        model, 
        tokenizer, 
        p, 
        device, 
        max_tokens=args.max_tokens, 
        temperature=args.temp, 
        top_k=args.top_k
    )

    print("\n--- Generated Assembly ---")
    print(generated)
    print("--------------------------\n")

    # 4. Save to file
    with open(args.out, "w") as f:
        f.write(generated)
    print(f"[*] Saved to {args.out}")
    print(f"[*] To execute: python3 geo_dogfood_qa.py --asm {args.out}")

if __name__ == "__main__":
    main()
