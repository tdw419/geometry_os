import concurrent.futures
import time
import random
import uuid
from dataclasses import dataclass
from typing import List, Callable, Any, Dict

@dataclass
class SimulationResult:
    id: str
    output: Any
    score: float
    duration: float
    metadata: Dict

class TimeBubble:
    """
    The Time Dilation Engine.
    Executes a task across N parallel timelines (threads/processes).
    Prunes results based on a validator function.
    Returns the geometric consensus (optimal result).
    """

    def __init__(self, max_workers: int = 10):
        self.max_workers = max_workers

    def fork_reality(self, task_func: Callable, variants: List[Dict], validator_func: Callable) -> SimulationResult:
        """
        Forks reality into N parallel timelines, where N is len(variants).
        Each timeline executes task_func(variant).
        """
        start_time = time.time()
        print(f"⏳ TimeBubble active: Forking {len(variants)} realities across {self.max_workers} threads...")

        futures = []
        with concurrent.futures.ThreadPoolExecutor(max_workers=self.max_workers) as executor:
            for variant in variants:
                futures.append(executor.submit(self._run_timeline, task_func, variant, validator_func))

        results = []
        for future in concurrent.futures.as_completed(futures):
            try:
                res = future.result()
                if res:
                    results.append(res)
            except Exception as e:
                # In a real OS, we'd log this to the Event Log
                print(f"  ❌ Timeline collapse: {e}")

        total_time = time.time() - start_time
        print(f"✨ Convergence reached in {total_time:.4f}s. {len(results)}/{len(variants)} timelines survived.")
        
        return self._consensus(results)

    def _run_timeline(self, task, variant, validator) -> SimulationResult:
        """Executes a single timeline."""
        t0 = time.time()
        # Simulate execution
        output = task(variant)
        # Validate
        score = validator(output)
        duration = time.time() - t0
        
        if score > 0: # Only return viable realities
            return SimulationResult(
                id=str(uuid.uuid4())[:8],
                output=output,
                score=score,
                duration=duration,
                metadata=variant
            )
        return None

    def _consensus(self, results: List[SimulationResult]) -> SimulationResult:
        """
        Collapses the wave function.
        Selects the result with the highest score.
        In L1, this would use geometric centroid logic.
        """
        if not results:
            raise Exception("All timelines failed validation.")
        
        # Sort by score descending
        sorted_results = sorted(results, key=lambda x: x.score, reverse=True)
        return sorted_results[0]

# --- Demo Logic ---

def mock_refactor_task(variant: Dict) -> str:
    """Simulates refactoring code with different parameters."""
    # Simulate work
    time.sleep(random.uniform(0.01, 0.05)) 
    
    # Simulate outcome based on 'strategy'
    strategy = variant.get('strategy')
    if strategy == "aggressive":
        if random.random() > 0.7: return "syntax_error"
        return "optimized_code_v1"
    elif strategy == "conservative":
        return "clean_code_v1"
    else:
        return "legacy_code"

def mock_validator(output: str) -> float:
    """Simulates running a test suite."""
    if output == "syntax_error": return 0.0
    if output == "optimized_code_v1": return 0.95
    if output == "clean_code_v1": return 0.85
    return 0.1

if __name__ == "__main__":
    # Create the engine
    engine = TimeBubble(max_workers=20)
    
    # Define our variants (The "Forks")
    # In a real scenario, the Oracle generates these variants
    variants = []
    for i in range(50):
        variants.append({'strategy': 'aggressive', 'seed': i})
    for i in range(50):
        variants.append({'strategy': 'conservative', 'seed': i})
        
    print(f"\n🔮 INTENT: 'Refactor Authentication Logic'")
    print(f"   Generating {len(variants)} parallel execution paths...")
    
    # Execute Time Dilation
    best_reality = engine.fork_reality(mock_refactor_task, variants, mock_validator)
    
    print(f"\n🏆 OPTIMAL REALITY SELECTED:")
    print(f"   ID:    {best_reality.id}")
    print(f"   Score: {best_reality.score}")
    print(f"   Out:   {best_reality.output}")
    print(f"   Meta:  {best_reality.metadata}")
