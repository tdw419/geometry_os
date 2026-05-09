#!/usr/bin/env python3
"""
PixelGPT V11 Smoke Test -- Visual + Semantic Validation.

Tests:
1. Syntax: Does the VM accept the code without errors?
2. Visual: Does the framebuffer change from black?
3. Semantic (new): Does the generated code match its own PLAN?
"""

import os
import sys
import re
import subprocess
from pathlib import Path

sys.path.insert(0, os.path.dirname(__file__))
from bilingual_tokenizer import BilingualTokenizer
from train_opcode_llm import OpcodeGPT
from isa_constrained_decoder import generate_isa_constrained

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


def run_vm(asm_file, ppm_file):
    """Run GeOS VM and capture output."""
    vm_path = os.path.expanduser("~/zion/projects/geometry_os/geometry_os/target/release/geometry_os")
    if not os.path.exists(vm_path):
        vm_path = "geometry_os"  # fallback to PATH
    try:
        result = subprocess.run(
            [vm_path, "--asm", str(asm_file), "--ppm", str(ppm_file)],
            capture_output=True, timeout=10
        )
        return result.stdout.decode(), result.stderr.decode()
    except (subprocess.TimeoutExpired, FileNotFoundError):
        return "", "VM not found or timed out"


def check_visual(ppm_file):
    """Check if PPM framebuffer has non-black pixels."""
    try:
        with open(ppm_file, "rb") as f:
            data = f.read()
        # Find end of PPM header (after third newline)
        header_end = 0
        newlines = 0
        for i, b in enumerate(data):
            if b == ord('\n'):
                newlines += 1
                if newlines == 3:
                    header_end = i + 1
                    break
        pixels = data[header_end:]
        total_pixels = len(pixels) // 3
        non_black = sum(1 for j in range(0, len(pixels), 3)
                       if pixels[j:j+3] != b'\x00\x00\x00')
        return non_black > 0, non_black / max(total_pixels, 1)
    except Exception:
        return False, 0.0


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
        elif stripped and not stripped.startswith('; DESCRIPTION:') and not stripped.startswith('; PLAN:'):
            code_lines.append(stripped)

    if not plan_line:
        return True, "No PLAN (V10 style, skip semantic check)"

    # Extract register assignments from PLAN
    # Format: r0=128(x), r1=128(y), ...
    plan_reg_assignments = {}
    reg_pattern = re.compile(r'(r\d+)=(\S+?)\((\w+?)\)')
    for match in reg_pattern.finditer(plan_line):
        reg, value, meaning = match.groups()
        plan_reg_assignments[reg] = (value, meaning)

    # Extract planned operations
    ops_pattern = re.compile(r'Op:\s*(.+?)\.')
    ops_match = ops_pattern.search(plan_line)
    planned_ops = ops_match.group(1).strip() if ops_match else ""

    if not plan_reg_assignments:
        return True, "PLAN has no register assignments"

    # Verify code loads match PLAN
    mismatches = []
    verified = 0

    for line in code_lines:
        # Check LDI statements: LDI r0, <value>
        ldi_match = re.match(r'LDI\s+(r\d+),\s*(\S+)', line)
        if ldi_match:
            reg, value = ldi_match.groups()
            if reg in plan_reg_assignments:
                expected_val, meaning = plan_reg_assignments[reg]
                if value == expected_val:
                    verified += 1
                else:
                    mismatches.append(f"{reg}: PLAN says {expected_val}({meaning}), code says {value}")

    # Verify planned opcode appears in code
    if planned_ops:
        opcode_match = re.match(r'(\w+)\s+', planned_ops)
        if opcode_match:
            planned_opcode = opcode_match.group(1)
            has_opcode = any(line.startswith(planned_opcode) for line in code_lines)
            if not has_opcode:
                mismatches.append(f"PLAN says Op:{planned_opcode} but code doesn't contain it")

    consistent = len(mismatches) == 0
    detail = f"Verified {verified}/{len(plan_reg_assignments)} register assignments"
    if mismatches:
        detail += f". Mismatches: {'; '.join(mismatches[:3])}"
    return consistent, detail


def main():
    checkpoint_path = "pixelflow/bilingual_llm_v10_ckpt.pt"
    tokenizer_path = "pixelflow/bilingual_tokenizer_v4"

    output_dir = Path("pixelflow/smoke_results")
    output_dir.mkdir(exist_ok=True)

    device = "cuda"
    print(f"[*] Device: {device}")

    tokenizer = BilingualTokenizer.load(tokenizer_path)
    if not os.path.exists(checkpoint_path):
        print(f"[!] Checkpoint {checkpoint_path} not found.")
        return

    checkpoint = torch.load(checkpoint_path, map_location=device, weights_only=False)

    # Model V10 config
    model = OpcodeGPT(
        vocab_size=3456,
        n_embd=384,
        n_head=8,
        n_layer=6,
        block_size=1024
    ).to(device)

    model.load_state_dict(checkpoint["model"])
    model.eval()
    print(f"[*] Model loaded: {model.param_count():,} parameters")
    print(f"[*] Epoch: {checkpoint['epoch']}, Loss: {checkpoint['loss']:.4f}")

    report = []

    for i, (prompt, keywords) in enumerate(PROMPTS):
        print(f"\n[Prompt {i+1}] {prompt}")
        generated = generate_isa_constrained(model, tokenizer, prompt, device, max_tokens=150)

        asm_file = output_dir / f"test_{i+1}.asm"
        ppm_file = output_dir / f"test_{i+1}.ppm"

        with open(asm_file, "w") as f:
            f.write(generated)

        # 1. Syntax + VM Run
        stdout, stderr = run_vm(asm_file, ppm_file)

        syntax_ok = ("requires" not in stdout and "Unknown opcode" not in stdout
                     and "Error" not in stdout and "undefined" not in stdout)

        # 2. Visual check
        vm_success, non_black_ratio = check_visual(ppm_file)

        # 3. Semantic (PLAN consistency)
        plan_ok, plan_detail = validate_plan_consistency(generated)

        status = "PASSED" if (syntax_ok and vm_success) else "FAILED"
        reasons = []
        if not syntax_ok:
            reasons.append("SYNTAX ERROR")
        if not vm_success:
            reasons.append("NO VISUAL OUTPUT")
        if not plan_ok:
            reasons.append("PLAN MISMATCH")
        if reasons:
            status += " (" + ", ".join(reasons) + ")"

        print(f"  Result: {status} [Visual: {non_black_ratio:.2%}]")
        print(f"  Plan: {'OK' if plan_ok else 'MISMATCH'} -- {plan_detail}")

        report.append({
            "prompt": prompt,
            "asm": generated,
            "status": status,
            "syntax_ok": syntax_ok,
            "visual_ok": vm_success,
            "plan_ok": plan_ok,
            "plan_detail": plan_detail,
            "success": "PASSED" in status,
        })

    # Summary
    syntax_count = sum(1 for r in report if r["syntax_ok"])
    visual_count = sum(1 for r in report if r["visual_ok"])
    plan_count = sum(1 for r in report if r["plan_ok"])

    print(f"\n{'='*60}")
    print(f"[*] Smoke test complete.")
    print(f"    Syntax:  {syntax_count}/10")
    print(f"    Visual:  {visual_count}/10")
    print(f"    Semantic (PLAN): {plan_count}/10")

    # Save report
    with open(output_dir / "report.md", "w") as f:
        f.write("# PixelGPT V11 (CoT) Smoke Test Report\n\n")
        f.write(f"Epoch: {checkpoint['epoch']}, Loss: {checkpoint['loss']:.4f}\n\n")
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


if __name__ == "__main__":
    import torch
    main()
