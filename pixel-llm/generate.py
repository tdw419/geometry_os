"""
End-to-end: Generate -> Assemble -> Run on Geometry OS GPU.

This script:
1. Loads a trained PixelGPT model
2. Generates a program
3. Assembles it to pixels
4. Writes a Rust test that loads and runs it
"""

import os
import sys
import argparse
import torch

from model import PixelGPT, decode, encode, BOS_ID, EOS_ID
from bridge import assemble_program, pixels_to_hex, write_load_script


def generate_programs(model, device, n=5, temperature=0.8, top_k=40):
    """Generate n programs from the model."""
    model.eval()
    programs = []
    for i in range(n):
        prompt = torch.tensor([[BOS_ID]], device=device)
        out = model.generate(prompt, max_new=80, temperature=temperature, top_k=top_k)
        text = decode(out[0].tolist())
        programs.append(text)
    return programs


def validate_program(text: str) -> bool:
    """Check if a program looks valid enough to run."""
    lines = [l.strip() for l in text.strip().split('\n') if l.strip()]
    if len(lines) < 2:
        return False
    # Must end with HALT or RET
    last = lines[-1].split()[0].upper()
    return last in ('HALT', 'RET')


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--checkpoint', default='checkpoints/final.pt')
    parser.add_argument('--n', type=int, default=5)
    parser.add_argument('--temperature', type=float, default=0.8)
    parser.add_argument('--top-k', type=int, default=40)
    parser.add_argument('--run', action='store_true', help='Write Rust test and run it')
    args = parser.parse_args()

    device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

    # Load model
    ckpt = torch.load(args.checkpoint, map_location=device, weights_only=False)
    config = ckpt.get('config', 'nano')
    block_size = ckpt.get('block_size', 128)
    model = PixelGPT(config=config, max_len=block_size).to(device)
    model.load_state_dict(ckpt['model_state'])
    print(f"Loaded {config} model from step {ckpt.get('step', '?')}, loss {ckpt.get('loss', '?'):.4f}")

    # Generate
    programs = generate_programs(model, device, n=args.n,
                                  temperature=args.temperature, top_k=args.top_k)

    for i, text in enumerate(programs):
        print(f"\n{'='*50}")
        print(f"Program {i+1}")
        print(f"{'='*50}")
        print(text)

        pixels = assemble_program(text)
        print(f"Assembled: {len(pixels)} pixels")
        print(f"Hex: {pixels_to_hex(pixels[:8])}{'...' if len(pixels) > 8 else ''}")
        valid = validate_program(text)
        print(f"Valid: {'YES' if valid else 'NO'}")

        if args.run and valid:
            test_dir = os.path.join(os.path.dirname(__file__), '..', 'tests')
            test_path = os.path.join(test_dir, f'llm_gen_{i}.rs')
            write_load_script(pixels, 300 + i * 100, test_path)


if __name__ == '__main__':
    main()
