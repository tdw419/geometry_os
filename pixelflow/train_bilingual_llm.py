#!/usr/bin/env python3
"""
Bilingual Pixel-LLM Training (V1).

Trains a 15M parameter Transformer on the Bilingual GeOS Corpus.
Learns semantic mapping between natural language documentation and 
hardware-native assembly logic.
"""

import argparse
import json
import math
import os
import sys
import time
from pathlib import Path

import numpy as np
import torch
import torch.nn as nn
import torch.nn.functional as F
from torch.utils.data import Dataset, DataLoader

# Add pixelflow to path
sys.path.insert(0, os.path.dirname(__file__))
from bilingual_tokenizer import BilingualTokenizer
from train_opcode_llm import OpcodeGPT, generate_asm

# ─── Dataset ─────────────────────────────────────────────────────────────────

class BilingualDataset(Dataset):
    def __init__(self, npz_path: str):
        print(f"Loading dataset from {npz_path}...")
        data = np.load(npz_path)
        self.tokens = torch.from_numpy(data["tokens"]).long()
        print(f"Dataset loaded: {len(self.tokens)} samples.")

    def __len__(self):
        return len(self.tokens)

    def __getitem__(self, idx):
        # input: all but last, target: shifted by 1
        x = self.tokens[idx][:-1]
        y = self.tokens[idx][1:]
        return x, y


# ─── Training ────────────────────────────────────────────────────────────────

def train(args):
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"Device: {device}")

    # 1. Load tokenizer (V4)
    print(f"Loading tokenizer from {args.tokenizer}...")
    tokenizer = BilingualTokenizer.load(args.tokenizer)
    
    # Calculate vocab size (IDs go up to offset + text_vocab_size)
    # We add 100 for safety buffer
    vocab_size = tokenizer.offset + tokenizer.text_vocab_size + 100
    print(f"Vocabulary Size: {vocab_size}")

    # 2. Load dataset
    dataset = BilingualDataset(args.dataset)
    loader = DataLoader(dataset, batch_size=args.batch_size, shuffle=True, num_workers=0)

    # 3. Build model (15M Parameter Target)
    # Defaults: 6 layers, 8 heads, 384 dimensions
    model = OpcodeGPT(
        vocab_size=vocab_size,
        n_embd=args.embd,
        n_head=args.heads,
        n_layer=args.layers,
        block_size=args.context_len,
        dropout=args.dropout,
    ).to(device)

    print(f"Model: {model.param_count():,} params")
    print(f"  {args.layers}L, {args.heads}H, {args.embd}D, ctx={args.context_len}")

    optimizer = torch.optim.AdamW(model.parameters(), lr=args.lr, weight_decay=0.01)
    scheduler = torch.optim.lr_scheduler.CosineAnnealingLR(optimizer, args.epochs * len(loader))

    best_loss = float('inf')
    for epoch in range(args.epochs):
        model.train()
        total_loss = 0
        n_batches = 0
        t0 = time.time()

        for i, (x, y) in enumerate(loader):
            x, y = x.to(device), y.to(device)
            logits, loss = model(x, y)
            optimizer.zero_grad()
            loss.backward()
            torch.nn.utils.clip_grad_norm_(model.parameters(), 1.0)
            optimizer.step()
            scheduler.step()
            total_loss += loss.item()
            n_batches += 1
            if (i + 1) % 100 == 0:
                print(f"  Batch {i+1}/{len(loader)}  loss={loss.item():.4f}")
            
            # V12: Periodic save to avoid loss on crash
            if (i + 1) % 500 == 0:
                ckpt = {
                    "model": model.state_dict(),
                    "args": {
                        "embd": args.embd, 
                        "heads": args.heads, 
                        "layers": args.layers, 
                        "context_len": args.context_len,
                        "vocab_size": vocab_size
                    },
                    "epoch": epoch + 1,
                    "batch": i + 1,
                    "loss": loss.item(),
                }
                torch.save(ckpt, args.checkpoint)
                print(f"  Saved intermediate checkpoint (batch {i+1})")

        avg_loss = total_loss / n_batches
        elapsed = time.time() - t0
        lr = scheduler.get_last_lr()[0]

        print(f"Epoch {epoch+1}/{args.epochs}  loss={avg_loss:.4f}  lr={lr:.2e}  time={elapsed:.1f}s")

        if avg_loss < best_loss:
            best_loss = avg_loss
            ckpt = {
                "model": model.state_dict(),
                "args": {
                    "embd": args.embd, 
                    "heads": args.heads, 
                    "layers": args.layers, 
                    "context_len": args.context_len,
                    "vocab_size": vocab_size
                },
                "epoch": epoch + 1,
                "loss": avg_loss,
            }
            torch.save(ckpt, args.checkpoint)
            print(f"  Saved best checkpoint (loss={avg_loss:.4f})")

        # Generate sample every 5 epochs
        if (epoch + 1) % 5 == 0 or epoch == args.epochs - 1:
            model.eval()
            prompts = [
                "; Draws a red circle at the center",
                "; Initialization sequence",
                "LDI r1, 10\nloop:"
            ]
            for p in prompts:
                print(f"\n  Prompt: {p}")
                sample = generate_asm(model, tokenizer, p, device, max_tokens=100)
                print(f"    {sample}")
            model.train()

    print(f"\nTraining complete. Best loss: {best_loss:.4f}")
    print(f"Checkpoint: {args.checkpoint}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--dataset", default="bilingual_dataset.npz")
    parser.add_argument("--tokenizer", default="pixelflow/bilingual_tokenizer_v4")
    parser.add_argument("--checkpoint", default="bilingual_llm_ckpt.pt")
    # 15M Param configuration
    parser.add_argument("--layers", type=int, default=6)
    parser.add_argument("--heads", type=int, default=8)
    parser.add_argument("--embd", type=int, default=384)
    parser.add_argument("--context-len", type=int, default=1024)
    
    parser.add_argument("--epochs", type=int, default=40)
    parser.add_argument("--batch-size", type=int, default=16)
    parser.add_argument("--lr", type=float, default=3e-4)
    parser.add_argument("--dropout", type=float, default=0.1)
    args = parser.parse_args()
    
    train(args)
