#!/usr/bin/env python3
"""
Overnight Tectonic Evolution - Phase 20 Generative Evolution
"The OS that trains itself while you sleep"

Coordinates:
- TectonicStage (Generational Optimization)
- FractureDetector (Ouroboros Reflex Monitoring)
- NarrativeBroadcaster (GOSR Radio 87.6)
- TectonicFitnessService (Auto-Rewind v14)

Goals:
- 100 Mutation Budget
- PAS Threshold: 0.85 (Pain Threshold)
- Auto-Rewind on Regression or Fracture
- Continuous ASCII Scene Monitoring
- GOSR Radio Narrative Logging
"""

import asyncio
import logging
import os
import sys
import time
from pathlib import Path
from datetime import datetime

# Project root setup
PROJECT_ROOT = Path(__file__).parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

# Imports
from systems.evolution_daemon.stages.tectonic_stage import TectonicStage, TectonicShiftResult
from systems.evolution_daemon.tectonic_fitness_service import TectonicConfig, TectonicFitnessService
from systems.evolution_daemon.safety.fracture_detector import FractureDetector, OuroborosReflex, FractureConfig
from systems.evolution_daemon.narrative_broadcaster.broadcaster import NarrativeBroadcaster

# Logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [OVERNIGHT] %(message)s',
    handlers=[
        logging.FileHandler(".loop/overnight_evolution.log"),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger("overnight_evolution")

class OvernightEvolutionRunner:
    """Orchestrates the overnight generative evolution loop."""
    
    def __init__(self, mutation_budget: int = 100):
        self.mutation_budget = mutation_budget
        self.config = TectonicConfig(
            generations=20,          # 5 mutations per gen * 20 = 100
            population_size=5,
            auto_rewind=True,
            git_commit_trials=True
        )
        self.tectonic_stage = TectonicStage(config=self.config)
        self.fracture_detector = FractureDetector()
        self.radio = NarrativeBroadcaster(station_id="87.6") # Substrate Jazz
        self.start_time = time.time()
        self.evolutions_run = 0

    async def initialize(self):
        """Initialize all subsystems."""
        logger.info("Initializing Overnight Evolution Runner...")
        
        # 1. Tectonic Stage
        if not await self.tectonic_stage.initialize():
            logger.error("Failed to initialize TectonicStage")
            return False
            
        # 2. Fracture Detector
        # We start the fracture detector in the background
        self.fracture_task = asyncio.create_task(self.fracture_detector.run())
        
        # 3. GOSR Radio
        logger.info("📻 Substrate Jazz 87.6 is ON AIR")
        
        return True

    async def run(self):
        """Execute the overnight evolution loop."""
        logger.info(f"🚀 Starting overnight session: {self.mutation_budget} mutation budget")
        
        try:
            # We run the tectonic shift while monitoring fractures
            # To get real-time coordination, we'll hook into the fitness service
            
            # Wrap the fitness service's benchmark_shader to include PAS monitoring
            original_benchmark = self.tectonic_stage.fitness_service.benchmark_shader
            
            async def monitored_benchmark(mutation_id, shader_code, **kwargs):
                # 1. Get current PAS/Drift before benchmark
                drift = self.fracture_detector.get_current_drift()
                pas_score = 1.0 - drift
                
                # 2. Run original benchmark (which handles disk-write and git-commit)
                # We merge kwargs to avoid duplicate argument errors
                kwargs['apply_to_disk'] = True
                kwargs['pas_score'] = pas_score
                
                score = await original_benchmark(
                    mutation_id, 
                    shader_code, 
                    **kwargs
                )
                
                # 3. Check for fracture reflexes
                if drift > self.fracture_detector.config.PAIN_THRESHOLD:
                    logger.warning(f"🚨 FRACTURE DETECTED during {mutation_id}: drift={drift:.2f}")
                
                # 4. Narrative Radio Update
                self._broadcast_mutation(mutation_id, score, pas_score)
                
                self.evolutions_run += 1
                return score

            # Apply the wrapper
            self.tectonic_stage.fitness_service.benchmark_shader = monitored_benchmark
            
            # Start the tectonic optimization
            result = await self.tectonic_stage.trigger_tectonic_shift(
                reason="overnight_generative_evolution"
            )
            
            self._final_report(result)
            
        except Exception as e:
            logger.error(f"Overnight session CRASHED: {e}")
            import traceback
            logger.error(traceback.format_exc())
        finally:
            await self.shutdown()

    def _broadcast_mutation(self, mutation_id, score, pas_score):
        """Generate a radio segment for a mutation."""
        if score.correctness and score.ipc > self.tectonic_stage.baseline_ipc:
            improvement = (score.ipc - self.tectonic_stage.baseline_ipc) / self.tectonic_stage.baseline_ipc
            content = f"The substrate is shifting. Mutation {mutation_id} shows a {improvement*100:.1f}% IPC boost. PAS holding at {pas_score:.2f}."
        elif not score.correctness:
            content = f"Ouroboros detected a fracture during trial {mutation_id}. The OS auto-rewound to protect its sanity."
        else:
            content = f"Trial {mutation_id} was neutral. We're keeping the baseline for now. Geometry is stable."
            
        # GOSR Radio broadcast (simulation)
        logger.info(f"📻 BROADCAST: {content}")

    def _final_report(self, result: TectonicShiftResult):
        """Print final session statistics."""
        elapsed = time.time() - self.start_time
        print("\n" + "="*60)
        print("  OVERNIGHT EVOLUTION COMPLETE")
        print("="*60)
        print(f"  Duration:         {elapsed/3600:.2f} hours")
        print(f"  Mutations Run:    {self.evolutions_run}")
        print(f"  Baseline IPC:     {result.baseline_ipc:.4f}")
        print(f"  Final IPC:        {result.final_ipc:.4f}")
        print(f"  Net Improvement:  {result.improvement_pct*100:.2f}%")
        print(f"  Status:           {'✅ STABLE' if result.success else '⚠️ NEUTRAL'}")
        print("="*60 + "\n")

    async def shutdown(self):
        """Cleanup all tasks."""
        logger.info("Shutting down overnight runner...")
        if hasattr(self, 'fracture_task'):
            self.fracture_task.cancel()
        logger.info("🛑 Overnight Runner stopped")

if __name__ == "__main__":
    async def main():
        runner = OvernightEvolutionRunner(mutation_budget=100)
        if await runner.initialize():
            await runner.run()
            
    asyncio.run(main())
