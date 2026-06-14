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
    def generate(self, idx, max_new_tokens, temperature=0.8, top_k=50, stop_tokens=None, constraint_fn=None):
        for _ in range(max_new_tokens):
            idx_cond = idx if idx.size(1) <= self.block_size else idx[:, -self.block_size:]
            logits, _ = self(idx_cond)
            logits = logits[:, -1, :] / temperature
            
            if constraint_fn is not None:
                # Fast path: only check top 200 tokens
                v, top_indices = torch.topk(logits, min(200, logits.size(-1)))
                allowed_mask = constraint_fn(idx, top_indices[0])
                invalid_indices = top_indices[0][~allowed_mask]
                logits[0, invalid_indices] = float('-inf')
                # Zero out anything not in top 200 to be safe
                v_min = v[:, -1].unsqueeze(-1)
                logits[logits < v_min] = float('-inf')

            if top_k is not None:
                v, _ = torch.topk(logits, min(top_k, logits.size(-1)))
                logits[logits < v[:, [-1]]] = float("-inf")
                
            probs = F.softmax(logits, dim=-1)
            # fallback if all probs are zero (e.g. over-constrained)
            if torch.isnan(probs).any() or probs.sum() == 0:
                break
            else:
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


def build_constraint_fn(idx_to_seed):
    arg_counts = {
        "HALT": 0, "FRAME": 0, "RET": 0, "NEG": 0,
        "FILL": 1, "PUSH": 1, "POP": 1, "IKEY": 1, "RAND": 1, "BEEP": 1, "BLINK": 1,
        "TICKS": 1, "PID": 1, "NOTE": 1,
        "ADD": 3, "SUB": 3, "MUL": 3, "DIV": 3, "MOD": 3,
        "AND": 3, "OR": 3, "XOR": 3, "SHL": 3, "SHR": 3, "SAR": 3,
        "MOV": 2, "CMP": 2, "LOAD": 2, "STORE": 2,
        "ADDI": 3, "SUBI": 3, "ANDI": 3, "ORI": 3, "XORI": 3, "SHLI": 3,
        "CMPI": 2, "BLT": 2, "BGE": 2, "BEQ": 2, "BNE": 2,
        "LDI": 2, "PSETI": 3, "WPIXEL": 3, "FG_COLOR": 1,
        "PSET": 3, "SCROLL": 2, "RAM": 2, "BUF": 2,
        "RECTF": 5, "CIRCLE": 4, "LINE": 5,
        "CALL": 1, "JMP": 1, "JZ": 2, "JNZ": 2,
        "TEXT": -1, "DRAWTEXT": -1, "STRO": -1, "SEND_BUF": -1,
        "STR_BUF": -1, "WINSYS": 1, "VM_SPAWN": -1, "LLM": -1, "OS": -1, "PTY": -1,
    }

    token_strs = {}
    for i, s in idx_to_seed.items():
        try:
            token_strs[i] = seeds_to_text([s])
        except:
            token_strs[i] = ""

    def constraint_fn(idx, top_indices):
        out_seeds = [idx_to_seed.get(i.item(), 0xA0000000) for i in idx[0]]
        current_text = seeds_to_text(out_seeds)
        lines = current_text.split('\n')
        last_line = lines[-1]
        
        if ';' in last_line or '"' in last_line or "'" in last_line:
            return torch.ones_like(top_indices, dtype=torch.bool)
            
        parts = last_line.strip().split()
        if not parts:
            return torch.ones_like(top_indices, dtype=torch.bool)
            
        opcode = parts[0].upper()
        if opcode not in arg_counts:
            return torch.ones_like(top_indices, dtype=torch.bool)
            
        expected = arg_counts[opcode]
        if expected < 0:
            return torch.ones_like(top_indices, dtype=torch.bool)
            
        target_commas = max(0, expected - 1)
        mask = torch.ones_like(top_indices, dtype=torch.bool)
        
        for idx_idx, token_idx in enumerate(top_indices):
            tok_str = token_strs.get(token_idx.item(), "")
            if not tok_str:
                continue
                
            new_line = last_line + tok_str
            
            if '\n' in tok_str or ';' in tok_str:
                before_end = new_line.split('\n')[0].split(';')[0]
                operands = [p for p in before_end.replace(',', ' ').split()][1:]
                if len(operands) != expected:
                    mask[idx_idx] = False
                continue
                
            current_commas = new_line.count(',')
            if current_commas > target_commas:
                mask[idx_idx] = False
                continue
                
            operands = [p for p in new_line.replace(',', ' ').split()][1:]
            if len(operands) > expected:
                mask[idx_idx] = False
                
        return mask

    return constraint_fn


def generate_asm(model, seed_to_idx, idx_to_seed, prompt: str,
                 max_tokens=200, temperature=0.7, top_k=50, device="cpu", use_grammar=True) -> str:
    """Generate assembly text from a prompt."""
    prompt_seeds = text_to_seeds(prompt)
    prompt_indices = [seed_to_idx.get(s, 0) for s in prompt_seeds if s in seed_to_idx]

    if not prompt_indices:
        prompt_indices = [0]

    idx = torch.tensor([prompt_indices], dtype=torch.long, device=device)

    # Stop on HALT seed (common program terminator)
    halt_seeds = text_to_seeds("HALT")
    halt_indices = {seed_to_idx.get(s) for s in halt_seeds if s in seed_to_idx}

    constraint_fn = build_constraint_fn(idx_to_seed) if use_grammar else None

    out = model.generate(idx, max_new_tokens=max_tokens, temperature=temperature,
                         top_k=top_k, stop_tokens=halt_indices, constraint_fn=constraint_fn)

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


def validate_asm(text: str) -> tuple[bool, str]:
    """Syntax validation for GeOS assembly. Checks opcodes, registers, and operand counts."""
    # Full opcode set from actual corpus
    valid_opcodes = {
        # 0-arg
        "HALT", "FRAME", "RET", "NEG",
        # 1-arg
        "FILL", "PUSH", "POP", "IKEY", "RAND", "BEEP", "BLINK", "TICKS", "PID", "NOTE",
        # 2-arg (reg, reg)
        "ADD", "SUB", "MUL", "DIV", "MOD",
        "AND", "OR", "XOR", "SHL", "SHR", "SAR",
        "MOV", "CMP", "LOAD", "STORE",
        "ADDI", "SUBI", "ANDI", "ORI", "XORI", "SHLI",
        "CMPI", "BLT", "BGE", "BEQ", "BNE",
        "LDI", "PSETI", "WPIXEL", "FG_COLOR",
        # 3-arg
        "PSET", "SCROLL", "RAM", "BUF", "RECTF", "CIRCLE", "LINE",
        # Special (labels, strings)
        "CALL", "JMP", "JZ", "JNZ", "TEXT", "DRAWTEXT", "STRO", "SEND_BUF",
        "STR_BUF", "WINSYS", "VM_SPAWN", "LLM", "OS", "PTY",
    }
    # Expected operand counts (excluding the opcode itself)
    # -1 = variable (labels, strings), 0 = no args
    arg_counts = {
        "HALT": 0, "FRAME": 0, "RET": 0, "NEG": 0,
        "FILL": 1, "PUSH": 1, "POP": 1, "IKEY": 1, "RAND": 1, "BEEP": 1, "BLINK": 1,
        "TICKS": 1, "PID": 1, "NOTE": 1,
        "ADD": 3, "SUB": 3, "MUL": 3, "DIV": 3, "MOD": 3,
        "AND": 3, "OR": 3, "XOR": 3, "SHL": 3, "SHR": 3, "SAR": 3,
        "MOV": 2, "CMP": 2, "LOAD": 2, "STORE": 2,
        "ADDI": 3, "SUBI": 3, "ANDI": 3, "ORI": 3, "XORI": 3, "SHLI": 3,
        "CMPI": 2, "BLT": 2, "BGE": 2, "BEQ": 2, "BNE": 2,
        "LDI": 2, "PSETI": 3, "WPIXEL": 3, "FG_COLOR": 1,
        "PSET": 3, "SCROLL": 2, "RAM": 2, "BUF": 2,
        "RECTF": 5, "CIRCLE": 4, "LINE": 5,
        "CALL": 1, "JMP": 1, "JZ": 2, "JNZ": 2,
        "TEXT": -1, "DRAWTEXT": -1, "STRO": -1, "SEND_BUF": -1,
        "STR_BUF": -1, "WINSYS": 1, "VM_SPAWN": -1, "LLM": -1, "OS": -1, "PTY": -1,
    }

    lines = text.split("\n")
    for i, raw_line in enumerate(lines):
        line = raw_line.split(";")[0].strip()  # Remove comments
        if not line or line.endswith(":"):
            continue

        # Split on commas and spaces to get operands
        parts = [p.strip().rstrip(",") for p in line.replace(",", " ").split()]
        if not parts:
            continue

        opcode = parts[0].upper()
        operands = parts[1:]

        if opcode not in valid_opcodes:
            return False, f"Line {i+1}: Unknown opcode '{opcode}'"

        # Check operand count
        expected = arg_counts.get(opcode, -1)
        if expected >= 0 and len(operands) != expected:
            return False, f"Line {i+1}: {opcode} expects {expected} args, got {len(operands)}"

        # Check registers
        for p in operands:
            # Skip string literals and labels
            if p.startswith('"') or p.startswith("'"):
                continue
            if p.startswith("r") and len(p) > 1:
                try:
                    reg_num = int(p[1:])
                    if not (0 <= reg_num <= 31):
                        return False, f"Line {i+1}: Invalid register '{p}'"
                except ValueError:
                    pass  # Likely a label

    return True, "OK"


def generate_with_retry(model, seed_to_idx, idx_to_seed, prompt: str,
                        max_tokens=200, temperature=0.7, top_k=50, device="cpu", retries=3) -> str:
    """Generate assembly with a feedback loop."""
    best_asm = ""
    for attempt in range(retries):
        raw_asm = generate_asm(
            model, seed_to_idx, idx_to_seed,
            prompt, max_tokens=max_tokens,
            temperature=temperature, top_k=top_k,
            device=device,
        )
        cleaned = cleanup_asm(raw_asm)
        is_valid, msg = validate_asm(cleaned)
        
        if is_valid:
            print(f"  [Attempt {attempt+1}] Validated successfully.")
            return cleaned
        else:
            print(f"  [Attempt {attempt+1}] Validation failed: {msg}")
            if not best_asm or len(cleaned) > len(best_asm):
                best_asm = cleaned
                
    print(f"  Maximum retries reached. Returning best effort.")
    return best_asm


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
    parser.add_argument("--retries", type=int, default=3, help="Number of retries for validation")
    args = parser.parse_args()

    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"Loading model from {args.checkpoint} ({device})...")
    model, seed_to_idx, idx_to_seed = load_model(args.checkpoint, device)
    print(f"Model loaded. Generating {args.n_samples} sample(s)...\n")

    for i in range(args.n_samples):
        print(f"{'='*60}")
        print(f"Sample {i+1}/{args.n_samples} | prompt: {repr(args.prompt)}")
        print(f"{'='*60}")

        cleaned = generate_with_retry(
            model, seed_to_idx, idx_to_seed,
            args.prompt, max_tokens=args.max_tokens,
            temperature=args.temperature, top_k=args.top_k,
            device=device, retries=args.retries
        )

        print(f"\n--- Resulting assembly ({len(cleaned.splitlines())} lines) ---")
        print(cleaned)

        # Save if requested
        if args.save:
            safe_name = args.prompt.lower().replace(" ", "_").replace("/", "_")[:30]
            out_path = Path(args.output_dir) / f"pixel_llm_{safe_name}.asm"
            out_path.write_text(cleaned)
            print(f"\nSaved to {out_path}")


if __name__ == "__main__":
    main()
