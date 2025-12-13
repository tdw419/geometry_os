
"""
The Volition Scheduler
Prioritizes self-generated tasks using Quantum Probability.
"""
from typing import List, Dict
from geometry_os.quantum.oracle import QuantumOracle

class Task:
    def __init__(self, name: str, priority_score: float):
        self.name = name
        self.priority_score = priority_score # 0.0 to 1.0

    def __repr__(self):
        return f"{self.name} ({self.priority_score:.2f})"

class VolitionScheduler:
    def __init__(self):
        self.oracle = QuantumOracle()
        self.tasks: List[Task] = []
        
    def add_task(self, name: str, priority: float):
        self.tasks.append(Task(name, priority))
        
    def choose_next_action(self) -> str:
        """
        Uses the Quantum Oracle to collapse the task list into a single choice.
        """
        if not self.tasks:
            return "IDLE"
            
        # Create superposition dict for the Oracle
        # Map Task Name -> Energy (Priority)
        superposition = {t.name: t.priority_score for t in self.tasks}
        
        print("\n⚖️  WEIGHING OPTIONS (Quantum Probability):")
        for t in self.tasks:
            print(f"   - {t.name}: {int(t.priority_score * 100)}% Energy")
            
        choice = self.oracle.observe(superposition)
        
        # Remove chosen task (it's being acted on)
        self.tasks = [t for t in self.tasks if t.name != choice]
        
        return choice
