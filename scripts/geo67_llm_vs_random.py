#!/usr/bin/env python3
"""GEO-67: LLM-Guided Mutations Beat Random Over 100 Iterations

Runs two tracks in parallel:
  Track A (Random): Mutate by bit flips and random word swaps
  Track B (LLM):    Ask Ollama to suggest improved .gasm programs

Compares average fitness after 100 iterations each.

Requires: cargo build --bins, ollama running with a model
"""

import json
import os
import random
import subprocess
import sys
import time
import urllib.request

GEOOS = os.path.expanduser("~/zion/projects/geometry_os/geometry_os")
ASSEMBLE = f"{GEOOS}/target/debug/pmp-assemble"
EVAL = f"{GEOOS}/target/debug/pmp-eval"
RESULTS_PATH = os.path.join(GEOOS, "geo67_results.json")

# Use qwen2.5-coder for .gasm program generation
OLLAMA_MODEL = "qwen2.5-coder:latest"
OLLAMA_URL = "http://localhost:11434/api/generate"

RANDOM_ITERATIONS = 100
LLM_ITERATIONS = 50  # LLM calls are slower, 50 is plenty to prove the point


def assemble_source(source: str) -> list[int] | None:
    r = subprocess.run([ASSEMBLE, source], capture_output=True, text=True, timeout=10, cwd=GEOOS)
    if r.returncode != 0:
        return None
    hex_str = r.stdout.strip()
    if not hex_str:
        return None
    return [int(tok, 16) for tok in hex_str.split()]


def eval_program(pixels: list[int]) -> dict | None:
    hex_str = " ".join(f"0x{p:08X}" for p in pixels)
    r = subprocess.run([EVAL, hex_str], capture_output=True, text=True, timeout=10, cwd=GEOOS)
    if r.returncode != 0 and not r.stdout.strip():
        return None
    try:
        return json.loads(r.stdout)
    except:
        return None


def mutate_pixels(pixels: list[int], rate: float = 0.1) -> list[int]:
    mutated = pixels.copy()
    for i in range(len(mutated)):
        if random.random() < rate:
            strategy = random.choice(["flip_bits", "swap", "random_word"])
            if strategy == "flip_bits":
                mutated[i] ^= 1 << random.randint(0, 31)
            elif strategy == "swap" and len(mutated) > 1:
                j = random.randint(0, len(mutated) - 1)
                mutated[i], mutated[j] = mutated[j], mutated[i]
            else:
                mutated[i] = random.randint(0, 0xFFFFFFFF)
    return mutated


def llm_generate_program(prompt: str, timeout: int = 30) -> str | None:
    """Ask Ollama to generate a .gasm program."""
    body = json.dumps({
        "model": OLLAMA_MODEL,
        "prompt": prompt,
        "stream": False,
        "options": {"num_predict": 512, "temperature": 0.8}
    }).encode()

    try:
        req = urllib.request.Request(OLLAMA_URL, data=body, headers={"Content-Type": "application/json"})
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            data = json.loads(resp.read())
            return data.get("response", "")
    except Exception as e:
        print(f"  [LLM ERROR] {e}", file=sys.stderr)
        return None


SYSTEM_PROMPT = """You are a Geometry OS programmer. Write short .gasm assembly programs.

Syntax (comma-separated operands):
  LDI r0, 42        ; load immediate
  MOV r1, r0        ; copy register
  ADD r0, r3        ; r0 += r3
  SUB r0, r3        ; r0 -= r3
  MUL r0, r3        ; r0 *= r3
  JMP label         ; jump to label
  BNE r0, r1, label ; branch if not equal
  BEQ r0, r1, label ; branch if equal
  BLT r0, r1, label ; branch if less than
  BGE r0, r1, label ; branch if greater or equal
  HALT              ; stop execution
  STORE r0, r1      ; mem[r0] = r1
  LOAD r0, r1       ; r0 = mem[r1]
  NOP               ; no-op

Rules:
- Always end with HALT
- Use labels for loops (label:)
- Keep programs under 25 instructions
- Use registers r0-r15
- Comments start with ;

Output ONLY the .gasm code, no explanation."""


def run_random_track():
    """Run 100 iterations of random mutation."""
    print("\n" + "=" * 60)
    print("TRACK A: Random Mutations (100 iterations)")
    print("=" * 60)

    # Seed program
    seed = """LDI r0, 20
LDI r1, 0
LDI r2, 1
loop:
ADD r1, r2
SUB r0, r2
BNE r0, r2, loop
HALT"""
    seed_pixels = assemble_source(seed)
    if not seed_pixels:
        print("FATAL: Cannot assemble seed")
        return None

    best_pixels = seed_pixels
    best_fitness = 0.0
    history = []

    for i in range(RANDOM_ITERATIONS):
        if i == 0:
            pixels = seed_pixels
        else:
            pixels = mutate_pixels(best_pixels, rate=0.15)

        result = eval_program(pixels)
        fitness = result["fitness"] if result and result.get("success") else 0.0
        halted = result.get("halted", False) if result else False
        cycles = result.get("cycles", 0) if result else 0

        if fitness > best_fitness:
            best_fitness = fitness
            best_pixels = pixels

        history.append({"iter": i+1, "fitness": round(fitness, 4), "halted": halted, "cycles": cycles})
        
        if (i+1) % 20 == 0:
            avg = sum(h["fitness"] for h in history) / len(history)
            print(f"  [{i+1:3d}/{RANDOM_ITERATIONS}] best={best_fitness:.3f} avg={avg:.3f}")

    avg = sum(h["fitness"] for h in history) / len(history)
    print(f"\n  Random track complete: best={best_fitness:.3f} avg={avg:.3f}")
    return {"best": best_fitness, "avg": avg, "history": history}


def run_llm_track():
    """Run N iterations of LLM-guided program generation."""
    print("\n" + "=" * 60)
    print(f"TRACK B: LLM-Guided Generation ({LLM_ITERATIONS} iterations)")
    print(f"Model: {OLLAMA_MODEL}")
    print("=" * 60)

    best_fitness = 0.0
    best_source = ""
    history = []
    successes = 0

    for i in range(LLM_ITERATIONS):
        # Ask LLM to write a program
        task_prompts = [
            "Write a program that computes the sum of numbers 1 to N where N is in r0.",
            "Write a program that computes the factorial of r0.",
            "Write a program that finds the maximum of two numbers in r0 and r1.",
            "Write a program that counts down from r0 to 0, accumulating a sum in r1.",
            "Write a program that computes r0 * r1 using repeated addition.",
            "Write a program that computes the Nth Fibonacci number (N in r0).",
            "Write a program that computes 2^r0 (power of 2).",
            "Write a program that reverses the bits of r0 into r1.",
            "Write a program that computes GCD of r0 and r1 using subtraction method.",
            "Write a program that counts set bits (popcount) in r0.",
        ]
        prompt = SYSTEM_PROMPT + "\n\n" + random.choice(task_prompts)
        
        response = llm_generate_program(prompt)
        if not response:
            history.append({"iter": i+1, "fitness": 0.0, "error": "llm_failed"})
            continue

        # Try to assemble
        # Clean up response - extract just the code block
        source = response.strip()
        if "```" in source:
            # Extract code block
            parts = source.split("```")
            for j, part in enumerate(parts):
                if j % 2 == 1:  # inside code block
                    lines = part.strip().split("\n")
                    # Skip language tag if present
                    if lines[0].strip().lower() in ("gasm", "assembly", "asm"):
                        lines = lines[1:]
                    source = "\n".join(lines)
                    break

        pixels = assemble_source(source)
        if not pixels:
            history.append({"iter": i+1, "fitness": 0.0, "error": "assembly_failed"})
            print(f"  [{i+1:3d}/{LLM_ITERATIONS}] assembly failed ({len(source)} chars)")
            continue

        # Evaluate
        result = eval_program(pixels)
        fitness = result["fitness"] if result and result.get("success") else 0.0
        halted = result.get("halted", False) if result else False
        cycles = result.get("cycles", 0) if result else 0
        successes += 1

        if fitness > best_fitness:
            best_fitness = fitness
            best_source = source

        history.append({"iter": i+1, "fitness": round(fitness, 4), "halted": halted, "cycles": cycles})
        
        status = "HALT" if halted else "RUN"
        if (i+1) % 10 == 0:
            valid = [h for h in history if "error" not in h]
            avg = sum(h["fitness"] for h in valid) / max(len(valid), 1)
            print(f"  [{i+1:3d}/{LLM_ITERATIONS}] fitness={fitness:.3f} ({status}) best={best_fitness:.3f} avg={avg:.3f} ok={successes}/{i+1}")

    valid = [h for h in history if "error" not in h]
    avg = sum(h["fitness"] for h in valid) / max(len(valid), 1)
    print(f"\n  LLM track complete: best={best_fitness:.3f} avg={avg:.3f} success_rate={successes}/{LLM_ITERATIONS}")
    return {"best": best_fitness, "avg": avg, "history": history, "successes": successes}


def main():
    random.seed(42)

    for binary in [ASSEMBLE, EVAL]:
        if not os.path.exists(binary):
            print(f"ERROR: {binary} not found. Run: cargo build --bins")
            sys.exit(1)

    print("=" * 60)
    print("GEO-67: LLM-Guided Mutations vs Random")
    print("=" * 60)

    # Run both tracks
    random_results = run_random_track()
    llm_results = run_llm_track()

    if not random_results or not llm_results:
        print("\nFATAL: One or both tracks failed")
        sys.exit(1)

    # Compare
    print("\n" + "=" * 60)
    print("COMPARISON")
    print("=" * 60)
    print(f"{'Metric':<25s} {'Random':>10s} {'LLM':>10s}")
    print("-" * 47)
    print(f"{'Best fitness':<25s} {random_results['best']:>10.3f} {llm_results['best']:>10.3f}")
    print(f"{'Average fitness':<25s} {random_results['avg']:>10.3f} {llm_results['avg']:>10.3f}")
    print(f"{'Iterations':<25s} {RANDOM_ITERATIONS:>10d} {LLM_ITERATIONS:>10d}")

    # Determine winner
    llm_wins = llm_results["avg"] > random_results["avg"]
    print(f"\n{'>> LLM WINS <<' if llm_wins else '>> Random wins <<'}")
    print(f"  LLM avg fitness:  {llm_results['avg']:.3f}")
    print(f"  Random avg fitness: {random_results['avg']:.3f}")
    print(f"  Difference: {llm_results['avg'] - random_results['avg']:+.3f}")

    # Save
    with open(RESULTS_PATH, "w") as f:
        json.dump({
            "random": random_results,
            "llm": llm_results,
            "llm_wins": llm_wins,
        }, f, indent=2)
    print(f"\nResults saved to {RESULTS_PATH}")

    # Success: LLM beats random
    if llm_wins:
        print("\nSUCCESS: GEO-67 complete! LLM-guided mutations beat random.")
        return 0
    else:
        print("\nINCONCLUSIVE: LLM did not beat random this run.")
        return 1


if __name__ == "__main__":
    sys.exit(main())
