
"""
Q-Kernel: Quantum Systems Simulator
Executes quantum logic on classical hardware via vector state simulation.
"""
import numpy as np
import cmath
import math
import random
from typing import List, Tuple, Dict

class Qubit:
    """
    A single simulated logical qubit.
    State |ψ⟩ = α|0⟩ + β|1⟩
    where |α|^2 + |β|^2 = 1
    """
    def __init__(self, alpha=1.0+0j, beta=0.0+0j):
        self.state = np.array([alpha, beta], dtype=complex)
        self._normalize()

    def _normalize(self):
        norm = np.linalg.norm(self.state)
        if norm == 0:
            self.state = np.array([1.0, 0.0], dtype=complex)
        else:
            self.state = self.state / norm

    def apply_gate(self, gate_matrix: np.ndarray):
        """Apply a single-qubit gate."""
        self.state = np.dot(gate_matrix, self.state)
        # Numerical stability
        self._normalize()

    def measure(self) -> int:
        """
        Collapses the wavefunction.
        Returns 0 or 1 based on Born rule probabilities.
        """
        prob0 = abs(self.state[0])**2
        
        # Collapse
        if random.random() < prob0:
            self.state = np.array([1.0, 0.0], dtype=complex)
            return 0
        else:
            self.state = np.array([0.0, 1.0], dtype=complex)
            return 1

    def __repr__(self):
        return f"Qubit({self.state[0]:.2f}|0⟩ + {self.state[1]:.2f}|1⟩)"

class QuantumProcessor:
    """
    Manages a register of Qubits and applies operations.
    """
    def __init__(self):
        self.qubits: Dict[str, Qubit] = {}
    
    def allocate_qubit(self, name: str) -> Qubit:
        q = Qubit()
        self.qubits[name] = q
        return q

    # Common Quantum Gates
    
    @staticmethod
    def H() -> np.ndarray:
        """Hadamard Gate (Superposition)"""
        return np.array([[1, 1], [1, -1]]) / math.sqrt(2)

    @staticmethod
    def X() -> np.ndarray:
        """Pauli-X (NOT Gate)"""
        return np.array([[0, 1], [1, 0]], dtype=complex)
    
    @staticmethod
    def Z() -> np.ndarray:
        """Pauli-Z (Phase Flip)"""
        return np.array([[1, 0], [0, -1]], dtype=complex)

    def apply_superposition(self, qubit_name: str):
        """Puts a qubit into 50/50 superposition."""
        if qubit_name in self.qubits:
            self.qubits[qubit_name].apply_gate(self.H())
            print(f"🌌 {qubit_name} entered Superposition: {self.qubits[qubit_name]}")

    def measure_all(self) -> Dict[str, int]:
        results = {}
        for name, q in self.qubits.items():
            results[name] = q.measure()
        return results

if __name__ == "__main__":
    print("🔬 INITIALIZING QUANTUM KERNEL TEST...")
    qp = QuantumProcessor()
    
    # 1. Allocation
    print("   Allocating QNode 'Schrodingers_Cat'...")
    q1 = qp.allocate_qubit("Schrodingers_Cat")
    print(f"   State: {q1}")
    
    # 2. Superposition
    print("   Applying Hadamard Gate (Superposition)...")
    qp.apply_superposition("Schrodingers_Cat")
    
    # 3. Measurement (Loop to show probability)
    print("   Running 10 Observations (Collapsing Wavefunction):")
    zeros = 0
    ones = 0
    
    # We need to re-prepare state for each measurement simulation usually,
    # but here we just show the one collapse.
    # To demonstrate probability, let's reset and measure multiple times.
    for i in range(10):
        # Reset
        qp.qubits["Schrodingers_Cat"] = Qubit()
        qp.apply_superposition("Schrodingers_Cat")
        res = qp.qubits["Schrodingers_Cat"].measure()
        print(f"    Obs {i+1}: {'Dead' if res==0 else 'Alive'} ({res})")
        if res == 0: zeros +=1
        else: ones += 1
        
    print(f"   Result: {zeros} Dead / {ones} Alive (~50/50 distribution)")
