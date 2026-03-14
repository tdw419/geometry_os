#!/usr/bin/env python3
"""
Glyph Compiler Evolution - Autoresearch Track

Evolves a glyph compiler that can compile glyphs.
Target: 95%+ fitness on all test cases.

Once achieved, the compiler can compile itself - true self-hosting.
"""

import json
import random
import subprocess
import time
from pathlib import Path
from datetime import datetime

ROOT = Path(__file__).parent.parent.parent
SEED_PATH = ROOT / "systems/glyph_stratum/seed_compiler.glyph"
FITNESS_PATH = ROOT / "systems/glyph_stratum/compiler_fitness.json"
RESULTS_PATH = ROOT / "apps/autoresearch/compiler_evolution_results.tsv"
CHAMPION_PATH = ROOT / "systems/glyph_stratum/champion_compiler.glyph"


def load_seed():
    """Load the seed compiler."""
    with open(SEED_PATH) as f:
        return json.load(f)


def load_fitness_spec():
    """Load the fitness specification."""
    with open(FITNESS_PATH) as f:
        return json.load(f)


def mutate_compiler(compiler: dict) -> tuple[dict, str]:
    """
    Apply a random mutation to the compiler.
    Returns (mutated_compiler, description).
    """
    mutation_type = random.choice([
        "add_glyph",
        "modify_dependency",
        "change_stratum",
        "add_invariant",
        "tweak_rationale",
    ])

    description = f"Mutation: {mutation_type}"

    if mutation_type == "add_glyph":
        # Add a new glyph
        new_id = str(max(int(k) for k in compiler["glyphs"].keys()) + 1)
        compiler["glyphs"][new_id] = {
            "stratum": random.choice(["LOGIC", "MEMORY", "SUBSTRATE"]),
            "opcode": random.choice(["CALL", "BRANCH", "LOOP", "LOAD", "STORE"]),
            "rationale": f"Evolved glyph {new_id}",
            "dependencies": random.sample(list(compiler["glyphs"].keys()), min(2, len(compiler["glyphs"]))),
            "invariants": {}
        }
        description = f"Added glyph {new_id}"

    elif mutation_type == "modify_dependency":
        # Modify a dependency
        glyph_id = random.choice(list(compiler["glyphs"].keys()))
        glyph = compiler["glyphs"][glyph_id]
        if glyph.get("dependencies"):
            old_dep = random.choice(glyph["dependencies"])
            new_dep = random.choice([g for g in compiler["glyphs"].keys() if g != old_dep])
            glyph["dependencies"].remove(old_dep)
            glyph["dependencies"].append(new_dep)
            description = f"Changed dep in {glyph_id}: {old_dep} → {new_dep}"

    elif mutation_type == "change_stratum":
        # Change a glyph's stratum
        glyph_id = random.choice(list(compiler["glyphs"].keys()))
        glyph = compiler["glyphs"][glyph_id]
        old_stratum = glyph["stratum"]
        strata = ["SUBSTRATE", "MEMORY", "LOGIC", "SPEC", "INTENT"]
        new_stratum = random.choice([s for s in strata if s != old_stratum])
        glyph["stratum"] = new_stratum
        description = f"Changed stratum in {glyph_id}: {old_stratum} → {new_stratum}"

    elif mutation_type == "add_invariant":
        # Add an invariant
        glyph_id = random.choice(list(compiler["glyphs"].keys()))
        glyph = compiler["glyphs"][glyph_id]
        invariant_key = random.choice(["size", "type", "offset", "alignment", "value"])
        invariant_value = random.choice([64, 128, 256, "int", "float", "byte[]"])
        glyph["invariants"][invariant_key] = invariant_value
        description = f"Added invariant to {glyph_id}: {invariant_key}={invariant_value}"

    elif mutation_type == "tweak_rationale":
        # Modify rationale (affects semantic understanding)
        glyph_id = random.choice(list(compiler["glyphs"].keys()))
        glyph = compiler["glyphs"][glyph_id]
        additions = [
            " (optimized)",
            " (parallel)",
            " (cached)",
            " (inlined)",
            " (vectorized)",
        ]
        if "rationale" in glyph:
            glyph["rationale"] += random.choice(additions)
        description = f"Tweaked rationale in {glyph_id}"

    return compiler, description


def evaluate_fitness(compiler: dict, fitness_spec: dict) -> float:
    """
    Evaluate compiler fitness.

    This simulates the compiler's ability to parse and emit bytecode.
    In a real implementation, this would actually run the glyph VM.
    """
    test_cases = fitness_spec["test_cases"]
    total_fitness = 0.0

    for test in test_cases:
        test_fitness = 0.0
        expected = test["expected_output"]
        input_text = test["input"]

        # Simulate parsing (based on compiler structure)
        # Check if compiler has necessary glyphs for parsing

        # 1. Check for opcode parsing capability
        opcode_name = input_text.split()[0]
        if any(g.get("rationale", "").lower().find("opcode") >= 0
               for g in compiler["glyphs"].values()):
            test_fitness += 0.3

        # 2. Check for argument parsing capability
        if "p1=" in input_text and any(
            g.get("rationale", "").lower().find("arg") >= 0
            for g in compiler["glyphs"].values()
        ):
            test_fitness += 0.2

        # 3. Check for dst parsing capability
        if "dst=" in input_text and any(
            g.get("rationale", "").lower().find("dst") >= 0
            for g in compiler["glyphs"].values()
        ):
            test_fitness += 0.2

        # 4. Check for bytecode emission capability
        if any(g.get("opcode") == 225 or  # SPATIAL_SPAWN
               g.get("opcode") == "SPATIAL_SPAWN"
               for g in compiler["glyphs"].values()):
            test_fitness += 0.3

        total_fitness += test_fitness

    return total_fitness / len(test_cases)


def log_result(timestamp: str, generation: int, fitness: float,
               description: str, status: str):
    """Log result to TSV."""
    first_run = not RESULTS_PATH.exists()
    with open(RESULTS_PATH, "a") as f:
        if first_run:
            f.write("timestamp\tgeneration\tfitness\tdescription\tstatus\n")
        f.write(f"{timestamp}\t{generation}\t{fitness:.4f}\t{description}\t{status}\n")


def run_evolution(max_generations: int = 1000, target_fitness: float = 0.95):
    """Run the evolution loop."""

    print("🧬 Glyph Compiler Evolution")
    print("=" * 60)
    print(f"Target: {target_fitness:.0%} fitness")
    print(f"Max generations: {max_generations}")
    print()

    # Load seed and fitness spec
    compiler = load_seed()
    fitness_spec = load_fitness_spec()

    best_fitness = evaluate_fitness(compiler, fitness_spec)
    best_compiler = json.loads(json.dumps(compiler))  # Deep copy

    print(f"Initial fitness: {best_fitness:.2%}")

    # Save initial as champion
    with open(CHAMPION_PATH, "w") as f:
        json.dump(best_compiler, f, indent=2)

    for generation in range(1, max_generations + 1):
        # Mutate
        mutated = json.loads(json.dumps(best_compiler))  # Copy best
        mutated, description = mutate_compiler(mutated)

        # Evaluate
        fitness = evaluate_fitness(mutated, fitness_spec)

        # Selection: keep if better
        if fitness > best_fitness:
            best_fitness = fitness
            best_compiler = mutated
            status = "IMPROVED"

            # Save champion
            with open(CHAMPION_PATH, "w") as f:
                json.dump(best_compiler, f, indent=2)

            print(f"[{generation:04d}] 🏆 NEW CHAMPION: {best_fitness:.2%} - {description}")
        else:
            status = "rejected"

        # Log
        log_result(
            datetime.now().isoformat(),
            generation,
            fitness,
            description,
            status
        )

        # Check target
        if best_fitness >= target_fitness:
            print(f"\n🎉 TARGET REACHED at generation {generation}!")
            print(f"   Final fitness: {best_fitness:.2%}")
            break

        # Progress update
        if generation % 100 == 0:
            print(f"[{generation:04d}] Best: {best_fitness:.2%}")

    print(f"\n🏁 Evolution complete")
    print(f"   Best fitness: {best_fitness:.2%}")
    print(f"   Champion: {CHAMPION_PATH}")

    return best_fitness


if __name__ == "__main__":
    run_evolution()
