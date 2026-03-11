#!/usr/bin/env python3
"""
Configuration Deployment Verification Script.

This script demonstrates and verifies the centralized configuration
management system by deploying configurations to multiple simulated
instances and verifying stability.

Usage:
    python scripts/verify_config_deployment.py
"""

from __future__ import annotations

import json
import sys
import time
from datetime import datetime, timezone
from pathlib import Path

# Add parent to path
sys.path.insert(0, str(Path(__file__).parent.parent))

from core.config_manager import (
    ConfigManager,
    ConfigSource,
    get_config,
    reset_config,
)
from core.config_deployer import (
    ConfigDeployer,
    DeploymentStrategy,
    DeploymentStatus,
    InstanceStatus,
)


def print_header(title: str) -> None:
    """Print a section header."""
    print(f"\n{'=' * 60}")
    print(f" {title}")
    print('=' * 60)


def print_result(test: str, success: bool, details: str = "") -> None:
    """Print a test result."""
    icon = "✓" if success else "✗"
    status = "PASS" if success else "FAIL"
    print(f"  {icon} {test}: {status}")
    if details:
        print(f"      {details}")


def verify_config_loading() -> bool:
    """Verify configuration can be loaded from files."""
    print_header("1. Configuration Loading")
    
    reset_config()
    config = get_config()
    
    all_passed = True
    
    # Check defaults loaded
    defaults_ok = config.get("debug_mode") is False
    print_result("Default values loaded", defaults_ok)
    all_passed &= defaults_ok
    
    # Check schema validation
    validation = config.validate()
    valid = len(config.validate_required()) == 0
    print_result("Schema validation", valid, f"{len(validation)} errors")
    all_passed &= valid
    
    # Check config hash generation
    hash1 = config.compute_config_hash()
    hash_ok = len(hash1) == 16
    print_result("Config hash generation", hash_ok, f"hash: {hash1}")
    all_passed &= hash_ok
    
    return all_passed


def verify_type_safety() -> bool:
    """Verify type-safe configuration access."""
    print_header("2. Type Safety")
    
    reset_config()
    config = get_config()
    
    all_passed = True
    
    # Integer access
    fps = config.get_int("visual_shell.fps_target")
    int_ok = isinstance(fps, int) and fps == 60
    print_result("Integer access", int_ok, f"fps_target = {fps}")
    all_passed &= int_ok
    
    # Boolean access
    debug = config.get_bool("debug_mode")
    bool_ok = isinstance(debug, bool) and debug is False
    print_result("Boolean access", bool_ok, f"debug_mode = {debug}")
    all_passed &= bool_ok
    
    # String access
    log_level = config.get_string("log_level")
    str_ok = log_level == "INFO"
    print_result("String access", str_ok, f"log_level = {log_level}")
    all_passed &= str_ok
    
    # Section access
    neural = config.get_section("neural")
    section_ok = "inference_device" in neural
    print_result("Section access", section_ok, f"neural keys: {list(neural.keys())}")
    all_passed &= section_ok
    
    return all_passed


def verify_validation() -> bool:
    """Verify configuration validation."""
    print_header("3. Configuration Validation")
    
    reset_config()
    config = get_config()
    
    all_passed = True
    
    # Test valid value
    config.set("visual_shell.fps_target", 120)
    errors = config.validate()
    valid_ok = "visual_shell.fps_target" not in errors
    print_result("Valid value passes", valid_ok, "fps=120")
    all_passed &= valid_ok
    
    # Test invalid value (too high)
    config.set("visual_shell.fps_target", 500)
    errors = config.validate()
    invalid_ok = "visual_shell.fps_target" in errors
    print_result("Invalid value rejected", invalid_ok, "fps=500 (max=240)")
    all_passed &= invalid_ok
    
    # Test invalid enum value
    config.set("log_level", "INVALID")
    errors = config.validate()
    enum_ok = "log_level" in errors
    print_result("Invalid enum rejected", enum_ok, "log_level=INVALID")
    all_passed &= enum_ok
    
    return all_passed


def verify_instance_management() -> bool:
    """Verify instance registration and health checking."""
    print_header("4. Instance Management")
    
    # Use unique instance IDs to avoid conflicts with other tests
    import time
    unique_id = str(int(time.time() * 1000))[-6:]
    
    deployer = ConfigDeployer()
    
    all_passed = True
    
    # Register instances with unique IDs
    instance_ids = [f"test-inst-{unique_id}-{i}" for i in range(3)]
    instances = []
    for iid in instance_ids:
        inst = deployer.register_instance(
            instance_id=iid,
            address=None,  # Local
            port=8080,
            metadata={"env": "test"},
        )
        instances.append(inst)
    
    reg_ok = all(deployer.get_instance(iid) is not None for iid in instance_ids)
    print_result("Instance registration", reg_ok, "3 instances registered")
    all_passed &= reg_ok
    
    # Health check specific instances
    results = {}
    for iid in instance_ids:
        results[iid] = deployer.check_instance_health(iid)
    health_ok = all(r.status == InstanceStatus.HEALTHY for r in results.values())
    print_result("Health checking", health_ok, f"{len(results)} instances checked")
    all_passed &= health_ok
    
    # Verify our instances are in the list
    all_instances = deployer.list_instances()
    filter_ok = all(iid in [i.instance_id for i in all_instances] for iid in instance_ids)
    print_result("Instance listing", filter_ok, f"{len(instance_ids)} found in {len(all_instances)} total")
    all_passed &= filter_ok
    
    return all_passed


def verify_deployment_strategies() -> bool:
    """Verify different deployment strategies."""
    print_header("5. Deployment Strategies")
    
    config_dir = Path(__file__).parent.parent
    config_file = config_dir / "config.yaml"
    
    deployer = ConfigDeployer(config_dir=config_dir)
    
    # Register instances
    for i in range(5):
        deployer.register_instance(f"deploy-test-{i}")
    
    all_passed = True
    
    # Test ALL_AT_ONCE strategy
    plan_all = deployer.create_deployment_plan(
        config_path=config_file,
        instance_ids=[f"deploy-test-{i}" for i in range(5)],
        strategy=DeploymentStrategy.ALL_AT_ONCE,
    )
    deploy_steps = [s for s in plan_all.steps if "Deploy" in s.name]
    all_at_once_ok = len(deploy_steps) == 1
    print_result("ALL_AT_ONCE strategy", all_at_once_ok, f"{len(deploy_steps)} deploy step(s)")
    all_passed &= all_at_once_ok
    
    # Test ROLLING strategy
    plan_rolling = deployer.create_deployment_plan(
        config_path=config_file,
        instance_ids=[f"deploy-test-{i}" for i in range(5)],
        strategy=DeploymentStrategy.ROLLING,
        batch_size=2,
    )
    deploy_steps = [s for s in plan_rolling.steps if "Deploy" in s.name]
    rolling_ok = len(deploy_steps) == 3  # ceil(5/2) = 3 batches
    print_result("ROLLING strategy", rolling_ok, f"{len(deploy_steps)} batches")
    all_passed &= rolling_ok
    
    # Test CANARY strategy
    plan_canary = deployer.create_deployment_plan(
        config_path=config_file,
        instance_ids=[f"deploy-test-{i}" for i in range(5)],
        strategy=DeploymentStrategy.CANARY,
        canary_count=1,
    )
    canary_steps = [s for s in plan_canary.steps if "canary" in s.step_id.lower()]
    canary_ok = len(canary_steps) >= 1
    print_result("CANARY strategy", canary_ok, f"{len(canary_steps)} canary step(s)")
    all_passed &= canary_ok
    
    return all_passed


def verify_deployment_execution() -> bool:
    """Verify deployment execution and verification."""
    print_header("6. Deployment Execution")
    
    config_dir = Path(__file__).parent.parent
    config_file = config_dir / "config.yaml"
    
    deployer = ConfigDeployer(config_dir=config_dir)
    
    # Register instances
    instance_ids = ["exec-test-0", "exec-test-1", "exec-test-2"]
    for iid in instance_ids:
        deployer.register_instance(iid)
    
    all_passed = True
    
    # Create and execute deployment
    plan = deployer.create_deployment_plan(
        config_path=config_file,
        instance_ids=instance_ids,
        strategy=DeploymentStrategy.ROLLING,
        batch_size=1,
    )
    
    create_ok = plan is not None and plan.deployment_id.startswith("deploy-")
    print_result("Plan creation", create_ok, f"ID: {plan.deployment_id[:20]}...")
    all_passed &= create_ok
    
    # Execute
    progress_events = []
    def progress_callback(p):
        progress_events.append(p)
    
    result = deployer.execute_deployment(
        deployment_id=plan.deployment_id,
        config_path=config_file,
        progress_callback=progress_callback,
    )
    
    exec_ok = result.status == DeploymentStatus.COMPLETED
    print_result("Execution completed", exec_ok, f"status: {result.status.value}")
    all_passed &= exec_ok
    
    # Verify deployment
    verification = deployer.verify_deployment(plan.deployment_id)
    verify_ok = len(verification) == len(instance_ids)
    print_result("Verification", verify_ok, f"{len(verification)} instances verified")
    all_passed &= verify_ok
    
    # Check progress tracking
    progress_ok = len(progress_events) > 0
    print_result("Progress tracking", progress_ok, f"{len(progress_events)} events")
    all_passed &= progress_ok
    
    return all_passed


def verify_change_tracking() -> bool:
    """Verify configuration change tracking."""
    print_header("7. Change Tracking")
    
    reset_config()
    config = get_config()
    
    all_passed = True
    
    # Track changes
    changes = []
    config.add_change_listener(lambda e: changes.append(e))
    
    config.set("test_key_1", "value1")
    config.set("test_key_1", "value2")
    config.set("test_key_2", 42)
    
    # Wait for async processing
    time.sleep(0.1)
    
    track_ok = len(changes) >= 3
    print_result("Change tracking", track_ok, f"{len(changes)} changes recorded")
    all_passed &= track_ok
    
    # Check history
    history = config.get_change_history()
    history_ok = len(history) >= 3
    print_result("History retrieval", history_ok, f"{len(history)} events in history")
    all_passed &= history_ok
    
    return all_passed


def verify_export_import() -> bool:
    """Verify configuration export and import."""
    print_header("8. Export/Import")
    
    import tempfile
    
    reset_config()
    config = get_config()
    
    # Set some values
    config.set("export_test_key", "export_value")
    config.set("export_test_int", 123)
    
    all_passed = True
    
    # Export to JSON
    with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
        export_path = Path(f.name)
    
    try:
        config.export_to_json(export_path, pretty=True)
        
        export_ok = export_path.exists()
        print_result("JSON export", export_ok, str(export_path))
        all_passed &= export_ok
        
        # Verify content
        data = json.loads(export_path.read_text())
        content_ok = "export_test_key" in data
        print_result("Export content", content_ok, f"keys: {len(data)}")
        all_passed &= content_ok
        
    finally:
        export_path.unlink(missing_ok=True)
    
    return all_passed


def verify_multi_instance_stability() -> bool:
    """Verify stability with multiple instances."""
    print_header("9. Multi-Instance Stability")
    
    config_dir = Path(__file__).parent.parent
    config_file = config_dir / "config.yaml"
    
    deployer = ConfigDeployer(config_dir=config_dir)
    
    # Simulate multiple instances
    num_instances = 5
    instance_ids = [f"stability-test-{i}" for i in range(num_instances)]
    
    for iid in instance_ids:
        deployer.register_instance(iid)
    
    all_passed = True
    
    # Deploy to all instances
    plan = deployer.create_deployment_plan(
        config_path=config_file,
        instance_ids=instance_ids,
        strategy=DeploymentStrategy.ALL_AT_ONCE,
    )
    
    result = deployer.execute_deployment(
        deployment_id=plan.deployment_id,
        config_path=config_file,
    )
    
    deploy_ok = result.status == DeploymentStatus.COMPLETED
    print_result("Deploy to all instances", deploy_ok, f"{num_instances} instances")
    all_passed &= deploy_ok
    
    # Verify all instances
    verification = deployer.verify_deployment(plan.deployment_id)
    all_verified = all(v.success for v in verification.values())
    print_result("All instances verified", all_verified, f"{len(verification)}/{num_instances}")
    all_passed &= all_verified
    
    # Check health after deployment
    health = deployer.check_all_instances()
    all_healthy = all(h.status == InstanceStatus.HEALTHY for h in health.values())
    print_result("All instances healthy", all_healthy, f"{len(health)}/{num_instances}")
    all_passed &= all_healthy
    
    return all_passed


def main() -> int:
    """Run all verification tests."""
    print("\n" + "=" * 60)
    print(" Geometry OS Configuration Management Verification")
    print(" " + datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    print("=" * 60)
    
    results = {
        "Configuration Loading": verify_config_loading(),
        "Type Safety": verify_type_safety(),
        "Validation": verify_validation(),
        "Instance Management": verify_instance_management(),
        "Deployment Strategies": verify_deployment_strategies(),
        "Deployment Execution": verify_deployment_execution(),
        "Change Tracking": verify_change_tracking(),
        "Export/Import": verify_export_import(),
        "Multi-Instance Stability": verify_multi_instance_stability(),
    }
    
    print_header("Summary")
    
    total = len(results)
    passed = sum(1 for v in results.values() if v)
    
    for name, success in results.items():
        icon = "✓" if success else "✗"
        status = "PASS" if success else "FAIL"
        print(f"  {icon} {name}: {status}")
    
    print(f"\n  Total: {passed}/{total} tests passed")
    
    if passed == total:
        print("\n  ✓ All verification tests passed!")
        return 0
    else:
        print(f"\n  ✗ {total - passed} test(s) failed")
        return 1


if __name__ == "__main__":
    sys.exit(main())
