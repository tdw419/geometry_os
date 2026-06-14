#!/usr/bin/env python3
"""
Post-training evaluation script for V16.
Runs the full smoke test with the StructuralConstraintEngine and saves detailed results.
Designed to be triggered after V16 training completes.

Usage:
    python3 pixelflow/v16_post_eval.py [--checkpoint PATH]
"""
import os
import sys
import re
import json
import time
import argparse
from pathlib import Path

sys.path.insert(0, os.path.dirname(__file__))
import torch
from bilingual_tokenizer import BilingualTokenizer
from train_opcode_llm import OpcodeGPT
from isa_constrained_decoder import generate_isa_constrained

DEVICE = "cuda" if torch.cuda.is_available() else "cpu"

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


def validate_syntax(asm_text):
    lines = [l.strip() for l in asm_text.strip().split('\n') if l.strip() and not l.strip().startswith(';')]
    for line in lines:
        if line.endswith(':'): continue
        parts = line.replace(',', ' ').split()
        if not parts: continue
        if parts[0].upper() not in KNOWN_OPS:
            return False, f"Unknown opcode: {parts[0]}"
    if "HALT" not in [l.strip().upper() for l in lines]:
        return False, "No HALT"
    return True, "OK"


def validate_visual(asm_text):
    lines = [l.strip().upper() for l in asm_text.strip().split('\n') if l.strip() and not l.strip().startswith(';')]
    draw_ops = {"RECTF", "CIRCLE", "LINE", "PSET", "FILL"}
    return any(l.split()[0] in draw_ops for l in lines if l.split())


def validate_semantic(asm_text):
    """Check PLAN consistency. Returns (pass, verified, mismatches, detail)."""
    lines = asm_text.strip().split('\n')
    plan_line = None
    code_lines = []
    for line in lines:
        stripped = line.strip()
        if stripped.startswith('; PLAN:'):
            plan_line = stripped
        elif stripped and not stripped.startswith(';'):
            code_lines.append(stripped)

    if not plan_line:
        return True, 0, 0, "No PLAN (auto-pass)"

    plan_regs = {}
    for m in re.finditer(r'(r\d+)=(\S+?)\((\w+?)\)', plan_line):
        plan_regs[m.group(1)] = m.group(2)

    if not plan_regs:
        return True, 0, 0, "PLAN has no register assignments (auto-pass)"

    verified = 0
    mismatches = 0
    mismatch_details = []
    for line in code_lines:
        ldi = re.match(r'LDI\s+(r\d+),\s*(\S+)', line)
        if ldi:
            reg, val = ldi.groups()
            if reg in plan_regs:
                if val.lower() == plan_regs[reg].lower():
                    verified += 1
                else:
                    mismatches += 1
                    mismatch_details.append(f"{reg}: plan={plan_regs[reg]}, code={val}")

    # Same tolerance as train_v2.py eval: 30% mismatches allowed
    passed = plan_regs and mismatches <= len(plan_regs) * 0.3
    detail = f"Verified {verified}/{len(plan_regs)}"
    if mismatch_details:
        detail += f", mismatches: {'; '.join(mismatch_details[:3])}"
    return passed, verified, mismatches, detail


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--checkpoint", default="pixelflow/bilingual_llm_v16_ckpt.pt")
    parser.add_argument("--ema", action="store_true", help="Use EMA checkpoint instead")
    parser.add_argument("--output-dir", default="pixelflow/smoke_v16_results")
    args = parser.parse_args()

    if args.ema:
        args.checkpoint = args.checkpoint.replace(".pt", "_ema.pt")

    output_dir = Path(args.output_dir)
    output_dir.mkdir(exist_ok=True)

    print(f"[*] Device: {DEVICE}")
    print(f"[*] Checkpoint: {args.checkpoint}")

    if not os.path.exists(args.checkpoint):
        print(f"[!] Checkpoint not found: {args.checkpoint}")
        sys.exit(1)

    tokenizer = BilingualTokenizer.load("pixelflow/bilingual_tokenizer_v4")
    checkpoint = torch.load(args.checkpoint, map_location=DEVICE, weights_only=False)

    model_args = checkpoint.get("args", {})
    model = OpcodeGPT(
        vocab_size=model_args.get("vocab_size", 3456),
        n_embd=model_args.get("embd", 384),
        n_head=model_args.get("heads", 8),
        n_layer=model_args.get("layers", 6),
        block_size=model_args.get("context_len", 1024)
    ).to(DEVICE)
    model.load_state_dict(checkpoint["model"])
    model.eval()

    print(f"[*] Model: {model.param_count():,} params")
    print(f"[*] Epoch: {checkpoint.get('epoch', 'N/A')}, Loss: {checkpoint.get('loss', 0):.5f}")
    if 'scores' in checkpoint:
        print(f"[*] Training eval scores: {checkpoint['scores']}")

    syntax_count = visual_count = semantic_count = 0
    report = []
    t0 = time.time()

    with torch.no_grad():
        for i, prompt in enumerate(PROMPTS):
            print(f"\n[{i+1}/10] {prompt[:65]}...")
            result = generate_isa_constrained(model, tokenizer, prompt, DEVICE, max_tokens=200)

            # Save assembly
            asm_file = output_dir / f"test_{i+1}.asm"
            with open(asm_file, "w") as f:
                f.write(result)

            syn_ok, syn_msg = validate_syntax(result)
            vis_ok = validate_visual(result)
            sem_ok, sem_ver, sem_mis, sem_detail = validate_semantic(result)

            if syn_ok: syntax_count += 1
            if vis_ok: visual_count += 1
            if sem_ok: semantic_count += 1

            status = "PASS" if (syn_ok and vis_ok and sem_ok) else "FAIL"
            reasons = []
            if not syn_ok: reasons.append(f"SYNTAX({syn_msg})")
            if not vis_ok: reasons.append("NO_VISUAL")
            if not sem_ok: reasons.append(f"PLAN_MISMATCH({sem_detail})")

            print(f"  {status} | syn={syn_ok} vis={vis_ok} sem={sem_ok} | {sem_detail}")

            report.append({
                "test": i + 1,
                "prompt": prompt,
                "asm": result,
                "syntax": syn_ok,
                "visual": vis_ok,
                "semantic": sem_ok,
                "sem_detail": sem_detail,
                "status": status,
                "reasons": reasons
            })

    elapsed = time.time() - t0
    total = syntax_count + visual_count + semantic_count

    print(f"\n{'='*60}")
    print(f"[*] V16 Post-Training Smoke Test Complete ({elapsed:.1f}s)")
    print(f"    Syntax:  {syntax_count}/10")
    print(f"    Visual:  {visual_count}/10")
    print(f"    Semantic: {semantic_count}/10")
    print(f"    TOTAL:   {total}/30")

    # Save report
    meta = {
        "checkpoint": str(args.checkpoint),
        "epoch": checkpoint.get("epoch", "N/A"),
        "loss": checkpoint.get("loss", 0),
        "training_scores": checkpoint.get("scores", None),
        "metrics": {
            "syntax": syntax_count,
            "visual": visual_count,
            "semantic": semantic_count,
            "total": total
        },
        "results": report,
        "elapsed_seconds": elapsed
    }

    with open(output_dir / "metrics.json", "w") as f:
        json.dump(meta, f, indent=2)

    with open(output_dir / "report.md", "w") as f:
        f.write(f"# V16 Smoke Test Report\n\n")
        f.write(f"Checkpoint: `{args.checkpoint}`\n")
        f.write(f"Epoch: {checkpoint.get('epoch', 'N/A')}, Loss: {checkpoint.get('loss', 0):.5f}\n")
        if 'scores' in checkpoint:
            f.write(f"Training eval: {checkpoint['scores']}\n")
        f.write(f"\n## Scores\n")
        f.write(f"- Syntax: {syntax_count}/10\n")
        f.write(f"- Visual: {visual_count}/10\n")
        f.write(f"- Semantic: {semantic_count}/10\n")
        f.write(f"- **Total: {total}/30**\n\n")
        for r in report:
            icon = "PASS" if r["status"] == "PASS" else "FAIL"
            f.write(f"## Test {r['test']}: {icon}\n")
            f.write(f"Prompt: {r['prompt']}\n")
            f.write(f"Semantic: {r['sem_detail']}\n")
            if r["reasons"]:
                f.write(f"Failures: {', '.join(r['reasons'])}\n")
            f.write(f"```\n{r['asm']}\n```\n\n")

    print(f"[*] Results saved to {output_dir}/")
    print(f"    metrics.json, report.md, test_*.asm")

    # Raise RuntimeError for cron detection
    if total < 28:
        raise RuntimeError(f"V16 smoke test scored {total}/30 (below 28 threshold)")


if __name__ == "__main__":
    main()
