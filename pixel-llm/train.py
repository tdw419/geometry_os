"""
Train PixelGPT on synthetic glyph assembly programs.

Usage:
    python train.py                     # nano model, quick test
    python train.py --config micro      # more capacity
    python train.py --config small      # real training
    python train.py --steps 10000       # longer training
    python train.py --sample            # sample after training

The model learns to generate valid assembly programs that can be
loaded into the Geometry OS substrate and executed on GPU.
"""

import argparse
import time
import os

import torch
import torch.nn as nn
from torch.utils.data import Dataset, DataLoader

from model import PixelGPT, decode, BOS_ID, EOS_ID, PAD_ID, encode
from synthetic import generate_dataset, batch_programs


class GlyphDataset(Dataset):
    """Tokenized glyph assembly programs."""

    def __init__(self, programs: list[list[int]], block_size: int = 128):
        self.programs = programs
        self.block_size = block_size

    def __len__(self):
        return len(self.programs)

    def __getitem__(self, idx):
        tokens = self.programs[idx]
        # Truncate or pad
        if len(tokens) > self.block_size:
            start = torch.randint(0, len(tokens) - self.block_size + 1, (1,)).item()
            tokens = tokens[start:start + self.block_size]
        padded = tokens + [PAD_ID] * (self.block_size - len(tokens))

        x = torch.tensor(padded[:-1], dtype=torch.long)
        y = torch.tensor(padded[1:], dtype=torch.long)
        return x, y


def train(args):
    # Setup
    device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
    print(f"Device: {device}")
    if device.type == 'cuda':
        print(f"GPU: {torch.cuda.get_device_name(0)}")
        print(f"VRAM: {torch.cuda.get_device_properties(0).total_memory / 1e9:.1f} GB")

    # Setup output
    os.makedirs(args.output_dir, exist_ok=True)

    # Generate training data
    print(f"\nGenerating {args.dataset_size} synthetic programs...")
    programs = generate_dataset(args.dataset_size)
    avg_len = sum(len(p) for p in programs) / len(programs)
    print(f"  Average tokens per program: {avg_len:.1f}")

    # Split
    split = int(0.9 * len(programs))
    train_programs = programs[:split]
    val_programs = programs[split:]

    train_dataset = GlyphDataset(train_programs, args.block_size)
    val_dataset = GlyphDataset(val_programs, args.block_size)

    train_loader = DataLoader(
        train_dataset,
        batch_size=args.batch_size,
        shuffle=True,
        num_workers=0,
        pin_memory=True,
    )

    # Model
    model = PixelGPT(config=args.config, max_len=args.block_size).to(device)
    n_params = model.count_parameters()
    print(f"Model: {args.config}, {n_params:,} params")

    # Optimizer
    optimizer = torch.optim.AdamW(
        model.parameters(),
        lr=args.lr,
        weight_decay=args.weight_decay,
        betas=(0.9, 0.95),
    )

    # Cosine schedule with warmup
    warmup_steps = args.warmup
    total_steps = args.steps
    base_lr = args.lr

    def lr_lambda(step):
        if step < warmup_steps:
            return step / max(warmup_steps, 1)
        progress = (step - warmup_steps) / max(total_steps - warmup_steps, 1)
        return 0.1 + 0.9 * 0.5 * (1 + __import__('math').cos(__import__('math').pi * progress))

    scheduler = torch.optim.lr_scheduler.LambdaLR(optimizer, lr_lambda)

    # Training loop
    print(f"\nTraining for {args.steps} steps...")
    print(f"{'step':>6} {'loss':>8} {'lr':>10} {'tok/s':>8} {'time':>6}")
    print("-" * 45)

    model.train()
    step = 0
    t0 = time.time()
    best_loss = float('inf')

    data_iter = iter(train_loader)
    while step < args.steps:
        try:
            x, y = next(data_iter)
        except StopIteration:
            data_iter = iter(train_loader)
            x, y = next(data_iter)

        x = x.to(device)
        y = y.to(device)

        _, loss = model(x, y)

        optimizer.zero_grad(set_to_none=True)
        loss.backward()
        nn.utils.clip_grad_norm_(model.parameters(), 1.0)
        optimizer.step()
        scheduler.step()

        step += 1

        if step % args.log_every == 0:
            elapsed = time.time() - t0
            tokens_per_sec = (step * args.batch_size * args.block_size) / elapsed
            lr = scheduler.get_last_lr()[0]
            print(
                f"{step:>6} {loss.item():>8.4f} {lr:>10.6f} "
                f"{tokens_per_sec:>8.0f} {elapsed:>5.1f}s"
            )

        # Save best
        if loss.item() < best_loss and step % 500 == 0:
            best_loss = loss.item()
            ckpt_path = os.path.join(args.output_dir, 'best.pt')
            torch.save({
                'model_state': model.state_dict(),
                'config': args.config,
                'block_size': args.block_size,
                'step': step,
                'loss': loss.item(),
            }, ckpt_path)

    # Final save
    os.makedirs(args.output_dir, exist_ok=True)
    final_path = os.path.join(args.output_dir, 'final.pt')
    torch.save({
        'model_state': model.state_dict(),
        'config': args.config,
        'block_size': args.block_size,
        'step': step,
        'loss': loss.item(),
    }, final_path)
    print(f"\nSaved to {final_path}")

    # Sample
    if args.sample:
        print("\n" + "=" * 50)
        print("Generated programs:")
        print("=" * 50)
        model.eval()
        for i in range(5):
            prompt = torch.tensor([[BOS_ID]], device=device)
            out = model.generate(prompt, max_new=64, temperature=0.8, top_k=40)
            text = decode(out[0].tolist())
            print(f"\n--- Program {i+1} ---")
            print(text)
            print()


def main():
    parser = argparse.ArgumentParser(description="Train PixelGPT")
    parser.add_argument('--config', default='nano', choices=['nano', 'micro', 'small'])
    parser.add_argument('--steps', type=int, default=2000)
    parser.add_argument('--batch-size', type=int, default=32)
    parser.add_argument('--block-size', type=int, default=128)
    parser.add_argument('--lr', type=float, default=3e-4)
    parser.add_argument('--weight-decay', type=float, default=0.1)
    parser.add_argument('--warmup', type=int, default=100)
    parser.add_argument('--dataset-size', type=int, default=10000)
    parser.add_argument('--log-every', type=int, default=100)
    parser.add_argument('--output-dir', default='checkpoints')
    parser.add_argument('--sample', action='store_true', help='Sample after training')
    args = parser.parse_args()
    train(args)


if __name__ == '__main__':
    main()
