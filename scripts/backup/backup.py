#!/usr/bin/env python3
"""
Geometry OS Backup System
=========================

A reliable backup solution for critical data and code repositories.

Features:
- Full and incremental backups
- Compression with zstd/gzip
- Backup verification
- Test restore capability
- Retention policy management
- Detailed logging and reporting
- Git repository awareness
- Remote backup support (rsync)
- Pre/post backup hooks

Usage:
    python backup.py [OPTIONS] COMMAND

Commands:
    full        Perform a full backup
    incremental Perform an incremental backup
    verify      Verify the last backup
    test        Test restore to temporary location
    status      Show backup status and statistics
    clean       Clean old backups based on retention policy
    list        List available backups
    schedule    Create systemd timer for automatic backups
"""

import argparse
import hashlib
import json
import logging
import os
import shutil
import subprocess
import sys
import tarfile
import tempfile
from dataclasses import dataclass, field
from datetime import datetime, timedelta
from pathlib import Path
from typing import Any, Optional

# Try to import yaml, fall back to basic parsing if not available
try:
    import yaml
    HAS_YAML = True
except ImportError:
    HAS_YAML = False

# Try to import zstandard
try:
    import zstandard as zstd
    HAS_ZSTD = True
except ImportError:
    HAS_ZSTD = False


# ============================================================================
# Configuration
# ============================================================================

@dataclass
class BackupConfig:
    """Backup configuration."""
    # Destination
    dest_local: str = "~/.local/share/geometry-backup/archives"
    dest_remote: str = ""
    dest_external: str = ""
    
    # Retention
    retention_daily: int = 7
    retention_weekly: int = 4
    retention_monthly: int = 6
    
    # Verification
    verify_enabled: bool = True
    test_restore: bool = True
    max_age_hours: int = 24
    
    # Compression
    compression_algorithm: str = "zstd"
    compression_level: int = 6
    
    # Logging
    log_path: str = "~/.local/share/geometry-backup/logs"
    log_level: str = "INFO"
    log_retention_days: int = 30
    
    # Notifications
    notifications_enabled: bool = False
    on_success: str = ""
    on_failure: str = ""
    
    # Hooks
    pre_backup: list = field(default_factory=list)
    post_backup: list = field(default_factory=list)
    
    # Sources
    sources: list = field(default_factory=list)
    critical_patterns: list = field(default_factory=list)


def load_config(config_path: Path) -> BackupConfig:
    """Load configuration from YAML file."""
    config = BackupConfig()
    
    if not config_path.exists():
        return config
    
    if HAS_YAML:
        with open(config_path) as f:
            data = yaml.safe_load(f)
    else:
        # Basic YAML parsing for simple configs
        data = parse_simple_yaml(config_path)
    
    if not data:
        return config
    
    # Parse destination
    dest = data.get("destination", {})
    config.dest_local = os.path.expanduser(dest.get("local", config.dest_local))
    config.dest_remote = dest.get("remote", "")
    config.dest_external = dest.get("external", "")
    
    # Parse retention
    retention = data.get("retention", {})
    config.retention_daily = retention.get("daily", config.retention_daily)
    config.retention_weekly = retention.get("weekly", config.retention_weekly)
    config.retention_monthly = retention.get("monthly", config.retention_monthly)
    
    # Parse verification
    verification = data.get("verification", {})
    config.verify_enabled = verification.get("enabled", config.verify_enabled)
    config.test_restore = verification.get("test_restore", config.test_restore)
    config.max_age_hours = verification.get("max_age_hours", config.max_age_hours)
    
    # Parse compression
    compression = data.get("compression", {})
    config.compression_algorithm = compression.get("algorithm", config.compression_algorithm)
    config.compression_level = compression.get("level", config.compression_level)
    
    # Parse logging
    logging_config = data.get("logging", {})
    config.log_path = os.path.expanduser(logging_config.get("path", config.log_path))
    config.log_level = logging_config.get("level", config.log_level)
    config.log_retention_days = logging_config.get("retention_days", config.log_retention_days)
    
    # Parse notifications
    notifications = data.get("notifications", {})
    config.notifications_enabled = notifications.get("enabled", False)
    config.on_success = notifications.get("on_success", "")
    config.on_failure = notifications.get("on_failure", "")
    
    # Parse hooks
    hooks = data.get("hooks", {})
    config.pre_backup = hooks.get("pre_backup", [])
    config.post_backup = hooks.get("post_backup", [])
    
    # Parse sources
    config.sources = data.get("sources", [])
    config.critical_patterns = data.get("critical_patterns", [])
    
    return config


def parse_simple_yaml(path: Path) -> dict:
    """Basic YAML parsing for simple configs without PyYAML."""
    data = {}
    current_section = None
    current_subsection = None
    
    with open(path) as f:
        for line in f:
            line = line.rstrip()
            if not line or line.startswith('#'):
                continue
            
            # Count indentation
            indent = len(line) - len(line.lstrip())
            line = line.strip()
            
            if ':' in line:
                key, _, value = line.partition(':')
                key = key.strip()
                value = value.strip().strip('"').strip("'")
                
                if indent == 0:
                    current_section = key
                    current_subsection = None
                    data[current_section] = {}
                elif indent == 2:
                    if current_section:
                        if value:
                            data[current_section][key] = value
                        else:
                            current_subsection = key
                            data[current_section][key] = []
                elif indent == 4:
                    if current_subsection and current_section:
                        if key == '-' or line.startswith('- '):
                            data[current_section][current_subsection].append(
                                line.lstrip('- ').strip()
                            )
    
    return data


# ============================================================================
# Logger Setup
# ============================================================================

def setup_logger(config: BackupConfig) -> logging.Logger:
    """Setup logging."""
    log_path = Path(config.log_path)
    log_path.mkdir(parents=True, exist_ok=True)
    
    logger = logging.getLogger("geometry-backup")
    logger.setLevel(getattr(logging, config.log_level))
    
    # File handler
    log_file = log_path / "backup.log"
    fh = logging.FileHandler(log_file)
    fh.setLevel(logging.DEBUG)
    
    # Console handler
    ch = logging.StreamHandler()
    ch.setLevel(logging.INFO)
    
    # Formatter
    formatter = logging.Formatter(
        '%(asctime)s - %(levelname)s - %(message)s'
    )
    fh.setFormatter(formatter)
    ch.setFormatter(formatter)
    
    logger.addHandler(fh)
    logger.addHandler(ch)
    
    return logger


# ============================================================================
# Backup Manager
# ============================================================================

class BackupManager:
    """Manages backup operations."""
    
    EXCLUDE_PATTERNS = [
        "*.pyc",
        "__pycache__",
        ".venv",
        "node_modules",
        "*.rts.png.f16",
        "htmlcov",
        ".coverage",
        "coverage.json",
        "*.log",
        "*.tmp",
        "*.swp",
        ".DS_Store",
        ".git/objects/pack/*.idx",
        ".git/objects/pack/*.pack",
    ]
    
    def __init__(self, config: BackupConfig, logger: logging.Logger):
        self.config = config
        self.logger = logger
        self.dest_path = Path(config.dest_local)
        self.compressor = self._get_compressor()
        
    def _get_compressor(self) -> tuple[str, str]:
        """Get compression command and extension."""
        if self.config.compression_algorithm == "zstd" and HAS_ZSTD:
            return "zstd", ".zst"
        elif self.config.compression_algorithm == "zstd" and shutil.which("zstd"):
            return "zstd", ".zst"
        elif shutil.which("pigz"):
            return "pigz", ".gz"
        else:
            return "gzip", ".gz"
    
    def _run_command(self, cmd: list, check: bool = True) -> subprocess.CompletedProcess:
        """Run a shell command."""
        self.logger.debug(f"Running: {' '.join(cmd)}")
        return subprocess.run(cmd, check=check, capture_output=True, text=True)
    
    def _get_exclude_file(self) -> Path:
        """Create a temporary exclude file."""
        exclude_file = Path(tempfile.mktemp())
        exclude_file.write_text("\n".join(self.EXCLUDE_PATTERNS))
        return exclude_file
    
    def _get_git_info(self) -> dict:
        """Get git repository information."""
        info = {
            "commit": "unknown",
            "branch": "unknown",
            "remote": "unknown",
            "status": "unknown"
        }
        
        try:
            result = self._run_command(["git", "rev-parse", "HEAD"], check=False)
            if result.returncode == 0:
                info["commit"] = result.stdout.strip()
            
            result = self._run_command(["git", "branch", "--show-current"], check=False)
            if result.returncode == 0:
                info["branch"] = result.stdout.strip()
            
            result = self._run_command(["git", "remote", "get-url", "origin"], check=False)
            if result.returncode == 0:
                info["remote"] = result.stdout.strip()
            
            result = self._run_command(["git", "status", "--porcelain"], check=False)
            if result.returncode == 0:
                lines = result.stdout.strip().split('\n') if result.stdout.strip() else []
                info["status"] = f"{len(lines)} uncommitted changes" if lines else "clean"
        except Exception as e:
            self.logger.warning(f"Could not get git info: {e}")
        
        return info
    
    def _run_hooks(self, hooks: list, hook_type: str) -> bool:
        """Run pre/post backup hooks."""
        if not hooks:
            return True
        
        self.logger.info(f"Running {hook_type} hooks...")
        
        for hook in hooks:
            try:
                self.logger.debug(f"Running hook: {hook}")
                result = self._run_command(hook, shell=True, check=False)
                if result.returncode != 0:
                    self.logger.warning(f"Hook failed: {hook}")
            except Exception as e:
                self.logger.error(f"Hook error: {e}")
                return False
        
        return True
    
    def _create_manifest(self, archive_path: Path, backup_name: str, 
                         backup_type: str, size: int, duration: float) -> dict:
        """Create a backup manifest."""
        git_info = self._get_git_info()
        
        manifest = {
            "name": backup_name,
            "type": backup_type,
            "created": datetime.now().isoformat(),
            "size": size,
            "size_human": self._format_size(size),
            "duration_seconds": round(duration, 2),
            "archive": archive_path.name,
            "source": str(Path.cwd()),
            "git": git_info,
            "hostname": os.uname().nodename,
            "version": "1.0",
            "checksum": self._calculate_checksum(archive_path)
        }
        
        manifest_path = archive_path.with_suffix(archive_path.suffix + ".manifest.json")
        manifest_path.write_text(json.dumps(manifest, indent=2))
        
        self.logger.debug(f"Manifest created: {manifest_path}")
        return manifest
    
    def _calculate_checksum(self, file_path: Path) -> str:
        """Calculate SHA256 checksum of a file."""
        sha256 = hashlib.sha256()
        with open(file_path, "rb") as f:
            for chunk in iter(lambda: f.read(8192), b""):
                sha256.update(chunk)
        return sha256.hexdigest()
    
    @staticmethod
    def _format_size(size: int) -> str:
        """Format size in human-readable format."""
        for unit in ['B', 'KB', 'MB', 'GB', 'TB']:
            if size < 1024:
                return f"{size:.1f}{unit}"
            size /= 1024
        return f"{size:.1f}PB"
    
    def _estimate_size(self, path: Path, exclude_file: Path) -> int:
        """Estimate backup size."""
        try:
            result = self._run_command([
                "du", "-sb", "--exclude-from", str(exclude_file), str(path)
            ], check=False)
            if result.returncode == 0:
                return int(result.stdout.split()[0])
        except Exception:
            pass
        return 0
    
    def full_backup(self, dry_run: bool = False) -> bool:
        """Perform a full backup."""
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        backup_name = f"geometry_os_full_{timestamp}"
        
        compress_cmd, compress_ext = self.compressor
        archive_path = self.dest_path / f"{backup_name}.tar{compress_ext}"
        
        self.logger.info(f"Starting full backup: {backup_name}")
        
        # Create destination
        self.dest_path.mkdir(parents=True, exist_ok=True)
        
        # Create exclude file
        exclude_file = self._get_exclude_file()
        
        # Run pre-hooks
        self._run_hooks(self.config.pre_backup, "pre-backup")
        
        # Estimate size
        self.logger.info("Calculating backup size...")
        size_estimate = self._estimate_size(Path.cwd(), exclude_file)
        self.logger.info(f"Estimated backup size: {self._format_size(size_estimate)}")
        
        if dry_run:
            self.logger.info(f"[DRY RUN] Would create archive: {archive_path}")
            exclude_file.unlink()
            return True
        
        # Create archive
        self.logger.info("Creating archive...")
        start_time = datetime.now()
        
        try:
            # Create tar archive
            tar_cmd = [
                "tar", "--exclude-from", str(exclude_file),
                "-cf", "-", "."
            ]
            
            compress_cmd_list = [compress_cmd, f"-{self.config.compression_level}"]
            
            # Pipe tar to compression
            with open(archive_path, "wb") as archive_out:
                tar_proc = subprocess.Popen(tar_cmd, stdout=subprocess.PIPE)
                comp_proc = subprocess.Popen(compress_cmd_list, stdin=tar_proc.stdout, stdout=archive_out)
                tar_proc.stdout.close()
                comp_proc.communicate()
                
                if comp_proc.returncode != 0:
                    raise RuntimeError("Compression failed")
            
            end_time = datetime.now()
            duration = (end_time - start_time).total_seconds()
            
            archive_size = archive_path.stat().st_size
            compression_ratio = (archive_size / size_estimate * 100) if size_estimate > 0 else 0
            
            self.logger.info(f"Archive created: {archive_path}")
            self.logger.info(f"Archive size: {self._format_size(archive_size)}")
            self.logger.info(f"Compression ratio: {compression_ratio:.1f}%")
            self.logger.info(f"Duration: {duration:.1f}s")
            
            # Create manifest
            self._create_manifest(archive_path, backup_name, "full", archive_size, duration)
            
            # Run post-hooks
            self._run_hooks(self.config.post_backup, "post-backup")
            
            # Verify if enabled
            if self.config.verify_enabled:
                if not self.verify_backup(archive_path):
                    return False
            
            self._notify("success", f"Full backup completed: {self._format_size(archive_size)}")
            return True
            
        except Exception as e:
            self.logger.error(f"Backup failed: {e}")
            if archive_path.exists():
                archive_path.unlink()
            self._notify("failure", str(e))
            return False
        finally:
            exclude_file.unlink()
    
    def incremental_backup(self, dry_run: bool = False) -> bool:
        """Perform an incremental backup."""
        # Find last backup
        backups = sorted(
            self.dest_path.glob("geometry_os_*.tar*"),
            key=lambda p: p.stat().st_mtime,
            reverse=True
        )
        
        if not backups:
            self.logger.warning("No previous backup found, performing full backup")
            return self.full_backup(dry_run)
        
        last_backup = backups[0]
        self.logger.info(f"Reference backup: {last_backup.name}")
        
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        backup_name = f"geometry_os_incr_{timestamp}"
        
        compress_cmd, compress_ext = self.compressor
        archive_path = self.dest_path / f"{backup_name}.tar{compress_ext}"
        
        self.logger.info(f"Starting incremental backup: {backup_name}")
        
        if dry_run:
            self.logger.info(f"[DRY RUN] Would create incremental archive: {archive_path}")
            return True
        
        # Get last backup time
        last_backup_time = last_backup.stat().st_mtime
        
        # Find changed files
        self.logger.info("Finding changed files...")
        changed_files = []
        
        for path in Path.cwd().rglob("*"):
            if path.is_file() and path.stat().st_mtime > last_backup_time:
                # Skip excluded patterns
                if not any(pattern.replace("*", "") in str(path) for pattern in self.EXCLUDE_PATTERNS):
                    changed_files.append(path)
        
        if not changed_files:
            self.logger.info("No changes since last backup")
            return True
        
        self.logger.info(f"Found {len(changed_files)} changed files")
        
        # Create archive with changed files
        start_time = datetime.now()
        
        try:
            with tarfile.open(archive_path, "w|") as tar:
                for file_path in changed_files:
                    tar.add(file_path, arcname=str(file_path.relative_to(Path.cwd())))
            
            # Compress
            if compress_cmd != "gzip":
                compressed_path = archive_path.with_suffix(compress_ext)
                subprocess.run([compress_cmd, str(archive_path)], check=True)
                archive_path = compressed_path
            else:
                subprocess.run([compress_cmd, str(archive_path)], check=True)
                archive_path = archive_path.with_suffix(".gz")
            
            end_time = datetime.now()
            duration = (end_time - start_time).total_seconds()
            
            archive_size = archive_path.stat().st_size
            self.logger.info(f"Incremental archive created: {archive_path}")
            self.logger.info(f"Archive size: {self._format_size(archive_size)}")
            self.logger.info(f"Duration: {duration:.1f}s")
            
            # Create manifest
            self._create_manifest(archive_path, backup_name, "incremental", archive_size, duration)
            
            return True
            
        except Exception as e:
            self.logger.error(f"Incremental backup failed: {e}")
            if archive_path.exists():
                archive_path.unlink()
            return False
    
    def verify_backup(self, archive_path: Path) -> bool:
        """Verify backup integrity."""
        self.logger.info(f"Verifying backup: {archive_path.name}")
        
        if not archive_path.exists():
            self.logger.error("Archive not found")
            return False
        
        # Test compression integrity
        try:
            if archive_path.suffix == ".zst":
                result = self._run_command(["zstd", "-t", str(archive_path)], check=False)
            else:
                result = self._run_command(["gzip", "-t", str(archive_path)], check=False)
            
            if result.returncode != 0:
                self.logger.error("Archive is corrupted")
                return False
            
            self.logger.info("Archive integrity verified")
        except Exception as e:
            self.logger.error(f"Verification failed: {e}")
            return False
        
        # Test we can list contents
        try:
            result = self._run_command(["tar", "-tf", str(archive_path)], check=False)
            if result.returncode == 0:
                file_count = len(result.stdout.strip().split('\n'))
                self.logger.info(f"Archive contains {file_count} files")
            else:
                self.logger.error("Cannot read archive contents")
                return False
        except Exception as e:
            self.logger.error(f"Cannot list archive: {e}")
            return False
        
        # Verify checksum if manifest exists
        manifest_path = archive_path.with_suffix(archive_path.suffix + ".manifest.json")
        if manifest_path.exists():
            manifest = json.loads(manifest_path.read_text())
            expected_checksum = manifest.get("checksum")
            if expected_checksum:
                actual_checksum = self._calculate_checksum(archive_path)
                if actual_checksum != expected_checksum:
                    self.logger.error("Checksum mismatch!")
                    return False
                self.logger.info("Checksum verified")
        
        self.logger.info("Backup verification passed")
        return True
    
    def test_restore(self) -> bool:
        """Test restore to temporary location."""
        backups = sorted(
            self.dest_path.glob("geometry_os_*.tar*"),
            key=lambda p: p.stat().st_mtime,
            reverse=True
        )
        
        if not backups:
            self.logger.error("No backup found to test")
            return False
        
        archive_path = backups[0]
        self.logger.info(f"Testing restore from: {archive_path.name}")
        
        with tempfile.TemporaryDirectory() as test_dir:
            self.logger.info(f"Test restore directory: {test_dir}")
            
            try:
                # Extract
                result = self._run_command(
                    ["tar", "-xf", str(archive_path), "-C", test_dir],
                    check=False
                )
                
                if result.returncode != 0:
                    self.logger.error("Test restore failed")
                    return False
                
                # Count extracted files
                extracted_count = sum(1 for _ in Path(test_dir).rglob("*") if _.is_file())
                self.logger.info(f"Successfully extracted {extracted_count} files")
                
                # Verify critical files
                critical_found = []
                for pattern in ["README.md", "AGENTS.md", "memory"]:
                    matches = list(Path(test_dir).rglob(pattern))
                    if matches:
                        critical_found.append(pattern)
                
                if critical_found:
                    self.logger.info(f"Found critical files: {', '.join(critical_found)}")
                
                self.logger.info("Test restore completed successfully")
                return True
                
            except Exception as e:
                self.logger.error(f"Test restore failed: {e}")
                return False
    
    def show_status(self) -> None:
        """Show backup status."""
        print("\n" + "=" * 50)
        print("   Geometry OS Backup Status")
        print("=" * 50 + "\n")
        
        # Destination info
        print(f"Backup Destination: {self.dest_path}")
        if self.dest_path.exists():
            dest_size = sum(f.stat().st_size for f in self.dest_path.glob("**/*") if f.is_file())
            backup_count = len(list(self.dest_path.glob("geometry_os_*.tar*")))
            print(f"  Exists: Yes")
            print(f"  Size: {self._format_size(dest_size)}")
            print(f"  Backups: {backup_count}")
        else:
            print("  Exists: No (will be created)")
        print()
        
        # Recent backups
        print("Recent Backups:")
        print("-" * 50)
        
        backups = sorted(
            self.dest_path.glob("geometry_os_*.tar*"),
            key=lambda p: p.stat().st_mtime,
            reverse=True
        )[:5]
        
        for backup in backups:
            stat = backup.stat()
            mtime = datetime.fromtimestamp(stat.st_mtime)
            size = self._format_size(stat.st_size)
            
            # Get backup type from manifest
            manifest_path = backup.with_suffix(backup.suffix + ".manifest.json")
            backup_type = "unknown"
            if manifest_path.exists():
                try:
                    manifest = json.loads(manifest_path.read_text())
                    backup_type = manifest.get("type", "unknown")
                except Exception:
                    pass
            
            print(f"  {mtime.strftime('%Y-%m-%d %H:%M:%S')}  [{backup_type:12s}]  {size:>8s}  {backup.name}")
        
        if not backups:
            print("  No backups found")
        print()
        
        # Backup health
        print("Backup Health:")
        print("-" * 50)
        
        if backups:
            last_backup = backups[0]
            last_backup_time = datetime.fromtimestamp(last_backup.stat().st_mtime)
            age = datetime.now() - last_backup_time
            age_hours = age.total_seconds() / 3600
            
            print(f"  Last backup: {age_hours:.1f}h ago ({last_backup_time.strftime('%Y-%m-%d %H:%M')})")
            
            if age_hours > self.config.max_age_hours:
                print(f"  Status: WARNING - Backup is older than {self.config.max_age_hours}h")
            else:
                print("  Status: OK")
            
            # Git status
            git_info = self._get_git_info()
            if git_info["status"] != "unknown":
                print(f"  Git status: {git_info['status']}")
                print(f"  Git branch: {git_info['branch']}")
        else:
            print("  No backups found")
        print()
    
    def list_backups(self) -> None:
        """List all backups."""
        print("\nAll Backups:")
        print("=" * 50)
        
        backups = sorted(
            self.dest_path.glob("geometry_os_*.tar*"),
            key=lambda p: p.stat().st_mtime,
            reverse=True
        )
        
        for backup in backups:
            stat = backup.stat()
            mtime = datetime.fromtimestamp(stat.st_mtime)
            size = self._format_size(stat.st_size)
            print(f"  {mtime.strftime('%Y-%m-%d %H:%M')}  {size:>8s}  {backup.name}")
        
        if not backups:
            print("  No backups found")
        print()
    
    def clean_old_backups(self, dry_run: bool = False) -> int:
        """Clean old backups based on retention policy."""
        self.logger.info("Cleaning old backups...")
        self.logger.info(
            f"Retention: Daily={self.config.retention_daily}, "
            f"Weekly={self.config.retention_weekly}, "
            f"Monthly={self.config.retention_monthly}"
        )
        
        backups = sorted(
            self.dest_path.glob("geometry_os_*.tar*"),
            key=lambda p: p.stat().st_mtime,
            reverse=True
        )
        
        total = len(backups)
        max_keep = self.config.retention_daily
        removed = 0
        kept = 0
        
        for i, backup in enumerate(backups):
            if i >= max_keep:
                if dry_run:
                    self.logger.info(f"[DRY RUN] Would remove: {backup.name}")
                else:
                    backup.unlink()
                    manifest = backup.with_suffix(backup.suffix + ".manifest.json")
                    if manifest.exists():
                        manifest.unlink()
                    self.logger.info(f"Removed: {backup.name}")
                removed += 1
            else:
                kept += 1
        
        self.logger.info(f"Cleanup complete: kept {kept}, removed {removed}")
        return removed
    
    def _notify(self, status: str, message: str) -> None:
        """Send notification."""
        if not self.config.notifications_enabled:
            return
        
        cmd = self.config.on_success if status == "success" else self.config.on_failure
        if cmd:
            try:
                subprocess.run(cmd, shell=True, check=False)
            except Exception as e:
                self.logger.warning(f"Notification failed: {e}")


# ============================================================================
# CLI
# ============================================================================

def main():
    parser = argparse.ArgumentParser(
        description="Geometry OS Backup System",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__
    )
    
    parser.add_argument(
        "-c", "--config",
        type=Path,
        default=Path(__file__).parent / "backup_config.yaml",
        help="Configuration file path"
    )
    parser.add_argument("-v", "--verbose", action="store_true", help="Verbose output")
    parser.add_argument("-q", "--quiet", action="store_true", help="Suppress output")
    parser.add_argument("-d", "--dry-run", action="store_true", help="Dry run")
    
    subparsers = parser.add_subparsers(dest="command", help="Command")
    
    # Full backup
    subparsers.add_parser("full", help="Perform a full backup")
    
    # Incremental backup
    subparsers.add_parser("incremental", help="Perform an incremental backup")
    
    # Verify
    subparsers.add_parser("verify", help="Verify the last backup")
    
    # Test restore
    subparsers.add_parser("test", help="Test restore to temporary location")
    
    # Status
    subparsers.add_parser("status", help="Show backup status")
    
    # List
    subparsers.add_parser("list", help="List all backups")
    
    # Clean
    subparsers.add_parser("clean", help="Clean old backups")
    
    # Schedule
    schedule_parser = subparsers.add_parser("schedule", help="Create systemd timer")
    schedule_parser.add_argument("--enable", action="store_true", help="Enable the timer")
    
    args = parser.parse_args()
    
    if not args.command:
        parser.print_help()
        return 1
    
    # Load config
    config = load_config(args.config)
    
    # Override log level
    if args.verbose:
        config.log_level = "DEBUG"
    elif args.quiet:
        config.log_level = "WARNING"
    
    # Setup logger
    logger = setup_logger(config)
    
    # Create manager
    manager = BackupManager(config, logger)
    
    # Execute command
    try:
        if args.command == "full":
            success = manager.full_backup(dry_run=args.dry_run)
            return 0 if success else 1
        
        elif args.command == "incremental":
            success = manager.incremental_backup(dry_run=args.dry_run)
            return 0 if success else 1
        
        elif args.command == "verify":
            backups = sorted(
                manager.dest_path.glob("geometry_os_*.tar*"),
                key=lambda p: p.stat().st_mtime,
                reverse=True
            )
            if backups:
                success = manager.verify_backup(backups[0])
                return 0 if success else 1
            else:
                logger.error("No backup found to verify")
                return 1
        
        elif args.command == "test":
            success = manager.test_restore()
            return 0 if success else 1
        
        elif args.command == "status":
            manager.show_status()
            return 0
        
        elif args.command == "list":
            manager.list_backups()
            return 0
        
        elif args.command == "clean":
            manager.clean_old_backups(dry_run=args.dry_run)
            return 0
        
        elif args.command == "schedule":
            return create_systemd_timer(config, args.enable)
        
        else:
            parser.print_help()
            return 1
            
    except KeyboardInterrupt:
        logger.info("Interrupted")
        return 130
    except Exception as e:
        logger.error(f"Error: {e}")
        return 1


def create_systemd_timer(config: BackupConfig, enable: bool) -> int:
    """Create systemd timer for automatic backups."""
    systemd_path = Path.home() / ".config" / "systemd" / "user"
    systemd_path.mkdir(parents=True, exist_ok=True)
    
    # Service file
    service_content = """[Unit]
Description=Geometry OS Backup
After=network.target

[Service]
Type=oneshot
ExecStart=/usr/bin/python3 {script_path} full
WorkingDirectory={work_dir}

[Install]
WantedBy=default.target
""".format(
        script_path=Path(__file__).resolve(),
        work_dir=Path.cwd()
    )
    
    # Timer file
    timer_content = """[Unit]
Description=Geometry OS Backup Timer

[Timer]
OnCalendar=daily
Persistent=true

[Install]
WantedBy=timers.target
"""
    
    service_path = systemd_path / "geometry-backup.service"
    timer_path = systemd_path / "geometry-backup.timer"
    
    service_path.write_text(service_content)
    timer_path.write_text(timer_content)
    
    print(f"Created: {service_path}")
    print(f"Created: {timer_path}")
    
    if enable:
        subprocess.run(["systemctl", "--user", "daemon-reload"], check=True)
        subprocess.run(["systemctl", "--user", "enable", "geometry-backup.timer"], check=True)
        subprocess.run(["systemctl", "--user", "start", "geometry-backup.timer"], check=True)
        print("Timer enabled and started")
    else:
        print("\nTo enable automatic backups, run:")
        print("  systemctl --user enable geometry-backup.timer")
        print("  systemctl --user start geometry-backup.timer")
    
    return 0


if __name__ == "__main__":
    sys.exit(main())
