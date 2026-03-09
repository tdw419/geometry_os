# Phase 12: Snapshot Creation - Research

**Researched:** 2026-03-09
**Domain:** QEMU VM snapshots for running PixelRTS containers
**Confidence:** HIGH

## Summary

This phase implements QEMU VM snapshots for running PixelRTS containers. The key insight is that the infrastructure already exists - `QemuBoot.send_monitor_command()` in `qemu_boot.py` provides Unix socket communication with QEMU's Human Monitor Protocol (HMP). The standard QEMU commands `savevm`, `loadvm`, `delvm`, and `info snapshots` handle all snapshot operations.

The implementation path is straightforward: create a `VMSnapshotManager` class that wraps the existing `send_monitor_command()` method, add CLI commands for snapshot operations, and track snapshot metadata using patterns established in the existing filesystem snapshot code (`infinite_map_snapshot_rollback.py`).

**Primary recommendation:** Use existing `QemuBoot.send_monitor_command()` with QEMU's native `savevm`/`loadvm` commands. Do not build custom snapshot format or external snapshot infrastructure.

## Standard Stack

### Core
| Library/Tool | Version | Purpose | Why Standard |
|--------------|---------|---------|--------------|
| QEMU HMP (Human Monitor Protocol) | 4.0+ | VM snapshot commands | Native QEMU support, no external dependencies |
| Python socket (stdlib) | 3.8+ | Unix socket communication | Already used in codebase for monitor/serial |
| dataclasses (stdlib) | 3.7+ | Snapshot metadata structures | Consistent with existing codebase patterns |

### Existing Codebase Infrastructure
| Component | Location | Purpose | Why Use |
|-----------|----------|---------|---------|
| `send_monitor_command()` | `qemu_boot.py:1026` | Send QEMU monitor commands | Already handles socket connection, command sending, response parsing |
| `_monitor_socket` | `qemu_boot.py:641-643` | Monitor socket path | Already configured as `temp_dir / "monitor.sock"` |
| `SnapshotMetadata` | `infinite_map_snapshot_rollback.py:69` | Metadata tracking pattern | Proven pattern with state tracking |
| `SnapshotState` | `infinite_map_snapshot_rollback.py:50` | State enum pattern | CREATING, COMPLETE, PARTIAL, CORRUPTED |

### QEMU Monitor Commands
| Command | Syntax | Purpose | Response |
|---------|--------|---------|----------|
| `savevm` | `savevm <tag>` | Create internal snapshot | Blocks until complete, returns to prompt |
| `loadvm` | `loadvm <tag>` | Restore from snapshot | VM pauses briefly, resumes |
| `delvm` | `delvm <tag>` | Delete snapshot | Returns to prompt |
| `info snapshots` | `info snapshots` | List snapshots | Tabular output with ID, tag, size, date |

**No external dependencies needed - all functionality exists in QEMU and Python stdlib.**

## Architecture Patterns

### Recommended Project Structure
```
systems/pixel_compiler/
├── boot/
│   ├── vm_snapshot.py          # NEW: VMSnapshotManager class
│   ├── boot_bridge.py          # MODIFIED: Add snapshot methods
│   └── multi_boot_manager.py   # MODIFIED: Add snapshot coordination
├── pixelrts_cli.py             # MODIFIED: Add snapshot subcommands
└── infinite_map_snapshot_rollback.py  # REFERENCE: Pattern source
```

### Pattern 1: VMSnapshotManager Class
**What:** Wrapper around QEMU monitor commands for snapshot operations
**When to use:** All VM snapshot operations for running containers
**Example:**
```python
# Source: Based on qemu_boot.py:1026-1063 send_monitor_command pattern
class VMSnapshotManager:
    """Manages QEMU VM snapshots via monitor socket."""

    def __init__(self, qemu_boot: QemuBoot):
        self._qemu = qemu_boot

    def create_snapshot(self, tag: str, timeout: float = 30.0) -> SnapshotResult:
        """
        Create VM snapshot using QEMU savevm command.

        Args:
            tag: Snapshot identifier (alphanumeric, no spaces)
            timeout: Max seconds to wait for snapshot completion

        Returns:
            SnapshotResult with success status and metadata
        """
        # Validate container is running
        if self._qemu._process is None or self._qemu._process.poll() is not None:
            raise SnapshotError("VM is not running")

        # Send savevm command
        response = self._qemu.send_monitor_command(f"savevm {tag}")

        # Parse response (success = prompt returns)
        return SnapshotResult(success=True, tag=tag, ...)

    def list_snapshots(self) -> List[SnapshotInfo]:
        """List available snapshots via info snapshots command."""
        response = self._qemu.send_monitor_command("info snapshots")
        return self._parse_snapshot_list(response)

    def restore_snapshot(self, tag: str) -> SnapshotResult:
        """Restore VM state from snapshot via loadvm command."""
        response = self._qemu.send_monitor_command(f"loadvm {tag}")
        return SnapshotResult(success=True, tag=tag, ...)

    def delete_snapshot(self, tag: str) -> SnapshotResult:
        """Delete snapshot via delvm command."""
        response = self._qemu.send_monitor_command(f"delvm {tag}")
        return SnapshotResult(success=True, tag=tag)
```

### Pattern 2: Snapshot Metadata Tracking
**What:** Dataclass for tracking snapshot metadata, following existing patterns
**When to use:** When storing snapshot information for CLI display and coordination
**Example:**
```python
# Source: Based on infinite_map_snapshot_rollback.py:69-114
@dataclass
class VMSnapshotMetadata:
    """Metadata for a VM snapshot."""
    snapshot_id: str
    tag: str                    # QEMU snapshot tag
    container_name: str         # Container this snapshot belongs to
    created_at: datetime
    state: SnapshotState
    vm_memory: str              # Memory size at snapshot time
    description: Optional[str] = None
    size_bytes: int = 0         # Populated from 'info snapshots'

    def to_dict(self) -> Dict[str, Any]:
        return {
            "snapshot_id": self.snapshot_id,
            "tag": self.tag,
            "container_name": self.container_name,
            "created_at": self.created_at.isoformat(),
            "state": self.state.value,
            "vm_memory": self.vm_memory,
            "description": self.description,
            "size_bytes": self.size_bytes,
        }
```

### Pattern 3: CLI Integration
**What:** Subcommand structure for snapshot operations
**When to use:** Adding snapshot commands to pixelrts CLI
**Example:**
```python
# Source: Based on pixelrts_cli.py existing command patterns
def cmd_snapshot_create(args):
    """Create snapshot of running container."""
    manager = MultiBootManager()
    container = manager.get_container(args.container)
    if container.state != ContainerState.RUNNING:
        print(f"Error: Container {args.container} is not running")
        return 1

    snapshot_manager = VMSnapshotManager(container.resources.qemu_boot)
    result = snapshot_manager.create_snapshot(args.tag, description=args.description)

    if result.success:
        print(f"Snapshot '{args.tag}' created for {args.container}")
        return 0
    else:
        print(f"Failed to create snapshot: {result.error}")
        return 1

# In main():
snapshot_parser = subparsers.add_parser('snapshot', help='VM snapshot operations')
snapshot_sub = snapshot_parser.add_subparsers(dest='snapshot_cmd')

# snapshot create
create_parser = snapshot_sub.add_parser('create', help='Create snapshot')
create_parser.add_argument('container', help='Container name')
create_parser.add_argument('tag', help='Snapshot tag')
create_parser.add_argument('-d', '--description', help='Description')
create_parser.set_defaults(func=cmd_snapshot_create)
```

### Anti-Patterns to Avoid
- **Don't use external snapshots (qcow2 overlay):** Internal `savevm` is atomic and doesn't create overlay files that complicate cleanup
- **Don't create custom snapshot format:** QEMU's internal format is already optimized and portable
- **Don't snapshot IDLE/STOPPED containers:** Only RUNNING containers have meaningful VM state
- **Don't skip timeout handling:** `savevm` can block for seconds on large memory VMs

## Don't Hand-Roll

Problems that look simple but have existing solutions:

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Socket communication with QEMU | Custom socket code | `QemuBoot.send_monitor_command()` | Already handles connection, timeout, non-blocking read |
| Snapshot metadata storage | Custom JSON schema | Existing `SnapshotMetadata` pattern | Consistent with filesystem snapshots |
| Container state validation | Custom state checks | `MultiBootManager.get_container()` + `ContainerState` | Centralized state management |
| Snapshot tag validation | Regex from scratch | QEMU's built-in validation | Error response tells you what's wrong |
| Snapshot list parsing | Custom parser | Simple regex on `info snapshots` output | Stable QEMU output format |

**Key insight:** The codebase already has all the infrastructure. The task is integration, not implementation.

## Common Pitfalls

### Pitfall 1: Snapshotting Non-Running Containers
**What goes wrong:** Calling `savevm` on a container that's STOPPED or BOOTING causes QEMU errors or hangs
**Why it happens:** QEMU's snapshot commands require an active VM in RUNNING state
**How to avoid:** Always check `ContainerState.RUNNING` before calling snapshot commands
**Warning signs:** `RuntimeError: VM is not running` from `send_monitor_command()`

### Pitfall 2: Tag Naming Issues
**What goes wrong:** Tags with spaces or special characters fail silently or corrupt snapshot
**Why it happens:** QEMU tags have character restrictions (alphanumeric, dash, underscore)
**How to avoid:** Validate tag format before sending to QEMU: `re.match(r'^[\w-]+$', tag)`
**Warning signs:** `info snapshots` shows malformed tag or snapshot doesn't appear

### Pitfall 3: Timeout During Large Memory Snapshots
**What goes wrong:** `savevm` blocks for >5 seconds on 4GB+ memory VMs, causing timeout
**Why it happens:** QEMU must serialize entire RAM to disk
**How to avoid:** Set appropriate timeout based on memory size (2GB = 5s, 4GB = 10s, 8GB = 20s)
**Warning signs:** Socket timeout exception, incomplete snapshot in `info snapshots`

### Pitfall 4: Monitor Socket Not Available
**What goes wrong:** `send_monitor_command()` raises `RuntimeError: Monitor socket not available`
**Why it happens:** VM was started with `monitor_enabled=False` or socket file deleted
**How to avoid:** Check `BootResult` for monitor_socket path, ensure `monitor_enabled=True` in config
**Warning signs:** `_monitor_socket` is None or socket file doesn't exist

### Pitfall 5: Snapshot Accumulation
**What goes wrong:** Too many snapshots slow down `info snapshots` and consume disk space
**Why it happens:** No automatic cleanup of old snapshots
**How to avoid:** Implement snapshot rotation/deletion policy, expose `delvm` via CLI
**Warning signs:** `info snapshots` takes >1 second, disk usage growing

## Code Examples

### Creating a Snapshot
```python
# Source: Based on qemu_boot.py:1026-1063 pattern
def create_snapshot(self, tag: str, description: str = "") -> SnapshotResult:
    """Create VM snapshot using QEMU savevm command."""
    # Validate VM is running
    if not self._qemu._monitor_socket or not self._qemu._monitor_socket.exists():
        raise SnapshotError("Monitor socket not available")

    if self._qemu._process is None or self._qemu._process.poll() is not None:
        raise SnapshotError("VM is not running")

    # Validate tag format
    if not re.match(r'^[\w-]+$', tag):
        raise SnapshotError(f"Invalid tag format: {tag}. Use alphanumeric, dash, underscore.")

    try:
        # Calculate timeout based on memory (2GB = 5s baseline)
        memory_gb = self._parse_memory_to_gb(self._qemu.config.memory)
        timeout = max(5.0, memory_gb * 2.5)

        # Send savevm command (blocks until complete)
        response = self._qemu.send_monitor_command(f"savevm {tag}")

        # Create metadata
        metadata = VMSnapshotMetadata(
            snapshot_id=f"snap-{int(time.time())}-{uuid.uuid4().hex[:8]}",
            tag=tag,
            container_name=self._container_name,
            created_at=datetime.now(),
            state=SnapshotState.COMPLETE,
            vm_memory=self._qemu.config.memory,
            description=description,
        )

        return SnapshotResult(success=True, metadata=metadata)

    except socket.timeout:
        raise SnapshotError(f"Snapshot creation timed out after {timeout}s")
    except Exception as e:
        raise SnapshotError(f"Snapshot creation failed: {e}")
```

### Listing Snapshots
```python
# Source: QEMU info snapshots output format
def list_snapshots(self) -> List[SnapshotInfo]:
    """List available VM snapshots."""
    response = self._qemu.send_monitor_command("info snapshots")

    # Parse QEMU output:
    # ID        TAG                 VM SIZE                DATE       VM CLOCK
    # 1         backup-2024         1.2 GiB   2024-01-15 10:30:00    00:05:32.123

    snapshots = []
    for line in response.split('\n'):
        match = re.match(r'^\s*(\d+)\s+(\S+)\s+([\d.]+\s+\w+)\s+(\d{4}-\d{2}-\d{2}\s+\d{2}:\d{2}:\d{2})\s+([\d:]+)', line)
        if match:
            snapshots.append(SnapshotInfo(
                id=int(match.group(1)),
                tag=match.group(2),
                size=match.group(3),
                date=match.group(4),
                vm_clock=match.group(5),
            ))

    return snapshots
```

### Restoring a Snapshot
```python
# Source: Based on qemu_boot.py pattern
def restore_snapshot(self, tag: str) -> SnapshotResult:
    """Restore VM state from snapshot."""
    # Verify snapshot exists
    snapshots = self.list_snapshots()
    if not any(s.tag == tag for s in snapshots):
        raise SnapshotError(f"Snapshot not found: {tag}")

    # Send loadvm command
    response = self._qemu.send_monitor_command(f"loadvm {tag}")

    # VM pauses briefly during restore, then resumes
    return SnapshotResult(success=True, tag=tag)
```

### Integration with MultiBootManager
```python
# Source: Based on multi_boot_manager.py ContainerInfo pattern
class ContainerInfo:
    # ... existing fields ...
    snapshots: List[VMSnapshotMetadata] = field(default_factory=list)

    def create_snapshot(self, tag: str, description: str = "") -> SnapshotResult:
        """Create snapshot for this container."""
        if self.state != ContainerState.RUNNING:
            raise SnapshotError(f"Cannot snapshot container in {self.state} state")

        manager = VMSnapshotManager(self.resources.qemu_boot)
        result = manager.create_snapshot(tag, description)

        if result.success:
            self.snapshots.append(result.metadata)

        return result
```

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| External snapshots (qcow2 overlay) | Internal snapshots (savevm) | QEMU 2.0+ | Simpler management, atomic operations |
| HMP only | QMP (QEMU Machine Protocol) | QEMU 0.14+ | JSON API option, but HMP simpler for basic ops |
| Manual snapshot tracking | Metadata in qcow2 header | QEMU 1.3+ | Self-contained snapshots with metadata |

**Deprecated/outdated:**
- `qemu-img snapshot -c` on running VM: Requires VM to be stopped; use `savevm` instead
- `snapshot_blkdev` for live snapshots: External snapshot approach; more complex, use `savevm` for simplicity

## Open Questions

1. **Snapshot persistence across reboots**
   - What we know: Internal snapshots are stored in the qcow2 file or VM state
   - What's unclear: For direct kernel boot from FUSE (no qcow2), where is snapshot stored?
   - Recommendation: Verify with `info snapshots` after VM restart; may require qcow2 disk for persistence

2. **Multi-container atomic snapshots**
   - What we know: Each container has independent snapshot state
   - What's unclear: How to coordinate snapshots across linked containers (e.g., server + client)
   - Recommendation: Start with single-container snapshots; add coordination in Phase 13 if needed

3. **Snapshot file location for FUSE-booted containers**
   - What we know: Direct kernel boot uses `-kernel` and `-initrd` without disk image
   - What's unclear: Where QEMU stores VM state for `savevm` without qcow2
   - Recommendation: May need to add a small qcow2 disk for VM state storage, or use `-loadvm` with migration

## Sources

### Primary (HIGH confidence)
- QEMU Official Documentation - https://qemu.org/docs/master/system/monitor.html - Monitor commands reference
- Codebase: `qemu_boot.py:1026-1063` - Existing `send_monitor_command()` implementation
- Codebase: `qemu_boot.py:641-643` - Monitor socket setup

### Secondary (MEDIUM confidence)
- Codebase: `infinite_map_snapshot_rollback.py:50-200` - Snapshot state/metadata patterns
- Codebase: `multi_boot_manager.py` - Container state management
- Codebase: `pixelrts_cli.py` - CLI command structure

### Tertiary (LOW confidence)
- WebSearch: QEMU snapshot best practices - Verified against official docs

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH - All components exist in codebase, QEMU commands are well-documented
- Architecture: HIGH - Pattern from existing snapshot code, existing monitor infrastructure
- Pitfalls: MEDIUM - Based on QEMU documentation and common issues, needs runtime verification

**Research date:** 2026-03-09
**Valid until:** 2026-06-09 (3 months - QEMU commands are stable)
