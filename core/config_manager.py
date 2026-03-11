"""
Centralized Configuration Management System for Geometry OS.

This module provides:
- Single source of truth for all configuration
- Type-safe configuration with validation
- Multiple configuration sources (files, environment, CLI)
- Instance-specific overrides for multi-instance deployments
- Configuration versioning and hot-reload
- Deployment tracking and verification
- Configuration change auditing

Usage:
    from core.config_manager import ConfigManager, get_config
    
    # Get singleton instance
    config = get_config()
    
    # Access configuration values
    api_key = config.get("google_api_key")
    debug_mode = config.get_bool("debug_mode", default=False)
    
    # Get entire section
    db_config = config.get_section("database")
"""

from __future__ import annotations

import copy
import hashlib
import json
import os
import secrets
import threading
import time
from dataclasses import dataclass, field
from datetime import datetime, timezone
from enum import Enum
from pathlib import Path
from typing import Any, Callable, Generic, TypeVar, Optional

# Try to import yaml, fall back to JSON-only mode if not available
try:
    import yaml
    YAML_AVAILABLE = True
except ImportError:
    YAML_AVAILABLE = False

T = TypeVar("T")


class ConfigSource(Enum):
    """Priority order for configuration sources (highest to lowest)."""
    CLI_OVERRIDE = 100      # Command-line overrides
    RUNTIME = 90            # Runtime modifications
    INSTANCE = 80           # Instance-specific overrides
    ENVIRONMENT = 70        # Environment variables
    LOCAL_FILE = 60         # Local config file (config.local.yaml)
    DEPLOYED_FILE = 50      # Deployed config file (config.yaml)
    DEFAULT = 10            # Hardcoded defaults


class ConfigDataType(Enum):
    """Supported configuration data types."""
    STRING = "string"
    INTEGER = "integer"
    FLOAT = "float"
    BOOLEAN = "boolean"
    LIST = "list"
    DICT = "dict"
    PATH = "path"
    SECRET = "secret"  # Masked in logs/reports


@dataclass
class ConfigSchema:
    """Schema definition for a configuration key."""
    key: str
    data_type: ConfigDataType
    description: str
    default: Any = None
    required: bool = False
    secret: bool = False
    validation_pattern: str | None = None  # Regex pattern for string validation
    min_value: int | float | None = None
    max_value: int | float | None = None
    allowed_values: list[Any] | None = None
    deprecated: bool = False
    replacement_key: str | None = None


@dataclass
class ConfigEntry:
    """A configuration entry with metadata."""
    key: str
    value: Any
    source: ConfigSource
    data_type: ConfigDataType
    schema: ConfigSchema | None = None
    loaded_at: datetime = field(default_factory=lambda: datetime.now(timezone.utc))
    modified_at: datetime | None = None
    validation_errors: list[str] = field(default_factory=list)


@dataclass
class ConfigChangeEvent:
    """Event emitted when configuration changes."""
    key: str
    old_value: Any
    new_value: Any
    source: ConfigSource
    timestamp: datetime = field(default_factory=lambda: datetime.now(timezone.utc))
    instance_id: str | None = None


@dataclass
class DeploymentRecord:
    """Record of a configuration deployment."""
    deployment_id: str
    config_hash: str
    deployed_at: datetime
    instance_ids: list[str]
    status: str  # "pending", "deploying", "completed", "failed"
    verification_results: dict[str, bool] = field(default_factory=dict)
    error_message: str | None = None


class ConfigValidationError(Exception):
    """Raised when configuration validation fails."""
    def __init__(self, errors: list[str]):
        self.errors = errors
        super().__init__(f"Configuration validation failed: {'; '.join(errors)}")


class ConfigManager:
    """
    Centralized configuration management system.
    
    Features:
    - Hierarchical configuration with priority-based merging
    - Type-safe access with validation
    - Hot-reload support
    - Instance-specific overrides
    - Secret management
    - Configuration change auditing
    - Deployment tracking
    """
    
    _instance: ConfigManager | None = None
    _lock = threading.Lock()
    
    # Default schema for Geometry OS configuration
    DEFAULT_SCHEMA: list[ConfigSchema] = [
        # API Keys
        ConfigSchema(
            key="google_api_key",
            data_type=ConfigDataType.SECRET,
            description="Google Gemini API Key for AI features",
            required=False,
            secret=True,
        ),
        ConfigSchema(
            key="zai_api_key",
            data_type=ConfigDataType.SECRET,
            description="Z.ai API Key for cognitive agents",
            required=False,
            secret=True,
        ),
        ConfigSchema(
            key="geometry_os_api_key",
            data_type=ConfigDataType.SECRET,
            description="API Server authentication key",
            required=False,
            secret=True,
        ),
        
        # WordPress Integration
        ConfigSchema(
            key="wp_url",
            data_type=ConfigDataType.STRING,
            description="WordPress site URL",
            required=False,
        ),
        ConfigSchema(
            key="wp_username",
            data_type=ConfigDataType.STRING,
            description="WordPress username",
            required=False,
        ),
        ConfigSchema(
            key="wp_password",
            data_type=ConfigDataType.SECRET,
            description="WordPress password",
            required=False,
            secret=True,
        ),
        
        # Security
        ConfigSchema(
            key="github_webhook_secret",
            data_type=ConfigDataType.SECRET,
            description="GitHub webhook secret",
            required=False,
            secret=True,
        ),
        
        # System Configuration
        ConfigSchema(
            key="debug_mode",
            data_type=ConfigDataType.BOOLEAN,
            description="Enable debug features",
            default=False,
        ),
        ConfigSchema(
            key="log_level",
            data_type=ConfigDataType.STRING,
            description="Logging level (DEBUG, INFO, WARNING, ERROR)",
            default="INFO",
            allowed_values=["DEBUG", "INFO", "WARNING", "ERROR", "TRACE", "OFF"],
        ),
        ConfigSchema(
            key="log_dir",
            data_type=ConfigDataType.PATH,
            description="Directory for log files",
            default="logs",
        ),
        
        # Distributed Mode
        ConfigSchema(
            key="is_clone",
            data_type=ConfigDataType.BOOLEAN,
            description="Whether this instance is a clone",
            default=False,
            deprecated=True,
            replacement_key="instance.is_clone",
        ),
        ConfigSchema(
            key="clone_id",
            data_type=ConfigDataType.STRING,
            description="Clone identification for distributed mode",
            deprecated=True,
            replacement_key="instance.id",
        ),
        ConfigSchema(
            key="instance.id",
            data_type=ConfigDataType.STRING,
            description="Unique instance identifier",
            required=False,
        ),
        ConfigSchema(
            key="instance.is_clone",
            data_type=ConfigDataType.BOOLEAN,
            description="Whether this instance is a clone",
            default=False,
        ),
        ConfigSchema(
            key="instance.role",
            data_type=ConfigDataType.STRING,
            description="Instance role (primary, replica, worker)",
            default="primary",
            allowed_values=["primary", "replica", "worker"],
        ),
        
        # Neural Configuration
        ConfigSchema(
            key="neural.model_path",
            data_type=ConfigDataType.PATH,
            description="Path to neural model file",
            required=False,
        ),
        ConfigSchema(
            key="neural.inference_device",
            data_type=ConfigDataType.STRING,
            description="Device for neural inference",
            default="auto",
            allowed_values=["auto", "cpu", "cuda", "mps", "vulkan"],
        ),
        ConfigSchema(
            key="neural.batch_size",
            data_type=ConfigDataType.INTEGER,
            description="Batch size for neural inference",
            default=1,
            min_value=1,
            max_value=1024,
        ),
        
        # Evolution Configuration
        ConfigSchema(
            key="evolution.enabled",
            data_type=ConfigDataType.BOOLEAN,
            description="Enable evolution daemon",
            default=True,
        ),
        ConfigSchema(
            key="evolution.check_interval_seconds",
            data_type=ConfigDataType.INTEGER,
            description="Evolution check interval in seconds",
            default=60,
            min_value=1,
            max_value=3600,
        ),
        ConfigSchema(
            key="evolution.max_generations",
            data_type=ConfigDataType.INTEGER,
            description="Maximum evolution generations",
            default=1000,
            min_value=1,
        ),
        
        # Visual Shell Configuration
        ConfigSchema(
            key="visual_shell.backend",
            data_type=ConfigDataType.STRING,
            description="Rendering backend",
            default="winit",
            allowed_values=["winit", "drm"],
        ),
        ConfigSchema(
            key="visual_shell.fps_target",
            data_type=ConfigDataType.INTEGER,
            description="Target frame rate",
            default=60,
            min_value=1,
            max_value=240,
        ),
        ConfigSchema(
            key="visual_shell.resolution_width",
            data_type=ConfigDataType.INTEGER,
            description="Display resolution width",
            default=1920,
            min_value=640,
            max_value=7680,
        ),
        ConfigSchema(
            key="visual_shell.resolution_height",
            data_type=ConfigDataType.INTEGER,
            description="Display resolution height",
            default=1080,
            min_value=480,
            max_value=4320,
        ),
        
        # Memory Configuration
        ConfigSchema(
            key="memory.max_heap_mb",
            data_type=ConfigDataType.INTEGER,
            description="Maximum heap memory in MB",
            default=512,
            min_value=64,
            max_value=16384,
        ),
        ConfigSchema(
            key="memory.cache_size_mb",
            data_type=ConfigDataType.INTEGER,
            description="Cache size in MB",
            default=128,
            min_value=16,
            max_value=4096,
        ),
        
        # Network Configuration
        ConfigSchema(
            key="network.bind_address",
            data_type=ConfigDataType.STRING,
            description="Network bind address",
            default="0.0.0.0",
        ),
        ConfigSchema(
            key="network.api_port",
            data_type=ConfigDataType.INTEGER,
            description="API server port",
            default=8080,
            min_value=1,
            max_value=65535,
        ),
        ConfigSchema(
            key="network.webhook_port",
            data_type=ConfigDataType.INTEGER,
            description="Webhook listener port",
            default=8081,
            min_value=1,
            max_value=65535,
        ),
        
        # Performance Configuration
        ConfigSchema(
            key="performance.slow_op_threshold_ms",
            data_type=ConfigDataType.FLOAT,
            description="Threshold for slow operation logging (ms)",
            default=50.0,
            min_value=1.0,
            max_value=10000.0,
        ),
        ConfigSchema(
            key="performance.profile_enabled",
            data_type=ConfigDataType.BOOLEAN,
            description="Enable performance profiling",
            default=False,
        ),
    ]
    
    def __init__(
        self,
        config_dir: str | Path | None = None,
        instance_id: str | None = None,
        auto_reload: bool = False,
        reload_interval: float = 5.0,
    ):
        """
        Initialize configuration manager.
        
        Args:
            config_dir: Directory containing configuration files
            instance_id: Unique instance identifier
            auto_reload: Enable automatic configuration reload
            reload_interval: Interval in seconds for auto-reload
        """
        self._config_dir = Path(config_dir) if config_dir else Path.cwd()
        self._instance_id = instance_id or self._generate_instance_id()
        
        # Configuration storage
        self._entries: dict[str, ConfigEntry] = {}
        self._schema: dict[str, ConfigSchema] = {s.key: s for s in self.DEFAULT_SCHEMA}
        
        # Instance-specific overrides
        self._instance_overrides: dict[str, Any] = {}
        
        # Change tracking
        self._change_listeners: list[Callable[[ConfigChangeEvent], None]] = []
        self._change_history: list[ConfigChangeEvent] = []
        self._max_history = 1000
        
        # Deployment tracking
        self._deployments: dict[str, DeploymentRecord] = {}
        
        # Auto-reload
        self._auto_reload = auto_reload
        self._reload_interval = reload_interval
        self._reload_thread: threading.Thread | None = None
        self._stop_reload = threading.Event()
        self._last_load_time: float = 0
        self._file_hashes: dict[str, str] = {}
        
        # Load initial configuration
        self._load_defaults()
        self._load_from_files()
        self._load_from_environment()
        self._load_instance_overrides()
        
        # Start auto-reload if enabled
        if auto_reload:
            self._start_reload_thread()
    
    @classmethod
    def get_instance(cls, **kwargs) -> ConfigManager:
        """Get singleton instance of ConfigManager."""
        if cls._instance is None:
            with cls._lock:
                if cls._instance is None:
                    cls._instance = cls(**kwargs)
        return cls._instance
    
    @classmethod
    def reset_instance(cls) -> None:
        """Reset singleton instance (for testing)."""
        with cls._lock:
            if cls._instance is not None:
                if cls._instance._reload_thread:
                    cls._instance._stop_reload.set()
                    cls._instance._reload_thread.join(timeout=5.0)
                cls._instance = None
    
    def _generate_instance_id(self) -> str:
        """Generate a unique instance ID."""
        hostname = os.environ.get("HOSTNAME", os.environ.get("COMPUTERNAME", "unknown"))
        random_part = secrets.token_hex(4)
        return f"{hostname}-{random_part}"
    
    def _load_defaults(self) -> None:
        """Load default values from schema."""
        for key, schema in self._schema.items():
            if schema.default is not None:
                self._set_entry(key, schema.default, ConfigSource.DEFAULT, schema.data_type, schema)
    
    def _load_from_files(self) -> None:
        """Load configuration from files."""
        # Load in priority order (lowest to highest)
        config_files = [
            ("config.yaml", ConfigSource.DEPLOYED_FILE),
            ("config.local.yaml", ConfigSource.LOCAL_FILE),
        ]
        
        for filename, source in config_files:
            filepath = self._config_dir / filename
            if filepath.exists():
                self._load_file(filepath, source)
        
        # Also check for JSON config
        json_config = self._config_dir / "config.json"
        if json_config.exists():
            self._load_json_file(json_config, ConfigSource.DEPLOYED_FILE)
    
    def _load_file(self, filepath: Path, source: ConfigSource) -> None:
        """Load configuration from a YAML file."""
        if not YAML_AVAILABLE:
            return
            
        try:
            file_hash = self._compute_file_hash(filepath)
            self._file_hashes[str(filepath)] = file_hash
            
            with open(filepath, 'r') as f:
                data = yaml.safe_load(f) or {}
            
            self._flatten_and_load(data, source)
            self._last_load_time = time.time()
        except Exception as e:
            # Log but don't fail - configuration loading should be resilient
            print(f"Warning: Failed to load config file {filepath}: {e}")
    
    def _load_json_file(self, filepath: Path, source: ConfigSource) -> None:
        """Load configuration from a JSON file."""
        try:
            file_hash = self._compute_file_hash(filepath)
            self._file_hashes[str(filepath)] = file_hash
            
            with open(filepath, 'r') as f:
                data = json.load(f)
            
            self._flatten_and_load(data, source)
            self._last_load_time = time.time()
        except Exception as e:
            print(f"Warning: Failed to load config file {filepath}: {e}")
    
    def _flatten_and_load(self, data: dict, source: ConfigSource, prefix: str = "") -> None:
        """Flatten nested dict and load into configuration."""
        for key, value in data.items():
            full_key = f"{prefix}.{key}" if prefix else key
            
            if isinstance(value, dict) and not key.endswith("_"):
                self._flatten_and_load(value, source, full_key)
            else:
                data_type = self._infer_data_type(value)
                schema = self._schema.get(full_key)
                self._set_entry(full_key, value, source, data_type, schema)
    
    def _load_from_environment(self) -> None:
        """Load configuration from environment variables."""
        env_mappings = {
            # Direct mappings
            "GOOGLE_API_KEY": "google_api_key",
            "ZAI_API_KEY": "zai_api_key",
            "GEOMETRY_OS_API_KEY": "geometry_os_api_key",
            "GITHUB_WEBHOOK_SECRET": "github_webhook_secret",
            "WP_URL": "wp_url",
            "WP_USERNAME": "wp_username",
            "WP_PASSWORD": "wp_password",
            "DEBUG_MODE": "debug_mode",
            "RUST_LOG": "log_level",
            "GEOM_LOG_DIR": "log_dir",
            "GEOMETRY_OS_IS_CLONE": "instance.is_clone",
            "GEOMETRY_OS_CLONE_ID": "instance.id",
            
            # Prefixed mappings (GEOM_)
            "GEOM_NEURAL_MODEL_PATH": "neural.model_path",
            "GEOM_NEURAL_INFERENCE_DEVICE": "neural.inference_device",
            "GEOM_NEURAL_BATCH_SIZE": "neural.batch_size",
            "GEOM_EVOLUTION_ENABLED": "evolution.enabled",
            "GEOM_EVOLUTION_CHECK_INTERVAL": "evolution.check_interval_seconds",
            "GEOM_VISUAL_SHELL_BACKEND": "visual_shell.backend",
            "GEOM_VISUAL_SHELL_FPS": "visual_shell.fps_target",
            "GEOM_MEMORY_MAX_HEAP": "memory.max_heap_mb",
            "GEOM_MEMORY_CACHE_SIZE": "memory.cache_size",
            "GEOM_NETWORK_BIND": "network.bind_address",
            "GEOM_NETWORK_API_PORT": "network.api_port",
            "GEOM_NETWORK_WEBHOOK_PORT": "network.webhook_port",
        }
        
        for env_key, config_key in env_mappings.items():
            value = os.environ.get(env_key)
            if value is not None:
                schema = self._schema.get(config_key)
                data_type = schema.data_type if schema else ConfigDataType.STRING
                converted = self._convert_value(value, data_type)
                self._set_entry(config_key, converted, ConfigSource.ENVIRONMENT, data_type, schema)
        
        # Also check for GEOM_ prefixed values not in mapping
        for env_key, value in os.environ.items():
            if env_key.startswith("GEOM_CONFIG_"):
                # Convert GEOM_CONFIG_SECTION_KEY to section.key
                config_key = env_key[12:].lower().replace("_", ".")
                schema = self._schema.get(config_key)
                data_type = schema.data_type if schema else ConfigDataType.STRING
                converted = self._convert_value(value, data_type)
                self._set_entry(config_key, converted, ConfigSource.ENVIRONMENT, data_type, schema)
    
    def _load_instance_overrides(self) -> None:
        """Load instance-specific overrides."""
        # Check for instance config file
        instance_config = self._config_dir / f"config.{self._instance_id}.yaml"
        if instance_config.exists() and YAML_AVAILABLE:
            try:
                with open(instance_config, 'r') as f:
                    data = yaml.safe_load(f) or {}
                self._flatten_and_load(data, ConfigSource.INSTANCE)
            except Exception as e:
                print(f"Warning: Failed to load instance config: {e}")
        
        # Check for instance config in JSON
        instance_json = self._config_dir / f"config.{self._instance_id}.json"
        if instance_json.exists():
            try:
                with open(instance_json, 'r') as f:
                    data = json.load(f)
                self._flatten_and_load(data, ConfigSource.INSTANCE)
            except Exception as e:
                print(f"Warning: Failed to load instance config: {e}")
    
    def _set_entry(
        self,
        key: str,
        value: Any,
        source: ConfigSource,
        data_type: ConfigDataType,
        schema: ConfigSchema | None = None,
    ) -> None:
        """Set a configuration entry."""
        old_entry = self._entries.get(key)
        old_value = old_entry.value if old_entry else None
        
        # Validate value
        validation_errors = self._validate_value(key, value, schema) if schema else []
        
        entry = ConfigEntry(
            key=key,
            value=value,
            source=source,
            data_type=data_type,
            schema=schema,
            validation_errors=validation_errors,
        )
        
        # Only set if source priority is higher or equal
        if old_entry is None or source.value >= old_entry.source.value:
            self._entries[key] = entry
            
            # Emit change event if value actually changed (or new key)
            if old_entry is None:
                # New key - emit with None old_value
                self._emit_change_event(key, None, value, source)
            elif old_value != value:
                # Value changed
                self._emit_change_event(key, old_value, value, source)
    
    def _validate_value(self, key: str, value: Any, schema: ConfigSchema | None) -> list[str]:
        """Validate a configuration value against its schema."""
        errors = []
        
        if schema is None:
            return errors
        
        # Check required
        if schema.required and value is None:
            errors.append(f"Required configuration '{key}' is missing")
            return errors
        
        if value is None:
            return errors  # Optional and not set is OK
        
        # Type validation
        if schema.data_type == ConfigDataType.INTEGER:
            if not isinstance(value, int) or isinstance(value, bool):
                errors.append(f"'{key}' must be an integer, got {type(value).__name__}")
        elif schema.data_type == ConfigDataType.FLOAT:
            if not isinstance(value, (int, float)):
                errors.append(f"'{key}' must be a number, got {type(value).__name__}")
        elif schema.data_type == ConfigDataType.BOOLEAN:
            if not isinstance(value, bool):
                errors.append(f"'{key}' must be a boolean, got {type(value).__name__}")
        elif schema.data_type == ConfigDataType.LIST:
            if not isinstance(value, list):
                errors.append(f"'{key}' must be a list, got {type(value).__name__}")
        elif schema.data_type == ConfigDataType.DICT:
            if not isinstance(value, dict):
                errors.append(f"'{key}' must be a dict, got {type(value).__name__}")
        
        # Range validation
        if schema.min_value is not None and isinstance(value, (int, float)):
            if value < schema.min_value:
                errors.append(f"'{key}' must be >= {schema.min_value}, got {value}")
        
        if schema.max_value is not None and isinstance(value, (int, float)):
            if value > schema.max_value:
                errors.append(f"'{key}' must be <= {schema.max_value}, got {value}")
        
        # Allowed values validation
        if schema.allowed_values is not None and value not in schema.allowed_values:
            errors.append(f"'{key}' must be one of {schema.allowed_values}, got {value}")
        
        # Pattern validation (for strings)
        if schema.validation_pattern and isinstance(value, str):
            import re
            if not re.match(schema.validation_pattern, value):
                errors.append(f"'{key}' does not match pattern {schema.validation_pattern}")
        
        return errors
    
    def _convert_value(self, value: str, data_type: ConfigDataType) -> Any:
        """Convert a string value to the specified type."""
        if data_type == ConfigDataType.INTEGER:
            try:
                return int(value)
            except ValueError:
                return 0
        elif data_type == ConfigDataType.FLOAT:
            try:
                return float(value)
            except ValueError:
                return 0.0
        elif data_type == ConfigDataType.BOOLEAN:
            return value.lower() in ("true", "1", "yes", "on", "enabled")
        elif data_type == ConfigDataType.LIST:
            if value.startswith("["):
                try:
                    return json.loads(value)
                except json.JSONDecodeError:
                    return [v.strip() for v in value.split(",")]
            return [v.strip() for v in value.split(",")]
        elif data_type == ConfigDataType.DICT:
            if value.startswith("{"):
                try:
                    return json.loads(value)
                except json.JSONDecodeError:
                    return {}
            return {}
        else:
            return value
    
    def _infer_data_type(self, value: Any) -> ConfigDataType:
        """Infer the data type of a value."""
        if isinstance(value, bool):
            return ConfigDataType.BOOLEAN
        elif isinstance(value, int):
            return ConfigDataType.INTEGER
        elif isinstance(value, float):
            return ConfigDataType.FLOAT
        elif isinstance(value, list):
            return ConfigDataType.LIST
        elif isinstance(value, dict):
            return ConfigDataType.DICT
        elif isinstance(value, Path) or (isinstance(value, str) and ("/" in value or "\\" in value)):
            return ConfigDataType.PATH
        else:
            return ConfigDataType.STRING
    
    def _emit_change_event(
        self,
        key: str,
        old_value: Any,
        new_value: Any,
        source: ConfigSource,
    ) -> None:
        """Emit a configuration change event."""
        event = ConfigChangeEvent(
            key=key,
            old_value=old_value,
            new_value=new_value,
            source=source,
            instance_id=self._instance_id,
        )
        
        # Add to history
        self._change_history.append(event)
        if len(self._change_history) > self._max_history:
            self._change_history = self._change_history[-self._max_history:]
        
        # Notify listeners
        for listener in self._change_listeners:
            try:
                listener(event)
            except Exception:
                pass  # Don't fail on listener errors
    
    def _compute_file_hash(self, filepath: Path) -> str:
        """Compute hash of a file for change detection."""
        hasher = hashlib.sha256()
        try:
            with open(filepath, 'rb') as f:
                hasher.update(f.read())
            return hasher.hexdigest()
        except Exception:
            return ""
    
    def _start_reload_thread(self) -> None:
        """Start the auto-reload thread."""
        self._stop_reload.clear()
        self._reload_thread = threading.Thread(target=self._reload_loop, daemon=True)
        self._reload_thread.start()
    
    def _reload_loop(self) -> None:
        """Auto-reload loop."""
        while not self._stop_reload.wait(self._reload_interval):
            self._check_for_changes()
    
    def _check_for_changes(self) -> None:
        """Check for configuration file changes and reload if needed."""
        config_files = [
            self._config_dir / "config.yaml",
            self._config_dir / "config.local.yaml",
            self._config_dir / "config.json",
        ]
        
        for filepath in config_files:
            if filepath.exists():
                new_hash = self._compute_file_hash(filepath)
                old_hash = self._file_hashes.get(str(filepath))
                
                if old_hash is None:
                    # First time seeing this file
                    self._file_hashes[str(filepath)] = new_hash
                elif new_hash != old_hash:
                    # File changed, reload
                    self._file_hashes[str(filepath)] = new_hash
                    if filepath.suffix == ".json":
                        self._load_json_file(filepath, ConfigSource.LOCAL_FILE)
                    else:
                        self._load_file(filepath, ConfigSource.LOCAL_FILE)
    
    # === Public API ===
    
    def get(
        self,
        key: str,
        default: T | None = None,
        source_min: ConfigSource = ConfigSource.DEFAULT,
    ) -> T | None:
        """
        Get a configuration value.
        
        Args:
            key: Configuration key (supports dot notation)
            default: Default value if not found
            source_min: Minimum source priority to consider
            
        Returns:
            Configuration value or default
        """
        entry = self._entries.get(key)
        if entry is None or entry.source.value < source_min.value:
            return default
        return entry.value
    
    def get_string(self, key: str, default: str = "") -> str:
        """Get a string configuration value."""
        value = self.get(key, default=default)
        return str(value) if value is not None else default
    
    def get_int(self, key: str, default: int = 0) -> int:
        """Get an integer configuration value."""
        value = self.get(key, default=default)
        return int(value) if value is not None else default
    
    def get_float(self, key: str, default: float = 0.0) -> float:
        """Get a float configuration value."""
        value = self.get(key, default=default)
        return float(value) if value is not None else default
    
    def get_bool(self, key: str, default: bool = False) -> bool:
        """Get a boolean configuration value."""
        value = self.get(key, default=default)
        return bool(value) if value is not None else default
    
    def get_list(self, key: str, default: list | None = None) -> list:
        """Get a list configuration value."""
        if default is None:
            default = []
        value = self.get(key, default=default)
        return list(value) if value is not None else default
    
    def get_dict(self, key: str, default: dict | None = None) -> dict:
        """Get a dict configuration value."""
        if default is None:
            default = {}
        value = self.get(key, default=default)
        return dict(value) if value is not None else default
    
    def get_path(self, key: str, default: Path | str | None = None) -> Path:
        """Get a path configuration value."""
        value = self.get(key, default=default)
        if value is None:
            return Path.cwd()
        return Path(value) if not isinstance(value, Path) else value
    
    def get_section(self, prefix: str) -> dict[str, Any]:
        """
        Get all configuration values with a given prefix.
        
        Args:
            prefix: Section prefix (e.g., "neural" for "neural.*")
            
        Returns:
            Dictionary of configuration values (without the prefix in keys)
        """
        result = {}
        full_prefix = f"{prefix}."
        
        for key, entry in self._entries.items():
            if key.startswith(full_prefix):
                sub_key = key[len(full_prefix):]
                result[sub_key] = entry.value
        
        return result
    
    def set(
        self,
        key: str,
        value: Any,
        source: ConfigSource = ConfigSource.RUNTIME,
    ) -> list[str]:
        """
        Set a configuration value at runtime.
        
        Args:
            key: Configuration key
            value: Configuration value
            source: Source priority (default: RUNTIME)
            
        Returns:
            List of validation errors (empty if valid)
        """
        schema = self._schema.get(key)
        data_type = schema.data_type if schema else self._infer_data_type(value)
        self._set_entry(key, value, source, data_type, schema)
        return self._entries[key].validation_errors
    
    def delete(self, key: str) -> bool:
        """
        Delete a configuration entry.
        
        Returns:
            True if the entry existed and was deleted
        """
        if key in self._entries:
            del self._entries[key]
            return True
        return False
    
    def reload(self) -> None:
        """Force reload of all configuration files."""
        self._load_from_files()
        self._load_from_environment()
        self._load_instance_overrides()
    
    def add_change_listener(self, listener: Callable[[ConfigChangeEvent], None]) -> None:
        """Add a listener for configuration changes."""
        self._change_listeners.append(listener)
    
    def remove_change_listener(self, listener: Callable[[ConfigChangeEvent], None]) -> None:
        """Remove a change listener."""
        if listener in self._change_listeners:
            self._change_listeners.remove(listener)
    
    def get_change_history(self, limit: int = 100) -> list[ConfigChangeEvent]:
        """Get recent configuration change history."""
        return self._change_history[-limit:]
    
    def validate(self) -> dict[str, list[str]]:
        """
        Validate all configuration entries.
        
        Returns:
            Dictionary mapping keys to their validation errors
        """
        errors = {}
        for key, entry in self._entries.items():
            if entry.validation_errors:
                errors[key] = entry.validation_errors
        return errors
    
    def validate_required(self) -> list[str]:
        """Check that all required configuration is present."""
        missing = []
        for key, schema in self._schema.items():
            if schema.required and key not in self._entries:
                missing.append(key)
        return missing
    
    def register_schema(self, schema: ConfigSchema) -> None:
        """Register a new configuration schema."""
        self._schema[schema.key] = schema
        
        # Set default if not already set
        if schema.default is not None and schema.key not in self._entries:
            self._set_entry(schema.key, schema.default, ConfigSource.DEFAULT, schema.data_type, schema)
    
    def get_schema(self, key: str) -> ConfigSchema | None:
        """Get the schema for a configuration key."""
        return self._schema.get(key)
    
    def get_all_keys(self) -> list[str]:
        """Get all configuration keys."""
        return list(self._entries.keys())
    
    def get_all_schema_keys(self) -> list[str]:
        """Get all schema-defined keys."""
        return list(self._schema.keys())
    
    # === Deployment Management ===
    
    def export_config(
        self,
        include_secrets: bool = False,
        include_defaults: bool = True,
        source_min: ConfigSource = ConfigSource.DEFAULT,
    ) -> dict[str, Any]:
        """
        Export configuration as a dictionary.
        
        Args:
            include_secrets: Whether to include secret values
            include_defaults: Whether to include default values
            source_min: Minimum source priority to include
            
        Returns:
            Nested dictionary of configuration
        """
        result = {}
        
        for key, entry in self._entries.items():
            if entry.source.value < source_min.value:
                continue
            
            if not include_defaults and entry.source == ConfigSource.DEFAULT:
                continue
            
            schema = self._schema.get(key)
            if schema and schema.secret and not include_secrets:
                value = "***REDACTED***"
            else:
                value = entry.value
            
            # Build nested structure
            parts = key.split(".")
            current = result
            for part in parts[:-1]:
                if part not in current:
                    current[part] = {}
                current = current[part]
            current[parts[-1]] = value
        
        return result
    
    def export_to_yaml(
        self,
        filepath: str | Path,
        include_secrets: bool = False,
        include_defaults: bool = True,
    ) -> None:
        """Export configuration to a YAML file."""
        if not YAML_AVAILABLE:
            raise RuntimeError("PyYAML not available for YAML export")
        
        data = self.export_config(include_secrets, include_defaults)
        with open(filepath, 'w') as f:
            yaml.dump(data, f, default_flow_style=False, sort_keys=True)
    
    def export_to_json(
        self,
        filepath: str | Path,
        include_secrets: bool = False,
        include_defaults: bool = True,
        pretty: bool = True,
    ) -> None:
        """Export configuration to a JSON file."""
        data = self.export_config(include_secrets, include_defaults)
        with open(filepath, 'w') as f:
            if pretty:
                json.dump(data, f, indent=2, sort_keys=True)
            else:
                json.dump(data, f, sort_keys=True)
    
    def compute_config_hash(self, include_secrets: bool = True) -> str:
        """Compute a hash of the current configuration."""
        data = self.export_config(include_secrets=include_secrets)
        content = json.dumps(data, sort_keys=True)
        return hashlib.sha256(content.encode()).hexdigest()[:16]
    
    def create_deployment(
        self,
        instance_ids: list[str],
        description: str | None = None,
    ) -> DeploymentRecord:
        """
        Create a new deployment record.
        
        Args:
            instance_ids: List of instance IDs to deploy to
            description: Optional deployment description
            
        Returns:
            DeploymentRecord for tracking
        """
        deployment_id = f"deploy-{datetime.now(timezone.utc).strftime('%Y%m%d%H%M%S')}-{secrets.token_hex(4)}"
        
        record = DeploymentRecord(
            deployment_id=deployment_id,
            config_hash=self.compute_config_hash(),
            deployed_at=datetime.now(timezone.utc),
            instance_ids=instance_ids,
            status="pending",
        )
        
        self._deployments[deployment_id] = record
        return record
    
    def update_deployment(
        self,
        deployment_id: str,
        status: str,
        verification_results: dict[str, bool] | None = None,
        error_message: str | None = None,
    ) -> DeploymentRecord | None:
        """Update a deployment record."""
        record = self._deployments.get(deployment_id)
        if record is None:
            return None
        
        record.status = status
        if verification_results:
            record.verification_results.update(verification_results)
        if error_message:
            record.error_message = error_message
        
        return record
    
    def get_deployment(self, deployment_id: str) -> DeploymentRecord | None:
        """Get a deployment record by ID."""
        return self._deployments.get(deployment_id)
    
    def list_deployments(self, limit: int = 50) -> list[DeploymentRecord]:
        """List recent deployments."""
        deployments = sorted(
            self._deployments.values(),
            key=lambda d: d.deployed_at,
            reverse=True,
        )
        return deployments[:limit]
    
    # === Reporting ===
    
    def generate_report(self) -> dict[str, Any]:
        """Generate a comprehensive configuration report."""
        validation_errors = self.validate()
        missing_required = self.validate_required()
        
        return {
            "instance_id": self._instance_id,
            "config_hash": self.compute_config_hash(include_secrets=False),
            "total_keys": len(self._entries),
            "schema_keys": len(self._schema),
            "validation_errors": validation_errors,
            "missing_required": missing_required,
            "is_valid": len(validation_errors) == 0 and len(missing_required) == 0,
            "sources": {
                "cli_override": len([e for e in self._entries.values() if e.source == ConfigSource.CLI_OVERRIDE]),
                "runtime": len([e for e in self._entries.values() if e.source == ConfigSource.RUNTIME]),
                "instance": len([e for e in self._entries.values() if e.source == ConfigSource.INSTANCE]),
                "environment": len([e for e in self._entries.values() if e.source == ConfigSource.ENVIRONMENT]),
                "local_file": len([e for e in self._entries.values() if e.source == ConfigSource.LOCAL_FILE]),
                "deployed_file": len([e for e in self._entries.values() if e.source == ConfigSource.DEPLOYED_FILE]),
                "default": len([e for e in self._entries.values() if e.source == ConfigSource.DEFAULT]),
            },
            "recent_changes": [
                {
                    "key": e.key,
                    "old_value": "***REDACTED***" if self._schema.get(e.key, ConfigSchema("", ConfigDataType.STRING, "")).secret else e.old_value,
                    "new_value": "***REDACTED***" if self._schema.get(e.key, ConfigSchema("", ConfigDataType.STRING, "")).secret else e.new_value,
                    "source": e.source.name,
                    "timestamp": e.timestamp.isoformat(),
                }
                for e in self.get_change_history(10)
            ],
            "deployments": {
                "total": len(self._deployments),
                "recent": [
                    {
                        "deployment_id": d.deployment_id,
                        "config_hash": d.config_hash,
                        "status": d.status,
                        "deployed_at": d.deployed_at.isoformat(),
                        "instances": len(d.instance_ids),
                    }
                    for d in self.list_deployments(5)
                ],
            },
        }
    
    def __repr__(self) -> str:
        return f"ConfigManager(instance_id={self._instance_id}, keys={len(self._entries)})"


# === Convenience Functions ===

def get_config(**kwargs) -> ConfigManager:
    """Get the singleton ConfigManager instance."""
    return ConfigManager.get_instance(**kwargs)


def reset_config() -> None:
    """Reset the ConfigManager singleton."""
    ConfigManager.reset_instance()


# === Environment Variable Helpers ===

def setup_from_env(config_manager: ConfigManager | None = None) -> ConfigManager:
    """
    Set up configuration from environment variables.
    
    This is called automatically by get_config(), but can be called
    explicitly to reload from environment.
    """
    if config_manager is None:
        config_manager = get_config()
    
    # Force reload from environment
    config_manager._load_from_environment()
    return config_manager


__all__ = [
    # Main classes
    "ConfigManager",
    "ConfigSource",
    "ConfigDataType",
    "ConfigSchema",
    "ConfigEntry",
    "ConfigChangeEvent",
    "DeploymentRecord",
    "ConfigValidationError",
    
    # Convenience functions
    "get_config",
    "reset_config",
    "setup_from_env",
]
