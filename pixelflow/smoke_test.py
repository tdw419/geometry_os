#!/usr/bin/env python3
"""
PixelGPT V13 Smoke Test -- Visual + Semantic Validation.

Tests:
1. Syntax: Does the VM accept the code without errors?
2. Visual: Does the generated code contain drawing opcodes?
3. Semantic: Does the generated code match its own PLAN?
"""

import os
import sys
import re
import argparse
from pathlib import Path
import torch

sys.path.insert(0, os.path.dirname(__file__))
from bilingual_tokenizer import BilingualTokenizer
from train_opcode_llm import OpcodeGPT
from isa_constrained_decoder import generate_isa_constrained

DEVICE = "cuda" if torch.cuda.is_available() else "cpu"

PROMPTS = [
    ("; DESCRIPTION: Draws a red circle at the center of the screen (128, 128) with radius 50.", ["CIRCLE"]),
    ("; DESCRIPTION: Fills the entire 256x256 screen with solid blue color (0x0000FF).", ["FILL"]),
    ("; DESCRIPTION: Draws a green rectangle of size 64x64 at the top-left corner (0, 0).", ["RECTF"]),
    ("; DESCRIPTION: Draws a white diagonal line from the top-left (0, 0) to the bottom-right (255, 255).", ["LINE"]),
    ("; DESCRIPTION: Clears the screen to black and then halts.", ["FILL"]),
    ("; DESCRIPTION: Draws a yellow square at (100, 100) with side length 40.", ["RECTF"]),
    ("; DESCRIPTION: A simple program that loads 10 into r1 and decrements it in a loop until it reaches 0.", ["SUB", "JNZ"]),
    ("; DESCRIPTION: Draws a checkerboard pattern of 8x8 squares using black and white.", ["RECTF"]),
    ("; DESCRIPTION: Draws a horizontal red line across the middle of the screen.", ["LINE"]),
    ("; DESCRIPTION: Fills the screen with a vertical gradient from black to white.", ["PSET", "BLT"]),
]


def validate_syntax(asm_text):
    """Check structural validity of the generated assembly."""
    lines = [l.strip() for l in asm_text.strip().split('\n') if l.strip() and not l.strip().startswith(';')]
    
    # Check for obvious errors
    for line in lines:
        # Ignore labels
        if line.endswith(':'): continue
        
        parts = line.replace(',', ' ').split()
        if not parts: continue
        
        opcode = parts[0].upper()
        # Check for known opcodes
        known_ops = {"LDI", "LD", "STORE", "ADD", "SUB", "MUL", "DIV", "AND", "OR", "XOR",
                     "RECTF", "CIRCLE", "LINE", "PSET", "FILL", "JMP", "JZ", "JNZ", "BLT", "BGE",
                     "HALT", "FRAME", "CALL", "RET", "PUSH", "POP", "CMP", "NEG", "RAND"}
        if opcode not in known_ops:
            return False, f"Unknown opcode: {opcode}"
    
    # Check if HALT exists
    if "HALT" not in [l.strip().upper() for l in lines]:
        return False, "No HALT instruction"
    
    return True, "Syntax OK"


def validate_visual(asm_text):
    """Infer visual output from presence of drawing opcodes."""
    lines = [l.strip().upper() for l in asm_text.strip().split('\n') 
             if l.strip() and not l.strip().startswith(';')]
    draw_ops = {"RECTF", "CIRCLE", "LINE", "PSET", "FILL"}
    has_draw = any(l.split()[0] in draw_ops for l in lines if l.split())
    
    # Special case: FILL 0x000000 (black) is correct but invisible on black screen
    # We consider it 'visually valid' as it's a valid drawing command
    return has_draw


def validate_plan_consistency(asm_text):
    """
    Check if the generated assembly code is consistent with its PLAN comment.
    Returns (consistent: bool, details: str).
    """
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
        return True, "No PLAN (V10 style, skip semantic check)"

    # Extract register assignments from PLAN
    # Format: r0=128(x)
    plan_reg_assignments = {}
    reg_pattern = re.compile(r'(r\d+)=(\S+?)\((\w+?)\)')
    for match in reg_pattern.finditer(plan_line):
        reg, value, meaning = match.groups()
        plan_reg_assignments[reg] = (value, meaning)

    if not plan_reg_assignments:
        return True, "PLAN has no register assignments"

    # Verify code loads match PLAN
    mismatches = []
    verified = 0

    for line in code_lines:
        ldi_match = re.match(r'LDI\s+(r\d+),\s*(\S+)', line)
        if ldi_match:
            reg, value = ldi_match.groups()
            if reg in plan_reg_assignments:
                expected_val, meaning = plan_reg_assignments[reg]
                # Normalize hex (lowercase vs uppercase)
                if value.lower() == expected_val.lower():
                    verified += 1
                else:
                    mismatches.append(f"{reg}: PLAN says {expected_val}({meaning}), code says {value}")

    consistent = len(mismatches) == 0
    detail = f"Verified {verified}/{len(plan_reg_assignments)} register assignments"
    if mismatches:
        detail += f". Mismatches: {'; '.join(mismatches[:3])}"
    return consistent, detail


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--checkpoint", default="pixelflow/bilingual_llm_v12_ckpt.pt")
    parser.add_argument("--tokenizer", default="pixelflow/bilingual_tokenizer_v4")
    parser.add_argument("--output-dir", default="pixelflow/smoke_results")
    args = parser.parse_args()

    checkpoint_path = args.checkpoint
    tokenizer_path = args.tokenizer
    output_dir = Path(args.output_dir)
    output_dir.mkdir(exist_ok=True)

    print(f"[*] Device: {DEVICE}")
    tokenizer = BilingualTokenizer.load(tokenizer_path)
    
    if not os.path.exists(checkpoint_path):
        print(f"[!] Checkpoint {checkpoint_path} not found.")
        return

    checkpoint = torch.load(checkpoint_path, map_location=DEVICE, weights_only=False)
    
    # Use saved args if available, else defaults
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
    print(f"[*] Model loaded: {model.param_count():,} parameters")
    print(f"[*] Epoch: {checkpoint.get('epoch', 'N/A')}, Loss: {checkpoint.get('loss', 0):.4f}")

    report = []
    syntax_count = 0
    visual_count = 0
    plan_count = 0

    for i, (prompt, keywords) in enumerate(PROMPTS):
        print(f"\n[Test {i+1}/10] {prompt}")
        generated = generate_isa_constrained(model, tokenizer, prompt, DEVICE, max_tokens=150)

        asm_file = output_dir / f"test_{i+1}.asm"
        with open(asm_file, "w") as f:
            f.write(generated)

        # 1. Syntax validation
        syntax_ok, syntax_msg = validate_syntax(generated)

        # 2. Visual check
        visual_ok = validate_visual(generated)
        
        # 3. Semantic (PLAN consistency)
        plan_ok, plan_detail = validate_plan_consistency(generated)

        status = "PASSED" if (syntax_ok and visual_ok and plan_ok) else "FAILED"
        reasons = []
        if not syntax_ok: reasons.append(f"SYNTAX ({syntax_msg})")
        if not visual_ok: reasons.append("NO VISUAL OP")
        if not plan_ok: reasons.append("PLAN MISMATCH")
        
        if syntax_ok: syntax_count += 1
        if visual_ok: visual_count += 1
        if plan_ok: plan_count += 1

        print(f"  Result: {status} ({', '.join(reasons) if reasons else 'None'})")
        print(f"  Plan: {'OK' if plan_ok else 'MISMATCH'} -- {plan_detail}")

        report.append({
            "prompt": prompt,
            "asm": generated,
            "status": status,
            "syntax_ok": syntax_ok,
            "visual_ok": visual_ok,
            "plan_ok": plan_ok,
            "plan_detail": plan_detail,
            "success": status == "PASSED",
            "reasons": ", ".join(reasons) if reasons else "None"
        })

    print(f"\n{'='*60}")
    print(f"[*] Smoke test complete.")
    print(f"    Syntax:  {syntax_count}/10")
    print(f"    Visual:  {visual_count}/10")
    print(f"    Semantic: {plan_count}/10")

    # Save report
    with open(output_dir / "report.md", "w") as f:
        f.write("# PixelGPT Smoke Test Report\n\n")
        f.write(f"Checkpoint: {checkpoint_path}\n")
        f.write(f"Epoch: {checkpoint.get('epoch', 'N/A')}, Loss: {checkpoint.get('loss', 0):.4f}\n\n")
        f.write(f"## Summary\n")
        f.write(f"- Syntax: {syntax_count}/10\n")
        f.write(f"- Visual: {visual_count}/10\n")
        f.write(f"- PLAN Consistency: {plan_count}/10\n\n")
        for i, item in enumerate(report):
            icon = "✅" if item["success"] else "❌"
            f.write(f"## {i+1}. {item['prompt']}\n")
            f.write(f"Status: {icon} ({item['status']})\n")
            f.write(f"PLAN: {'✅' if item['plan_ok'] else '❌'} {item['plan_detail']}\n\n")
            f.write("### Generated Assembly:\n```\n")
            f.write(item["asm"])
            f.write("\n```\n\n")

    print(f"    Report saved to {output_dir / 'report.md'}")

    # Meta-loop JSON output
    import json
    meta_report = {
        "checkpoint": str(checkpoint_path),
        "epoch": checkpoint.get("epoch", "N/A"),
        "loss": checkpoint.get("loss", 0),
        "metrics": {
            "syntax": syntax_count,
            "visual": visual_count,
            "semantic": plan_count,
            "total": 10
        },
        "results": report
    }
    with open(output_dir / "metrics.json", "w") as f:
        json.dump(meta_report, f, indent=4)
    print(f"    Metrics saved to {output_dir / 'metrics.json'}")


if __name__ == "__main__":
    main()
