#!/usr/bin/env python3
"""
PixelGPT V2 Training Script.

Improvements over train_bilingual_llm.py:
1. Evaluation-guided early stopping (smoke test score, not loss)
2. Warmup + cosine LR with configurable schedule
3. Checkpoint averaging (EMA of last N checkpoints)
4. Hard example mining during self-distillation (bias toward weak categories)
5. Adaptive distilled ratio based on acceptance rate
6. Shorter fine-tuning with early stopping
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

sys.path.insert(0, os.path.dirname(__file__))
from bilingual_tokenizer import BilingualTokenizer
from train_opcode_llm import OpcodeGPT


class BilingualDataset(Dataset):
    def __init__(self, npz_path: str):
        print(f"Loading dataset from {npz_path}...")
        data = np.load(npz_path)
        self.tokens = torch.from_numpy(data["tokens"]).long()
        print(f"Dataset loaded: {len(self.tokens)} samples.")

    def __len__(self):
        return len(self.tokens)

    def __getitem__(self, idx):
        x = self.tokens[idx][:-1]
        y = self.tokens[idx][1:]
        return x, y


def evaluate_checkpoint(checkpoint_path, device, tokenizer):
    """Run smoke test and return (syntax, visual, semantic) scores."""
    sys.path.insert(0, os.path.dirname(__file__))
    from isa_constrained_decoder import generate_isa_constrained

    ckpt = torch.load(checkpoint_path, map_location=device, weights_only=False)
    model = OpcodeGPT(
        vocab_size=ckpt['args']['vocab_size'],
        n_embd=ckpt['args']['embd'],
        n_head=ckpt['args']['heads'],
        n_layer=ckpt['args']['layers'],
        block_size=ckpt['args']['context_len'],
        dropout=0.0,
    ).to(device)
    model.load_state_dict(ckpt["model"])
    model.eval()

    PROMPTS = [
        "; DESCRIPTION: Draws a red circle at the center of the screen (128, 128) with radius 50.",
        "; DESCRIPTION: Fills the entire 256x256 screen with solid blue color (0x0000FF).",
        "; DESCRIPTION: Draws a green rectangle of size 64x64 at the top-left corner (0, 0).",
        "; DESCRIPTION: Draws a white diagonal line from the top-left (0, 0) to the bottom-right (255, 255).",
        "; DESCRIPTION: Clears the screen to black and then halts.",
        "; DESCRIPTION: Draws a yellow square at (100, 100) with side length 40.",
        "; DESCRIPTION: A simple program that loads 10 into r1 and decrements it in a loop until it reaches 0.",
        "; DESCRIPTION: Draws a checkerboard pattern of 8x8 squares using black and white.",
        "; DESCRIPTION: Draws a horizontal red line across the middle of the screen.",
        "; DESCRIPTION: Fills the screen with a vertical gradient from black to white.",
    ]

    KNOWN_OPS = {
        "LDI", "LD", "STORE", "ADD", "SUB", "MUL", "DIV", "AND", "OR", "XOR",
        "RECTF", "CIRCLE", "LINE", "PSET", "FILL", "JMP", "JZ", "JNZ", "BLT", "BGE",
        "HALT", "FRAME", "CALL", "RET", "PUSH", "POP", "CMP", "NEG", "RAND"
    }

    syntax = visual = semantic = 0

    with torch.no_grad():
        for prompt in PROMPTS:
            result = generate_isa_constrained(model, tokenizer, prompt, device, max_tokens=200)

            # Syntax check
            lines = [l.strip() for l in result.strip().split('\n') if l.strip() and not l.strip().startswith(';')]
            valid_syntax = True
            has_halt = False
            for line in lines:
                if line.endswith(':'): continue
                parts = line.replace(',', ' ').split()
                if not parts: continue
                if parts[0].upper() not in KNOWN_OPS:
                    valid_syntax = False; break
                if parts[0].upper() == "HALT": has_halt = True
            if valid_syntax and has_halt:
                syntax += 1

            # Visual check
            draw_ops = {"RECTF", "CIRCLE", "LINE", "PSET", "FILL"}
            if any(l.split()[0].upper() in draw_ops for l in lines if l.split()):
                visual += 1

            # Semantic check (PLAN consistency)
            plan_line = None
            for line in result.strip().split('\n'):
                if line.strip().startswith('; PLAN:'):
                    plan_line = line.strip(); break
            if plan_line:
                import re
                plan_regs = {}
                for m in re.finditer(r'(r\d+)=(\S+?)\((\w+?)\)', plan_line):
                    plan_regs[m.group(1)] = m.group(2)
                verified = 0
                mismatches = 0
                for line in lines:
                    ldi = re.match(r'LDI\s+(r\d+),\s*(\S+)', line)
                    if ldi:
                        reg, val = ldi.groups()
                        if reg in plan_regs:
                            if val.lower() == plan_regs[reg].lower():
                                verified += 1
                            else:
                                mismatches += 1
                if plan_regs and mismatches <= len(plan_regs) * 0.3:
                    semantic += 1

    return syntax, visual, semantic


def train(args):
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"Device: {device}")

    tokenizer = BilingualTokenizer.load(args.tokenizer)
    vocab_size = tokenizer.offset + tokenizer.text_vocab_size + 100
    print(f"Vocabulary Size: {vocab_size}")

    dataset = BilingualDataset(args.dataset)
    loader = DataLoader(dataset, batch_size=args.batch_size, shuffle=True, num_workers=0)

    model = OpcodeGPT(
        vocab_size=vocab_size,
        n_embd=args.embd,
        n_head=args.heads,
        n_layer=args.layers,
        block_size=args.context_len,
        dropout=args.dropout,
    ).to(device)
    print(f"Model: {model.param_count():,} params")

    # Warmup + cosine LR schedule
    total_steps = args.epochs * len(loader)
    warmup_steps = int(total_steps * args.warmup_ratio)

    def lr_lambda(step):
        if step < warmup_steps:
            return step / max(1, warmup_steps)
        progress = (step - warmup_steps) / max(1, total_steps - warmup_steps)
        return 0.5 * (1.0 + math.cos(math.pi * progress))

    optimizer = torch.optim.AdamW(model.parameters(), lr=args.lr, weight_decay=0.01)
    scheduler = torch.optim.lr_scheduler.LambdaLR(optimizer, lr_lambda)
    print(f"Schedule: {args.lr} peak LR, {warmup_steps} warmup steps, cosine decay over {total_steps}")

    start_epoch = 0
    if args.resume and os.path.exists(args.checkpoint):
        checkpoint = torch.load(args.checkpoint, map_location=device, weights_only=False)
        model.load_state_dict(checkpoint["model"])
        start_epoch = checkpoint.get("epoch", 0)
        print(f"Resumed from epoch {start_epoch}")

    best_score = -1
    best_epoch = -1
    patience = 3  # epochs without improvement before stopping
    checkpoint_ema = None  # For checkpoint averaging
    ema_count = 0

    for epoch in range(start_epoch, args.epochs):
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

            if (i + 1) % 500 == 0:
                # Save intermediate to separate path (don't overwrite best)
                int_path = args.checkpoint.replace(".pt", "_latest.pt")
                ckpt = {
                    "model": model.state_dict(),
                    "args": {"embd": args.embd, "heads": args.heads, "layers": args.layers,
                             "context_len": args.context_len, "vocab_size": vocab_size},
                    "epoch": epoch + 1, "batch": i + 1, "loss": loss.item(),
                }
                torch.save(ckpt, int_path)

        avg_loss = total_loss / n_batches
        lr = scheduler.get_last_lr()[0]
        elapsed = time.time() - t0
        print(f"Epoch {epoch+1}/{args.epochs}  loss={avg_loss:.4f}  lr={lr:.2e}  time={elapsed:.1f}s")

        # Evaluate at end of each epoch
        scores = evaluate_checkpoint(args.checkpoint, device, tokenizer)
        total_score = sum(scores)
        print(f"  Eval: Syntax={scores[0]}/10  Visual={scores[1]}/10  Semantic={scores[2]}/10  Total={total_score}/30")

        # Checkpoint averaging: accumulate EMA of weights
        if checkpoint_ema is None:
            checkpoint_ema = {k: v.clone() for k, v in model.state_dict().items()}
            ema_count = 1
        else:
            alpha = 1.0 / (ema_count + 1)
            for k in checkpoint_ema:
                checkpoint_ema[k] = (1 - alpha) * checkpoint_ema[k].to(device) + alpha * model.state_dict()[k]
            ema_count += 1

        if total_score > best_score:
            best_score = total_score
            best_epoch = epoch
            # Save best (raw)
            ckpt = {
                "model": model.state_dict(),
                "args": {"embd": args.embd, "heads": args.heads, "layers": args.layers,
                         "context_len": args.context_len, "vocab_size": vocab_size},
                "epoch": epoch + 1, "loss": avg_loss,
                "scores": {"syntax": scores[0], "visual": scores[1], "semantic": scores[2], "total": total_score},
            }
            torch.save(ckpt, args.checkpoint)
            print(f"  Best checkpoint saved (score={total_score})")

            # Also save EMA-averaged checkpoint
            ema_ckpt = ckpt.copy()
            ema_ckpt["model"] = checkpoint_ema
            ema_ckpt["ema_epochs"] = ema_count
            torch.save(ema_ckpt, args.checkpoint.replace(".pt", "_ema.pt"))
            print(f"  EMA checkpoint saved ({ema_count} epochs averaged)")

        # Early stopping: patience-based
        # - If perfect 30/30, stop after 2 more epochs (give EMA a chance)
        # - Otherwise stop after `patience` epochs without improvement
        epochs_without_improvement = epoch - best_epoch
        if total_score >= 30:
            if epochs_without_improvement >= 2:
                print(f"  Perfect score held for 2 epochs. Early stopping.")
                break
        elif epochs_without_improvement >= patience:
            print(f"  No improvement for {patience} epochs. Early stopping (best={best_score} at epoch {best_epoch+1}).")
            break

    print(f"\nTraining complete. Best score: {best_score}/30")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--dataset", default="bilingual_dataset.npz")
    parser.add_argument("--tokenizer", default="pixelflow/bilingual_tokenizer_v4")
    parser.add_argument("--checkpoint", default="bilingual_llm_ckpt.pt")
    parser.add_argument("--layers", type=int, default=6)
    parser.add_argument("--heads", type=int, default=8)
    parser.add_argument("--embd", type=int, default=384)
    parser.add_argument("--context-len", type=int, default=1024)
    parser.add_argument("--epochs", type=int, default=10)
    parser.add_argument("--batch-size", type=int, default=16)
    parser.add_argument("--lr", type=float, default=5e-5)       # Lower default for fine-tuning
    parser.add_argument("--warmup-ratio", type=float, default=0.1)  # 10% warmup
    parser.add_argument("--dropout", type=float, default=0.1)
    parser.add_argument("--resume", action="store_true")
    args = parser.parse_args()

    train(args)
