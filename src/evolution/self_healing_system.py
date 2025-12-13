
import asyncio
import psutil
import time
from typing import Dict, Any, List, Optional
from datetime import datetime
import json

class SelfHealingSystem:
    """
    Directive-004: Self-Healing System
    Monitors system health, detects anomalies, and triggers recovery logic.
    """
    def __init__(self, ctrm, evolution_daemon):
        self.ctrm = ctrm
        self.evolution_daemon = evolution_daemon
        self.health_history = []
        self.recovery_log = []
        self.last_check = 0
        self.check_interval = 60 # Check every 60 seconds
        
        # Thresholds
        self.cpu_threshold = 90.0
        self.memory_threshold = 90.0
        self.error_rate_threshold = 0.2
        self.active = True

    async def run_monitoring_cycle(self) -> Dict[str, Any]:
        """Execute one health monitoring cycle"""
        if not self.active or (time.time() - self.last_check < self.check_interval):
            return {"status": "skipped", "reason": "interval_too_soon"}
            
        self.last_check = time.time()
        
        # 1. Collect Metrics
        metrics = await self._collect_system_metrics()
        
        # 2. Add application metrics if available from evolution daemon
        if hasattr(self.evolution_daemon, "get_performance_stats"):
            metrics.update(self.evolution_daemon.get_performance_stats())
            
        # 3. Detect Anomalies
        anomalies = self._detect_anomalies(metrics)
        
        result = {
            "timestamp": datetime.now().isoformat(),
            "metrics": metrics,
            "anomalies": anomalies,
            "actions_taken": []
        }
        
        # 4. Trigger Recovery if needed
        if anomalies:
            print(f"🚑 Self-Healing: Detected {len(anomalies)} anomalies")
            actions = await self._execute_recovery(anomalies)
            result["actions_taken"] = actions
            self.recovery_log.append({
                "timestamp": result["timestamp"],
                "anomalies": anomalies,
                "actions": actions
            })
            
            # 5. Store Incident Truth
            await self.ctrm.create_truth(
                statement=f"Self-Healing Event: {len(anomalies)} anomalies detected and addressed",
                context=json.dumps({
                    "anomalies": anomalies,
                    "actions": actions,
                    "metrics": metrics
                }),
                confidence=0.95
            )
            
        self.health_history.append(result)
        # Keep history manageable
        if len(self.health_history) > 100:
            self.health_history.pop(0)
            
        return result

    async def _collect_system_metrics(self) -> Dict[str, Any]:
        """Collect lower-level system metrics"""
        try:
            return {
                "cpu_percent": psutil.cpu_percent(interval=0.1),
                "memory_percent": psutil.virtual_memory().percent,
                "disk_usage": psutil.disk_usage('/').percent,
                "active_threads": psutil.Process().num_threads()
            }
        except Exception as e:
            print(f"⚠️ Error collecting metrics: {e}")
            return {}

    def _detect_anomalies(self, metrics: Dict[str, Any]) -> List[Dict[str, Any]]:
        """Identify issues requiring intervention"""
        anomalies = []
        
        # CPU Check
        if metrics.get("cpu_percent", 0) > self.cpu_threshold:
            anomalies.append({
                "type": "resource_exhaustion",
                "resource": "cpu",
                "value": metrics["cpu_percent"],
                "severity": "high"
            })
            
        # Memory Check
        if metrics.get("memory_percent", 0) > self.memory_threshold:
            anomalies.append({
                "type": "resource_exhaustion",
                "resource": "memory",
                "value": metrics["memory_percent"],
                "severity": "critical"
            })
            
        # Evolution Errors (if we can infer them)
        # Note: In a real implementation we'd hook into the error logs more directly
        
        return anomalies

    async def _execute_recovery(self, anomalies: List[Dict[str, Any]]) -> List[str]:
        """Execute recovery strategies based on anomaly type"""
        actions = []
        
        for anomaly in anomalies:
            if anomaly["type"] == "resource_exhaustion":
                if anomaly["resource"] == "memory":
                    # Action: Trigger GC and Cache Clearing
                    import gc
                    gc.collect()
                    actions.append("triggers_garbage_collection")
                    
                    # Suggest cooldown to Daemon
                    if hasattr(self.evolution_daemon, "enter_conservation_mode"):
                        self.evolution_daemon.enter_conservation_mode()
                        actions.append("entered_conservation_mode")
                        
                elif anomaly["resource"] == "cpu":
                    actions.append("throttle_evolution_cycles")
                    
        return actions

    async def health_report(self) -> str:
        """Generate human-readable health status"""
        if not self.health_history:
            return "No health data available yet."
            
        latest = self.health_history[-1]
        status = "HEALTHY" if not latest["anomalies"] else "DEGRADED"
        
        return f"""
        System Health: {status}
        CPU: {latest['metrics'].get('cpu_percent', 'N/A')}%
        Memory: {latest['metrics'].get('memory_percent', 'N/A')}%
        Last Check: {latest['timestamp']}
        Recent Incidents: {len(self.recovery_log)}
        """
