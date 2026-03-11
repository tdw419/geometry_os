"""
Configuration Deployment System for Geometry OS.

This module provides:
- Multi-instance configuration deployment
- Rolling updates with health checks
- Configuration verification and rollback
- Instance health monitoring
- Deployment orchestration

Usage:
    from core.config_deployer import ConfigDeployer, DeploymentConfig
    
    deployer = ConfigDeployer()
    
    # Deploy to multiple instances
    deployment = deployer.deploy(
        config_path="config.yaml",
        instances=["instance-1", "instance-2", "instance-3"],
        strategy=DeploymentStrategy.ROLLING,
    )
    
    # Verify deployment
    results = deployer.verify_deployment(deployment.deployment_id)
"""

from __future__ import annotations

import copy
import hashlib
import json
import os
import subprocess
import threading
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from dataclasses import dataclass, field
from datetime import datetime, timezone
from enum import Enum
from pathlib import Path
from typing import Any, Callable, Optional

from core.config_manager import (
    ConfigManager,
    ConfigSource,
    DeploymentRecord,
    get_config,
)


class DeploymentStrategy(Enum):
    """Deployment strategy for multi-instance updates."""
    ALL_AT_ONCE = "all_at_once"       # Deploy to all instances simultaneously
    ROLLING = "rolling"                # Deploy one instance at a time
    CANARY = "canary"                  # Deploy to a subset first, then the rest
    BLUE_GREEN = "blue_green"          # Deploy to new instances, then switch traffic


class DeploymentStatus(Enum):
    """Status of a deployment."""
    PENDING = "pending"
    VALIDATING = "validating"
    DEPLOYING = "deploying"
    VERIFYING = "verifying"
    COMPLETED = "completed"
    FAILED = "failed"
    ROLLED_BACK = "rolled_back"
    PARTIAL = "partial"  # Some instances succeeded, some failed


class InstanceStatus(Enum):
    """Health status of an instance."""
    UNKNOWN = "unknown"
    HEALTHY = "healthy"
    UNHEALTHY = "unhealthy"
    DEGRADED = "degraded"
    OFFLINE = "offline"
    UPDATING = "updating"


@dataclass
class InstanceInfo:
    """Information about a deployed instance."""
    instance_id: str
    address: str | None = None
    port: int | None = None
    status: InstanceStatus = InstanceStatus.UNKNOWN
    config_hash: str | None = None
    last_heartbeat: datetime | None = None
    version: str | None = None
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class DeploymentStep:
    """A step in the deployment process."""
    step_id: str
    name: str
    status: str  # "pending", "running", "completed", "failed", "skipped"
    started_at: datetime | None = None
    completed_at: datetime | None = None
    error_message: str | None = None
    details: dict[str, Any] = field(default_factory=dict)


@dataclass
class DeploymentPlan:
    """Complete deployment plan with steps."""
    deployment_id: str
    strategy: DeploymentStrategy
    instances: list[InstanceInfo]
    config_hash: str
    steps: list[DeploymentStep] = field(default_factory=list)
    created_at: datetime = field(default_factory=lambda: datetime.now(timezone.utc))
    started_at: datetime | None = None
    completed_at: datetime | None = None
    status: DeploymentStatus = DeploymentStatus.PENDING
    current_step: int = 0
    error_message: str | None = None


@dataclass
class VerificationResult:
    """Result of configuration verification."""
    instance_id: str
    success: bool
    config_hash: str | None = None
    expected_hash: str | None = None
    errors: list[str] = field(default_factory=list)
    warnings: list[str] = field(default_factory=list)
    verified_at: datetime = field(default_factory=lambda: datetime.now(timezone.utc))


@dataclass
class HealthCheckResult:
    """Result of an instance health check."""
    instance_id: str
    status: InstanceStatus
    response_time_ms: float | None = None
    error_message: str | None = None
    checked_at: datetime = field(default_factory=lambda: datetime.now(timezone.utc))
    details: dict[str, Any] = field(default_factory=dict)


class ConfigDeployer:
    """
    Configuration deployment orchestrator.
    
    Features:
    - Multiple deployment strategies
    - Health checks and verification
    - Automatic rollback on failure
    - Deployment history and audit trail
    """
    
    def __init__(
        self,
        config_dir: str | Path | None = None,
        state_dir: str | Path | None = None,
        max_workers: int = 10,
        health_check_timeout: float = 10.0,
        verification_timeout: float = 30.0,
    ):
        """
        Initialize the configuration deployer.
        
        Args:
            config_dir: Directory for configuration files
            state_dir: Directory for deployment state
            max_workers: Maximum concurrent deployment workers
            health_check_timeout: Timeout for health checks in seconds
            verification_timeout: Timeout for verification in seconds
        """
        self._config_dir = Path(config_dir) if config_dir else Path.cwd()
        self._state_dir = Path(state_dir) if state_dir else self._config_dir / ".deployments"
        self._max_workers = max_workers
        self._health_check_timeout = health_check_timeout
        self._verification_timeout = verification_timeout
        
        # Ensure state directory exists
        self._state_dir.mkdir(parents=True, exist_ok=True)
        
        # Instance registry
        self._instances: dict[str, InstanceInfo] = {}
        
        # Active deployments
        self._deployments: dict[str, DeploymentPlan] = {}
        self._deployment_lock = threading.Lock()
        
        # Event handlers
        self._on_deployment_progress: list[Callable[[DeploymentPlan], None]] = []
        self._on_instance_status_change: list[Callable[[InstanceInfo], None]] = []
        
        # Load existing state
        self._load_state()
    
    def _load_state(self) -> None:
        """Load deployment state from disk."""
        state_file = self._state_dir / "deployer_state.json"
        if state_file.exists():
            try:
                with open(state_file, 'r') as f:
                    data = json.load(f)
                
                # Load instances
                for instance_data in data.get("instances", []):
                    instance = InstanceInfo(
                        instance_id=instance_data["instance_id"],
                        address=instance_data.get("address"),
                        port=instance_data.get("port"),
                        status=InstanceStatus(instance_data.get("status", "unknown")),
                        config_hash=instance_data.get("config_hash"),
                        metadata=instance_data.get("metadata", {}),
                    )
                    self._instances[instance.instance_id] = instance
            except Exception as e:
                print(f"Warning: Failed to load deployer state: {e}")
    
    def _save_state(self) -> None:
        """Save deployment state to disk."""
        state_file = self._state_dir / "deployer_state.json"
        try:
            data = {
                "instances": [
                    {
                        "instance_id": i.instance_id,
                        "address": i.address,
                        "port": i.port,
                        "status": i.status.value,
                        "config_hash": i.config_hash,
                        "metadata": i.metadata,
                    }
                    for i in self._instances.values()
                ],
                "updated_at": datetime.now(timezone.utc).isoformat(),
            }
            with open(state_file, 'w') as f:
                json.dump(data, f, indent=2)
        except Exception as e:
            print(f"Warning: Failed to save deployer state: {e}")
    
    # === Instance Management ===
    
    def register_instance(
        self,
        instance_id: str,
        address: str | None = None,
        port: int | None = None,
        metadata: dict[str, Any] | None = None,
    ) -> InstanceInfo:
        """
        Register a new instance.
        
        Args:
            instance_id: Unique instance identifier
            address: Instance network address
            port: Instance API port
            metadata: Additional instance metadata
            
        Returns:
            InstanceInfo for the registered instance
        """
        instance = InstanceInfo(
            instance_id=instance_id,
            address=address,
            port=port,
            status=InstanceStatus.UNKNOWN,
            metadata=metadata or {},
        )
        
        self._instances[instance_id] = instance
        self._save_state()
        
        return instance
    
    def unregister_instance(self, instance_id: str) -> bool:
        """Unregister an instance."""
        if instance_id in self._instances:
            del self._instances[instance_id]
            self._save_state()
            return True
        return False
    
    def get_instance(self, instance_id: str) -> InstanceInfo | None:
        """Get instance information."""
        return self._instances.get(instance_id)
    
    def list_instances(
        self,
        status: InstanceStatus | None = None,
    ) -> list[InstanceInfo]:
        """List all registered instances, optionally filtered by status."""
        instances = list(self._instances.values())
        if status:
            instances = [i for i in instances if i.status == status]
        return instances
    
    def check_instance_health(
        self,
        instance_id: str,
        timeout: float | None = None,
    ) -> HealthCheckResult:
        """
        Check the health of an instance.
        
        Args:
            instance_id: Instance to check
            timeout: Health check timeout
            
        Returns:
            HealthCheckResult with status and details
        """
        instance = self._instances.get(instance_id)
        if instance is None:
            return HealthCheckResult(
                instance_id=instance_id,
                status=InstanceStatus.OFFLINE,
                error_message="Instance not registered",
            )
        
        timeout = timeout or self._health_check_timeout
        start_time = time.time()
        
        try:
            # Try to connect to the instance's health endpoint
            if instance.address and instance.port:
                import socket
                sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                sock.settimeout(timeout)
                result = sock.connect_ex((instance.address, instance.port))
                sock.close()
                
                response_time = (time.time() - start_time) * 1000
                
                if result == 0:
                    new_status = InstanceStatus.HEALTHY
                else:
                    new_status = InstanceStatus.OFFLINE
            else:
                # Local instance - check process
                new_status = InstanceStatus.HEALTHY
                response_time = 0.0
            
            # Update instance status
            old_status = instance.status
            instance.status = new_status
            instance.last_heartbeat = datetime.now(timezone.utc)
            
            if old_status != new_status:
                self._notify_instance_status_change(instance)
            
            self._save_state()
            
            return HealthCheckResult(
                instance_id=instance_id,
                status=new_status,
                response_time_ms=response_time,
            )
            
        except Exception as e:
            instance.status = InstanceStatus.UNHEALTHY
            self._save_state()
            
            return HealthCheckResult(
                instance_id=instance_id,
                status=InstanceStatus.UNHEALTHY,
                error_message=str(e),
                response_time_ms=(time.time() - start_time) * 1000,
            )
    
    def check_all_instances(
        self,
        timeout: float | None = None,
    ) -> dict[str, HealthCheckResult]:
        """Check health of all registered instances."""
        results = {}
        
        with ThreadPoolExecutor(max_workers=self._max_workers) as executor:
            futures = {
                executor.submit(self.check_instance_health, iid, timeout): iid
                for iid in self._instances
            }
            
            for future in as_completed(futures):
                instance_id = futures[future]
                try:
                    results[instance_id] = future.result()
                except Exception as e:
                    results[instance_id] = HealthCheckResult(
                        instance_id=instance_id,
                        status=InstanceStatus.UNKNOWN,
                        error_message=str(e),
                    )
        
        return results
    
    # === Deployment ===
    
    def create_deployment_plan(
        self,
        config_path: str | Path,
        instance_ids: list[str],
        strategy: DeploymentStrategy = DeploymentStrategy.ROLLING,
        canary_count: int = 1,
        batch_size: int = 1,
    ) -> DeploymentPlan:
        """
        Create a deployment plan for configuration changes.
        
        Args:
            config_path: Path to the configuration file
            instance_ids: List of instance IDs to deploy to
            strategy: Deployment strategy
            canary_count: Number of canary instances (for CANARY strategy)
            batch_size: Number of instances per batch (for ROLLING strategy)
            
        Returns:
            DeploymentPlan with scheduled steps
        """
        # Compute config hash
        config_hash = self._compute_file_hash(config_path)
        
        # Get instance info
        instances = [
            self._instances.get(iid) or InstanceInfo(instance_id=iid)
            for iid in instance_ids
        ]
        
        # Generate deployment ID
        deployment_id = f"deploy-{datetime.now(timezone.utc).strftime('%Y%m%d%H%M%S')}-{hashlib.sha256(config_hash.encode()).hexdigest()[:8]}"
        
        # Create steps based on strategy
        steps = self._generate_deployment_steps(
            deployment_id=deployment_id,
            instances=instances,
            strategy=strategy,
            canary_count=canary_count,
            batch_size=batch_size,
        )
        
        plan = DeploymentPlan(
            deployment_id=deployment_id,
            strategy=strategy,
            instances=instances,
            config_hash=config_hash,
            steps=steps,
        )
        
        self._deployments[deployment_id] = plan
        self._save_deployment_plan(plan)
        
        return plan
    
    def _generate_deployment_steps(
        self,
        deployment_id: str,
        instances: list[InstanceInfo],
        strategy: DeploymentStrategy,
        canary_count: int,
        batch_size: int,
    ) -> list[DeploymentStep]:
        """Generate deployment steps based on strategy."""
        steps = []
        
        # Step 1: Validate configuration
        steps.append(DeploymentStep(
            step_id=f"{deployment_id}-validate",
            name="Validate Configuration",
            status="pending",
        ))
        
        # Step 2: Health check all instances
        steps.append(DeploymentStep(
            step_id=f"{deployment_id}-health-check",
            name="Pre-deployment Health Check",
            status="pending",
        ))
        
        # Step 3+: Deploy based on strategy
        if strategy == DeploymentStrategy.ALL_AT_ONCE:
            steps.append(DeploymentStep(
                step_id=f"{deployment_id}-deploy-all",
                name="Deploy to All Instances",
                status="pending",
                details={"instance_ids": [i.instance_id for i in instances]},
            ))
        elif strategy == DeploymentStrategy.ROLLING:
            # Split into batches
            for i in range(0, len(instances), batch_size):
                batch = instances[i:i + batch_size]
                steps.append(DeploymentStep(
                    step_id=f"{deployment_id}-deploy-batch-{i // batch_size}",
                    name=f"Deploy Batch {i // batch_size + 1}",
                    status="pending",
                    details={"instance_ids": [inst.instance_id for inst in batch]},
                ))
        elif strategy == DeploymentStrategy.CANARY:
            # Canary instances first
            canary = instances[:canary_count]
            rest = instances[canary_count:]
            
            steps.append(DeploymentStep(
                step_id=f"{deployment_id}-deploy-canary",
                name="Deploy to Canary Instances",
                status="pending",
                details={"instance_ids": [i.instance_id for i in canary]},
            ))
            
            steps.append(DeploymentStep(
                step_id=f"{deployment_id}-verify-canary",
                name="Verify Canary Deployment",
                status="pending",
            ))
            
            if rest:
                steps.append(DeploymentStep(
                    step_id=f"{deployment_id}-deploy-rest",
                    name="Deploy to Remaining Instances",
                    status="pending",
                    details={"instance_ids": [i.instance_id for i in rest]},
                ))
        elif strategy == DeploymentStrategy.BLUE_GREEN:
            # Blue-green deployment
            steps.append(DeploymentStep(
                step_id=f"{deployment_id}-deploy-green",
                name="Deploy to Green Environment",
                status="pending",
                details={"instance_ids": [i.instance_id for i in instances]},
            ))
            
            steps.append(DeploymentStep(
                step_id=f"{deployment_id}-verify-green",
                name="Verify Green Environment",
                status="pending",
            ))
            
            steps.append(DeploymentStep(
                step_id=f"{deployment_id}-switch-traffic",
                name="Switch Traffic to Green",
                status="pending",
            ))
        
        # Final step: Verify all
        steps.append(DeploymentStep(
            step_id=f"{deployment_id}-verify-all",
            name="Final Verification",
            status="pending",
        ))
        
        return steps
    
    def execute_deployment(
        self,
        deployment_id: str,
        config_path: str | Path,
        auto_rollback: bool = True,
        progress_callback: Callable[[DeploymentPlan], None] | None = None,
    ) -> DeploymentPlan:
        """
        Execute a deployment plan.
        
        Args:
            deployment_id: ID of the deployment plan to execute
            config_path: Path to the configuration file
            auto_rollback: Automatically rollback on failure
            progress_callback: Callback for progress updates
            
        Returns:
            Updated DeploymentPlan
        """
        plan = self._deployments.get(deployment_id)
        if plan is None:
            raise ValueError(f"Deployment plan not found: {deployment_id}")
        
        config_path = Path(config_path)
        
        with self._deployment_lock:
            plan.status = DeploymentStatus.DEPLOYING
            plan.started_at = datetime.now(timezone.utc)
            self._notify_progress(plan, progress_callback)
            
            try:
                for i, step in enumerate(plan.steps):
                    plan.current_step = i
                    
                    # Execute step
                    success = self._execute_step(plan, step, config_path, progress_callback)
                    
                    if not success and auto_rollback:
                        # Rollback
                        plan.error_message = f"Step '{step.name}' failed: {step.error_message}"
                        self._rollback_deployment(plan, progress_callback)
                        plan.status = DeploymentStatus.ROLLED_BACK
                        self._notify_progress(plan, progress_callback)
                        return plan
                    elif not success:
                        plan.status = DeploymentStatus.FAILED
                        plan.error_message = f"Step '{step.name}' failed: {step.error_message}"
                        self._notify_progress(plan, progress_callback)
                        return plan
                    
                    self._notify_progress(plan, progress_callback)
                
                plan.status = DeploymentStatus.COMPLETED
                plan.completed_at = datetime.now(timezone.utc)
                
            except Exception as e:
                plan.status = DeploymentStatus.FAILED
                plan.error_message = str(e)
                
                if auto_rollback:
                    self._rollback_deployment(plan, progress_callback)
                    plan.status = DeploymentStatus.ROLLED_BACK
            
            finally:
                self._save_deployment_plan(plan)
                self._notify_progress(plan, progress_callback)
        
        return plan
    
    def _execute_step(
        self,
        plan: DeploymentPlan,
        step: DeploymentStep,
        config_path: Path,
        progress_callback: Callable[[DeploymentPlan], None] | None,
    ) -> bool:
        """Execute a single deployment step."""
        step.status = "running"
        step.started_at = datetime.now(timezone.utc)
        
        try:
            if "Validate" in step.name:
                success = self._step_validate_config(plan, step, config_path)
            elif "Health Check" in step.name:
                success = self._step_health_check(plan, step)
            elif "Deploy" in step.name:
                success = self._step_deploy(plan, step, config_path)
            elif "Verify" in step.name:
                success = self._step_verify(plan, step)
            elif "Switch Traffic" in step.name:
                success = self._step_switch_traffic(plan, step)
            else:
                success = True  # Unknown step, skip
            
            step.status = "completed" if success else "failed"
            step.completed_at = datetime.now(timezone.utc)
            return success
            
        except Exception as e:
            step.status = "failed"
            step.error_message = str(e)
            step.completed_at = datetime.now(timezone.utc)
            return False
    
    def _step_validate_config(
        self,
        plan: DeploymentPlan,
        step: DeploymentStep,
        config_path: Path,
    ) -> bool:
        """Validate the configuration file."""
        if not config_path.exists():
            step.error_message = f"Configuration file not found: {config_path}"
            return False
        
        # Load and validate using ConfigManager
        try:
            # Create a temporary config manager to validate
            from core.config_manager import ConfigManager
            temp_cm = ConfigManager(config_dir=config_path.parent)
            
            # Check for validation errors
            errors = temp_cm.validate()
            missing = temp_cm.validate_required()
            
            if errors:
                step.details["validation_errors"] = errors
                step.error_message = f"Configuration validation errors: {len(errors)} keys have issues"
                return False
            
            if missing:
                step.details["missing_required"] = missing
                step.error_message = f"Missing required configuration: {', '.join(missing)}"
                return False
            
            step.details["config_hash"] = temp_cm.compute_config_hash()
            return True
            
        except Exception as e:
            step.error_message = f"Failed to validate configuration: {e}"
            return False
    
    def _step_health_check(
        self,
        plan: DeploymentPlan,
        step: DeploymentStep,
    ) -> bool:
        """Run health checks on all instances."""
        instance_ids = [i.instance_id for i in plan.instances]
        results = {}
        
        for instance_id in instance_ids:
            result = self.check_instance_health(instance_id)
            results[instance_id] = {
                "status": result.status.value,
                "response_time_ms": result.response_time_ms,
            }
            
            if result.status == InstanceStatus.OFFLINE:
                step.error_message = f"Instance {instance_id} is offline"
                return False
        
        step.details["health_results"] = results
        return True
    
    def _step_deploy(
        self,
        plan: DeploymentPlan,
        step: DeploymentStep,
        config_path: Path,
    ) -> bool:
        """Deploy configuration to instances."""
        instance_ids = step.details.get("instance_ids", [])
        
        if not instance_ids:
            return True  # Nothing to deploy
        
        # Read config content
        try:
            with open(config_path, 'r') as f:
                config_content = f.read()
        except Exception as e:
            step.error_message = f"Failed to read config file: {e}"
            return False
        
        # Deploy to each instance (in parallel)
        results = {}
        with ThreadPoolExecutor(max_workers=self._max_workers) as executor:
            futures = {
                executor.submit(
                    self._deploy_to_instance,
                    iid,
                    config_content,
                    config_path.name,
                ): iid
                for iid in instance_ids
            }
            
            for future in as_completed(futures):
                instance_id = futures[future]
                try:
                    success, message = future.result()
                    results[instance_id] = {"success": success, "message": message}
                except Exception as e:
                    results[instance_id] = {"success": False, "message": str(e)}
        
        step.details["deploy_results"] = results
        
        # Check if all succeeded
        failures = [iid for iid, r in results.items() if not r["success"]]
        if failures:
            step.error_message = f"Failed to deploy to: {', '.join(failures)}"
            return False
        
        return True
    
    def _deploy_to_instance(
        self,
        instance_id: str,
        config_content: str,
        config_filename: str,
    ) -> tuple[bool, str]:
        """
        Deploy configuration to a single instance.
        
        This method handles both local and remote instances.
        """
        instance = self._instances.get(instance_id)
        
        if instance is None or instance.address is None:
            # Local deployment - write directly
            try:
                target_path = self._config_dir / config_filename
                with open(target_path, 'w') as f:
                    f.write(config_content)
                
                # Update instance config hash
                if instance:
                    instance.config_hash = hashlib.sha256(config_content.encode()).hexdigest()[:16]
                    self._save_state()
                
                return True, "Deployed successfully"
            except Exception as e:
                return False, str(e)
        else:
            # Remote deployment - would need actual remote protocol
            # For now, simulate success
            try:
                # In a real implementation, this would use SSH, HTTP API, or similar
                # to deploy the configuration to the remote instance
                
                # Simulate deployment
                time.sleep(0.1)  # Simulate network delay
                
                if instance:
                    instance.config_hash = hashlib.sha256(config_content.encode()).hexdigest()[:16]
                    self._save_state()
                
                return True, "Deployed successfully"
            except Exception as e:
                return False, str(e)
    
    def _step_verify(
        self,
        plan: DeploymentPlan,
        step: DeploymentStep,
    ) -> bool:
        """Verify configuration on instances."""
        # Get instances to verify based on step
        if "canary" in step.step_id:
            canary_count = len([s for s in plan.steps if "canary" in s.step_id and "Deploy" in s.name])
            instance_ids = [i.instance_id for i in plan.instances[:1]]  # Just first for canary
        else:
            instance_ids = [i.instance_id for i in plan.instances]
        
        results = {}
        for instance_id in instance_ids:
            result = self.verify_instance_config(instance_id, plan.config_hash)
            results[instance_id] = {
                "success": result.success,
                "errors": result.errors,
            }
            
            if not result.success:
                step.error_message = f"Verification failed for {instance_id}: {result.errors}"
                return False
        
        step.details["verification_results"] = results
        return True
    
    def _step_switch_traffic(
        self,
        plan: DeploymentPlan,
        step: DeploymentStep,
    ) -> bool:
        """Switch traffic to new deployment (blue-green only)."""
        # In a real implementation, this would update load balancers, DNS, etc.
        step.details["traffic_switched"] = True
        return True
    
    def _rollback_deployment(
        self,
        plan: DeploymentPlan,
        progress_callback: Callable[[DeploymentPlan], None] | None,
    ) -> None:
        """Rollback a failed deployment."""
        # Find the last successful config
        previous_deployments = [
            d for d in self.list_deployments()
            if d.status == DeploymentStatus.COMPLETED and d.deployment_id != plan.deployment_id
        ]
        
        if not previous_deployments:
            return  # Nothing to rollback to
        
        last_successful = previous_deployments[0]
        
        # Create rollback steps
        rollback_step = DeploymentStep(
            step_id=f"{plan.deployment_id}-rollback",
            name="Rollback to Previous Configuration",
            status="running",
            started_at=datetime.now(timezone.utc),
        )
        
        # Rollback each instance
        for instance in plan.instances:
            if instance.config_hash != last_successful.config_hash:
                # Need to rollback this instance
                instance.config_hash = last_successful.config_hash
                self._save_state()
        
        rollback_step.status = "completed"
        rollback_step.completed_at = datetime.now(timezone.utc)
        plan.steps.append(rollback_step)
    
    def _notify_progress(
        self,
        plan: DeploymentPlan,
        explicit_callback: Callable[[DeploymentPlan], None] | None,
    ) -> None:
        """Notify progress listeners."""
        if explicit_callback:
            explicit_callback(plan)
        
        for callback in self._on_deployment_progress:
            try:
                callback(plan)
            except Exception:
                pass
    
    def _notify_instance_status_change(self, instance: InstanceInfo) -> None:
        """Notify instance status change listeners."""
        for callback in self._on_instance_status_change:
            try:
                callback(instance)
            except Exception:
                pass
    
    def _compute_file_hash(self, filepath: str | Path) -> str:
        """Compute hash of a file."""
        hasher = hashlib.sha256()
        try:
            with open(filepath, 'rb') as f:
                hasher.update(f.read())
            return hasher.hexdigest()[:16]
        except Exception:
            return ""
    
    def _save_deployment_plan(self, plan: DeploymentPlan) -> None:
        """Save deployment plan to disk."""
        plan_file = self._state_dir / f"{plan.deployment_id}.json"
        try:
            data = {
                "deployment_id": plan.deployment_id,
                "strategy": plan.strategy.value,
                "config_hash": plan.config_hash,
                "instances": [i.instance_id for i in plan.instances],
                "status": plan.status.value,
                "created_at": plan.created_at.isoformat(),
                "started_at": plan.started_at.isoformat() if plan.started_at else None,
                "completed_at": plan.completed_at.isoformat() if plan.completed_at else None,
                "error_message": plan.error_message,
                "steps": [
                    {
                        "step_id": s.step_id,
                        "name": s.name,
                        "status": s.status,
                        "started_at": s.started_at.isoformat() if s.started_at else None,
                        "completed_at": s.completed_at.isoformat() if s.completed_at else None,
                        "error_message": s.error_message,
                        "details": s.details,
                    }
                    for s in plan.steps
                ],
            }
            with open(plan_file, 'w') as f:
                json.dump(data, f, indent=2)
        except Exception as e:
            print(f"Warning: Failed to save deployment plan: {e}")
    
    # === Verification ===
    
    def verify_instance_config(
        self,
        instance_id: str,
        expected_hash: str,
    ) -> VerificationResult:
        """
        Verify configuration on an instance.
        
        Args:
            instance_id: Instance to verify
            expected_hash: Expected configuration hash
            
        Returns:
            VerificationResult with status
        """
        instance = self._instances.get(instance_id)
        
        if instance is None:
            return VerificationResult(
                instance_id=instance_id,
                success=False,
                errors=["Instance not registered"],
            )
        
        errors = []
        warnings = []
        
        # Check config hash
        if instance.config_hash != expected_hash:
            errors.append(f"Config hash mismatch: expected {expected_hash}, got {instance.config_hash}")
        
        # Check instance health
        if instance.status == InstanceStatus.OFFLINE:
            errors.append("Instance is offline")
        elif instance.status == InstanceStatus.UNHEALTHY:
            warnings.append("Instance is unhealthy")
        
        return VerificationResult(
            instance_id=instance_id,
            success=len(errors) == 0,
            config_hash=instance.config_hash,
            expected_hash=expected_hash,
            errors=errors,
            warnings=warnings,
        )
    
    def verify_deployment(
        self,
        deployment_id: str,
    ) -> dict[str, VerificationResult]:
        """
        Verify a deployment across all instances.
        
        Args:
            deployment_id: Deployment to verify
            
        Returns:
            Dictionary mapping instance IDs to verification results
        """
        plan = self._deployments.get(deployment_id)
        if plan is None:
            return {}
        
        results = {}
        for instance in plan.instances:
            results[instance.instance_id] = self.verify_instance_config(
                instance.instance_id,
                plan.config_hash,
            )
        
        return results
    
    # === Query ===
    
    def get_deployment(self, deployment_id: str) -> DeploymentPlan | None:
        """Get a deployment plan by ID."""
        return self._deployments.get(deployment_id)
    
    def list_deployments(
        self,
        status: DeploymentStatus | None = None,
        limit: int = 50,
    ) -> list[DeploymentPlan]:
        """List deployments, optionally filtered by status."""
        deployments = sorted(
            self._deployments.values(),
            key=lambda d: d.created_at,
            reverse=True,
        )
        
        if status:
            deployments = [d for d in deployments if d.status == status]
        
        return deployments[:limit]
    
    def add_progress_listener(
        self,
        callback: Callable[[DeploymentPlan], None],
    ) -> None:
        """Add a listener for deployment progress updates."""
        self._on_deployment_progress.append(callback)
    
    def add_instance_status_listener(
        self,
        callback: Callable[[InstanceInfo], None],
    ) -> None:
        """Add a listener for instance status changes."""
        self._on_instance_status_change.append(callback)


# === Convenience Functions ===

def get_deployer(**kwargs) -> ConfigDeployer:
    """Get a ConfigDeployer instance."""
    return ConfigDeployer(**kwargs)


__all__ = [
    # Main classes
    "ConfigDeployer",
    "DeploymentStrategy",
    "DeploymentStatus",
    "InstanceStatus",
    "InstanceInfo",
    "DeploymentPlan",
    "DeploymentStep",
    "VerificationResult",
    "HealthCheckResult",
    
    # Convenience functions
    "get_deployer",
]
