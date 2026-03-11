# Configuration Hub

> Centralized configuration management for Geometry OS

## Overview

The Configuration Hub (`systems/config_hub`) provides a unified configuration management system for Geometry OS with schema validation, hot reload, multi-source configuration, and deployment synchronization.

## Features

- **Schema-Based Validation**: Define and validate configuration schemas
- **Multiple Sources**: File, environment variables, defaults, and remote config
- **Hot Reload**: Update configuration without restart
- **Change Notifications**: Subscribe to configuration changes
- **Instance Deployment**: Deploy configuration across distributed instances
- **Version Control**: Track changes with rollback capability
- **Health Verification**: Validate configuration health

## Quick Start

### Basic Usage

```python
from systems.config_hub import ConfigHub, get_config_hub

# Get the singleton hub
hub = get_config_hub()

# Get a configuration value
cache_size = hub.get("evolution_daemon", "cache.size_mb", default=100)

# Set a configuration value
hub.set("evolution_daemon", "cache.size_mb", 200)

# Watch for changes
def on_cache_change(old_value, new_value):
    print(f"Cache size changed: {old_value} -> {new_value}")

hub.watch("evolution_daemon", "cache.size_mb", on_cache_change)
```

### Registering a Component Schema

```python
from systems.config_hub import ConfigSchema, ConfigValue, ConfigDataType

# Define your component's configuration schema
evolution_schema = ConfigSchema(
    component="evolution_daemon",
    version="1.0.0",
    values=[
        ConfigValue(
            key="cache.size_mb",
            data_type=ConfigDataType.INTEGER,
            default=100,
            min_value=10,
            max_value=4096,
            description="Cache size in megabytes"
        ),
        ConfigValue(
            key="cache.enabled",
            data_type=ConfigDataType.BOOLEAN,
            default=True,
            description="Enable caching"
        ),
        ConfigValue(
            key="evolution.check_interval_seconds",
            data_type=ConfigDataType.INTEGER,
            default=60,
            min_value=1,
            max_value=3600,
            description="Interval between evolution checks"
        ),
        ConfigValue(
            key="evolution.max_generations",
            data_type=ConfigDataType.INTEGER,
            default=1000,
            description="Maximum evolution generations"
        )
    ]
)

# Register with the hub
hub.register_schema(evolution_schema)
```

## Configuration Sources

The ConfigHub supports multiple configuration sources with priority ordering:

### Priority Order (Highest to Lowest)

1. **Environment Variables** - `GEOMETRY_OS_*`
2. **Command Line Arguments**
3. **Local Configuration File** - `config.local.yaml`
4. **Main Configuration File** - `config.yaml`
5. **Schema Defaults**

### Configuration File

```yaml
# config.yaml
debug_mode: false
log_level: INFO

# Instance Configuration
instance:
  id: null  # Auto-generated if null
  is_clone: false
  role: primary  # primary, replica, worker

# Neural Network Configuration
neural:
  model_path: null
  inference_device: auto  # auto, cpu, cuda, mps, vulkan
  batch_size: 1

# Evolution System Configuration
evolution:
  enabled: true
  check_interval_seconds: 60
  max_generations: 1000

# Visual Shell Configuration
visual_shell:
  backend: winit  # winit, drm
  fps_target: 60
  resolution_width: 1920
  resolution_height: 1080

# Memory Configuration
memory:
  max_heap_mb: 512
  cache_size_mb: 128

# Network Configuration
network:
  bind_address: "0.0.0.0"
  api_port: 8080
  webhook_port: 8081

# Performance Monitoring
performance:
  slow_op_threshold_ms: 50.0
  profile_enabled: false
```

### Local Overrides

Create `config.local.yaml` for local configuration that won't be committed to git:

```yaml
# config.local.yaml
debug_mode: true
log_level: DEBUG

neural:
  model_path: "./models/my_brain.rts.png"
  inference_device: cuda

evolution:
  check_interval_seconds: 30  # Faster for development
```

### Environment Variables

Override configuration with environment variables:

```bash
# Format: GEOMETRY_OS_<SECTION>_<KEY>
export GEOMETRY_OS_DEBUG_MODE=true
export GEOMETRY_OS_LOG_LEVEL=DEBUG
export GEOMETRY_OS_NEURAL_INFERENCE_DEVICE=cuda
export GEOMETRY_OS_EVOLUTION_CHECK_INTERVAL_SECONDS=30
```

## API Reference

### ConfigHub

```python
class ConfigHub:
    """Centralized configuration management."""
    
    def get(
        self, 
        component: str, 
        key: str, 
        default: Any = None
    ) -> Any:
        """
        Get a configuration value.
        
        Args:
            component: Component name (e.g., "evolution_daemon")
            key: Configuration key (e.g., "cache.size_mb")
            default: Default value if not found
            
        Returns:
            Configuration value
        """
        
    def set(
        self, 
        component: str, 
        key: str, 
        value: Any,
        source: ConfigSource = ConfigSource.RUNTIME
    ) -> None:
        """
        Set a configuration value.
        
        Args:
            component: Component name
            key: Configuration key
            value: Value to set
            source: Source of the change
        """
        
    def watch(
        self,
        component: str,
        key: str,
        callback: Callable[[Any, Any], None]
    ) -> str:
        """
        Watch for configuration changes.
        
        Args:
            component: Component name
            key: Configuration key
            callback: Function(old_value, new_value)
            
        Returns:
            Watcher ID for unwatching
        """
        
    def unwatch(self, watcher_id: str) -> None:
        """Remove a configuration watcher."""
        
    def register_schema(self, schema: ConfigSchema) -> None:
        """Register a component's configuration schema."""
        
    def validate(
        self, 
        component: str
    ) -> List[ConfigValidationError]:
        """Validate a component's configuration."""
        
    def reload(self) -> None:
        """Reload configuration from all sources."""
        
    def deploy_to_instances(
        self,
        instance_ids: List[str]
    ) -> Dict[str, DeploymentResult]:
        """Deploy configuration to distributed instances."""
```

### ConfigSchema

```python
@dataclass
class ConfigSchema:
    """Configuration schema for a component."""
    
    component: str           # Component name
    version: str             # Schema version
    values: List[ConfigValue]  # Configuration values
    migrations: Dict[str, Callable] = None  # Version migrations
```

### ConfigValue

```python
@dataclass
class ConfigValue:
    """A single configuration value definition."""
    
    key: str                          # Configuration key
    data_type: ConfigDataType         # Type of value
    default: Any = None               # Default value
    required: bool = False            # Is required?
    description: str = ""             # Human-readable description
    
    # Validation constraints
    min_value: Union[int, float] = None
    max_value: Union[int, float] = None
    pattern: str = None               # Regex pattern for strings
    enum: List[Any] = None            # Allowed values
```

### ConfigDataType

```python
class ConfigDataType(Enum):
    """Supported configuration data types."""
    
    STRING = "string"
    INTEGER = "integer"
    FLOAT = "float"
    BOOLEAN = "boolean"
    LIST = "list"
    DICT = "dict"
    PATH = "path"      # Filesystem path
    URL = "url"        # URL
    PORT = "port"      # Network port (1-65535)
```

## Deployment

### Deploying to Instances

```python
from systems.config_hub import get_config_hub

hub = get_config_hub()

# Deploy to specific instances
results = hub.deploy_to_instances(["node-01", "node-02", "node-03"])

# Check results
for instance_id, result in results.items():
    if result.success:
        print(f"✅ {instance_id}: Deployed successfully")
    else:
        print(f"❌ {instance_id}: {result.error}")
```

### DeploymentResult

```python
@dataclass
class DeploymentResult:
    """Result of a configuration deployment."""
    
    instance_id: str
    success: bool
    version: str           # Configuration version deployed
    timestamp: datetime
    error: str = None
    rollback_version: str = None  # Version to rollback to
```

### Verification

```python
from systems.config_hub import ConfigVerifier

verifier = ConfigVerifier()

# Verify configuration health
result = verifier.verify("evolution_daemon")

if result.healthy:
    print("✅ Configuration is healthy")
else:
    print("❌ Issues found:")
    for issue in result.issues:
        print(f"  - {issue}")
```

## Hot Reload

### Enabling Hot Reload

```python
hub = get_config_hub()

# Enable hot reload (checks every 5 seconds)
hub.enable_hot_reload(interval_seconds=5)

# Configuration changes will now automatically reload
# and trigger registered watchers
```

### Handling Configuration Changes

```python
def on_neural_config_change(old_value, new_value):
    """Handle neural configuration changes."""
    print(f"Neural config changed: {old_value} -> {new_value}")
    
    # Reinitialize neural system with new config
    reinitialize_neural_system(new_value)

# Watch for changes
hub.watch("neural", "inference_device", on_neural_config_change)
hub.watch("neural", "batch_size", on_neural_config_change)
```

## Best Practices

### 1. Define Schemas Early

Always register your component's schema before using configuration:

```python
# In your component's __init__.py or setup
from systems.config_hub import get_config_hub, ConfigSchema, ConfigValue, ConfigDataType

def setup_config():
    hub = get_config_hub()
    hub.register_schema(ConfigSchema(
        component="my_component",
        version="1.0.0",
        values=[
            ConfigValue(
                key="enabled",
                data_type=ConfigDataType.BOOLEAN,
                default=True,
                description="Enable my component"
            ),
            # ... more values
        ]
    ))
```

### 2. Use Type-Safe Access

Always specify defaults with correct types:

```python
# Good - type safe
cache_size = hub.get("evolution", "cache.size_mb", default=100)

# Avoid - no default, might be None
cache_size = hub.get("evolution", "cache.size_mb")
```

### 3. Validate Early

Validate configuration at startup:

```python
hub = get_config_hub()
errors = hub.validate("my_component")

if errors:
    for error in errors:
        logging.error(f"Config validation error: {error}")
    raise ConfigurationError("Invalid configuration")
```

### 4. Use Local Overrides

Keep machine-specific config in `config.local.yaml`:

```bash
# .gitignore
config.local.yaml
```

### 5. Document Configuration

Add descriptions to all config values:

```python
ConfigValue(
    key="cache.size_mb",
    data_type=ConfigDataType.INTEGER,
    default=100,
    min_value=10,
    max_value=4096,
    description="Cache size in megabytes. Larger values improve performance but use more memory."
)
```

## Migration Guide

### From Direct Configuration

If you're using direct file reads or environment variables:

**Before:**
```python
import os
import yaml

with open("config.yaml") as f:
    config = yaml.safe_load(f)

cache_size = config.get("cache", {}).get("size_mb", 100)
debug = os.environ.get("DEBUG", "false").lower() == "true"
```

**After:**
```python
from systems.config_hub import get_config_hub

hub = get_config_hub()
cache_size = hub.get("my_component", "cache.size_mb", default=100)
debug = hub.get("global", "debug_mode", default=False)
```

## Troubleshooting

### Configuration Not Loading

```bash
# Check configuration file syntax
python3 -c "import yaml; yaml.safe_load(open('config.yaml'))"

# Verify environment variables
env | grep GEOMETRY_OS_

# Check schema registration
python3 -c "from systems.config_hub import get_config_hub; hub = get_config_hub(); print(hub.list_schemas())"
```

### Hot Reload Not Working

```python
# Ensure hot reload is enabled
hub = get_config_hub()
print(f"Hot reload enabled: {hub.is_hot_reload_enabled()}")
print(f"Reload interval: {hub.get_reload_interval()}")

# Manually trigger reload
hub.reload()
```

### Validation Errors

```python
# Get detailed validation errors
hub = get_config_hub()
errors = hub.validate("my_component")

for error in errors:
    print(f"Key: {error.key}")
    print(f"Value: {error.value}")
    print(f"Expected: {error.expected}")
    print(f"Message: {error.message}")
```

## See Also

- [Configuration Management](CONFIGURATION_MANAGEMENT.md)
- [Deployment Guide](DEPLOYMENT.md)
- [Environment Variables](../.env.example)
- [Main Configuration](../config.yaml)

---

*Last Updated: 2026-03-11*
*Version: 1.0.0*
