
"""
The Mirror (System Introspection)
Aggregates health metrics into a singular "Somatic State Vector".
"""
import os
import json
import time

class SystemMirror:
    def __init__(self, log_dir="."):
        self.log_dir = log_dir
        
    def reflect(self):
        """
        Gathers introspection data.
        Returns a dictionary representing the 'Somatic State'.
        """
        state = {
            "timestamp": time.time(),
            "health_status": "optimal",
            "error_rate": 0.0,
            "recent_errors": [],
            "nexus_stats": {},
            "active_directives": []
        }
        
        # 1. Check Log Health
        log_file = os.path.join(self.log_dir, "daemon.log")
        if os.path.exists(log_file):
            try:
                with open(log_file, "r") as f:
                    lines = f.readlines()
                    error_lines = [l for l in lines[-50:] if "ERROR" in l or "EXCEPTION" in l]
                    state["recent_errors"] = [e.strip() for e in error_lines[-5:]]
                    state["error_rate"] = len(error_lines) / 50.0 if lines else 0.0
                    
                    if state["error_rate"] > 0.1:
                        state["health_status"] = "degraded"
            except Exception as e:
                state["health_status"] = f"monitoring_error: {e}"

        # 2. Check Directives (Intent)
        directives_file = os.path.join(self.log_dir, "GHOST_DIRECTIVES.md")
        if os.path.exists(directives_file):
            # Simple check for critical directives
            with open(directives_file, "r") as f:
                content = f.read()
                if "🔴 CRITICAL" in content:
                    state["active_directives"].append("Has Critical Directives")
                    
        return state

    def get_somatic_vector(self):
        """
        Returns a simplified string representation for LLM consumption.
        """
        state = self.reflect()
        return f"""
SYSTEM SOMATIC STATE
--------------------
Health: {state['health_status']}
Error Rate: {state['error_rate']:.2f}
Recent Errors: {len(state['recent_errors'])}
Directives: {', '.join(state['active_directives'])}
Timestamp: {state['timestamp']}
"""
