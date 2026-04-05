#!/usr/bin/env python3
"""GEO-66: GPU End-to-End Agent Loop

Runs 10+ iterations of program generation, assembly, GPU evaluation, and
fitness tracking. Demonstrates the full pipeline:
  1. Generate/load a .gasm program
  2. Assemble to hex pixels (pmp-assemble)
  3. Evaluate on GPU substrate (pmp-eval)
  4. Track fitness over iterations
  5. Apply simple mutations (bit flips, instruction swaps)
  6. Keep best program

Requires: cargo build --bins (pmp-assemble, pmp-eval)
"""

import json
import os
import random
import subprocess
import sys

GEOOS = os.path.expanduser("~/zion/projects/geometry_os/geometry_os")
ASSEMBLE = f"{GEOOS}/target/debug/pmp-assemble"
EVAL = f"{GEOOS}/target/debug/pmp-eval"
ITERATIONS = 15


def assemble_source(source: str) -> list[int] | None:
    """Assemble .gasm source to pixel list."""
    r = subprocess.run(
        [ASSEMBLE, source],
        capture_output=True, text=True, timeout=10, cwd=GEOOS
    )
    if r.returncode != 0:
        print(f"  [ASM ERROR] {r.stderr.strip()[:120]}", file=sys.stderr)
        return None
    hex_str = r.stdout.strip()
    if not hex_str:
        return None
    pixels = []
    for tok in hex_str.split():
        val = int(tok, 16)
        pixels.append(val)
    return pixels


def eval_program(pixels: list[int]) -> dict | None:
    """Evaluate pixel program on GPU substrate."""
    hex_str = " ".join(f"0x{p:08X}" for p in pixels)
    r = subprocess.run(
        [EVAL, hex_str],
        capture_output=True, text=True, timeout=10, cwd=GEOOS
    )
    if r.returncode != 0 and not r.stdout.strip():
        print(f"  [EVAL ERROR] {r.stderr.strip()[:120]}", file=sys.stderr)
        return None
    try:
        return json.loads(r.stdout)
    except json.JSONDecodeError:
        print(f"  [JSON ERROR] {r.stdout[:120]}", file=sys.stderr)
        return None


def mutate_pixels(pixels: list[int], rate: float = 0.1) -> list[int]:
    """Apply random mutations to a pixel program."""
    mutated = pixels.copy()
    for i in range(len(mutated)):
        if random.random() < rate:
            # Pick a mutation strategy
            strategy = random.choice(["flip_bits", "swap", "random_word"])
            if strategy == "flip_bits":
                bit = 1 << random.randint(0, 31)
                mutated[i] ^= bit
            elif strategy == "swap" and len(mutated) > 1:
                j = random.randint(0, len(mutated) - 1)
                mutated[i], mutated[j] = mutated[j], mutated[i]
            else:
                mutated[i] = random.randint(0, 0xFFFFFFFF)
    return mutated


def generate_simple_program() -> str:
    """Generate a simple .gasm program that does computation."""
    programs = [
        # Sum 1..N
        """LDI r0, {n}
LDI r1, 0
LDI r2, 1
loop:
ADD r1, r2
SUB r0, r2
BNE r0, r2, loop
HALT""",
        # Multiply by repeated addition
        """LDI r0, {a}
LDI r1, {b}
LDI r2, 0
LDI r3, 0
loop:
BGE r3, r1, done
ADD r2, r0
LDI r4, 1
ADD r3, r4
JMP loop
done:
HALT""",
        # Fibonacci
        """LDI r0, {n}
LDI r1, 0
LDI r2, 1
LDI r3, 0
loop:
BGE r3, r0, done
LDI r4, 0
ADD r4, r1
ADD r1, r2
MOV r2, r4
LDI r5, 1
ADD r3, r5
JMP loop
done:
HALT""",
    ]
    template = random.choice(programs)
    return template.format(
        n=random.randint(5, 50),
        a=random.randint(2, 20),
        b=random.randint(2, 20),
    )


def main():
    random.seed(42)
    
    # Ensure binaries exist
    for binary in [ASSEMBLE, EVAL]:
        if not os.path.exists(binary):
            print(f"ERROR: {binary} not found. Run: cargo build --bins")
            sys.exit(1)

    print("=" * 60)
    print("GEO-66: GPU End-to-End Agent Loop")
    print(f"Target: {ITERATIONS} iterations")
    print("=" * 60)

    # Start with a seed program
    seed_source = generate_simple_program()
    seed_pixels = assemble_source(seed_source)
    if not seed_pixels:
        print("FATAL: Could not assemble seed program")
        sys.exit(1)

    best_pixels = seed_pixels
    best_fitness = 0.0
    best_iteration = 0
    history = []

    for i in range(ITERATIONS):
        print(f"\n--- Iteration {i+1}/{ITERATIONS} ---")

        if i == 0:
            pixels = seed_pixels
            print(f"  Source: seed program ({len(pixels)} pixels)")
        else:
            # Mutate from best
            pixels = mutate_pixels(best_pixels, rate=0.15)
            print(f"  Source: mutated best (rate=0.15)")

        # Evaluate
        result = eval_program(pixels)
        if not result or not result.get("success"):
            fitness = 0.0
            halted = False
            cycles = 0
            print(f"  Eval: FAILED")
        else:
            fitness = result["fitness"]
            halted = result["halted"]
            cycles = result["cycles"]
            nz = result["nonzero_regs"]
            print(f"  Eval: fitness={fitness:.3f} halted={halted} cycles={cycles} nonzero_regs={nz}")

        # Track
        history.append({
            "iteration": i + 1,
            "fitness": round(fitness, 4),
            "halted": halted,
            "cycles": cycles,
            "pixels": len(pixels),
        })

        if fitness > best_fitness:
            best_fitness = fitness
            best_pixels = pixels
            best_iteration = i + 1
            print(f"  *** NEW BEST: {best_fitness:.3f} ***")

    # Summary
    print("\n" + "=" * 60)
    print("RESULTS")
    print("=" * 60)
    print(f"Best fitness:    {best_fitness:.3f} (iteration {best_iteration})")
    print(f"Total iterations: {ITERATIONS}")
    print(f"Best program:    {len(best_pixels)} pixels")
    
    avg_fitness = sum(h["fitness"] for h in history) / len(history)
    print(f"Average fitness: {avg_fitness:.3f}")
    
    # Fitness progression
    print("\nFitness progression:")
    for h in history:
        bar = "#" * int(h["fitness"] * 30)
        marker = " <-- BEST" if h["iteration"] == best_iteration else ""
        print(f"  {h['iteration']:3d}: {h['fitness']:.3f} {bar}{marker}")

    # Save results
    results_path = os.path.join(GEOOS, "geo66_results.json")
    with open(results_path, "w") as f:
        json.dump({
            "best_fitness": best_fitness,
            "best_iteration": best_iteration,
            "iterations": ITERATIONS,
            "history": history,
        }, f, indent=2)
    print(f"\nResults saved to {results_path}")

    # Success criteria: 10+ iterations completed, best fitness > 0
    if ITERATIONS >= 10 and best_fitness > 0:
        print("\nSUCCESS: GEO-66 complete!")
        return 0
    else:
        print(f"\nFAIL: iterations={ITERATIONS} (need 10+), best_fitness={best_fitness:.3f} (need > 0)")
        return 1


if __name__ == "__main__":
    sys.exit(main())
