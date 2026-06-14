#!/usr/bin/env python3
"""GEO-68: Fitness-Component-Guided Mutations

The key insight from GEO-67: the fitness function is STRUCTURAL, not semantic.
It rewards: halt (+0.20), register usage (+0.15), memory writes (+0.15),
opcode diversity (+0.10), cycle count 4-800 (+0.10), memory efficiency (+0.15),
spatial locality (+0.15). Ceiling without STORE/memory writes is 0.625.

GEO-67's LLM from-scratch approach failed because the LLM tried to write
semantically meaningful programs when structural properties mattered more.

GEO-68 approach:
  Track A (Random): Same bit-flip mutations as GEO-67 (baseline)
  Track B (Fitness-Guided): Parse the fitness breakdown, identify the weakest
    component, and apply targeted mutations to improve that specific component.

  For example:
  - If no HALT: append HALT instruction
  - If register count < 3: insert LDI to unused register
  - If no memory writes: insert STORE instruction
  - If low opcode diversity: insert an unused opcode
  - If cycles out of range: adjust loop bounds
  - If low efficiency: trim NOPs

Runs 50 iterations of each track and compares average fitness.

Requires: cargo build --bins
"""

import json
import os
import random
import subprocess
import sys
import time

GEOOS = os.path.expanduser("~/zion/projects/geometry_os/geometry_os")
ASSEMBLE = f"{GEOOS}/target/debug/pmp-assemble"
EVAL = f"{GEOOS}/target/debug/pmp-eval"
RESULTS_PATH = os.path.join(GEOOS, "geo68_results.json")

ITERATIONS = 50

# Instruction encodings (opcode, operand formats) for targeted mutation
# Format: (opcode_byte, [operand_types]) where types: 'r' = register, 'i' = immediate, 'l' = label
KNOWN_OPCODES = {
    "NOP":  (0, []),
    "LDI":  (1, ["r", "i"]),
    "MOV":  (2, ["r", "r"]),
    "LOAD": (3, ["r", "r"]),
    "STORE":(4, ["r", "r"]),
    "ADD":  (5, ["r", "r"]),
    "SUB":  (6, ["r", "r"]),
    "MUL":  (7, ["r", "r"]),
    "DIV":  (8, ["r", "r"]),
    "JMP":  (9, ["l"]),
    "BNE":  (10, ["r", "r", "l"]),
    "CALL": (11, ["l"]),
    "RET":  (12, []),
    "HALT": (13, []),
}

# .gasm instruction templates for injection
GASM_TEMPLATES = {
    "LDI":   lambda r, v=1: f"LDI r{r}, {v}",
    "MOV":   lambda r1, r2: f"MOV r{r1}, r{r2}",
    "STORE": lambda r1, r2: f"STORE r{r1}, r{r2}",
    "LOAD":  lambda r1, r2: f"LOAD r{r1}, r{r2}",
    "ADD":   lambda r1, r2: f"ADD r{r1}, r{r2}",
    "SUB":   lambda r1, r2: f"SUB r{r1}, r{r2}",
    "MUL":   lambda r1, r2: f"MUL r{r1}, r{r2}",
    "NOP":   lambda: "NOP",
    "HALT":  lambda: "HALT",
    "BNE":   lambda r1, r2, lbl: f"BNE r{r1}, r{r2}, {lbl}",
    "JMP":   lambda lbl: f"JMP {lbl}",
}


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


def mutate_pixels_random(pixels: list[int], rate: float = 0.15) -> list[int]:
    """Original GEO-67 random mutation strategy."""
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


def pixels_to_gasm(pixels: list[int]) -> list[str]:
    """Best-effort disassembly of pixel data back to .gasm mnemonics."""
    lines = []
    i = 0
    while i < len(pixels):
        op = (pixels[i] >> 24) & 0xFF
        name = None
        for n, (code, _) in KNOWN_OPCODES.items():
            if code == op:
                name = n
                break
        if name:
            lines.append(f"{name} ; raw=0x{pixels[i]:08X}")
        else:
            lines.append(f"; data 0x{pixels[i]:08X}")
        i += 1
    return lines


def analyze_fitness_breakdown(result: dict) -> dict:
    """Parse eval result into fitness component scores."""
    if not result or not result.get("success"):
        return {
            "halted": 0.0,
            "registers": 0.0,
            "writes": 0.0,
            "diversity": 0.0,
            "cycles": 0.0,
            "efficiency": 0.0,
            "locality": 0.0,
            "total": 0.0,
        }

    score = {}
    # Halt component (+0.20)
    score["halted"] = 0.20 if result.get("halted") else 0.0

    # Register usage (+0.15, max at 3+)
    nz = result.get("nonzero_regs", 0)
    score["registers"] = 0.15 * min(nz / 3.0, 1.0)

    # Memory writes (+0.15, max at 5+)
    uw = result.get("unique_writes", 0)
    score["writes"] = 0.15 * min(uw / 5.0, 1.0)

    # Opcode diversity (+0.10, max at 3+)
    ops = result.get("opcodes_used", [])
    score["diversity"] = 0.10 * min(len(ops) / 3.0, 1.0)

    # Cycles (+0.10 if 4-800, +0.03 if >0)
    cycles = result.get("cycles", 0)
    if 4 <= cycles <= 800:
        score["cycles"] = 0.10
    elif cycles > 0:
        score["cycles"] = 0.03
    else:
        score["cycles"] = 0.0

    # Memory efficiency (+0.15, writes/length)
    plen = result.get("program_length", 0)
    if plen > 0 and uw > 0:
        score["efficiency"] = 0.15 * min(uw / plen, 1.0)
    else:
        score["efficiency"] = 0.0

    # Spatial locality (+0.15) -- back-calculate from total
    total_known = sum(v for k, v in score.items())
    actual_fitness = result.get("fitness", 0.0)
    score["locality"] = max(0.0, actual_fitness - total_known)
    # Clamp locality to max 0.15
    score["locality"] = min(score["locality"], 0.15)

    score["total"] = sum(score.values())
    return score


def fitness_guided_mutation(source: str, fitness_breakdown: dict, eval_result: dict) -> str:
    """Apply targeted mutation to improve the weakest fitness component."""
    lines = source.strip().split("\n")
    # Remove empty lines and comments-only lines for analysis, keep structure
    code_lines = [l for l in lines if l.strip() and not l.strip().startswith(";")]

    if not code_lines:
        # Start from scratch with a good seed
        return build_seed_program()

    # Find weakest component (by gap from max possible)
    gaps = {
        "halted":     0.20 - fitness_breakdown.get("halted", 0),
        "writes":     0.15 - fitness_breakdown.get("writes", 0),
        "registers":  0.15 - fitness_breakdown.get("registers", 0),
        "diversity":  0.10 - fitness_breakdown.get("diversity", 0),
        "cycles":     0.10 - fitness_breakdown.get("cycles", 0),
        "efficiency": 0.15 - fitness_breakdown.get("efficiency", 0),
        "locality":   0.15 - fitness_breakdown.get("locality", 0),
    }

    # Sort by gap (biggest gap = weakest component)
    weakest = sorted(gaps.items(), key=lambda x: -x[1])

    # Apply mutation for the top 1-2 weakest components
    mutated_lines = lines.copy()

    for component, gap in weakest[:2]:
        if gap < 0.01:
            continue  # Already near-max

        if component == "halted":
            # Ensure HALT at the end
            last_real = ""
            for l in reversed(mutated_lines):
                if l.strip() and not l.strip().startswith(";"):
                    last_real = l.strip()
                    break
            if not last_real.startswith("HALT"):
                # Remove any existing HALT mid-program, add at end
                mutated_lines = [l for l in mutated_lines if not l.strip().startswith("HALT")]
                mutated_lines.append("HALT")

        elif component == "writes":
            # Insert STORE instruction -- need an address reg and value reg
            # Find which registers are used
            used_regs = set()
            for l in code_lines:
                import re
                for m in re.finditer(r'r(\d+)', l):
                    used_regs.add(int(m.group(1)))

            addr_reg = 10  # r10 for address
            val_reg = 11   # r11 for value
            if used_regs:
                # Use a register that's already nonzero for the value
                val_reg = min(used_regs) if used_regs else 0

            # CRITICAL: store address must be within scan window (500..500+program_length*4)
            # Use address 520+ to be in the write zone
            store_addr = random.randint(520, 570)
            insert_lines = [
                f"LDI r{addr_reg}, {store_addr}",
                f"STORE r{addr_reg}, r{val_reg}",
            ]
            # Find HALT and insert before it
            halt_idx = None
            for i, l in enumerate(mutated_lines):
                if l.strip().startswith("HALT"):
                    halt_idx = i
                    break
            if halt_idx is not None:
                for j, il in enumerate(insert_lines):
                    mutated_lines.insert(halt_idx + j, il)
            else:
                mutated_lines.extend(insert_lines)

        elif component == "registers":
            # Add LDI to a new register
            used_regs = set()
            import re
            for l in code_lines:
                for m in re.finditer(r'r(\d+)', l):
                    used_regs.add(int(m.group(1)))
            new_reg = 0
            for r in range(16):
                if r not in used_regs:
                    new_reg = r
                    break
            # Insert before HALT
            new_line = f"LDI r{new_reg}, {random.randint(1, 50)}"
            halt_idx = None
            for i, l in enumerate(mutated_lines):
                if l.strip().startswith("HALT"):
                    halt_idx = i
                    break
            if halt_idx is not None:
                mutated_lines.insert(halt_idx, new_line)
            else:
                mutated_lines.append(new_line)

        elif component == "diversity":
            # Add an opcode not yet used
            ops_used = set(eval_result.get("opcodes_used", [])) if eval_result else set()
            candidates = []
            if "STORE" not in ops_used:
                candidates.append(("STORE", f"STORE r10, r0"))
            if "LOAD" not in ops_used:
                candidates.append(("LOAD", f"LOAD r5, r0"))
            if "ADD" not in ops_used:
                candidates.append(("ADD", f"ADD r0, r1"))
            if "SUB" not in ops_used:
                candidates.append(("SUB", f"SUB r0, r1"))
            if "MUL" not in ops_used:
                candidates.append(("MUL", f"MUL r0, r1"))
            if "MOV" not in ops_used:
                candidates.append(("MOV", f"MOV r2, r0"))

            if candidates:
                _, new_line = random.choice(candidates)
                halt_idx = None
                for i, l in enumerate(mutated_lines):
                    if l.strip().startswith("HALT"):
                        halt_idx = i
                        break
                if halt_idx is not None:
                    mutated_lines.insert(halt_idx, new_line)
                else:
                    mutated_lines.append(new_line)

        elif component == "cycles":
            cycles = eval_result.get("cycles", 0) if eval_result else 0
            if cycles > 800:
                # Too many cycles -- break the loop or reduce iterations
                # Replace a BNE with NOP (kills infinite loops)
                for i, l in enumerate(mutated_lines):
                    if "BNE" in l or "BEQ" in l or "BLT" in l:
                        if random.random() < 0.3:
                            mutated_lines[i] = f"NOP ; was: {l.strip()}"
                            break
            elif cycles < 4:
                # Too few cycles -- add a small loop
                label = f"loop{random.randint(1,99)}"
                insert = [
                    f"LDI r12, 5",
                    f"{label}:",
                    f"SUB r12, r2",
                    f"BNE r12, r2, {label}",
                ]
                halt_idx = None
                for i, l in enumerate(mutated_lines):
                    if l.strip().startswith("HALT"):
                        halt_idx = i
                        break
                if halt_idx is not None:
                    for j, il in enumerate(insert):
                        mutated_lines.insert(halt_idx + j, il)
                else:
                    mutated_lines.extend(insert)

        elif component == "efficiency":
            # Memory efficiency = unique_writes / program_length
            # To improve: either add more writes or shorten the program
            if random.random() < 0.5:
                # Add another STORE with different address (within scan window)
                addr = random.randint(520, 570)
                insert = f"LDI r13, {addr}\nSTORE r13, r0"
                halt_idx = None
                for i, l in enumerate(mutated_lines):
                    if l.strip().startswith("HALT"):
                        halt_idx = i
                        break
                if halt_idx is not None:
                    mutated_lines.insert(halt_idx, insert)
            else:
                # Remove a NOP if present
                mutated_lines = [l for l in mutated_lines if not l.strip().startswith("NOP")]

        elif component == "locality":
            # Spatial locality is hard to target via source mutation
            # Just add a small random perturbation
            if random.random() < 0.3 and len(mutated_lines) > 2:
                # Swap two adjacent instructions (not HALT)
                for i in range(len(mutated_lines) - 1):
                    if not mutated_lines[i].strip().startswith("HALT") and \
                       not mutated_lines[i+1].strip().startswith("HALT"):
                        if random.random() < 0.3:
                            mutated_lines[i], mutated_lines[i+1] = mutated_lines[i+1], mutated_lines[i]

    # Also add a small random perturbation (keeps evolutionary diversity)
    if random.random() < 0.2 and mutated_lines:
        # Tweak a constant in a random LDI
        import re
        for i, l in enumerate(mutated_lines):
            m = re.match(r'(LDI\s+r\d+,\s*)(\d+)', l.strip())
            if m:
                old_val = int(m.group(2))
                new_val = max(1, old_val + random.randint(-5, 5))
                mutated_lines[i] = f"{m.group(1)}{new_val}"
                break

    return "\n".join(mutated_lines)


def build_seed_program() -> str:
    """Build a seed program designed to hit multiple fitness components.
    
    Key insight: unique_writes counts non-zero values in the substrate near the 
    program that differ from the original. Load address is 500, scan window is 
    500..500+program_length*4. To get unique_writes > 0, we must STORE to 
    addresses within that window (e.g., 520+) with values != original bytes.
    """
    return """LDI r0, 10
LDI r1, 0
LDI r2, 1
LDI r3, 520
loop:
ADD r1, r2
STORE r3, r1
ADD r3, r2
SUB r0, r2
BNE r0, r2, loop
HALT"""


def source_to_pixels(source: str) -> list[int] | None:
    """Assemble source code to pixel data."""
    return assemble_source(source)


def pixels_to_source(pixels: list[int]) -> str:
    """Best-effort reconstitution of source from pixels."""
    # For the guided track, we maintain source separately
    # This is a fallback for bootstrapping
    return build_seed_program()


def run_random_track(iterations: int = ITERATIONS):
    """Run random mutation baseline."""
    print("\n" + "=" * 60)
    print(f"TRACK A: Random Mutations ({iterations} iterations)")
    print("=" * 60)

    seed = build_seed_program()
    seed_pixels = assemble_source(seed)
    if not seed_pixels:
        print("FATAL: Cannot assemble seed")
        return None

    best_pixels = seed_pixels
    best_fitness = 0.0
    history = []

    for i in range(iterations):
        if i == 0:
            pixels = seed_pixels
        else:
            pixels = mutate_pixels_random(best_pixels, rate=0.15)

        result = eval_program(pixels)
        fitness = result["fitness"] if result and result.get("success") else 0.0

        if fitness > best_fitness:
            best_fitness = fitness
            best_pixels = pixels

        entry = {
            "iter": i + 1,
            "fitness": round(fitness, 4),
            "halted": result.get("halted", False) if result else False,
            "cycles": result.get("cycles", 0) if result else 0,
            "writes": result.get("unique_writes", 0) if result else 0,
        }
        history.append(entry)

        if (i + 1) % 10 == 0:
            avg = sum(h["fitness"] for h in history) / len(history)
            print(f"  [{i+1:3d}/{iterations}] best={best_fitness:.3f} avg={avg:.3f}")

    avg = sum(h["fitness"] for h in history) / len(history)
    print(f"\n  Random complete: best={best_fitness:.3f} avg={avg:.3f}")
    return {"best": best_fitness, "avg": avg, "history": history}


def run_guided_track(iterations: int = ITERATIONS):
    """Run fitness-component-guided mutations."""
    print("\n" + "=" * 60)
    print(f"TRACK B: Fitness-Guided Mutations ({iterations} iterations)")
    print("=" * 60)

    best_source = build_seed_program()
    best_fitness = 0.0
    history = []
    mutation_log = []

    for i in range(iterations):
        if i == 0:
            source = best_source
        else:
            # Get fitness breakdown of current best, then mutate
            best_pixels = assemble_source(best_source)
            if best_pixels:
                best_result = eval_program(best_pixels)
                breakdown = analyze_fitness_breakdown(best_result)
                source = fitness_guided_mutation(best_source, breakdown, best_result)
            else:
                source = build_seed_program()

        pixels = assemble_source(source)
        if not pixels:
            # Assembly failed -- keep best, try again next iter
            history.append({"iter": i + 1, "fitness": 0.0, "error": "assembly_failed"})
            if (i + 1) % 10 == 0:
                avg = sum(h["fitness"] for h in history if "error" not in h) / max(1, len([h for h in history if "error" not in h]))
                print(f"  [{i+1:3d}/{iterations}] assembly failed, best={best_fitness:.3f} avg_valid={avg:.3f}")
            continue

        result = eval_program(pixels)
        fitness = result["fitness"] if result and result.get("success") else 0.0

        if fitness > best_fitness or i == 0:
            best_fitness = fitness
            best_source = source
            improved = True
        else:
            improved = False

        breakdown = analyze_fitness_breakdown(result)
        weakest = min(breakdown, key=lambda k: breakdown[k] if k != "total" else 999)

        entry = {
            "iter": i + 1,
            "fitness": round(fitness, 4),
            "halted": result.get("halted", False) if result else False,
            "cycles": result.get("cycles", 0) if result else 0,
            "writes": result.get("unique_writes", 0) if result else 0,
            "weakest": weakest,
            "improved": improved,
        }
        history.append(entry)
        mutation_log.append({
            "iter": i + 1,
            "source": source[:200],
            "fitness": round(fitness, 4),
            "breakdown": {k: round(v, 3) for k, v in breakdown.items()},
        })

        if (i + 1) % 10 == 0:
            avg = sum(h["fitness"] for h in history if "error" not in h) / max(1, len([h for h in history if "error" not in h]))
            print(f"  [{i+1:3d}/{iterations}] fitness={fitness:.3f} best={best_fitness:.3f} avg={avg:.3f} weakest={weakest}")

    valid = [h for h in history if "error" not in h]
    avg = sum(h["fitness"] for h in valid) / max(1, len(valid))
    print(f"\n  Guided complete: best={best_fitness:.3f} avg={avg:.3f}")
    print(f"  Best program:\n{best_source}")
    return {"best": best_fitness, "avg": avg, "history": history, "mutation_log": mutation_log, "best_source": best_source}


def main():
    random.seed(42)

    for binary in [ASSEMBLE, EVAL]:
        if not os.path.exists(binary):
            print(f"ERROR: {binary} not found. Run: cargo build --bins")
            sys.exit(1)

    print("=" * 60)
    print("GEO-68: Fitness-Component-Guided Mutations vs Random")
    print("=" * 60)
    print(f"\nFitness components:")
    print(f"  halt (+0.20) regs (+0.15) writes (+0.15)")
    print(f"  diversity (+0.10) cycles (+0.10)")
    print(f"  efficiency (+0.15) locality (+0.15)")
    print(f"  Ceiling without STORE: 0.625")

    random_results = run_random_track()
    guided_results = run_guided_track()

    if not random_results or not guided_results:
        print("\nFATAL: One or both tracks failed")
        sys.exit(1)

    # Compare
    print("\n" + "=" * 60)
    print("COMPARISON")
    print("=" * 60)
    print(f"{'Metric':<25s} {'Random':>10s} {'Guided':>10s} {'Delta':>10s}")
    print("-" * 57)
    print(f"{'Best fitness':<25s} {random_results['best']:>10.3f} {guided_results['best']:>10.3f} {guided_results['best']-random_results['best']:>+10.3f}")
    print(f"{'Average fitness':<25s} {random_results['avg']:>10.3f} {guided_results['avg']:>10.3f} {guided_results['avg']-random_results['avg']:>+10.3f}")
    print(f"{'Iterations':<25s} {ITERATIONS:>10d} {ITERATIONS:>10d}")

    guided_wins = guided_results["avg"] > random_results["avg"]
    delta = guided_results["avg"] - random_results["avg"]
    print(f"\n{'>> GUIDED WINS <<' if guided_wins else '>> Random wins <<'}")
    print(f"  Guided avg:  {guided_results['avg']:.3f}")
    print(f"  Random avg:  {random_results['avg']:.3f}")
    print(f"  Delta:       {delta:+.3f}")

    # Save
    with open(RESULTS_PATH, "w") as f:
        json.dump({
            "random": random_results,
            "guided": {k: v for k, v in guided_results.items() if k != "mutation_log"},
            "guided_wins": guided_wins,
            "delta": round(delta, 4),
            "best_guided_source": guided_results.get("best_source", ""),
        }, f, indent=2)
    print(f"\nResults saved to {RESULTS_PATH}")

    if guided_wins:
        print("\nSUCCESS: GEO-68 complete! Fitness-guided mutations beat random.")
        return 0
    else:
        print("\nINCONCLUSIVE: Guided did not beat random this run.")
        return 1


if __name__ == "__main__":
    sys.exit(main())
