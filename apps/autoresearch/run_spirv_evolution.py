#!/usr/bin/env python3
"""
SPIR-V Evolution Runner - Overnight glyph program evolution.

This script connects the glyph_evolution module to the autoresearch
infrastructure, running overnight experiments to evolve better glyph programs.

Usage:
    python3 apps/autoresearch/run_spirv_evolution.py --generations 1000

The results are logged to apps/autoresearch/spirv_results.tsv
"""

import argparse
import json
import subprocess
import time
import hashlib
from datetime import datetime
from pathlib import Path
from dataclasses import dataclass, field, asdict
from typing import List, Dict, Any, Optional
import random

# Ensure we can import from the project root
import sys
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

# Try to import the glyph_evolution module
try:
    from systems.evolution_daemon.glyph_evolution import (
        GlyphProgram,
        GlyphMutator,
        fitness_shader_correctness,
        evolve_glyph_program,
        VALID_OPCODES,
    )
    HAS_GLYPH_EVOLUTION = True
except ImportError:
    HAS_GLYPH_EVOLUTION = False
    print("Warning: systems.evolution_daemon.glyph_evolution not found, using local implementation")
    VALID_OPCODES = [
        200, 201, 202, 203,  # Arithmetic
        204, 205, 206, 207,  # Memory
        208, 209, 210, 211,  # Control
        212, 215,            # System
        216, 217, 218,       # Extended
        220, 221, 222, 223, 224, 225, 227,  # AI-specific
        230, 231, 232, 233, 234, 235, 236,  # Infinite Map
    ]

    @dataclass
    class GlyphProgram:
        glyphs: List[Dict[str, Any]] = field(default_factory=list)
        def to_json(self) -> str:
            return json.dumps({"glyphs": self.glyphs})

    class GlyphMutator:
        def __init__(self, mutation_rate=0.1, opcode_mutation_rate=0.3, param_mutation_rate=0.3):
            self.mutation_rate = mutation_rate
            self.opcode_mutation_rate = opcode_mutation_rate
            self.param_mutation_rate = param_mutation_rate

        def mutate(self, program: GlyphProgram) -> GlyphProgram:
            if random.random() > self.mutation_rate:
                return GlyphProgram(glyphs=program.glyphs.copy())
            glyphs = []
            for g in program.glyphs:
                new_g = g.copy()
                if random.random() < self.opcode_mutation_rate:
                    new_g["opcode"] = random.choice(VALID_OPCODES)
                if random.random() < self.param_mutation_rate:
                    new_g["p1"] = random.uniform(-10.0, 10.0)
                if random.random() < self.param_mutation_rate:
                    new_g["p2"] = random.uniform(-10.0, 10.0)
                glyphs.append(new_g)
            return GlyphProgram(glyphs=glyphs)


# Constants
RESULTS_FILE = Path(__file__).parent / "spirv_results.tsv"
SPIRV_MAGIC = 0x07230203


@dataclass
class ExperimentResult:
    """Result of a single evolution experiment."""
    timestamp: str
    program_hash: str
    spirv_size: int
    word_count: int
    fitness: float
    status: str  # KEEP, DISCARD, CRASH
    description: str


def hash_program(program: GlyphProgram) -> str:
    """Generate a hash for a glyph program."""
    content = program.to_json()
    return hashlib.md5(content.encode()).hexdigest()[:8]


def compile_glyph_program(program: GlyphProgram, timeout: float = 30.0) -> tuple[bool, dict]:
    """
    Compile a glyph program to SPIR-V.

    Returns:
        (success, result_dict)
    """
    try:
        result = subprocess.run(
            ["cargo", "run", "--package", "glyph_compiler", "--", "compile"],
            input=program.to_json(),
            capture_output=True,
            text=True,
            timeout=timeout,
        )

        if result.returncode != 0:
            return False, {"error": result.stderr}

        output = json.loads(result.stdout)
        return True, output

    except subprocess.TimeoutExpired:
        return False, {"error": "timeout"}
    except json.JSONDecodeError as e:
        return False, {"error": f"json error: {e}"}
    except Exception as e:
        return False, {"error": str(e)}


def calculate_fitness(program: GlyphProgram, compile_result: dict) -> float:
    """
    Calculate fitness score for a program.

    Fitness is based on:
    - Compilation success (0.3)
    - Valid SPIR-V magic (0.3)
    - Non-trivial size (0.2)
    - Opcode diversity (0.2)
    """
    score = 0.0

    # Compilation success
    if compile_result.get("spirv_size", 0) > 0:
        score += 0.3

    # Valid magic number
    if compile_result.get("magic") == f"0x{SPIRV_MAGIC:08x}":
        score += 0.3

    # Non-trivial size (> 80 bytes = minimal valid SPIR-V)
    if compile_result.get("spirv_size", 0) > 80:
        score += 0.2

    # Opcode diversity (use multiple different opcodes)
    opcodes_used = set(g.get("opcode", 0) for g in program.glyphs)
    diversity = len(opcodes_used) / max(len(program.glyphs), 1)
    score += 0.2 * min(diversity, 1.0)

    return score


def log_result(result: ExperimentResult):
    """Log experiment result to TSV file."""
    file_exists = RESULTS_FILE.exists()

    with open(RESULTS_FILE, "a") as f:
        if not file_exists:
            f.write("timestamp\tprogram_hash\tspirv_size\tword_count\tfitness\tstatus\tdescription\n")

        f.write(f"{result.timestamp}\t{result.program_hash}\t{result.spirv_size}\t"
                f"{result.word_count}\t{result.fitness:.4f}\t{result.status}\t{result.description}\n")


def run_evolution_loop(
    generations: int = 100,
    population_size: int = 50,
    log_interval: int = 10,
    seed_program: Optional[GlyphProgram] = None,
):
    """
    Run the overnight evolution loop.

    Args:
        generations: Number of generations to run
        population_size: Population size per generation
        log_interval: Log results every N generations
        seed_program: Starting program (default: simple MOV/HALT)
    """
    print(f"═══════════════════════════════════════════════════════════════")
    print(f"       SPIR-V Evolution Runner - {datetime.now().isoformat()}")
    print(f"═══════════════════════════════════════════════════════════════")
    print(f"Generations: {generations}")
    print(f"Population: {population_size}")
    print(f"Results: {RESULTS_FILE}")
    print(f"")

    # Create seed program if not provided
    if seed_program is None:
        seed_program = GlyphProgram(glyphs=[
            {"opcode": 206, "stratum": 0, "p1": 1.0, "p2": 0.0, "dst": 0},  # MOV
            {"opcode": 206, "stratum": 0, "p1": 2.0, "p2": 0.0, "dst": 1},  # MOV
            {"opcode": 200, "stratum": 0, "p1": 0.0, "p1": 1.0, "dst": 2},  # ADD
            {"opcode": 212, "stratum": 0, "p1": 0.0, "p2": 0.0, "dst": 0},  # HALT
        ])

    mutator = GlyphMutator(
        mutation_rate=0.3,
        opcode_mutation_rate=0.4,
        param_mutation_rate=0.5,
    )

    # Track best
    best_program = seed_program
    best_fitness = 0.0

    # Initialize population
    population = [seed_program]
    for _ in range(population_size - 1):
        population.append(mutator.mutate(seed_program))

    start_time = time.time()
    total_experiments = 0
    keeps = 0
    discards = 0
    crashes = 0

    for gen in range(generations):
        gen_start = time.time()

        # Evaluate all programs
        fitness_scores = []
        for program in population:
            total_experiments += 1

            success, compile_result = compile_glyph_program(program)
            fitness = calculate_fitness(program, compile_result) if success else 0.0

            fitness_scores.append((program, fitness, compile_result))

            # Log periodically
            if total_experiments % log_interval == 0:
                status = "KEEP" if fitness > best_fitness else ("DISCARD" if fitness > 0.3 else "CRASH")
                if status == "KEEP":
                    keeps += 1
                elif status == "DISCARD":
                    discards += 1
                else:
                    crashes += 1

                result = ExperimentResult(
                    timestamp=datetime.now().isoformat(),
                    program_hash=hash_program(program),
                    spirv_size=compile_result.get("spirv_size", 0),
                    word_count=compile_result.get("word_count", 0),
                    fitness=fitness,
                    status=status,
                    description=f"gen={gen} glyphs={len(program.glyphs)}",
                )
                log_result(result)

        # Sort by fitness
        fitness_scores.sort(key=lambda x: x[1], reverse=True)

        # Update best
        if fitness_scores[0][1] > best_fitness:
            best_program = fitness_scores[0][0]
            best_fitness = fitness_scores[0][1]
            print(f"  🎯 Gen {gen}: New best fitness = {best_fitness:.4f}")

        # Selection (top 25%)
        survivors = [p for p, _, _ in fitness_scores[:population_size // 4]]

        # Create new population
        population = survivors.copy()
        while len(population) < population_size:
            parent = random.choice(survivors)
            population.append(mutator.mutate(parent))

        # Progress report
        gen_time = time.time() - gen_start
        if gen % 10 == 0:
            elapsed = time.time() - start_time
            rate = total_experiments / elapsed if elapsed > 0 else 0
            print(f"  Gen {gen}/{generations} | Best: {best_fitness:.4f} | "
                  f"Rate: {rate:.1f} exp/s | Keep/Discard/Crash: {keeps}/{discards}/{crashes}")

    # Final summary
    elapsed = time.time() - start_time
    print(f"")
    print(f"═══════════════════════════════════════════════════════════════")
    print(f"                    EVOLUTION COMPLETE")
    print(f"═══════════════════════════════════════════════════════════════")
    print(f"Total experiments: {total_experiments}")
    print(f"Elapsed time: {elapsed:.1f}s ({elapsed/60:.1f} min)")
    print(f"Best fitness: {best_fitness:.4f}")
    print(f"Keep/Discard/Crash: {keeps}/{discards}/{crashes}")
    print(f"Results logged to: {RESULTS_FILE}")

    return best_program, best_fitness


def main():
    parser = argparse.ArgumentParser(description="SPIR-V Evolution Runner")
    parser.add_argument("--generations", type=int, default=100,
                        help="Number of generations to run (default: 100)")
    parser.add_argument("--population", type=int, default=50,
                        help="Population size (default: 50)")
    parser.add_argument("--log-interval", type=int, default=10,
                        help="Log results every N experiments (default: 10)")
    parser.add_argument("--overnight", action="store_true",
                        help="Run overnight mode (1000 generations, 100 population)")

    args = parser.parse_args()

    if args.overnight:
        args.generations = 1000
        args.population = 100

    best_program, best_fitness = run_evolution_loop(
        generations=args.generations,
        population_size=args.population,
        log_interval=args.log_interval,
    )

    # Save best program
    best_file = Path(__file__).parent / "best_program.json"
    with open(best_file, "w") as f:
        json.dump({"glyphs": best_program.glyphs}, f, indent=2)
    print(f"Best program saved to: {best_file}")


if __name__ == "__main__":
    main()
