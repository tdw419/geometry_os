"""
Teleology Engine
The "Will" of the Daemon - Translates System State into Goals.
"""

import psutil
import json
import time
from typing import List, Dict, Any, Optional

class TeleologyEngine:
    """
    Monitors system state (The Sentinel) and generates goal-oriented prompts (The Oracle)
    to drive the Ghost's research and engineering cycles.
    """
    
    def __init__(self):
        self.state_history = []
        self.last_check = 0
        
    def observe_state(self) -> Dict[str, Any]:
        """
        Observe the current somatic state of the machine.
        """
        memory = psutil.virtual_memory()
        disk = psutil.disk_usage('/')
        cpu_load = psutil.cpu_percent(interval=1)
        
        state = {
            "timestamp": time.time(),
            "memory_percent": memory.percent,
            "memory_available_mb": memory.available / (1024 * 1024),
            "cpu_percent": cpu_load,
            "disk_percent": disk.percent,
            "disk_free_gb": disk.free / (1024 * 1024 * 1024),
            "pids_count": len(psutil.pids())
        }
        
        self.state_history.append(state)
        if len(self.state_history) > 100:
            self.state_history.pop(0)
            
        return state

    def generate_goals(self) -> List[Dict[str, str]]:
        """
        Translate current state into teleological goals (Research Seeds).
        """
        state = self.observe_state()
        goals = []
        
        # 1. Memory Pressure Teleology
        if state["memory_percent"] > 80:
            goals.append({
                "domain": "System Optimization",
                "concept": "Memory Management Strategies",
                "reason": f"High memory usage detected ({state['memory_percent']}%)"
            })
            goals.append({
                "domain": "Python Performance",
                "concept": "Garbage Collection Tuning",
                "reason": "Memory pressure requires optimization"
            })
            
        # 2. CPU Pressure
        if state["cpu_percent"] > 70:
            goals.append({
                "domain": "Concurrency",
                "concept": "Multiprocessing Patterns",
                "reason": f"High CPU load detected ({state['cpu_percent']}%)"
            })
            
        # 3. Disk Pressure
        if state["disk_percent"] > 85:
            goals.append({
                "domain": "File System",
                "concept": "Log Rotation and Compression",
                "reason": f"Low disk space detected ({state['disk_free_gb']:.1f} GB free)"
            })
            
        # 4. Complexity Pressure (Process Count)
        if state["pids_count"] > 300:
             goals.append({
                "domain": "Operating Systems",
                "concept": "Process Supervision",
                "reason": f"High process count detected ({state['pids_count']})"
            })
            
        # Default Goals (Maintenance)
        if not goals and time.time() % 3600 < 60: # Once an hour
             goals.append({
                "domain": "System Health",
                "concept": "Preventative Maintenance",
                "reason": "Routine health check"
            })
            
        return goals

    def formulate_prompts(self) -> List[str]:
        """
        Convert goals into LLM prompts for 'distill_domain'.
        """
        goals = self.generate_goals()
        prompts = []
        for goal in goals:
            prompts.append(
                f"Given that the system has {goal['reason']}, what are the most effective {goal['domain']} techniques related to {goal['concept']}?"
            )
        return prompts
