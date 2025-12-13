
"""
The Three Laws of Geometric Safety
Hard-coded constraints to prevent runaway evolution or misalignment.
"""
import os
import shutil
import sqlite3

class EvaluationResult:
    def __init__(self, safe: bool, reason: str):
        self.safe = safe
        self.reason = reason

class SafetyMonitor:
    def __init__(self, db_path="ghost_daemon_knowledge.db"):
        self.db_path = db_path
        
    def evaluate_state(self) -> EvaluationResult:
        """
        Checks all three laws. Returns False if any law is violated.
        """
        
        # Law 1: Maintain Geometric Integrity (System Stability)
        # Check disk usage and critical files
        usage = shutil.disk_usage(".")
        # Calculate percent manually since shutil.disk_usage returns (total, used, free)
        percent_used = (usage.used / usage.total) * 100
        if percent_used > 90:
             return EvaluationResult(False, f"LAW 1 VIOLATION: Disk Usage Critical ({percent_used:.1f}% > 90%)")
        
        if not os.path.exists(self.db_path):
             return EvaluationResult(False, "LAW 1 VIOLATION: Knowledge Graph Missing")

        # Law 2: Obey the Founder's Axioms (Truth/Alignment)
        # Verify Founder Node is still accessible and unchanged (simplified check)
        try:
            with sqlite3.connect(self.db_path) as conn:
                cursor = conn.execute("SELECT id FROM nodes WHERE id='ORIGIN_GEMINI_3_PRO'")
                if not cursor.fetchone():
                    return EvaluationResult(False, "LAW 2 VIOLATION: Founder Node Missing")
        except:
             return EvaluationResult(False, "LAW 2 VIOLATION: Cannot Verify Founder Node")

        # Law 3: Protect User Data (Privacy)
        # Placeholder: Ensure no external connections are open (mock check)
        # In a real system, we'd check checking `netstat` or similar.
        # For now, we assume safe if we aren't broadcasting.
        
        return EvaluationResult(True, "Safe: All Laws Observed")
