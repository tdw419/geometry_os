#!/usr/bin/env python3
"""
Pixel-LLM Training with Opcode-Level Tokenizer

Trains a small GPT-2 to predict GeOS assembly using clean opcode-level tokens.
Each opcode, register, and structural element is a single discrete token.

Usage:
    python3 train_opcode_llm.py                          # train with defaults
    python3 train_opcode_llm.py --layers 2 --embd 128    # small model
    python3 train_opcode_llm.py --layers 4 --embd 256    # medium model
    python3 train_opcode_llm.py --gen "LDI r1, 5"        # generate after training
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
from opcode_tokenizer import OpcodeTokenizer, BOS, EOS, PAD, NEWLINE, NUM, LABEL, STR


# ─── Dataset ─────────────────────────────────────────────────────────────────

class OpcodeDataset(Dataset):
    def __init__(self, npz_path: str):
        data = np.load(npz_path)
        self.tokens = torch.from_numpy(data["tokens"]).long()

    def __len__(self):
        return len(self.tokens)

    def __getitem__(self, idx):
        x = self.tokens[idx][:-1]  # input: all but last
        y = self.tokens[idx][1:]   # target: shifted by 1
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
        self.register_buffer("bias", torch.tril(torch.ones(block_size, block_size)).view(1, 1, block_size, block_size))

    def forward(self, x):
        B, T, C = x.size()
        qkv = self.c_attn(x).split(self.n_embd, dim=2)
        q, k, v = [h.view(B, T, self.n_head, C // self.n_head).transpose(1, 2) for h in (qkv[0], qkv[1], qkv[2])]
        att = (q @ k.transpose(-2, -1)) * (1.0 / math.sqrt(k.size(-1)))
        att = att.masked_fill(self.bias[:, :, :T, :T] == 0, float('-inf'))
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


class OpcodeGPT(nn.Module):
    def __init__(self, vocab_size, n_embd=128, n_head=4, n_layer=2, block_size=512, dropout=0.1):
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
        assert T <= self.block_size
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
        for _ in range(max_new_tokens):
            idx_cond = idx if idx.size(1) <= self.block_size else idx[:, -self.block_size:]
            logits, _ = self(idx_cond)
            logits = logits[:, -1, :] / temperature
            if top_k is not None:
                v, _ = torch.topk(logits, min(top_k, logits.size(-1)))
                logits[logits < v[:, [-1]]] = float('-inf')
            probs = F.softmax(logits, dim=-1)
            idx_next = torch.multinomial(probs, num_samples=1)
            idx = torch.cat([idx, idx_next], dim=1)
            if idx_next.item() == EOS:
                break
        return idx

    def param_count(self):
        return sum(p.numel() for p in self.parameters())


# ─── Generation helpers ──────────────────────────────────────────────────────

def prompt_to_ids(tokenizer: OpcodeTokenizer, prompt: str, device: str) -> torch.Tensor:
    """Convert a text prompt to token IDs."""
    ids = tokenizer.encode(prompt, add_bos=True, add_eos=False)
    return torch.tensor([ids], dtype=torch.long, device=device)


def generate_asm(model, tokenizer, prompt: str, device: str, max_tokens=200, temperature=0.8, top_k=40) -> str:
    """Generate GeOS assembly from a prompt."""
    idx = prompt_to_ids(tokenizer, prompt, device)
    out = model.generate(idx, max_new_tokens=max_tokens, temperature=temperature, top_k=top_k)
    return tokenizer.decode(out[0].tolist())


# ─── Opcode-aware constraint ────────────────────────────────────────────────

def build_opcode_mask(tokenizer: OpcodeTokenizer, block_size: int) -> torch.Tensor:
    """
    Build a mask that blocks invalid token transitions.
    After NEWLINE, only opcodes and LABEL are valid (start of instruction).
    After an opcode, only registers, NUM, LABEL, STR are valid (operands).
    """
    from opcode_tokenizer import SPECIAL_NAMES, OPCODES, REGISTERS
    
    vocab_size = tokenizer.vocab_size
    mask = torch.ones(vocab_size, vocab_size)  # mask[from_token][to_token] = 0 means blocked
    
    # After NEWLINE or BOS: only opcodes, LABEL, COMMENT, NEWLINE, EOS are valid
    valid_after_newline = set()
    valid_after_newline.add(NEWLINE)
    valid_after_newline.add(EOS)
    valid_after_newline.add(COMMENT)
    for op in OPCODES:
        valid_after_newline.add(tokenizer.token2id[op])
    valid_after_newline.add(LABEL)
    
    for tid in range(vocab_size):
        if tid == NEWLINE or tid == BOS:
            for to_tid in range(vocab_size):
                if to_tid not in valid_after_newline:
                    mask[tid][to_tid] = float('-inf')
    
    return mask


# ─── Training ────────────────────────────────────────────────────────────────

def train(args):
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"Device: {device}")

    # Load dataset
    dataset = OpcodeDataset(args.dataset)
    loader = DataLoader(dataset, batch_size=args.batch_size, shuffle=True, num_workers=0)

    # Load tokenizer
    tok_path = Path(args.dataset).with_suffix('.tokenizer.json')
    tokenizer = OpcodeTokenizer.load(str(tok_path))

    # Build model
    model = OpcodeGPT(
        vocab_size=tokenizer.vocab_size,
        n_embd=args.embd,
        n_head=args.heads,
        n_layer=args.layers,
        block_size=args.context_len,
        dropout=args.dropout,
    ).to(device)

    print(f"Vocab: {tokenizer.vocab_size} tokens")
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

        for x, y in loader:
            x, y = x.to(device), y.to(device)
            logits, loss = model(x, y)
            optimizer.zero_grad()
            loss.backward()
            torch.nn.utils.clip_grad_norm_(model.parameters(), 1.0)
            optimizer.step()
            scheduler.step()
            total_loss += loss.item()
            n_batches += 1

        avg_loss = total_loss / n_batches
        elapsed = time.time() - t0
        lr = scheduler.get_last_lr()[0]

        print(f"Epoch {epoch+1}/{args.epochs}  loss={avg_loss:.4f}  lr={lr:.2e}  time={elapsed:.1f}s")

        if avg_loss < best_loss:
            best_loss = avg_loss
            ckpt = {
                "model": model.state_dict(),
                "args": {"embd": args.embd, "heads": args.heads, "layers": args.layers, "context_len": args.context_len},
                "epoch": epoch + 1,
                "loss": avg_loss,
                "vocab_size": tokenizer.vocab_size,
            }
            torch.save(ckpt, args.checkpoint)
            print(f"  Saved best checkpoint (loss={avg_loss:.4f})")

        # Generate sample every 5 epochs
        if (epoch + 1) % 5 == 0 or epoch == args.epochs - 1:
            model.eval()
            for prompt in ["LDI r1, 5", "ADD r1, r2, r3", "RECTF 0, 0, 64, 64, 0xFF0000"]:
                print(f"\n  Prompt: {prompt}")
                sample = generate_asm(model, tokenizer, prompt, device, max_tokens=80, temperature=0.8)
                for line in sample.split('\n')[:8]:
                    if line.strip():
                        print(f"    {line.strip()}")
            model.train()

    print(f"\nTraining complete. Best loss: {best_loss:.4f}")
    print(f"Checkpoint: {args.checkpoint}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--dataset", default="pixel_llm_opcode_dataset.npz")
    parser.add_argument("--checkpoint", default="pixel_llm_opcode_ckpt.pt")
    parser.add_argument("--layers", type=int, default=2)
    parser.add_argument("--heads", type=int, default=4)
    parser.add_argument("--embd", type=int, default=128)
    parser.add_argument("--context-len", type=int, default=512)
    parser.add_argument("--epochs", type=int, default=20)
    parser.add_argument("--batch-size", type=int, default=32)
    parser.add_argument("--lr", type=float, default=3e-4)
    parser.add_argument("--dropout", type=float, default=0.1)
    parser.add_argument("--gen", type=str, default=None, help="Generate after training")
    args = parser.parse_args()
    train(args)
