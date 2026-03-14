#!/usr/bin/env python3
"""
Glyph Program Evolution - Connected to actual GPU execution.

This evolves glyph programs by running them through the benchmark
and measuring actual performance (GIPS, correctness).

Usage:
    python3 apps/autoresearch/run_glyph_evolution.py --generations 100
"""

import argparse
import json
import subprocess
import time
import hashlib
import random
from datetime import datetime
from pathlib import Path
from dataclasses import dataclass, field
from typing import List, Dict, Any, Optional

ROOT = Path(__file__).parent.parent.parent.absolute()
RESULTS_FILE = Path(__file__).parent / "evolution_results.tsv"

# Valid opcodes for evolution
VALID_OPCODES = [
    # Core opcodes (0-15)
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
    # GPU/AI-native opcodes (200-227)
    200, 201, 202, 203,  # Arithmetic
    204, 205, 206, 207,  # Memory
    208, 209, 210, 211,  # Control
    212, 215,            # System
    216, 217, 218,       # Extended
    220, 221, 222, 223, 224, 225, 227,  # AI-specific
    # Spatial/Infinite Map opcodes (230-236)
    230, 231, 232, 233, 234, 235, 236,
]


@dataclass
class GlyphProgram:
    glyphs: List[Dict[str, Any]] = field(default_factory=list)

    def to_json(self) -> str:
        return json.dumps({"glyphs": self.glyphs})

    def to_rts_commands(self) -> str:
        """Convert to commands for crystallization."""
        lines = []
        for g in self.glyphs:
            op = g.get("opcode", 0)
            p1 = g.get("p1", 0)
            p2 = g.get("p2", 0)
            dst = g.get("dst", 0)
            lines.append(f"OP {op} {p1} {p2} {dst}")
        return "\n".join(lines)


class GlyphMutator:
    def __init__(self, mutation_rate=0.3, opcode_rate=0.4, param_rate=0.5):
        self.mutation_rate = mutation_rate
        self.opcode_rate = opcode_rate
        self.param_rate = param_rate

    def mutate(self, program: GlyphProgram) -> GlyphProgram:
        if random.random() > self.mutation_rate:
            return GlyphProgram(glyphs=program.glyphs.copy())

        glyphs = []
        for g in program.glyphs:
            new_g = g.copy()
            if random.random() < self.opcode_rate:
                new_g["opcode"] = random.choice(VALID_OPCODES)
            if random.random() < self.param_rate:
                new_g["p1"] = round(random.uniform(-10.0, 10.0), 2)
            if random.random() < self.param_rate:
                new_g["p2"] = round(random.uniform(-10.0, 10.0), 2)
            glyphs.append(new_g)

        # Occasionally add/remove glyphs
        if random.random() < 0.1 and len(glyphs) < 20:
            glyphs.append({
                "opcode": random.choice(VALID_OPCODES),
                "p1": round(random.uniform(-10.0, 10.0), 2),
                "p2": round(random.uniform(-10.0, 10.0), 2),
                "dst": random.randint(0, 31),
            })
        if random.random() < 0.1 and len(glyphs) > 2:
            glyphs.pop(random.randint(0, len(glyphs) - 1))

        return GlyphProgram(glyphs=glyphs)


def run_benchmark() -> Dict[str, Any]:
    """Run the glyph benchmark and return metrics."""
    try:
        result = subprocess.run(
            ["python3", str(ROOT / "systems" / "glyph_stratum" / "benchmark_glyph_fps.py")],
            capture_output=True,
            text=True,
            timeout=60,
        )
        output = result.stdout + result.stderr

        metrics = {"gips": 0.0, "fps": 0.0, "passed": False}

        for line in output.split("\n"):
            if "GIPS:" in line:
                metrics["gips"] = float(line.split(":")[1].strip())
            if "FPS:" in line:
                metrics["fps"] = float(line.split(":")[1].strip())
            if "Status: PASS" in line or "r2=120" in line:
                metrics["passed"] = True

        return metrics

    except Exception as e:
        return {"gips": 0.0, "fps": 0.0, "passed": False, "error": str(e)}


def calculate_fitness(metrics: Dict[str, Any], program: GlyphProgram) -> float:
    """
    Calculate fitness based on actual execution.

    Priorities:
    1. Correctness (tests pass) - required for any score
    2. GIPS (instructions per second) - higher is better
    3. Program complexity - reward non-trivial programs
    """
    # Must pass tests to get any score
    if not metrics.get("passed", False):
        return 0.0

    # Base score for passing
    score = 0.5

    # GIPS bonus (max 0.3)
    gips = metrics.get("gips", 0.0)
    score += min(gips * 10, 0.3)  # 0.003 GIPS = 0.03 bonus

    # Complexity bonus (max 0.2)
    num_glyphs = len(program.glyphs)
    opcodes_used = set(g.get("opcode", 0) for g in program.glyphs)
    complexity = (num_glyphs / 10) * 0.1 + (len(opcodes_used) / 5) * 0.1
    score += min(complexity, 0.2)

    return min(score, 1.0)


def log_result(generation: int, program: GlyphProgram, fitness: float, metrics: Dict[str, Any]):
    """Log evolution result."""
    first_run = not RESULTS_FILE.exists()

    with open(RESULTS_FILE, "a") as f:
        if first_run:
            f.write("timestamp\tgen\tfitness\tgips\tfps\tpassed\tglyphs\topcodes\n")

        opcodes = ",".join(str(g.get("opcode", 0)) for g in program.glyphs)
        f.write(f"{datetime.now().isoformat()}\t{generation}\t{fitness:.4f}\t"
                f"{metrics.get('gips', 0):.4f}\t{metrics.get('fps', 0):.1f}\t"
                f"{metrics.get('passed', False)}\t{len(program.glyphs)}\t{opcodes}\n")


def run_evolution(generations: int = 100, population_size: int = 20):
    """Run the evolution loop connected to actual execution."""
    print("=" * 63)
    print(f"       GLYPH EVOLUTION - {datetime.now().isoformat()}")
    print("=" * 63)
    print(f"Generations: {generations}")
    print(f"Population: {population_size}")
    print(f"Results: {RESULTS_FILE}")
    print()

    # Seed program: factorial calculation
    seed = GlyphProgram(glyphs=[
        {"opcode": 206, "p1": 5.0, "p2": 0.0, "dst": 0},   # MOV r0, 5
        {"opcode": 206, "p1": 1.0, "p2": 0.0, "dst": 1},   # MOV r1, 1
        {"opcode": 206, "p1": 1.0, "p2": 0.0, "dst": 2},   # MOV r2, 1
        {"opcode": 200, "p1": 2.0, "p2": 0.0, "dst": 2},   # MUL r2, r2, r0
        {"opcode": 201, "p1": 0.0, "p2": 1.0, "dst": 0},   # SUB r0, r0, 1
        {"opcode": 208, "p1": 0.0, "p2": 1.0, "dst": 0},   # JNZ r0, 1 (loop)
        {"opcode": 212, "p1": 0.0, "p2": 0.0, "dst": 0},   # HALT
    ])

    mutator = GlyphMutator()
    best_program = seed
    best_fitness = 0.0

    # Initialize population
    population = [seed]
    for _ in range(population_size - 1):
        population.append(mutator.mutate(seed))

    start_time = time.time()

    for gen in range(generations):
        gen_start = time.time()

        # Evaluate population
        fitness_scores = []
        for program in population:
            metrics = run_benchmark()
            fitness = calculate_fitness(metrics, program)
            fitness_scores.append((program, fitness, metrics))

            if fitness > 0:
                log_result(gen, program, fitness, metrics)

        # Sort by fitness
        fitness_scores.sort(key=lambda x: x[1], reverse=True)

        # Update best
        if fitness_scores[0][1] > best_fitness:
            best_program = fitness_scores[0][0]
            best_fitness = fitness_scores[0][1]
            print(f"  🎯 Gen {gen}: New best fitness = {best_fitness:.4f} (GIPS: {fitness_scores[0][2].get('gips', 0):.4f})")

        # Selection (top 25%)
        survivors = [p for p, _, _ in fitness_scores[:max(population_size // 4, 1)]]

        # Create new population
        population = survivors.copy()
        while len(population) < population_size:
            parent = random.choice(survivors)
            population.append(mutator.mutate(parent))

        # Progress
        gen_time = time.time() - gen_start
        if gen % 10 == 0:
            elapsed = time.time() - start_time
            avg_fitness = sum(f for _, f, _ in fitness_scores) / len(fitness_scores)
            print(f"  Gen {gen}/{generations} | Best: {best_fitness:.4f} | Avg: {avg_fitness:.4f} | Time: {gen_time:.1f}s")

    # Final summary
    elapsed = time.time() - start_time
    print()
    print("=" * 63)
    print("                    EVOLUTION COMPLETE")
    print("=" * 63)
    print(f"Elapsed: {elapsed:.1f}s ({elapsed/60:.1f} min)")
    print(f"Best fitness: {best_fitness:.4f}")
    print(f"Best program: {len(best_program.glyphs)} glyphs")
    print(f"Results: {RESULTS_FILE}")

    # Save best program
    best_file = Path(__file__).parent / "best_evolved_program.json"
    with open(best_file, "w") as f:
        json.dump({"glyphs": best_program.glyphs}, f, indent=2)
    print(f"Saved to: {best_file}")

    return best_program, best_fitness


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Glyph Program Evolution")
    parser.add_argument("--generations", type=int, default=50,
                        help="Number of generations (default: 50)")
    parser.add_argument("--population", type=int, default=20,
                        help="Population size (default: 20)")

    args = parser.parse_args()

    best_program, best_fitness = run_evolution(
        generations=args.generations,
        population_size=args.population,
    )
