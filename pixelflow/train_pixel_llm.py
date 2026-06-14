#!/usr/bin/env python3
"""
Pixel-LLM Training Spike (Step 2)

Train a small transformer to autoregressively predict GeOS assembly
encoded as pixelpack seeds (3 ASCII bytes per u32 token).

Architecture: GPT-2 style, 4L-6H-384D, ~7M params
Vocabulary: ~19K discrete u32 pixel values
Task: Next-seed prediction (given N seeds, predict seed N+1)

Usage:
    python3 train_pixel_llm.py                    # train with defaults
    python3 train_pixel_llm.py --epochs 20        # more training
    python3 train_pixel_llm.py --gen "LDI r1, 5"  # generate after training
    python3 train_pixel_llm.py --gen_only          # generate with existing checkpoint
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

# ─── Pixel Encoding / Decoding ──────────────────────────────────────────────

def text_to_seeds(text: str) -> list[int]:
    """Encode text to pixelpack raw3 seeds (3 bytes per u32, 0xA0 prefix)."""
    raw = text.encode("utf-8")
    seeds = []
    for i in range(0, len(raw), 3):
        chunk = raw[i:i+3]
        seed = 0xA0000000
        if len(chunk) >= 1: seed |= chunk[0] << 16
        if len(chunk) >= 2: seed |= chunk[1] << 8
        if len(chunk) >= 3: seed |= chunk[2]
        seeds.append(seed)
    return seeds


def seeds_to_text(seeds: list[int]) -> str:
    """Decode pixelpack raw3 seeds back to text."""
    raw = bytearray()
    for s in seeds:
        raw.append((s >> 16) & 0xFF)
        raw.append((s >> 8) & 0xFF)
        raw.append(s & 0xFF)
    # Strip trailing nulls (padding artifacts)
    return raw.rstrip(b"\x00").decode("utf-8", errors="replace")


# ─── Dataset ─────────────────────────────────────────────────────────────────

class PixelASMDataset(Dataset):
    """GeOS assembly programs encoded as pixel seed sequences."""

    def __init__(self, npz_path: str, context_len: int = 1024, stride: int = 256):
        data = np.load(npz_path)
        self.context_len = context_len
        self.sequences = []

        for key in data.files:
            seeds = data[key].astype(np.int64).tolist()
            # Create overlapping windows for longer programs
            if len(seeds) <= context_len:
                self.sequences.append(seeds)
            else:
                for start in range(0, len(seeds) - context_len + 1, stride):
                    self.sequences.append(seeds[start:start + context_len])

    def __len__(self):
        return len(self.sequences)

    def __getitem__(self, idx):
        seq = self.sequences[idx]
        # Pad to context_len
        pad_len = self.context_len - len(seq) + 1
        seq = seq + [0] * pad_len  # pad with seed index 0
        seq = seq[:self.context_len]  # ensure exact length
        x = torch.tensor(seq[:-1], dtype=torch.long)
        y = torch.tensor(seq[1:], dtype=torch.long)
        return x, y


# ─── Model ───────────────────────────────────────────────────────────────────

class CausalSelfAttention(nn.Module):
    def __init__(self, n_embd, n_head, block_size, dropout=0.1):
        super().__init__()
        assert n_embd % n_head == 0
        self.n_head = n_head
        self.n_embd = n_embd
        self.c_attn = nn.Linear(n_embd, 3 * n_embd)
        self.c_proj = nn.Linear(n_embd, n_embd)
        self.attn_dropout = nn.Dropout(dropout)
        self.resid_dropout = nn.Dropout(dropout)
        self.register_buffer(
            "bias",
            torch.tril(torch.ones(block_size, block_size)).view(1, 1, block_size, block_size),
        )

    def forward(self, x):
        B, T, C = x.size()
        q, k, v = self.c_attn(x).split(self.n_embd, dim=2)
        q = q.view(B, T, self.n_head, C // self.n_head).transpose(1, 2)
        k = k.view(B, T, self.n_head, C // self.n_head).transpose(1, 2)
        v = v.view(B, T, self.n_head, C // self.n_head).transpose(1, 2)

        att = (q @ k.transpose(-2, -1)) * (1.0 / math.sqrt(k.size(-1)))
        att = att.masked_fill(self.bias[:, :, :T, :T] == 0, float("-inf"))
        att = F.softmax(att, dim=-1)
        att = self.attn_dropout(att)
        y = att @ v
        y = y.transpose(1, 2).contiguous().view(B, T, C)
        y = self.resid_dropout(self.c_proj(y))
        return y


class Block(nn.Module):
    def __init__(self, n_embd, n_head, block_size, dropout=0.1):
        super().__init__()
        self.ln_1 = nn.LayerNorm(n_embd)
        self.attn = CausalSelfAttention(n_embd, n_head, block_size, dropout)
        self.ln_2 = nn.LayerNorm(n_embd)
        self.mlp = nn.Sequential(
            nn.Linear(n_embd, 4 * n_embd),
            nn.GELU(),
            nn.Linear(4 * n_embd, n_embd),
            nn.Dropout(dropout),
        )

    def forward(self, x):
        x = x + self.attn(self.ln_1(x))
        x = x + self.mlp(self.ln_2(x))
        return x


class PixelGPT(nn.Module):
    """Small GPT-2 for predicting pixelpack seed sequences."""

    def __init__(self, vocab_size, n_embd=384, n_head=6, n_layer=4, block_size=1024, dropout=0.1):
        super().__init__()
        self.block_size = block_size
        self.transformer = nn.ModuleDict(dict(
            wte=nn.Embedding(vocab_size, n_embd),
            wpe=nn.Embedding(block_size, n_embd),
            drop=nn.Dropout(dropout),
            h=nn.ModuleList([Block(n_embd, n_head, block_size, dropout) for _ in range(n_layer)]),
            ln_f=nn.LayerNorm(n_embd),
        ))
        self.lm_head = nn.Linear(n_embd, vocab_size, bias=False)
        # Weight tying: reuse token embeddings for output projection
        self.lm_head.weight = self.transformer.wte.weight
        self.apply(self._init_weights)

    def _init_weights(self, module):
        if isinstance(module, nn.Linear):
            torch.nn.init.normal_(module.weight, mean=0.0, std=0.02)
            if module.bias is not None:
                torch.nn.init.zeros_(module.bias)
        elif isinstance(module, nn.Embedding):
            torch.nn.init.normal_(module.weight, mean=0.0, std=0.02)

    def forward(self, idx, targets=None):
        B, T = idx.size()
        assert T <= self.block_size, f"Sequence length {T} > block_size {self.block_size}"

        pos = torch.arange(0, T, dtype=torch.long, device=idx.device)
        tok_emb = self.transformer.wte(idx)
        pos_emb = self.transformer.wpe(pos)
        x = self.transformer.drop(tok_emb + pos_emb)
        for block in self.transformer.h:
            x = block(x)
        x = self.transformer.ln_f(x)
        logits = self.lm_head(x)

        loss = None
        if targets is not None:
            loss = F.cross_entropy(logits.view(-1, logits.size(-1)), targets.view(-1))
        return logits, loss

    @torch.no_grad()
    def generate(self, idx, max_new_tokens, temperature=0.8, top_k=40):
        """Autoregressive generation."""
        for _ in range(max_new_tokens):
            idx_cond = idx if idx.size(1) <= self.block_size else idx[:, -self.block_size:]
            logits, _ = self(idx_cond)
            logits = logits[:, -1, :] / temperature
            if top_k is not None:
                v, _ = torch.topk(logits, min(top_k, logits.size(-1)))
                logits[logits < v[:, [-1]]] = float("-inf")
            probs = F.softmax(logits, dim=-1)
            idx_next = torch.multinomial(probs, num_samples=1)
            idx = torch.cat([idx, idx_next], dim=1)
        return idx

    def param_count(self):
        return sum(p.numel() for p in self.parameters())


# ─── Training ────────────────────────────────────────────────────────────────

def train(args):
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"Device: {device}")

    # Load dataset
    dataset = PixelASMDataset(args.dataset, context_len=args.context_len, stride=args.stride)
    print(f"Sequences: {len(dataset)} (context_len={args.context_len}, stride={args.stride})")

    # Build vocab from dataset
    all_seeds = []
    for x, y in dataset:
        all_seeds.extend(x.tolist())
        all_seeds.extend(y.tolist())
    vocab = sorted(set(all_seeds))
    vocab_size = max(vocab) + 1  # Use max+1 as vocab size (sparse, but correct)
    print(f"Vocab: {len(vocab)} unique tokens, index range [0, {vocab_size - 1}]")
    print(f"Vocab range: 0x{min(vocab):08X} to 0x{max(vocab):08X}")

    # Remap seeds to dense indices for efficiency
    seed_to_idx = {s: i for i, s in enumerate(vocab)}
    idx_to_seed = {i: s for s, i in seed_to_idx.items()}

    # Remap dataset
    for i in range(len(dataset.sequences)):
        dataset.sequences[i] = [seed_to_idx[s] for s in dataset.sequences[i]]

    # Split train/val (90/10)
    n_train = int(0.9 * len(dataset))
    train_ds, val_ds = torch.utils.data.random_split(dataset, [n_train, len(dataset) - n_train])
    train_loader = DataLoader(train_ds, batch_size=args.batch_size, shuffle=True, num_workers=0)
    val_loader = DataLoader(val_ds, batch_size=args.batch_size, shuffle=False, num_workers=0)

    # Model
    model = PixelGPT(
        vocab_size=len(vocab),
        n_embd=args.embd,
        n_head=args.heads,
        n_layer=args.layers,
        block_size=args.context_len,
        dropout=args.dropout,
    ).to(device)
    print(f"Model: {model.param_count():,} params")
    print(f"  {args.layers}L, {args.heads}H, {args.embd}D, ctx={args.context_len}")

    optimizer = torch.optim.AdamW(model.parameters(), lr=args.lr, weight_decay=0.01)
    scheduler = torch.optim.lr_scheduler.CosineAnnealingLR(optimizer, T_max=args.epochs)

    best_val_loss = float("inf")
    ckpt_path = Path(args.checkpoint)

    for epoch in range(args.epochs):
        t0 = time.time()
        model.train()
        train_loss = 0
        train_steps = 0

        for x, y in train_loader:
            x, y = x.to(device), y.to(device)
            _, loss = model(x, y)
            optimizer.zero_grad()
            loss.backward()
            torch.nn.utils.clip_grad_norm_(model.parameters(), 1.0)
            optimizer.step()
            train_loss += loss.item()
            train_steps += 1

        scheduler.step()

        # Validation
        model.eval()
        val_loss = 0
        val_steps = 0
        with torch.no_grad():
            for x, y in val_loader:
                x, y = x.to(device), y.to(device)
                _, loss = model(x, y)
                val_loss += loss.item()
                val_steps += 1

        train_loss /= max(train_steps, 1)
        val_loss /= max(val_steps, 1)
        dt = time.time() - t0

        marker = " *" if val_loss < best_val_loss else ""
        if val_loss < best_val_loss:
            best_val_loss = val_loss
            torch.save({
                "model": model.state_dict(),
                "vocab": vocab,
                "seed_to_idx": seed_to_idx,
                "idx_to_seed": idx_to_seed,
                "args": vars(args),
            }, ckpt_path)

        print(
            f"  epoch {epoch+1:3d}/{args.epochs} | "
            f"train {train_loss:.4f} | val {val_loss:.4f} | "
            f"best {best_val_loss:.4f} | "
            f"{dt:.1f}s{marker}"
        )

        # Sample generation every 5 epochs
        if (epoch + 1) % 5 == 0 or epoch == args.epochs - 1:
            sample_and_decode(model, idx_to_seed, device, args)

    print(f"\nTraining complete. Best val loss: {best_val_loss:.4f}")
    print(f"Checkpoint: {ckpt_path}")


def sample_and_decode(model, idx_to_seed, device, args):
    """Generate a sample and decode it back to assembly text."""
    model.eval()
    # Start with a common GeOS prefix
    prompt = "LDI r1, 0\n"
    prompt_seeds = text_to_seeds(prompt)
    # Map seeds through vocab
    seed_to_idx = {v: k for k, v in idx_to_seed.items()}
    prompt_indices = [seed_to_idx.get(s, 0) for s in prompt_seeds if s in seed_to_idx]

    if not prompt_indices:
        print("    (prompt seeds not in vocab, skipping sample)")
        return

    idx = torch.tensor([prompt_indices], dtype=torch.long, device=device)
    out = model.generate(idx, max_new_tokens=100, temperature=0.8, top_k=50)
    out_seeds = [idx_to_seed.get(i.item(), 0xA0000000) for i in out[0]]
    text = seeds_to_text(out_seeds)
    print(f"    sample: {repr(text[:200])}")


def generate(args):
    """Load checkpoint and generate from a prompt."""
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

    if not os.path.exists(args.checkpoint):
        print(f"No checkpoint at {args.checkpoint}. Train first.")
        return

    ckpt = torch.load(args.checkpoint, map_location=device, weights_only=False)
    model_args = ckpt["args"]
    idx_to_seed = ckpt["idx_to_seed"]
    seed_to_idx = ckpt["seed_to_idx"]
    vocab_size = len(idx_to_seed)

    model = PixelGPT(
        vocab_size=vocab_size,
        n_embd=model_args.get("embd", 384),
        n_head=model_args.get("heads", 6),
        n_layer=model_args.get("layers", 4),
        block_size=model_args.get("context_len", 1024),
    ).to(device)
    model.load_state_dict(ckpt["model"])
    model.eval()
    print(f"Loaded model from {args.checkpoint}")

    # Encode prompt
    prompt_seeds = text_to_seeds(args.gen)
    prompt_indices = [seed_to_idx.get(s, 0) for s in prompt_seeds if s in seed_to_idx]
    if not prompt_indices:
        print(f"Warning: none of the prompt seeds are in the vocab. Trying anyway...")
        prompt_indices = [0]

    idx = torch.tensor([prompt_indices], dtype=torch.long, device=device)
    print(f"Prompt ({len(prompt_indices)} seeds): {args.gen}")

    out = model.generate(idx, max_new_tokens=args.max_tokens, temperature=args.temperature, top_k=50)
    out_seeds = [idx_to_seed.get(i.item(), 0xA0000000) for i in out[0]]
    text = seeds_to_text(out_seeds)
    print(f"\nGenerated assembly ({len(text)} chars):\n")
    print(text)
    print(f"\n--- End of generation ({len(out_seeds)} seeds) ---")


# ─── Main ────────────────────────────────────────────────────────────────────

def main():
    parser = argparse.ArgumentParser(description="Pixel-LLM: Train a transformer on GeOS pixel-encoded assembly")
    parser.add_argument("--dataset", default="pixel_llm_dataset.npz", help="Path to .npz dataset")
    parser.add_argument("--checkpoint", default="pixel_llm_ckpt.pt", help="Checkpoint path")
    # Model
    parser.add_argument("--layers", type=int, default=2, help="Transformer layers")
    parser.add_argument("--heads", type=int, default=4, help="Attention heads")
    parser.add_argument("--embd", type=int, default=128, help="Embedding dimension")
    parser.add_argument("--context-len", type=int, default=512, help="Context window (seeds)")
    parser.add_argument("--dropout", type=float, default=0.1, help="Dropout")
    # Training
    parser.add_argument("--epochs", type=int, default=10, help="Training epochs")
    parser.add_argument("--batch-size", type=int, default=32, help="Batch size")
    parser.add_argument("--lr", type=float, default=3e-4, help="Learning rate")
    parser.add_argument("--stride", type=int, default=256, help="Window stride for long programs")
    # Generation
    parser.add_argument("--gen", type=str, default=None, help="Prompt text for generation")
    parser.add_argument("--gen-only", action="store_true", help="Only generate (skip training)")
    parser.add_argument("--max-tokens", type=int, default=200, help="Max tokens to generate")
    parser.add_argument("--temperature", type=float, default=0.8, help="Generation temperature")

    args = parser.parse_args()

    if args.gen_only or args.gen:
        generate(args)
    else:
        train(args)


if __name__ == "__main__":
    main()
