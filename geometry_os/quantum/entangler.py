
"""
Entanglement Swarm
Manages non-local correlations between knowledge nodes (qubits).
"""
import random
import numpy as np
from typing import Dict, Tuple
from geometry_os.quantum.q_kernel import Qubit, QuantumProcessor

class EntanglementSwarm:
    def __init__(self, processor: QuantumProcessor):
        self.processor = processor
        self.entangled_pairs: Dict[str, str] = {} # Map A -> B (and B -> A)

    def entangle(self, name_a: str, name_b: str):
        """
        Creates a Bell Pair (Φ+) between two qubits.
        |Φ+⟩ = (|00⟩ + |11⟩) / √2
        """
        if name_a not in self.processor.qubits or name_b not in self.processor.qubits:
            raise ValueError("Qubits must exist in processor")
            
        # 1. Put A in Superposition (acting as the control in a sense, or just preparing the state)
        # Purely symbolic in this simulation, we handle the correlation in measure_pair
        self.processor.apply_superposition(name_a)
        
        # 2. Register link
        self.entangled_pairs[name_a] = name_b
        self.entangled_pairs[name_b] = name_a
        
        print(f"♾️  ENTANGLED: {name_a} <==> {name_b}")

    def measure_pair(self, name_a: str) -> Tuple[int, int]:
        """
        Measures one qubit, and forces the other to collapse to the same state
        (Simulating Spooky Action).
        """
        if name_a not in self.entangled_pairs:
            # Normal measurement
            val = self.processor.qubits[name_a].measure()
            return val, -1
            
        name_b = self.entangled_pairs[name_a]
        
        # Measure A first (It's in superposition, so 50/50)
        val_a = self.processor.qubits[name_a].measure()
        
        # Force B to match (Simulating collapse of the pair state |00> + |11>)
        q_b = self.processor.qubits[name_b]
        
        if val_a == 0:
            q_b.state = np.array([1.0+0j, 0.0+0j], dtype=complex) # Force |0⟩
        else:
            q_b.state = np.array([0.0+0j, 1.0+0j], dtype=complex) # Force |1⟩
            
        val_b = q_b.measure() # Will be deterministic now
        
        return val_a, val_b
