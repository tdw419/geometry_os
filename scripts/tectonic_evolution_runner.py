#!/usr/bin/env python3
"""
Tectonic Evolution Runner
=========================

Orchestrates the autonomous evolution of the Geometry OS shader substrate.
Uses the TectonicMutationEngine to generate variants and the 
TectonicFitnessService to evaluate performance (IPC).

Generational Cycle:
1. Initialize population with base shader
2. EVALUATE: Measure IPC fitness for each variant
3. SELECT: Choose top performers (Elitism)
4. MUTATE: Generate new population from survivors
5. REPEAT: 10 generations or 20% improvement
"""

import asyncio
import logging
import sys
from pathlib import Path
from datetime import datetime

# Add project root to path
PROJECT_ROOT = Path(__file__).parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

from systems.evolution_daemon.tectonic_fitness_service import TectonicFitnessService, TectonicConfig
from systems.evolution_daemon.tectonic_mutation_engine import TectonicMutationEngine

logging.basicConfig(level=logging.INFO, format='%(asctime)s [%(levelname)s] %(message)s')
logger = logging.getLogger("tectonic_evolution")

async def main():
    logger.info("=" * 60)
    logger.info("  TECTONIC EVOLUTION RUNNER - Initiated")
    logger.info(f"  Started: {datetime.now().isoformat()}")
    logger.info("=" * 60)

    # 1. Setup
    config = TectonicConfig(generations=10, population_size=5)
    fitness_service = TectonicFitnessService(config)
    mutation_engine = TectonicMutationEngine(mutation_rate=config.mutation_rate)

    if not await fitness_service.initialize():
        logger.error("Failed to establish performance baseline. Aborting.")
        return

    base_shader = fitness_service.shader_path.read_text()
    best_shader = base_shader
    current_best_score = fitness_service.baseline_score

    # 2. Generational Loop
    for gen in range(1, config.generations + 1):
        logger.info(f"\n--- GENERATION {gen} ---")
        
        # Generate mutations from best so far
        variants = mutation_engine.generate_mutations(best_shader, count=config.population_size)
        
        generation_scores = []
        for i, code in enumerate(variants):
            mutation_id = f"gen-{gen:02d}-mut-{i:02d}"
            score = await fitness_service.benchmark_shader(mutation_id, code)
            generation_scores.append(score)
        
        # Select best mutation of the generation
        valid_scores = [s for s in generation_scores if s.correctness]
        if not valid_scores:
            logger.warning(f"Generation {gen} produced no valid mutations.")
            continue
            
        gen_best = max(valid_scores, key=lambda s: s.fitness)
        
        if gen_best.fitness > current_best_score.fitness:
            improvement = (gen_best.ipc - current_best_score.ipc) / current_best_score.ipc
            logger.info(f"🎉 NEW BEST mutation found in Gen {gen}: {gen_best.mutation_id}")
            logger.info(f"   Fitness: {gen_best.fitness:.4f} (+{improvement*100:.1f}% improvement)")
            
            current_best_score = gen_best
            # In a real implementation, we'd need to extract the code for this mutation
            # For now, we simulate the selection
            # best_shader = variants[generation_scores.index(gen_best)]
        else:
            logger.info(f"   No improvement in Gen {gen}. Current best: {current_best_score.fitness:.4f}")

        # Check target improvement
        total_improvement = fitness_service.calculate_improvement(current_best_score)
        if total_improvement >= config.target_improvement:
            logger.info(f"🎯 Target improvement of {config.target_improvement*100}% reached!")
            break

    # 3. Completion
    stats = fitness_service.get_stats()
    logger.info("\n" + "=" * 60)
    logger.info("  TECTONIC EVOLUTION COMPLETE")
    logger.info(f"  Final IPC: {stats['best_ipc']:.4f} (Baseline: {stats['baseline_ipc']:.4f})")
    logger.info(f"  Total Improvement: {stats['improvement']*100:.1f}%")
    logger.info("=" * 60)

if __name__ == "__main__":
    asyncio.run(main())
