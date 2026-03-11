#!/usr/bin/env python3
"""
Configuration Management CLI for Geometry OS.

Commands:
    config show                  Show current configuration
    config get <key>             Get a specific configuration value
    config set <key> <value>     Set a configuration value
    config validate              Validate current configuration
    config export [file]         Export configuration to file
    config import <file>         Import configuration from file
    config diff <file>           Compare current config with file
    
    instance list                List registered instances
    instance register <id>       Register a new instance
    instance health [id]         Check instance health
    instance verify <id>         Verify instance configuration
    
    deploy create <config>       Create a deployment plan
    deploy execute <id>          Execute a deployment
    deploy status <id>           Show deployment status
    deploy list                  List recent deployments
    deploy verify <id>           Verify a deployment
    
Usage:
    python -m core.config_cli show
    python -m core.config_cli get neural.model_path
    python -m core.config_cli set debug_mode true
    python -m core.config_cli deploy create config.yaml --instances i1,i2,i3
"""

from __future__ import annotations

import argparse
import json
import sys
from datetime import datetime, timezone
from pathlib import Path
from typing import Any

# Add parent to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

try:
    import yaml
    YAML_AVAILABLE = True
except ImportError:
    YAML_AVAILABLE = False

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
    get_deployer,
)


def format_timestamp(dt: datetime | None) -> str:
    """Format a timestamp for display."""
    if dt is None:
        return "N/A"
    if dt.tzinfo is None:
        dt = dt.replace(tzinfo=timezone.utc)
    local = dt.astimezone()
    return local.strftime("%Y-%m-%d %H:%M:%S")


def format_value(value: Any, secret: bool = False) -> str:
    """Format a configuration value for display."""
    if secret:
        return "***REDACTED***"
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, (list, dict)):
        return json.dumps(value, indent=2)
    return str(value)


def print_table(rows: list[list[str]], headers: list[str]) -> None:
    """Print a formatted table."""
    if not rows:
        print("No data to display.")
        return
    
    # Calculate column widths
    widths = [len(h) for h in headers]
    for row in rows:
        for i, cell in enumerate(row):
            widths[i] = max(widths[i], len(str(cell)))
    
    # Print header
    header_line = " | ".join(h.ljust(w) for h, w in zip(headers, widths))
    print(header_line)
    print("-" * len(header_line))
    
    # Print rows
    for row in rows:
        print(" | ".join(str(cell).ljust(w) for cell, w in zip(row, widths)))


# === Config Commands ===

def cmd_config_show(args: argparse.Namespace) -> int:
    """Show current configuration."""
    config = get_config()
    
    if args.section:
        data = config.get_section(args.section)
        if not data:
            print(f"No configuration found for section: {args.section}")
            return 1
    else:
        data = config.export_config(
            include_secrets=args.secrets,
            include_defaults=not args.no_defaults,
        )
    
    if args.format == "json":
        print(json.dumps(data, indent=2, sort_keys=True))
    elif args.format == "yaml" and YAML_AVAILABLE:
        print(yaml.dump(data, default_flow_style=False, sort_keys=True))
    else:
        # Pretty print
        def print_dict(d: dict, prefix: str = "") -> None:
            for key, value in sorted(d.items()):
                full_key = f"{prefix}{key}" if prefix else key
                if isinstance(value, dict):
                    print(f"\n[{full_key}]")
                    print_dict(value, prefix="  ")
                else:
                    schema = config.get_schema(full_key)
                    is_secret = schema.secret if schema else False
                    val_str = format_value(value, is_secret and not args.secrets)
                    source = config._entries.get(full_key)
                    source_str = f" ({source.source.name})" if source else ""
                    print(f"  {full_key}: {val_str}{source_str}")
        
        print_dict(data)
    
    return 0


def cmd_config_get(args: argparse.Namespace) -> int:
    """Get a specific configuration value."""
    config = get_config()
    
    value = config.get(args.key)
    if value is None:
        print(f"Configuration key not found: {args.key}")
        return 1
    
    schema = config.get_schema(args.key)
    is_secret = schema.secret if schema else False
    
    if args.raw:
        print(format_value(value, is_secret and not args.show_secrets))
    else:
        entry = config._entries.get(args.key)
        print(f"Key: {args.key}")
        print(f"Value: {format_value(value, is_secret and not args.show_secrets)}")
        if entry:
            print(f"Source: {entry.source.name}")
            print(f"Type: {entry.data_type.value}")
        if schema:
            print(f"Description: {schema.description}")
            if schema.required:
                print("Required: Yes")
            if entry and entry.validation_errors:
                print(f"Validation Errors: {entry.validation_errors}")
    
    return 0


def cmd_config_set(args: argparse.Namespace) -> int:
    """Set a configuration value."""
    config = get_config()
    
    # Parse value based on type
    schema = config.get_schema(args.key)
    if schema:
        from core.config_manager import ConfigDataType
        if schema.data_type == ConfigDataType.BOOLEAN:
            value = args.value.lower() in ("true", "1", "yes", "on")
        elif schema.data_type == ConfigDataType.INTEGER:
            value = int(args.value)
        elif schema.data_type == ConfigDataType.FLOAT:
            value = float(args.value)
        elif schema.data_type == ConfigDataType.LIST:
            if args.value.startswith("["):
                value = json.loads(args.value)
            else:
                value = [v.strip() for v in args.value.split(",")]
        elif schema.data_type == ConfigDataType.DICT:
            value = json.loads(args.value)
        else:
            value = args.value
    else:
        value = args.value
    
    # Set the value
    source = ConfigSource.CLI_OVERRIDE if args.permanent else ConfigSource.RUNTIME
    errors = config.set(args.key, value, source)
    
    if errors:
        print(f"Warning: Validation errors: {errors}")
    
    print(f"Set {args.key} = {format_value(value)}")
    
    if args.permanent:
        # Save to local config
        config.export_to_yaml(
            config._config_dir / "config.local.yaml",
            include_secrets=True,
            include_defaults=False,
        )
        print("Saved to config.local.yaml")
    
    return 0


def cmd_config_validate(args: argparse.Namespace) -> int:
    """Validate current configuration."""
    config = get_config()
    
    errors = config.validate()
    missing = config.validate_required()
    
    if not errors and not missing:
        print("✓ Configuration is valid")
        return 0
    
    if missing:
        print("Missing required configuration:")
        for key in missing:
            schema = config.get_schema(key)
            print(f"  - {key}: {schema.description if schema else 'No description'}")
    
    if errors:
        print("\nValidation errors:")
        for key, key_errors in errors.items():
            print(f"  {key}:")
            for error in key_errors:
                print(f"    - {error}")
    
    return 1


def cmd_config_export(args: argparse.Namespace) -> int:
    """Export configuration to file."""
    config = get_config()
    
    filepath = Path(args.file) if args.file else Path("config.export.yaml")
    
    if filepath.suffix == ".json":
        config.export_to_json(
            filepath,
            include_secrets=args.secrets,
            include_defaults=not args.no_defaults,
        )
    else:
        if not YAML_AVAILABLE:
            print("Error: PyYAML not available for YAML export. Use .json extension.")
            return 1
        config.export_to_yaml(
            filepath,
            include_secrets=args.secrets,
            include_defaults=not args.no_defaults,
        )
    
    print(f"Exported configuration to {filepath}")
    return 0


def cmd_config_import(args: argparse.Namespace) -> int:
    """Import configuration from file."""
    filepath = Path(args.file)
    if not filepath.exists():
        print(f"File not found: {filepath}")
        return 1
    
    config = get_config()
    
    # Backup current config
    if args.backup:
        backup_path = filepath.with_suffix(filepath.suffix + ".backup")
        config.export_to_yaml(backup_path)
        print(f"Backed up current config to {backup_path}")
    
    # Import by reloading
    config._load_file(filepath, ConfigSource.LOCAL_FILE)
    
    print(f"Imported configuration from {filepath}")
    return 0


def cmd_config_diff(args: argparse.Namespace) -> int:
    """Compare current configuration with file."""
    filepath = Path(args.file)
    if not filepath.exists():
        print(f"File not found: {filepath}")
        return 1
    
    config = get_config()
    
    # Load file config
    from core.config_manager import ConfigManager
    file_config = ConfigManager(config_dir=filepath.parent)
    file_config._load_file(filepath, ConfigSource.LOCAL_FILE)
    
    # Compare
    current_keys = set(config._entries.keys())
    file_keys = set(file_config._entries.keys())
    
    added = file_keys - current_keys
    removed = current_keys - file_keys
    common = current_keys & file_keys
    
    changed = []
    for key in common:
        current_val = config.get(key)
        file_val = file_config.get(key)
        if current_val != file_val:
            changed.append((key, current_val, file_val))
    
    if not added and not removed and not changed:
        print("No differences found.")
        return 0
    
    if added:
        print(f"Added in file ({len(added)}):")
        for key in sorted(added):
            print(f"  + {key}: {file_config.get(key)}")
    
    if removed:
        print(f"\nRemoved in file ({len(removed)}):")
        for key in sorted(removed):
            print(f"  - {key}: {config.get(key)}")
    
    if changed:
        print(f"\nChanged ({len(changed)}):")
        for key, old, new in sorted(changed, key=lambda x: x[0]):
            print(f"  ~ {key}:")
            print(f"      current: {old}")
            print(f"      file:    {new}")
    
    return 0


def cmd_config_report(args: argparse.Namespace) -> int:
    """Generate configuration report."""
    config = get_config()
    report = config.generate_report()
    
    if args.format == "json":
        print(json.dumps(report, indent=2))
    else:
        print("=== Configuration Report ===")
        print(f"\nInstance ID: {report['instance_id']}")
        print(f"Config Hash: {report['config_hash']}")
        print(f"Total Keys: {report['total_keys']}")
        print(f"Schema Keys: {report['schema_keys']}")
        print(f"Valid: {'✓ Yes' if report['is_valid'] else '✗ No'}")
        
        print("\n--- Sources ---")
        for source, count in report['sources'].items():
            print(f"  {source}: {count}")
        
        if report['validation_errors']:
            print("\n--- Validation Errors ---")
            for key, errors in report['validation_errors'].items():
                print(f"  {key}: {errors}")
        
        if report['missing_required']:
            print("\n--- Missing Required ---")
            for key in report['missing_required']:
                print(f"  - {key}")
        
        if report['recent_changes']:
            print("\n--- Recent Changes ---")
            for change in report['recent_changes'][:10]:
                print(f"  {change['timestamp']}: {change['key']} ({change['source']})")
        
        if report['deployments']['recent']:
            print("\n--- Recent Deployments ---")
            for dep in report['deployments']['recent']:
                print(f"  {dep['deployment_id']}: {dep['status']} ({dep['instances']} instances)")
    
    return 0


# === Instance Commands ===

def cmd_instance_list(args: argparse.Namespace) -> int:
    """List registered instances."""
    deployer = get_deployer()
    
    status_filter = None
    if args.status:
        try:
            status_filter = InstanceStatus(args.status.lower())
        except ValueError:
            print(f"Invalid status: {args.status}")
            return 1
    
    instances = deployer.list_instances(status=status_filter)
    
    if not instances:
        print("No instances registered.")
        return 0
    
    rows = []
    for inst in instances:
        rows.append([
            inst.instance_id,
            inst.address or "local",
            str(inst.port or "-"),
            inst.status.value,
            inst.config_hash or "-",
            format_timestamp(inst.last_heartbeat) if inst.last_heartbeat else "-",
        ])
    
    print_table(
        rows,
        ["Instance ID", "Address", "Port", "Status", "Config Hash", "Last Heartbeat"],
    )
    
    return 0


def cmd_instance_register(args: argparse.Namespace) -> int:
    """Register a new instance."""
    deployer = get_deployer()
    
    instance = deployer.register_instance(
        instance_id=args.instance_id,
        address=args.address,
        port=args.port,
        metadata=json.loads(args.metadata) if args.metadata else None,
    )
    
    print(f"Registered instance: {instance.instance_id}")
    return 0


def cmd_instance_health(args: argparse.Namespace) -> int:
    """Check instance health."""
    deployer = get_deployer()
    
    if args.instance_id:
        result = deployer.check_instance_health(args.instance_id)
        results = {args.instance_id: result}
    else:
        results = deployer.check_all_instances()
    
    rows = []
    for instance_id, result in results.items():
        rows.append([
            instance_id,
            result.status.value,
            f"{result.response_time_ms:.1f}ms" if result.response_time_ms else "-",
            result.error_message or "OK",
        ])
    
    print_table(
        rows,
        ["Instance ID", "Status", "Response Time", "Message"],
    )
    
    # Return non-zero if any unhealthy
    unhealthy = [r for r in results.values() if r.status != InstanceStatus.HEALTHY]
    return 1 if unhealthy else 0


def cmd_instance_verify(args: argparse.Namespace) -> int:
    """Verify instance configuration."""
    deployer = get_deployer()
    config = get_config()
    
    expected_hash = args.hash or config.compute_config_hash()
    
    result = deployer.verify_instance_config(args.instance_id, expected_hash)
    
    print(f"Instance: {result.instance_id}")
    print(f"Success: {'✓ Yes' if result.success else '✗ No'}")
    print(f"Expected Hash: {result.expected_hash}")
    print(f"Actual Hash: {result.config_hash}")
    
    if result.errors:
        print("Errors:")
        for error in result.errors:
            print(f"  - {error}")
    
    if result.warnings:
        print("Warnings:")
        for warning in result.warnings:
            print(f"  - {warning}")
    
    return 0 if result.success else 1


# === Deploy Commands ===

def cmd_deploy_create(args: argparse.Namespace) -> int:
    """Create a deployment plan."""
    deployer = get_deployer()
    
    config_path = Path(args.config)
    if not config_path.exists():
        print(f"Configuration file not found: {config_path}")
        return 1
    
    instance_ids = [i.strip() for i in args.instances.split(",")]
    
    strategy = DeploymentStrategy(args.strategy)
    
    plan = deployer.create_deployment_plan(
        config_path=config_path,
        instance_ids=instance_ids,
        strategy=strategy,
        canary_count=args.canary_count,
        batch_size=args.batch_size,
    )
    
    print(f"Created deployment plan: {plan.deployment_id}")
    print(f"Strategy: {plan.strategy.value}")
    print(f"Config Hash: {plan.config_hash}")
    print(f"Instances: {len(plan.instances)}")
    print(f"\nSteps:")
    for i, step in enumerate(plan.steps, 1):
        print(f"  {i}. {step.name}")
    
    print(f"\nTo execute, run:")
    print(f"  python -m core.config_cli deploy execute {plan.deployment_id} --config {args.config}")
    
    return 0


def cmd_deploy_execute(args: argparse.Namespace) -> int:
    """Execute a deployment."""
    deployer = get_deployer()
    
    plan = deployer.get_deployment(args.deployment_id)
    if plan is None:
        print(f"Deployment not found: {args.deployment_id}")
        return 1
    
    config_path = Path(args.config)
    if not config_path.exists():
        print(f"Configuration file not found: {config_path}")
        return 1
    
    def progress_callback(p):
        if args.verbose:
            step = p.steps[p.current_step] if p.current_step < len(p.steps) else None
            if step:
                print(f"  Step {p.current_step + 1}/{len(p.steps)}: {step.name} - {step.status}")
    
    print(f"Executing deployment: {plan.deployment_id}")
    print(f"Strategy: {plan.strategy.value}")
    print(f"Instances: {len(plan.instances)}")
    print()
    
    result = deployer.execute_deployment(
        deployment_id=args.deployment_id,
        config_path=config_path,
        auto_rollback=not args.no_rollback,
        progress_callback=progress_callback if args.verbose else None,
    )
    
    print()
    print(f"Deployment {result.status.value}")
    
    if result.error_message:
        print(f"Error: {result.error_message}")
    
    if result.status == DeploymentStatus.COMPLETED:
        print("✓ Deployment completed successfully")
        return 0
    else:
        print("✗ Deployment failed")
        return 1


def cmd_deploy_status(args: argparse.Namespace) -> int:
    """Show deployment status."""
    deployer = get_deployer()
    
    plan = deployer.get_deployment(args.deployment_id)
    if plan is None:
        print(f"Deployment not found: {args.deployment_id}")
        return 1
    
    print(f"Deployment: {plan.deployment_id}")
    print(f"Status: {plan.status.value}")
    print(f"Strategy: {plan.strategy.value}")
    print(f"Config Hash: {plan.config_hash}")
    print(f"Created: {format_timestamp(plan.created_at)}")
    print(f"Started: {format_timestamp(plan.started_at)}")
    print(f"Completed: {format_timestamp(plan.completed_at)}")
    
    if plan.error_message:
        print(f"Error: {plan.error_message}")
    
    print(f"\nInstances ({len(plan.instances)}):")
    for inst in plan.instances:
        print(f"  - {inst.instance_id}: {inst.status.value}")
    
    print(f"\nSteps:")
    for i, step in enumerate(plan.steps, 1):
        status_icon = "✓" if step.status == "completed" else "✗" if step.status == "failed" else "○"
        print(f"  {status_icon} {i}. {step.name}: {step.status}")
        if step.error_message:
            print(f"       Error: {step.error_message}")
    
    return 0


def cmd_deploy_list(args: argparse.Namespace) -> int:
    """List recent deployments."""
    deployer = get_deployer()
    
    status_filter = None
    if args.status:
        try:
            status_filter = DeploymentStatus(args.status.lower())
        except ValueError:
            print(f"Invalid status: {args.status}")
            return 1
    
    deployments = deployer.list_deployments(status=status_filter, limit=args.limit)
    
    if not deployments:
        print("No deployments found.")
        return 0
    
    rows = []
    for dep in deployments:
        rows.append([
            dep.deployment_id,
            dep.strategy.value,
            dep.status.value,
            str(len(dep.instances)),
            dep.config_hash[:8],
            format_timestamp(dep.created_at),
        ])
    
    print_table(
        rows,
        ["Deployment ID", "Strategy", "Status", "Instances", "Hash", "Created"],
    )
    
    return 0


def cmd_deploy_verify(args: argparse.Namespace) -> int:
    """Verify a deployment."""
    deployer = get_deployer()
    
    results = deployer.verify_deployment(args.deployment_id)
    
    if not results:
        print(f"Deployment not found: {args.deployment_id}")
        return 1
    
    print(f"Verification for deployment: {args.deployment_id}")
    print()
    
    all_success = True
    for instance_id, result in results.items():
        status = "✓" if result.success else "✗"
        print(f"{status} {instance_id}")
        if result.errors:
            for error in result.errors:
                print(f"    Error: {error}")
        if not result.success:
            all_success = False
    
    print()
    if all_success:
        print("✓ All instances verified successfully")
        return 0
    else:
        print("✗ Some instances failed verification")
        return 1


def main() -> int:
    """Main entry point."""
    parser = argparse.ArgumentParser(
        description="Geometry OS Configuration Management CLI",
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    subparsers = parser.add_subparsers(dest="command", help="Commands")
    
    # === Config Commands ===
    config_parser = subparsers.add_parser("config", help="Configuration management")
    config_sub = config_parser.add_subparsers(dest="config_command")
    
    # config show
    show_parser = config_sub.add_parser("show", help="Show current configuration")
    show_parser.add_argument("--section", help="Show only a specific section")
    show_parser.add_argument("--format", choices=["json", "yaml", "text"], default="text")
    show_parser.add_argument("--secrets", action="store_true", help="Show secret values")
    show_parser.add_argument("--no-defaults", action="store_true", help="Hide default values")
    
    # config get
    get_parser = config_sub.add_parser("get", help="Get a configuration value")
    get_parser.add_argument("key", help="Configuration key")
    get_parser.add_argument("--raw", action="store_true", help="Output raw value only")
    get_parser.add_argument("--show-secrets", action="store_true")
    
    # config set
    set_parser = config_sub.add_parser("set", help="Set a configuration value")
    set_parser.add_argument("key", help="Configuration key")
    set_parser.add_argument("value", help="Configuration value")
    set_parser.add_argument("--permanent", action="store_true", help="Save to config file")
    
    # config validate
    config_sub.add_parser("validate", help="Validate current configuration")
    
    # config export
    export_parser = config_sub.add_parser("export", help="Export configuration")
    export_parser.add_argument("file", nargs="?", help="Output file")
    export_parser.add_argument("--secrets", action="store_true")
    export_parser.add_argument("--no-defaults", action="store_true")
    
    # config import
    import_parser = config_sub.add_parser("import", help="Import configuration")
    import_parser.add_argument("file", help="Input file")
    import_parser.add_argument("--backup", action="store_true", help="Backup current config")
    
    # config diff
    diff_parser = config_sub.add_parser("diff", help="Compare configuration with file")
    diff_parser.add_argument("file", help="File to compare with")
    
    # config report
    report_parser = config_sub.add_parser("report", help="Generate configuration report")
    report_parser.add_argument("--format", choices=["json", "text"], default="text")
    
    # === Instance Commands ===
    instance_parser = subparsers.add_parser("instance", help="Instance management")
    instance_sub = instance_parser.add_subparsers(dest="instance_command")
    
    # instance list
    list_inst_parser = instance_sub.add_parser("list", help="List instances")
    list_inst_parser.add_argument("--status", help="Filter by status")
    
    # instance register
    reg_parser = instance_sub.add_parser("register", help="Register instance")
    reg_parser.add_argument("instance_id")
    reg_parser.add_argument("--address")
    reg_parser.add_argument("--port", type=int)
    reg_parser.add_argument("--metadata", help="JSON metadata")
    
    # instance health
    health_parser = instance_sub.add_parser("health", help="Check instance health")
    health_parser.add_argument("instance_id", nargs="?", help="Instance ID (all if not specified)")
    
    # instance verify
    verify_parser = instance_sub.add_parser("verify", help="Verify instance config")
    verify_parser.add_argument("instance_id")
    verify_parser.add_argument("--hash", help="Expected config hash")
    
    # === Deploy Commands ===
    deploy_parser = subparsers.add_parser("deploy", help="Deployment management")
    deploy_sub = deploy_parser.add_subparsers(dest="deploy_command")
    
    # deploy create
    create_parser = deploy_sub.add_parser("create", help="Create deployment plan")
    create_parser.add_argument("config", help="Configuration file")
    create_parser.add_argument("--instances", required=True, help="Comma-separated instance IDs")
    create_parser.add_argument("--strategy", choices=[s.value for s in DeploymentStrategy], default="rolling")
    create_parser.add_argument("--canary-count", type=int, default=1)
    create_parser.add_argument("--batch-size", type=int, default=1)
    
    # deploy execute
    exec_parser = deploy_sub.add_parser("execute", help="Execute deployment")
    exec_parser.add_argument("deployment_id")
    exec_parser.add_argument("--config", required=True, help="Configuration file")
    exec_parser.add_argument("--no-rollback", action="store_true", help="Disable auto-rollback")
    exec_parser.add_argument("--verbose", "-v", action="store_true")
    
    # deploy status
    status_parser = deploy_sub.add_parser("status", help="Show deployment status")
    status_parser.add_argument("deployment_id")
    
    # deploy list
    list_dep_parser = deploy_sub.add_parser("list", help="List deployments")
    list_dep_parser.add_argument("--status", help="Filter by status")
    list_dep_parser.add_argument("--limit", type=int, default=20)
    
    # deploy verify
    dep_verify_parser = deploy_sub.add_parser("verify", help="Verify deployment")
    dep_verify_parser.add_argument("deployment_id")
    
    args = parser.parse_args()
    
    if args.command == "config":
        if args.config_command == "show":
            return cmd_config_show(args)
        elif args.config_command == "get":
            return cmd_config_get(args)
        elif args.config_command == "set":
            return cmd_config_set(args)
        elif args.config_command == "validate":
            return cmd_config_validate(args)
        elif args.config_command == "export":
            return cmd_config_export(args)
        elif args.config_command == "import":
            return cmd_config_import(args)
        elif args.config_command == "diff":
            return cmd_config_diff(args)
        elif args.config_command == "report":
            return cmd_config_report(args)
    
    elif args.command == "instance":
        if args.instance_command == "list":
            return cmd_instance_list(args)
        elif args.instance_command == "register":
            return cmd_instance_register(args)
        elif args.instance_command == "health":
            return cmd_instance_health(args)
        elif args.instance_command == "verify":
            return cmd_instance_verify(args)
    
    elif args.command == "deploy":
        if args.deploy_command == "create":
            return cmd_deploy_create(args)
        elif args.deploy_command == "execute":
            return cmd_deploy_execute(args)
        elif args.deploy_command == "status":
            return cmd_deploy_status(args)
        elif args.deploy_command == "list":
            return cmd_deploy_list(args)
        elif args.deploy_command == "verify":
            return cmd_deploy_verify(args)
    
    parser.print_help()
    return 1


if __name__ == "__main__":
    sys.exit(main())
