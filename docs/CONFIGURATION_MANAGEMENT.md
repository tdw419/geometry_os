# Configuration Management System

This document describes the centralized configuration management system for Geometry OS.

## Overview

The configuration management system provides:

- **Single Source of Truth**: All configuration is managed through a centralized `ConfigManager`
- **Type Safety**: Type-safe access with validation for all configuration values
- **Multiple Sources**: Configuration can come from files, environment variables, or CLI overrides
- **Instance-Specific Overrides**: Each instance can have its own configuration overrides
- **Deployment Management**: Deploy configurations to multiple instances with verification
- **Change Tracking**: Audit trail of all configuration changes

## Quick Start

### Using the Configuration Manager

```python
from core.config_manager import get_config

# Get the singleton config manager
config = get_config()

# Access values with type-safe methods
debug_mode = config.get_bool("debug_mode")
fps = config.get_int("visual_shell.fps_target")
log_level = config.get_string("log_level")

# Get a section of related config
neural_config = config.get_section("neural")
model_path = neural_config["model_path"]

# Set values at runtime
config.set("debug_mode", True)

# Validate configuration
errors = config.validate()
if errors:
    print(f"Configuration errors: {errors}")
```

### Using the CLI

```bash
# Show current configuration
python -m core.config_cli config show

# Get a specific value
python -m core.config_cli get neural.model_path

# Set a value
python -m core.config_cli set debug_mode true --permanent

# Validate configuration
python -m core.config_cli config validate

# Export configuration
python -m core.config_cli config export config.backup.json

# Generate a report
python -m core.config_cli config report
```

## Configuration Sources

Configuration values are loaded from multiple sources in priority order (highest to lowest):

1. **CLI Override** (`ConfigSource.CLI_OVERRIDE`) - Command-line arguments
2. **Runtime** (`ConfigSource.RUNTIME`) - Values set during runtime
3. **Instance** (`ConfigSource.INSTANCE`) - Instance-specific config files
4. **Environment** (`ConfigSource.ENVIRONMENT`) - Environment variables
5. **Local File** (`ConfigSource.LOCAL_FILE`) - `config.local.yaml`
6. **Deployed File** (`ConfigSource.DEPLOYED_FILE`) - `config.yaml`
7. **Default** (`ConfigSource.DEFAULT`) - Schema defaults

### Configuration Files

- `config.yaml` - Main configuration file (committed to git)
- `config.local.yaml` - Local overrides (NOT committed to git)
- `config.<instance-id>.yaml` - Instance-specific overrides

### Environment Variables

Environment variables are mapped to configuration keys:

| Environment Variable | Config Key |
|---------------------|------------|
| `GOOGLE_API_KEY` | `google_api_key` |
| `DEBUG_MODE` | `debug_mode` |
| `RUST_LOG` | `log_level` |
| `GEOM_LOG_DIR` | `log_dir` |
| `GEOM_NEURAL_MODEL_PATH` | `neural.model_path` |
| `GEOM_NEURAL_BATCH_SIZE` | `neural.batch_size` |
| `GEOM_EVOLUTION_ENABLED` | `evolution.enabled` |
| `GEOM_VISUAL_SHELL_FPS` | `visual_shell.fps_target` |

Any environment variable prefixed with `GEOM_CONFIG_` will be mapped:
- `GEOM_CONFIG_SECTION_KEY` → `section.key`

## Configuration Schema

All configuration keys are defined in a schema with:

- Data type (string, integer, float, boolean, list, dict, path, secret)
- Description
- Default value
- Whether required
- Validation rules (min/max, allowed values, patterns)

Example schema definition:

```python
from core.config_manager import ConfigSchema, ConfigDataType

schema = ConfigSchema(
    key="visual_shell.fps_target",
    data_type=ConfigDataType.INTEGER,
    description="Target frame rate",
    default=60,
    min_value=1,
    max_value=240,
)
```

## Instance Management

### Registering Instances

```python
from core.config_deployer import ConfigDeployer

deployer = ConfigDeployer()

# Register a new instance
instance = deployer.register_instance(
    instance_id="worker-1",
    address="192.168.1.100",
    port=8080,
    metadata={"env": "production"},
)
```

### Health Checking

```python
# Check single instance
result = deployer.check_instance_health("worker-1")
print(f"Status: {result.status}")

# Check all instances
results = deployer.check_all_instances()
for instance_id, result in results.items():
    print(f"{instance_id}: {result.status}")
```

## Deployment

### Creating a Deployment

```bash
# Create deployment plan
python -m core.config_cli deploy create config.yaml \
    --instances instance-1,instance-2,instance-3 \
    --strategy rolling \
    --batch-size 1
```

### Deployment Strategies

- **ALL_AT_ONCE**: Deploy to all instances simultaneously
- **ROLLING**: Deploy one batch at a time (configurable batch size)
- **CANARY**: Deploy to a subset first, then the rest
- **BLUE_GREEN**: Deploy to new instances, then switch traffic

### Executing a Deployment

```bash
# Execute with progress tracking
python -m core.config_cli deploy execute <deployment-id> \
    --config config.yaml \
    --verbose
```

### Verification

```bash
# Verify deployment
python -m core.config_cli deploy verify <deployment-id>

# Verify specific instance
python -m core.config_cli instance verify instance-1 --hash <expected-hash>
```

## Change Tracking

All configuration changes are tracked:

```python
# Add a change listener
def on_change(event):
    print(f"Config changed: {event.key}")
    print(f"  Old: {event.old_value}")
    print(f"  New: {event.new_value}")

config.add_change_listener(on_change)

# Get change history
history = config.get_change_history(limit=10)
for event in history:
    print(f"{event.timestamp}: {event.key} changed")
```

## Secrets Management

Secrets are masked by default in exports and reports:

```python
# Secrets are redacted in exports
exported = config.export_config(include_secrets=False)
# "google_api_key": "***REDACTED***"

# Include secrets when needed
exported_with_secrets = config.export_config(include_secrets=True)
```

## Best Practices

1. **Use Schema Defaults**: Define defaults in the schema, not in code
2. **Validate Early**: Call `validate()` at application startup
3. **Use Sections**: Group related configuration under sections (e.g., `neural.*`)
4. **Instance IDs**: Use meaningful instance IDs for distributed deployments
5. **Local Config**: Use `config.local.yaml` for development overrides
6. **Environment Variables**: Use environment variables for secrets and deployment-specific values
7. **Change Listeners**: Register listeners for critical configuration changes

## Files

| File | Purpose |
|------|---------|
| `core/config_manager.py` | Main configuration management |
| `core/config_deployer.py` | Multi-instance deployment |
| `core/config_cli.py` | Command-line interface |
| `config.yaml` | Main configuration file |
| `config.local.yaml` | Local overrides (git-ignored) |
| `config.local.yaml.example` | Example local config |
| `tests/test_config_manager.py` | Unit tests |

## Running Verification

To verify the configuration management system is working correctly:

```bash
python scripts/verify_config_deployment.py
```

This will run a comprehensive set of tests including:
- Configuration loading from multiple sources
- Type safety and validation
- Instance management
- Deployment strategies
- Change tracking
- Multi-instance stability
