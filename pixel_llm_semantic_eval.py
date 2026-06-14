#!/usr/bin/env python3
"""
Pixel-LLM Semantic Evaluation

Systematically evaluates the quality of generated GeOS assembly.
Metrics:
1. Syntactic Validity: Does it pass the basic operand/opcode check?
2. Program Termination: Does it end with HALT or RET?
3. Register Hygiene: Are registers used before being set? (Heuristic)
4. Instruction Variety: How many unique opcodes are used?
5. Execution Potential: Score based on known GeOS patterns.
"""

import argparse
import torch
import numpy as np
from pathlib import Path
from pixelflow.pixel_llm_pipeline import load_model, generate_asm, cleanup_asm, validate_asm

# ─── Evaluation Logic ────────────────────────────────────────────────────────

def evaluate_sample(asm_text: str):
    lines = asm_text.split("\n")
    cleaned_lines = [l.split(";")[0].strip() for l in lines if l.strip()]
    
    # 1. Syntax Check (using existing validator)
    is_valid, msg = validate_asm(asm_text)
    
    # 2. Termination
    terminates = any(l.startswith(("HALT", "RET")) for l in cleaned_lines)
    
    # 3. Register Hygiene
    # Simple heuristic: Track register writes and reads
    reg_set = set()
    hygiene_violations = 0
    
    # Common opcodes that WRITE to the first register operand
    writes_to_first = {
        "MOV", "ADD", "SUB", "MUL", "DIV", "MOD", "AND", "OR", "XOR", "SHL", "SHR", "SAR",
        "LDI", "ADDI", "SUBI", "ANDI", "ORI", "XORI", "SHLI", "LOAD", "IKEY", "RAND", "TICKS", "PID"
    }
    
    unique_opcodes = set()
    
    for line in cleaned_lines:
        parts = [p.strip().rstrip(",") for p in line.replace(",", " ").split()]
        if not parts: continue
        opcode = parts[0].upper()
        unique_opcodes.add(opcode)
        operands = parts[1:]
        
        # Heuristic check for uninitialized registers
        for i, op in enumerate(operands):
            if op.startswith("r") and op[1:].isdigit():
                reg_num = int(op[1:])
                if opcode in writes_to_first and i == 0:
                    reg_set.add(reg_num)
                else:
                    if reg_num not in reg_set:
                        # Register read before write
                        hygiene_violations += 1
                        
    # 4. Scoring (Refined - Terminate is cheap, Validity is expensive)
    score = 0
    if is_valid: score += 50
    if terminates: score += 5
    if len(unique_opcodes) > 3: score += 20
    if hygiene_violations == 0 and len(reg_set) > 0: score += 25
    
    return {
        "valid": is_valid,
        "error": msg if not is_valid else None,
        "terminates": terminates,
        "hygiene_violations": hygiene_violations,
        "unique_opcodes": len(unique_opcodes),
        "score": score,
        "lines": len(cleaned_lines)
    }

# ─── Main ────────────────────────────────────────────────────────────────────

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--checkpoint", default="pixel_llm_ckpt.pt")
    parser.add_argument("--n-samples", type=int, default=10)
    parser.add_argument("--prompts", nargs="+", default=["LDI r1, 1", "Draw a circle", "Loop 10 times"])
    args = parser.parse_args()

    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"Loading {args.checkpoint}...")
    model, seed_to_idx, idx_to_seed = load_model(args.checkpoint, device)
    
    results = []
    
    for prompt in args.prompts:
        print(f"\nEvaluating Prompt: {repr(prompt)}")
        for i in range(args.n_samples // len(args.prompts)):
            raw = generate_asm(model, seed_to_idx, idx_to_seed, prompt, device=device)
            cleaned = cleanup_asm(raw)
            eval_res = evaluate_sample(cleaned)
            results.append(eval_res)
            print(f"  Sample {i+1}: Score {eval_res['score']} | Valid: {eval_res['valid']} | Opcodes: {eval_res['unique_opcodes']}")
            if not eval_res['valid']:
                print(f"    Error: {eval_res['error']}")

    # Summary
    if results:
        avg_score = sum(r['score'] for r in results) / len(results)
        valid_pct = sum(1 for r in results if r['valid']) / len(results) * 100
        term_pct = sum(1 for r in results if r['terminates']) / len(results) * 100
        
        print(f"\n{'='*40}")
        print(f"Evaluation Summary ({len(results)} samples)")
        print(f"{'='*40}")
        print(f"Avg Score:         {avg_score:.2f}/100")
        print(f"Syntactic Validity: {valid_pct:.1f}%")
        print(f"Termination Rate:   {term_pct:.1f}%")
        print(f"Avg Unique Opcodes: {sum(r['unique_opcodes'] for r in results) / len(results):.1f}")
        print(f"{'='*40}")

if __name__ == "__main__":
    main()
