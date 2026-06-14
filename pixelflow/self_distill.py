#!/usr/bin/env python3
"""
PixelGPT Self-Distillation Pipeline.

Uses a trained model to generate programs, validates them, and saves
valid programs as .asm files for mixing into future training datasets.

Recursive self-improvement loop:
  V13 -> generate 10K programs -> validate -> keep ~9K -> mix into dataset -> train V14
  V14 -> generate 10K programs -> validate -> keep ~9.5K -> mix -> train V15
  ...

Each iteration, the model generates better data because it learned from
its own high-quality outputs. The validation filter ensures only
syntactically correct, semantically consistent programs enter the pool.
"""

import os
import sys
import re
import random
import argparse
import time
from pathlib import Path

sys.path.insert(0, os.path.dirname(__file__))

import torch
from bilingual_tokenizer import BilingualTokenizer
from train_opcode_llm import OpcodeGPT
from isa_constrained_decoder import generate_isa_constrained


# ─── Prompt Templates ────────────────────────────────────────────────────────
# Diverse prompts covering all GeOS capability categories.
# Each has a (template_string, category) tuple.

COLORS = ["red", "green", "blue", "white", "yellow", "cyan", "magenta", "orange", "purple"]

PROMPT_TEMPLATES = [
    # ── RECTF ──
    ("; DESCRIPTION: Draws a {color} rectangle at ({x}, {y}) with width {w} and height {h}.", "rectf"),
    ("; DESCRIPTION: Places a {color} {w}x{h} box at position ({x}, {y}).", "rectf"),
    ("; DESCRIPTION: Renders a {color} rectangular region spanning {w} by {h} at ({x}, {y}).", "rectf"),
    ("; DESCRIPTION: Creates a {color} filled rectangle of size {w}x{h} starting at ({x}, {y}).", "rectf"),

    # ── CIRCLE ──
    ("; DESCRIPTION: Draws a {color} circle centered at ({x}, {y}) with radius {r}.", "circle"),
    ("; DESCRIPTION: Places a {color} disk with center ({x}, {y}) and radius {r}.", "circle"),
    ("; DESCRIPTION: Renders a {color} circular shape at ({x}, {y}) with radius {r}.", "circle"),

    # ── FILL ──
    ("; DESCRIPTION: Fills the entire screen with solid {color}.", "fill"),
    ("; DESCRIPTION: Clears the screen to {color}.", "fill"),
    ("; DESCRIPTION: Sets the background to {color}.", "fill"),
    ("; DESCRIPTION: Paints the whole screen {color}.", "fill"),

    # ── LINE ──
    ("; DESCRIPTION: Draws a {color} line from ({x1}, {y1}) to ({x2}, {y2}).", "line"),
    ("; DESCRIPTION: Renders a {color} line segment connecting ({x1}, {y1}) to ({x2}, {y2}).", "line"),
    ("; DESCRIPTION: Draws a {color} horizontal line across the screen at y={y}.", "line"),
    ("; DESCRIPTION: Draws a {color} vertical line down the screen at x={x}.", "line"),

    # ── PSET ──
    ("; DESCRIPTION: Sets a single {color} pixel at ({x}, {y}).", "pset"),
    ("; DESCRIPTION: Places a {color} dot at position ({x}, {y}).", "pset"),

    # ── LOOP ──
    ("; DESCRIPTION: Loads {count} into r1 and decrements it in a loop until zero.", "loop"),
    ("; DESCRIPTION: Counts from {count} down to 0 using a decrement loop.", "loop"),
    ("; DESCRIPTION: Runs a simple loop {count} times, decrementing a counter each iteration.", "loop"),

    # ── GRADIENT ──
    ("; DESCRIPTION: Fills the screen with a vertical {color} gradient from dark to bright.", "gradient"),
    ("; DESCRIPTION: Creates a vertical {color} gradient from black to {color}.", "gradient"),
    ("; DESCRIPTION: Draws a horizontal {color} gradient across the screen.", "gradient"),

    # ── MULTI ──
    ("; DESCRIPTION: Draws a {c1} rectangle at (50, 50) with size 80x60 then a {c2} circle at (200, 100) with radius 40.", "multi"),
    ("; DESCRIPTION: Fills the screen with {c1} then draws a {c2} rectangle at (100, 80) with size 100x50.", "multi"),
    ("; DESCRIPTION: Draws a {c1} circle at (128, 128) with radius 60 then a {c2} line from (0, 0) to (255, 255).", "multi"),
    ("; DESCRIPTION: Draws a {c1} rectangle at (30, 30) with size 90x70 then a {c2} line from (0, 255) to (255, 0).", "multi"),

    # ── COMPLEX (novel combinations not in training data) ──
    ("; DESCRIPTION: Draws a {color} border around the entire screen (a rectangle from 0,0 to 511,255).", "complex"),
    ("; DESCRIPTION: Places 4 {color} circles at the corners of the screen.", "complex"),
    ("; DESCRIPTION: Draws a {color} cross in the center of the screen (horizontal + vertical lines).", "complex"),
    ("; DESCRIPTION: Creates a {color} diamond shape using 4 lines meeting at the center.", "complex"),
    ("; DESCRIPTION: Draws concentric {color} circles at the center with radii 20, 40, 60.", "complex"),
]

SCREEN_W = 512
SCREEN_H = 256


def fill_prompt(template):
    """Fill a prompt template with random values."""
    kwargs = {
        "color": random.choice(COLORS),
        "c1": random.choice(COLORS),
        "c2": random.choice(COLORS),
        "x": random.randint(0, 400),
        "y": random.randint(0, 200),
        "x1": random.randint(0, 400),
        "y1": random.randint(0, 200),
        "x2": random.randint(0, 400),
        "y2": random.randint(0, 200),
        "w": random.randint(10, 120),
        "h": random.randint(10, 120),
        "r": random.randint(10, 80),
        "count": random.randint(5, 50),
    }
    return template.format(**kwargs)


# ─── Validation ──────────────────────────────────────────────────────────────

KNOWN_OPS = {
    "LDI", "LD", "STORE", "ADD", "SUB", "MUL", "DIV", "AND", "OR", "XOR",
    "RECTF", "CIRCLE", "LINE", "PSET", "FILL", "JMP", "JZ", "JNZ", "BLT", "BGE",
    "HALT", "FRAME", "CALL", "RET", "PUSH", "POP", "CMP", "NEG", "RAND"
}

def validate_program(asm_text):
    """
    Validate a generated GeOS program.
    Returns (valid: bool, category: str, reason: str).
    """
    lines = [l.strip() for l in asm_text.strip().split('\n') if l.strip()]

    # Must have at least a DESCRIPTION and some code
    has_desc = any(l.startswith('; DESCRIPTION:') for l in lines)
    code_lines = [l for l in lines if l and not l.startswith(';')]
    if not has_desc or len(code_lines) < 2:
        return False, "empty", "Missing description or too few code lines"

    # Check syntax: all opcodes must be known
    for line in code_lines:
        # Skip labels (ending with colon)
        if line.endswith(':'):
            continue
        parts = line.replace(',', ' ').split()
        if not parts:
            continue
        opcode = parts[0].upper()
        if opcode not in KNOWN_OPS:
            return False, "syntax", f"Unknown opcode: {opcode}"

    # Must have HALT
    if "HALT" not in [l.strip().upper() for l in code_lines]:
        return False, "syntax", "No HALT instruction"

    # Must have at least one drawing opcode or be a loop program
    draw_ops = {"RECTF", "CIRCLE", "LINE", "PSET", "FILL"}
    has_draw = any(l.split()[0].upper() in draw_ops for l in code_lines if l.split())
    has_loop = any(l.split()[0].upper() in {"JMP", "JZ", "JNZ", "BLT", "BGE"} for l in code_lines if l.split())

    if not has_draw and not has_loop:
        return False, "trivial", "No drawing ops or loops"

    # Check for PLAN consistency if PLAN exists
    plan_line = None
    for line in lines:
        if line.strip().startswith('; PLAN:'):
            plan_line = line.strip()
            break

    if plan_line:
        plan_regs = {}
        reg_pattern = re.compile(r'(r\d+)=(\S+?)\((\w+?)\)')
        for match in reg_pattern.finditer(plan_line):
            reg, value, meaning = match.groups()
            plan_regs[reg] = (value, meaning)

        if plan_regs:
            verified = 0
            mismatches = 0
            for line in code_lines:
                ldi_match = re.match(r'LDI\s+(r\d+),\s*(\S+)', line)
                if ldi_match:
                    reg, value = ldi_match.groups()
                    if reg in plan_regs:
                        expected_val = plan_regs[reg][0]
                        if value.lower() == expected_val.lower():
                            verified += 1
                        else:
                            mismatches += 1

            # Require at least 85% of PLAN registers verified (was 50%)
            if plan_regs and mismatches > len(plan_regs) * 0.15:
                return False, "semantic", f"PLAN mismatch: {mismatches}/{len(plan_regs)} incorrect"

    # Classify the program
    if has_draw and has_loop:
        category = "gradient" if "PSET" in " ".join(code_lines) else "complex"
    elif has_loop:
        category = "loop"
    elif any("RECTF" in l for l in code_lines):
        category = "rectf"
    elif any("CIRCLE" in l for l in code_lines):
        category = "circle"
    elif any("LINE" in l for l in code_lines):
        category = "line"
    elif any("FILL" in l for l in code_lines):
        category = "fill"
    elif any("PSET" in l for l in code_lines):
        category = "pset"
    else:
        category = "other"

    return True, category, "OK"


# ─── Self-Distillation ───────────────────────────────────────────────────────

def self_distill(checkpoint_path, tokenizer_path, output_dir, num_samples=10000,
                 temperature=0.7, top_k=40, max_tokens=200,
                 hard_bias_categories=None, hard_bias_weight=3.0):
    """Generate programs from a checkpoint and save valid ones.

    Args:
        hard_bias_categories: list of categories to oversample (e.g. ["gradient", "loop"])
        hard_bias_weight: multiplier for oversampled categories
    """

    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"[*] Device: {device}")

    # Load tokenizer and model
    print(f"[*] Loading tokenizer from {tokenizer_path}...")
    tokenizer = BilingualTokenizer.load(tokenizer_path)

    print(f"[*] Loading checkpoint from {checkpoint_path}...")
    ckpt = torch.load(checkpoint_path, map_location=device, weights_only=False)

    model = OpcodeGPT(
        vocab_size=ckpt['args']['vocab_size'],
        n_embd=ckpt['args']['embd'],
        n_head=ckpt['args']['heads'],
        n_layer=ckpt['args']['layers'],
        block_size=ckpt['args']['context_len'],
        dropout=0.1,
    ).to(device)
    model.load_state_dict(ckpt['model'])
    model.eval()

    epoch = ckpt.get('epoch', '?')
    loss = ckpt.get('loss', 0)
    print(f"[*] Model: Epoch {epoch}, Loss {loss:.4f}, {model.param_count():,} params")

    # Setup output directory
    out_path = Path(output_dir)
    out_path.mkdir(parents=True, exist_ok=True)

    # Stats
    stats = {"total": 0, "valid": 0, "categories": {}}
    rejected = {"syntax": 0, "semantic": 0, "trivial": 0, "empty": 0}

    print(f"\n[*] Generating {num_samples} programs...")
    if hard_bias_categories:
        print(f"[*] Hard example mining: {hard_bias_categories} (weight={hard_bias_weight}x)")
    print(f"[*] Valid programs will be saved to {out_path}/")
    t0 = time.time()

    # Build weighted prompt pool with hard bias
    prompt_pool = []
    for template, cat in PROMPT_TEMPLATES:
        weight = hard_bias_weight if hard_bias_categories and cat in hard_bias_categories else 1.0
        prompt_pool.extend([(template, cat)] * int(weight * 10))

    for i in range(num_samples):
        # Pick from weighted pool
        template, default_cat = random.choice(prompt_pool)
        prompt = fill_prompt(template)

        # Generate
        with torch.no_grad():
            result = generate_isa_constrained(
                model, tokenizer, prompt, device,
                max_tokens=max_tokens, temperature=temperature, top_k=top_k
            )

        stats["total"] += 1
        valid, category, reason = validate_program(result)

        if valid:
            # Save the valid program
            file_path = out_path / f"selfdist_{i:05d}.asm"
            file_path.write_text(result + "\n")
            stats["valid"] += 1
            stats["categories"][category] = stats["categories"].get(category, 0) + 1
        else:
            rejected[reason] = rejected.get(reason, 0) + 1

        # Progress
        if (i + 1) % 500 == 0:
            elapsed = time.time() - t0
            rate = (i + 1) / elapsed
            accept_rate = stats["valid"] / stats["total"] * 100
            eta = (num_samples - i - 1) / rate
            print(f"  [{i+1}/{num_samples}]  "
                  f"Valid: {stats['valid']}/{stats['total']} ({accept_rate:.1f}%)  "
                  f"Rate: {rate:.1f}/s  ETA: {eta/60:.1f}m")

    elapsed = time.time() - t0
    accept_rate = stats["valid"] / stats["total"] * 100

    print(f"\n{'='*50}")
    print(f"[*] Self-Distillation Complete")
    print(f"    Generated:  {stats['total']}")
    print(f"    Valid:      {stats['valid']} ({accept_rate:.1f}%)")
    print(f"    Rejected:   {stats['total'] - stats['valid']}")
    print(f"    Time:       {elapsed:.1f}s ({stats['total']/elapsed:.1f} programs/s)")
    print(f"    Output:     {out_path}/")
    print(f"\n[*] Category Distribution:")
    for cat, count in sorted(stats["categories"].items(), key=lambda x: -x[1]):
        print(f"    {cat:12}: {count:5} ({count/stats['valid']*100:.1f}%)")
    print(f"\n[*] Rejection Reasons:")
    for reason, count in sorted(rejected.items(), key=lambda x: -x[1]):
        if count > 0:
            print(f"    {reason:12}: {count:5}")

    # Save stats
    stats["rejected"] = rejected
    stats["accept_rate"] = accept_rate
    stats["source_checkpoint"] = str(checkpoint_path)
    stats["epoch"] = epoch
    stats_path = out_path / "distill_stats.json"
    import json
    with open(stats_path, "w") as f:
        json.dump(stats, f, indent=2)
    print(f"[*] Stats saved to {stats_path}")

    return stats["valid"]


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="PixelGPT Self-Distillation")
    parser.add_argument("--checkpoint", default="bilingual_llm_v13_ckpt.pt",
                        help="Path to model checkpoint")
    parser.add_argument("--tokenizer", default="bilingual_tokenizer_v4",
                        help="Path to tokenizer")
    parser.add_argument("--output-dir", default="self_distilled_v13",
                        help="Output directory for valid programs")
    parser.add_argument("--num-samples", type=int, default=10000,
                        help="Number of programs to generate")
    parser.add_argument("--temperature", type=float, default=0.7,
                        help="Generation temperature")
    parser.add_argument("--top-k", type=int, default=40,
                        help="Top-k sampling")
    parser.add_argument("--max-tokens", type=int, default=200,
                        help="Max tokens per generation")
    parser.add_argument("--hard-bias", nargs="+", default=None,
                        help="Categories to oversample (e.g. gradient loop multi)")
    parser.add_argument("--hard-bias-weight", type=float, default=3.0,
                        help="Weight multiplier for hard categories")
    args = parser.parse_args()

    self_distill(
        args.checkpoint, args.tokenizer, args.output_dir,
        num_samples=args.num_samples,
        temperature=args.temperature,
        top_k=args.top_k,
        max_tokens=args.max_tokens,
        hard_bias_categories=args.hard_bias,
        hard_bias_weight=args.hard_bias_weight,
    )
