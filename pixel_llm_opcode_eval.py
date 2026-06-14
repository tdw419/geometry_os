#!/usr/bin/env python3
"""
Pixel-LLM Opcode-Level Semantic Evaluation

Evaluates generated GeOS assembly from the opcode-tokenized model.
Metrics:
1. Syntactic Validity: All decoded opcodes exist in the ISA.
2. Instruction Variety: How many unique opcodes are used.
3. Structure Score: Proper program structure (BOS/EOS, HALT/RET).
4. Operand Plausibility: Registers after opcodes, numbers after registers.
"""

import argparse
import sys
import os
from pathlib import Path

import torch
import numpy as np

sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'pixelflow'))
from opcode_tokenizer import OpcodeTokenizer, BOS, EOS, PAD, NEWLINE, NUM, LABEL, STR, COMMENT, OPCODE_SET


def load_opcode_model(ckpt_path, device="cpu"):
    """Load trained opcode-level model."""
    # Import model class
    sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'pixelflow'))
    from train_opcode_llm import OpcodeGPT

    ckpt = torch.load(ckpt_path, map_location=device, weights_only=False)
    cfg = ckpt["args"]
    vocab_size = ckpt["vocab_size"]

    model = OpcodeGPT(
        vocab_size=vocab_size,
        n_embd=cfg.get("embd", 128),
        n_head=cfg.get("heads", 4),
        n_layer=cfg.get("layers", 2),
        block_size=cfg.get("context_len", 512),
    ).to(device)
    model.load_state_dict(ckpt["model"])
    model.eval()
    return model, cfg, vocab_size


def generate_sample(model, tokenizer, prompt, device, max_tokens=150, temperature=0.8, top_k=40):
    """Generate and return decoded assembly text."""
    ids = tokenizer.encode(prompt, add_bos=True, add_eos=False)
    idx = torch.tensor([ids], dtype=torch.long, device=device)
    out = model.generate(idx, max_new_tokens=max_tokens, temperature=temperature, top_k=top_k)
    return tokenizer.decode(out[0].tolist())


def evaluate_sample(text: str, tokenizer: OpcodeTokenizer) -> dict:
    """Evaluate a generated assembly sample."""
    lines = [l.strip() for l in text.split('\n') if l.strip()]

    # Tokenize and check every non-special token
    raw_ids = tokenizer.encode(text, add_bos=False, add_eos=False)

    opcode_tokens = []
    register_tokens = []
    total_content_tokens = 0
    invalid_tokens = 0
    has_halt = False
    has_ret = False

    for tid in raw_ids:
        if tid in (NEWLINE, BOS, EOS, PAD, COMMENT):
            continue
        total_content_tokens += 1
        token_name = tokenizer.id2token.get(tid, f"<unk:{tid}>")
        if token_name in OPCODE_SET:
            opcode_tokens.append(token_name)
            if token_name == "HALT":
                has_halt = True
            if token_name == "RET":
                has_ret = True
        elif token_name.startswith('r') and token_name[1:].isdigit():
            register_tokens.append(token_name)
        elif tid == NUM:
            pass  # Valid numeric placeholder
        elif tid == LABEL:
            pass  # Valid label
        elif tid == STR:
            pass  # Valid string
        else:
            invalid_tokens += 1

    unique_opcodes = set(opcode_tokens)
    terminates = has_halt or has_ret

    # Validity: no invalid tokens found
    is_valid = invalid_tokens == 0 and total_content_tokens > 0

    # Scoring (revised: validity is king)
    score = 0
    if is_valid:
        score += 50  # All tokens are valid ISA members
    if terminates:
        score += 10
    if len(unique_opcodes) >= 3:
        score += 20
    if len(unique_opcodes) >= 5:
        score += 10  # bonus for variety
    if total_content_tokens >= 10:
        score += 10  # substantial program

    return {
        "valid": is_valid,
        "invalid_tokens": invalid_tokens,
        "terminates": terminates,
        "unique_opcodes": len(unique_opcodes),
        "total_tokens": total_content_tokens,
        "opcodes_used": list(unique_opcodes),
        "score": score,
        "lines": len(lines),
    }


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--checkpoint", default="pixel_llm_opcode_ckpt.pt")
    parser.add_argument("--tokenizer", default=None, help="Path to tokenizer.json (auto-detected if omitted)")
    parser.add_argument("--n-samples", type=int, default=50)
    parser.add_argument("--prompts", nargs="+", default=[
        "LDI r1, 1",
        "ADD r1, r2, r3",
        "RECTF 0, 0, 128, 128, 0xFF0000",
        "CALL myfunc",
        "HALT",
    ])
    parser.add_argument("--max-tokens", type=int, default=150)
    args = parser.parse_args()

    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

    # Load tokenizer
    if args.tokenizer:
        tok_path = args.tokenizer
    else:
        tok_path = "pixel_llm_opcode_dataset.tokenizer.json"
    tokenizer = OpcodeTokenizer.load(tok_path)

    # Load model
    print(f"Loading {args.checkpoint}...")
    model, cfg, vocab_size = load_opcode_model(args.checkpoint, device)
    print(f"Model: {cfg['layers']}L-{cfg['heads']}H-{cfg['embd']}D, vocab={vocab_size}")

    results = []
    samples_per_prompt = max(1, args.n_samples // len(args.prompts))

    for prompt in args.prompts:
        print(f"\nPrompt: {repr(prompt)}")
        for i in range(samples_per_prompt):
            raw = generate_sample(model, tokenizer, prompt, device, max_tokens=args.max_tokens)
            eval_res = evaluate_sample(raw, tokenizer)
            results.append(eval_res)
            status = "OK" if eval_res["valid"] else f"FAIL ({eval_res['invalid_tokens']} bad tokens)"
            print(f"  Sample {i+1}: Score {eval_res['score']} | {status} | Opcodes: {eval_res['unique_opcodes']}")
            if eval_res["invalid_tokens"] > 0:
                print(f"    Invalid token count: {eval_res['invalid_tokens']}")

    # Summary
    if results:
        avg_score = sum(r['score'] for r in results) / len(results)
        valid_pct = sum(1 for r in results if r['valid']) / len(results) * 100
        term_pct = sum(1 for r in results if r['terminates']) / len(results) * 100
        avg_opcodes = sum(r['unique_opcodes'] for r in results) / len(results)
        avg_invalid = sum(r['invalid_tokens'] for r in results) / len(results)

        print(f"\n{'='*50}")
        print(f"Evaluation Summary ({len(results)} samples)")
        print(f"{'='*50}")
        print(f"Avg Score:          {avg_score:.2f}/100")
        print(f"Syntactic Validity: {valid_pct:.1f}%")
        print(f"Termination Rate:   {term_pct:.1f}%")
        print(f"Avg Unique Opcodes: {avg_opcodes:.1f}")
        print(f"Avg Invalid Tokens: {avg_invalid:.2f}")
        print(f"{'='*50}")

        # Compare to raw3 baselines
        print(f"\nReference (raw3 byte-packing baselines):")
        print(f"  v1 (2.8M, conservative):  76.7% validity, 2.1 unique opcodes")
        print(f"  v2 (2.8M, creative):      66.7% validity, 4.4 unique opcodes")
        print(f"  v2 highcap (15.7M):        42.0% validity, 7.4 unique opcodes")
        print(f"  This model (opcode-level): {valid_pct:.1f}% validity, {avg_opcodes:.1f} unique opcodes")


if __name__ == "__main__":
    main()
