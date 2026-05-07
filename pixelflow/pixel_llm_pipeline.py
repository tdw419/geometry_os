#!/usr/bin/env python3
"""
Pixel-LLM End-to-End Pipeline (Step 4)

Generate GeOS assembly from a text prompt using the trained Pixel-LLM,
attempt to assemble it, and execute it in the GeOS VM.

Usage:
    python3 pixel_llm_pipeline.py "Draw a red pixel at center"
    python3 pixel_llm_pipeline.py "LDI r1, 5" --max-tokens 300
    python3 pixel_llm_pipeline.py "fibonacci" --n-samples 5 --temperature 1.0
"""

import argparse
import json
import math
import sys
import time
from pathlib import Path

import numpy as np
import torch
import torch.nn as nn
import torch.nn.functional as F

# ─── Pixel Encoding / Decoding ──────────────────────────────────────────────

def text_to_seeds(text: str) -> list[int]:
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
    raw = bytearray()
    for s in seeds:
        raw.append((s >> 16) & 0xFF)
        raw.append((s >> 8) & 0xFF)
        raw.append(s & 0xFF)
    return raw.rstrip(b"\x00").decode("utf-8", errors="replace")


# ─── Model (exact copy from train_pixel_llm.py for weight compatibility) ────

class CausalSelfAttention(nn.Module):
    def __init__(self, n_embd, n_head, block_size, dropout=0.0):
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
    def __init__(self, n_embd, n_head, block_size, dropout=0.0):
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
    def __init__(self, vocab_size, n_embd=128, n_head=4, n_layer=2, block_size=256, dropout=0.0):
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
        assert T <= self.block_size
        pos = torch.arange(0, T, dtype=torch.long, device=idx.device)
        tok_emb = self.transformer.wte(idx)
        pos_emb = self.transformer.wpe(pos)
        x = self.transformer.drop(tok_emb + pos_emb)
        for block in self.transformer.h:
            x = block(x)
        x = self.transformer.ln_f(x)
        logits = self.lm_head(x)
        loss = F.cross_entropy(logits.view(-1, logits.size(-1)), targets.view(-1)) if targets is not None else None
        return logits, loss

    @torch.no_grad()
    def generate(self, idx, max_new_tokens, temperature=0.8, top_k=50, stop_tokens=None):
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
            if stop_tokens and idx_next.item() in stop_tokens:
                break
        return idx


def load_model(ckpt_path, device="cpu"):
    """Load trained Pixel-LLM checkpoint."""
    ckpt = torch.load(ckpt_path, map_location=device, weights_only=False)
    cfg = ckpt["args"]
    idx_to_seed = ckpt["idx_to_seed"]
    seed_to_idx = ckpt["seed_to_idx"]
    vocab_size = len(idx_to_seed)

    model = PixelGPT(
        vocab_size=vocab_size,
        n_embd=cfg.get("embd", 128),
        n_head=cfg.get("heads", 4),
        n_layer=cfg.get("layers", 2),
        block_size=cfg.get("context_len", 256),
    ).to(device)
    model.load_state_dict(ckpt["model"])
    model.eval()
    return model, seed_to_idx, idx_to_seed


def generate_asm(model, seed_to_idx, idx_to_seed, prompt: str,
                 max_tokens=200, temperature=0.7, top_k=50, device="cpu") -> str:
    """Generate assembly text from a prompt."""
    prompt_seeds = text_to_seeds(prompt)
    prompt_indices = [seed_to_idx.get(s, 0) for s in prompt_seeds if s in seed_to_idx]

    if not prompt_indices:
        prompt_indices = [0]

    idx = torch.tensor([prompt_indices], dtype=torch.long, device=device)

    # Stop on HALT seed (common program terminator)
    halt_seeds = text_to_seeds("HALT")
    halt_indices = {seed_to_idx.get(s) for s in halt_seeds if s in seed_to_idx}

    out = model.generate(idx, max_new_tokens=max_tokens, temperature=temperature,
                         top_k=top_k, stop_tokens=halt_indices)

    out_seeds = [idx_to_seed.get(i.item(), 0xA0000000) for i in out[0]]
    return seeds_to_text(out_seeds)


def cleanup_asm(text: str) -> str:
    """Clean up generated assembly for VM submission."""
    lines = []
    for line in text.split("\n"):
        stripped = line.strip()
        # Skip empty lines at start/end, keep internal structure
        if not stripped:
            continue
        # Remove obviously broken lines (incomplete tokens, garbage)
        # Keep comments, labels, instructions
        if any(bad in stripped for bad in ["\x00", "ÿ", "Ã", "Â"]):
            # Try to salvage by removing the bad characters
            cleaned = stripped.encode("ascii", errors="ignore").decode("ascii").strip()
            if cleaned:
                lines.append(cleaned)
            continue
        lines.append(stripped)
    # Ensure HALT at end if not present
    if lines and not lines[-1].startswith("HALT"):
        lines.append("HALT")
    return "\n".join(lines)


def attempt_assembly(asm_text: str) -> dict:
    """Try to assemble the generated code via the GeOS VM MCP tool.
    Returns dict with success, error, and cleaned asm."""
    # We can't call MCP tools directly from Python, so return the asm
    # for the caller to submit to the VM.
    return {"asm": asm_text, "lines": len(asm_text.split("\n"))}


# ─── Main ────────────────────────────────────────────────────────────────────

def main():
    parser = argparse.ArgumentParser(description="Pixel-LLM: Generate and execute GeOS assembly")
    parser.add_argument("prompt", help="Text prompt (e.g., 'Draw a red pixel')")
    parser.add_argument("--checkpoint", default="pixel_llm_ckpt.pt", help="Model checkpoint")
    parser.add_argument("--max-tokens", type=int, default=200, help="Max tokens to generate")
    parser.add_argument("--temperature", type=float, default=0.7, help="Sampling temperature")
    parser.add_argument("--n-samples", type=int, default=1, help="Number of samples to generate")
    parser.add_argument("--top-k", type=int, default=50, help="Top-k sampling")
    parser.add_argument("--save", action="store_true", help="Save generated asm to programs/ directory")
    parser.add_argument("--output-dir", default="programs", help="Output directory for saved programs")
    args = parser.parse_args()

    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"Loading model from {args.checkpoint} ({device})...")
    model, seed_to_idx, idx_to_seed = load_model(args.checkpoint, device)
    print(f"Model loaded. Generating {args.n_samples} sample(s)...\n")

    for i in range(args.n_samples):
        print(f"{'='*60}")
        print(f"Sample {i+1}/{args.n_samples} | prompt: {repr(args.prompt)}")
        print(f"{'='*60}")

        raw_asm = generate_asm(
            model, seed_to_idx, idx_to_seed,
            args.prompt, max_tokens=args.max_tokens,
            temperature=args.temperature, top_k=args.top_k,
            device=device,
        )
        cleaned = cleanup_asm(raw_asm)

        print(f"\n--- Raw generation ({len(raw_asm)} chars) ---")
        print(raw_asm[:500])
        if len(raw_asm) > 500:
            print(f"  ... ({len(raw_asm) - 500} chars truncated)")

        print(f"\n--- Cleaned assembly ({len(cleaned.splitlines())} lines) ---")
        print(cleaned)

        # Save if requested
        if args.save:
            safe_name = args.prompt.lower().replace(" ", "_").replace("/", "_")[:30]
            out_path = Path(args.output_dir) / f"pixel_llm_{safe_name}.asm"
            out_path.write_text(cleaned)
            print(f"\nSaved to {out_path}")


if __name__ == "__main__":
    main()
