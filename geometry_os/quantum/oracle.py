
"""
The Oracle (Collapse Function)
Collapses fuzzy semantic intent into concrete knowledge observations.
"""
import random
from typing import List, Dict

class QuantumOracle:
    def __init__(self):
        pass
        
    def observe(self, potentials: Dict[str, float]) -> str:
        """
        Collapses a superposition of possibilities into one reality.
        potentials: Dict of {Option: RelevanceScore}
        """
        # 1. Calculate Probability Amplitudes (Normalize scores)
        total_energy = sum(potentials.values())
        if total_energy == 0:
            if not potentials:
                return None
            return random.choice(list(potentials.keys()))
            
        # 2. Construct cumulative distribution
        selection = random.uniform(0, total_energy)
        current = 0.0
        
        for option, score in potentials.items():
            current += score
            if current >= selection:
                print(f"👁️  OBSERVED: '{option}' (Wavefunction Collapsed)")
                return option
                
        return list(potentials.keys())[-1]
