# Architecture Patterns: Multi-Container Boot

**Domain:** Multi-container boot orchestration for PixelRTS
**Researched:** 2026-03-08
**Confidence:** HIGH

## Current Architecture (Single Container)

### BootBridge Flow

```
pixelrts boot container.rts.png
         |
         v
+------------------+
|    BootBridge    |  <- Orchestrates FUSE + QEMU
+--------+---------+
         |
    +----+----+--------------------+
    |         |                    |
    v         v                    v
+-------+  +-------+          +-------+
| FUSE  |  | QEMU  |          | VNC   |
| Mount |  | Boot  |          | Display|
+-------+  +-------+          +-------+
    |         |
    v         v
+-------+  +-------+
|Kernel |  | VM    |
|Initrd |  | Process|
+-------+  +-------+
```

### Existing Components

| Component | File | Responsibility |
|-----------|------|----------------|
| **BootBridge** | `boot/boot_bridge.py` | Orchestrates FUSE mount + QEMU boot for single container |
| **MountHelper** | `boot/mount_helper.py` | FUSE filesystem lifecycle management |
| **QemuBoot** | `integration/qemu_boot.py` | QEMU process management, VNC, serial |
| **BootResult** | `boot/boot_bridge.py` | Data class for boot operation results |
| **BootProgress** | `boot/boot_progress.py` | Visual progress display |
| **pixelrts CLI** | `pixelrts_cli.py` | Command-line entry point |

## Proposed Multi-Container Architecture

### Overview

```
pixelrts boot webapp.rts.png db.rts.png cache.rts.png --network mynet
         |
         v
+----------------------+
|  MultiBootManager    |  <- NEW: Orchestrates multiple BootBridges
+----------+-----------+
           |
    +------+------+--------------+
    |             |              |
    v             v              v
+--------+   +--------+    +--------+
|Bridge 1|   |Bridge 2|    |Bridge 3|
|(webapp)|   |  (db)  |    |(cache) |
+---+----+   +---+----+    +---+----+
    |            |             |
    v            v             v
+-------+   +-------+     +-------+
| VM 1  |   | VM 2  |     | VM 3  |
+---+---+   +---+---+     +---+---+
    |            |             |
    +------------+-------------+
                 |
                 v
         +---------------+
         | VirtualNetwork|  <- NEW: Inter-VM networking
         +---------------+
```

### Component Architecture

```
+-----------------------------------------------------------------------+
|                        Multi-Boot Orchestration Layer                 |
|  +-----------------------------------------------------------------+  |
|  |                     MultiBootManager                             |  |
|  |  - Manages multiple BootBridge instances                         |  |
|  |  - Coordinates parallel boot sequencing                          |  |
|  |  - Handles aggregate status and health                           |  |
|  +----------------------------+------------------------------------+  |
|                               |                                       |
+-------------------------------|---------------------------------------+
                                |
        +-----------------------+-----------------------+
        |                       |                       |
+-------v-------+       +-------v-------+       +-------v-------+
| BootBridge 1  |       | BootBridge 2  |       | BootBridge N  |
| (existing,    |       | (existing,    |       | (existing,    |
|  unchanged)   |       |  unchanged)   |       |  unchanged)   |
+---------------+       +---------------+       +---------------+
        |                       |                       |
        v                       v                       v
+---------------+       +---------------+       +---------------+
| QemuBoot 1    |       | QemuBoot 2    |       | QemuBoot N    |
| (modified for |       | (modified for |       | (modified for |
|  network)     |       |  network)     |       |  network)     |
+-------+-------+       +-------+-------+       +-------+-------+
        |                       |                       |
        +-----------------------+-----------------------+
                                |
                                v
+-----------------------------------------------------------------------+
|                        Virtual Network Layer                           |
|  +---------------------+  +---------------------+  +---------------+  |
|  |  VirtualNetwork     |  |  NetworkNamespace   |  |  PortManager  |  |
|  |  (QEMU user/netdev) |  |  (optional: netns)  |  |  (VNC, serial)|  |
|  +----------+----------+  +----------+----------+  +-------+-------+  |
+-------------|---------------------------|-------------------|----------+
              |                           |                   |
              v                           v                   v
+-----------------------------------------------------------------------+
|                        Host System Layer                               |
|  - /dev/kvm (KVM acceleration)                                       |
|  - /dev/net/tun (TAP devices, if needed)                             |
|  - Network bridges (optional)                                         |
+-----------------------------------------------------------------------+
```

## New Components

### 1. MultiBootManager

**Location:** `systems/pixel_compiler/boot/multi_boot_manager.py`

**Responsibilities:**
- Accept multiple RTS paths and orchestrate parallel boot
- Manage BootBridge instances lifecycle
- Allocate resources (VNC displays, serial sockets, network ports)
- Coordinate boot sequencing (dependencies, startup order)
- Provide aggregate status and health monitoring

```python
@dataclass
class MultiBootConfig:
    """Configuration for multi-container boot."""
    containers: List[Path]  # List of .rts.png paths
    network_name: Optional[str] = "pixelrts_net"
    base_vnc_display: int = 0
    base_serial_port: int = 0
    parallel_boot: bool = True  # Boot all simultaneously
    boot_timeout: int = 120  # Seconds to wait for all boots
    auto_stop: bool = True  # Stop all on first failure

@dataclass
class ContainerSpec:
    """Specification for a single container in the group."""
    path: Path
    name: str  # Human-readable name
    memory: str = "2G"
    cpus: int = 2
    vnc_display: Optional[int] = None  # Auto-allocated if None
    serial_socket: Optional[Path] = None  # Auto-allocated if None
    network_alias: Optional[str] = None  # DNS name in virtual network
    depends_on: List[str] = field(default_factory=list)  # Container names
    environment: Dict[str, str] = field(default_factory=dict)

@dataclass
class MultiBootResult:
    """Result of multi-container boot operation."""
    success: bool
    containers: Dict[str, BootResult]  # name -> BootResult
    network_info: Optional[NetworkInfo] = None
    error_message: Optional[str] = None
    failed_containers: List[str] = field(default_factory=list)

class MultiBootManager:
    """
    Orchestrates boot of multiple PixelRTS containers with networking.

    Example:
        manager = MultiBootManager()
        result = manager.boot([
            ContainerSpec(path="webapp.rts.png", name="web"),
            ContainerSpec(path="db.rts.png", name="db", depends_on=["web"]),
        ])

        if result.success:
            # All containers running
            for name, bridge in manager.bridges.items():
                print(f"{name}: VNC :{bridge.vnc_display}")
    """

    def __init__(self, config: Optional[MultiBootConfig] = None):
        self.config = config or MultiBootConfig()
        self._bridges: Dict[str, BootBridge] = {}
        self._network: Optional[VirtualNetwork] = None
        self._resource_allocator = ResourceAllocator()

    def boot(self, specs: List[ContainerSpec]) -> MultiBootResult:
        """Boot all containers with dependency ordering."""

    def stop(self, container_name: Optional[str] = None) -> None:
        """Stop specific container or all containers."""

    def get_status(self) -> Dict[str, Dict[str, Any]]:
        """Get status of all containers."""

    def get_bridge(self, name: str) -> Optional[BootBridge]:
        """Get BootBridge for a specific container."""
```

### 2. VirtualNetwork

**Location:** `systems/pixel_compiler/boot/virtual_network.py`

**Responsibilities:**
- Create isolated network for inter-container communication
- Manage QEMU user-mode networking with socket-based interconnect
- Optionally create TAP/bridge for more advanced networking
- Provide DNS-like name resolution between containers

```python
@dataclass
class NetworkConfig:
    """Virtual network configuration."""
    name: str = "pixelrts_net"
    subnet: str = "10.0.2.0/24"
    gateway: str = "10.0.2.1"
    enable_dns: bool = True  # Simple DNS via /etc/hosts style
    mode: NetworkMode = NetworkMode.USER  # USER, TAP, BRIDGE

@dataclass
class NetworkInfo:
    """Information about the virtual network."""
    config: NetworkConfig
    containers: Dict[str, ContainerNetworkInfo]  # name -> info

@dataclass
class ContainerNetworkInfo:
    """Network info for a single container."""
    ip_address: str
    mac_address: str
    aliases: List[str]
    exposed_ports: Dict[int, int]  # guest_port -> host_port

class VirtualNetwork:
    """
    Manages virtual networking between containers.

    Uses QEMU's built-in user-mode networking by default, which provides:
    - Isolated network for containers
    - Port forwarding to host
    - Basic inter-container communication via socket forwarding

    For more advanced networking, can use TAP devices.
    """

    def __init__(self, config: Optional[NetworkConfig] = None):
        self.config = config or NetworkConfig()
        self._containers: Dict[str, ContainerNetworkInfo] = {}

    def add_container(
        self,
        name: str,
        aliases: Optional[List[str]] = None
    ) -> ContainerNetworkInfo:
        """Register a container in the network."""

    def get_qemu_net_args(self, container_name: str) -> List[str]:
        """Get QEMU -netdev/-device arguments for a container."""

    def get_port_forward_args(
        self,
        container_name: str,
        guest_port: int
    ) -> Tuple[int, List[str]]:
        """Allocate host port and return QEMU port forward args."""
```

### 3. ResourceAllocator

**Location:** `systems/pixel_compiler/boot/resource_allocator.py`

**Responsibilities:**
- Allocate VNC display numbers (avoiding conflicts)
- Allocate serial socket paths
- Allocate network ports for forwarding
- Track and release resources on cleanup

```python
@dataclass
class AllocatedResources:
    """Resources allocated for a container."""
    vnc_display: int
    vnc_port: int
    serial_socket: Path
    monitor_socket: Path
    forwarded_ports: Dict[int, int]  # guest_port -> host_port

class ResourceAllocator:
    """
    Allocates host resources for multiple containers.

    Ensures no conflicts between:
    - VNC display numbers (5900+N)
    - Serial socket paths
    - Port forwards
    """

    def __init__(self, base_vnc: int = 0, base_port: int = 10000):
        self._base_vnc = base_vnc
        self._base_port = base_port
        self._allocated_vnc: Set[int] = set()
        self._allocated_ports: Set[int] = set()

    def allocate(self, name: str, port_forwards: List[int] = None) -> AllocatedResources:
        """Allocate resources for a container."""

    def release(self, resources: AllocatedResources) -> None:
        """Release allocated resources."""
```

## Integration Points with Existing BootBridge

### BootBridge Modifications (Minimal)

The existing BootBridge remains largely unchanged. New parameters added for multi-container support:

```python
class BootBridge:
    def __init__(
        self,
        rts_png_path: Union[str, Path],
        memory: str = "2G",
        cpus: int = 2,
        vnc_display: int = 0,
        verbose: bool = False,
        # NEW PARAMETERS for multi-container
        network_config: Optional[NetworkConfig] = None,
        port_forwards: Optional[Dict[int, int]] = None,
        container_name: Optional[str] = None,
    ):
```

### QemuBoot Modifications

Extend `_build_network_args()` to support multi-container networking:

```python
def _build_network_args(self) -> List[str]:
    """Build network configuration arguments."""
    args = []

    if self.config.network_mode == NetworkMode.USER:
        # Existing user-mode logic
        net_config = "user"

        # NEW: Multi-container interconnect
        if self._network_config:
            # Use socket-based interconnect for container-to-container
            net_config += f",net=/{self._network_config.subnet}"

        # Add port forwards (existing + new from VirtualNetwork)
        for host_port, guest_port in self.config.network_port_forward.items():
            net_config += f",hostfwd=tcp::{host_port}-:{guest_port}"

        args.extend(["-nic", net_config])
```

### CLI Integration

Extend `pixelrts boot` command in `pixelrts_cli.py`:

```python
def cmd_boot(args):
    """Handle boot command with multi-container support."""

    if len(args.containers) == 1:
        # Single container: use existing BootBridge directly
        bridge = BootBridge(args.containers[0], ...)
        result = bridge.boot()
    else:
        # Multiple containers: use MultiBootManager
        manager = MultiBootManager()
        specs = [ContainerSpec(path=p, name=p.stem) for p in args.containers]
        result = manager.boot(specs)
```

## Data Flow

### Multi-Container Boot Sequence

```
1. CLI Parse
   pixelrts boot web.rts.png db.rts.png --network mynet
         |
         v
2. MultiBootManager.boot([ContainerSpec(...), ContainerSpec(...)])
         |
         +---> VirtualNetwork.add_container("web")
         |     VirtualNetwork.add_container("db")
         |
         +---> ResourceAllocator.allocate("web") -> AllocatedResources
         |     ResourceAllocator.allocate("db") -> AllocatedResources
         |
         v
3. Dependency Ordering (topological sort)
         |
         v
4. Parallel Boot (Phase 1: independent containers)
   +--------------------------------------------------+
   |  BootBridge("web.rts.png", vnc_display=0, ...)  |  <- Parallel
   |  BootBridge("db.rts.png", vnc_display=1, ...)   |  <- Parallel
   +--------------------------------------------------+
         |
         v
5. Sequential Boot (Phase 2: dependent containers)
   - Wait for dependencies
   - Start containers with depends_on
         |
         v
6. Return MultiBootResult
   {
     success: True,
     containers: {
       "web": BootResult(vnc_port=5900, ...),
       "db": BootResult(vnc_port=5901, ...)
     },
     network_info: NetworkInfo(...)
   }
```

## Patterns to Follow

### Pattern 1: Composition over Inheritance

**What:** MultiBootManager composes multiple BootBridge instances rather than extending BootBridge.

**When:** Always - this is the core design principle.

**Example:**
```python
class MultiBootManager:
    def __init__(self):
        self._bridges: Dict[str, BootBridge] = {}  # Composition

    def boot(self, specs: List[ContainerSpec]) -> MultiBootResult:
        for spec in specs:
            self._bridges[spec.name] = BootBridge(spec.path, ...)
```

### Pattern 2: Resource Allocation before Boot

**What:** Allocate all resources (VNC, ports, sockets) before starting any container.

**When:** Always - prevents partial failures leaving orphaned resources.

**Example:**
```python
def boot(self, specs: List[ContainerSpec]) -> MultiBootResult:
    # Phase 1: Allocate all resources
    allocations = {}
    for spec in specs:
        allocations[spec.name] = self._resource_allocator.allocate(spec.name)

    try:
        # Phase 2: Boot all containers
        for spec in specs:
            self._boot_single(spec, allocations[spec.name])
    except Exception:
        # Phase 3: Cleanup on failure
        self._cleanup_all()
        raise
```

### Pattern 3: Graceful Degradation

**What:** If networking setup fails, containers still boot with isolated networking.

**When:** When VirtualNetwork setup fails (missing TAP, permissions, etc.).

**Example:**
```python
def boot(self, specs: List[ContainerSpec]) -> MultiBootResult:
    try:
        self._network = VirtualNetwork()
    except NetworkSetupError:
        logger.warning("Virtual network setup failed, using isolated mode")
        self._network = None  # Each container gets its own user network
```

## Anti-Patterns to Avoid

### Anti-Pattern 1: Modifying BootBridge for Multi-Container

**What:** Adding multi-container logic directly into BootBridge.

**Why bad:** Violates single responsibility, makes single-container boot more complex.

**Instead:** Use MultiBootManager as orchestrator; BootBridge stays focused on single container.

### Anti-Pattern 2: Global State for Resource Tracking

**What:** Using global variables to track allocated VNC displays.

**Why bad:** Makes testing hard, causes issues with multiple MultiBootManager instances.

**Instead:** Use ResourceAllocator instance per MultiBootManager.

### Anti-Pattern 3: Blocking Boot for All Containers

**What:** Waiting for each container to fully boot before starting the next.

**Why bad:** Slow boot times for independent containers.

**Instead:** Boot independent containers in parallel, only wait for dependencies.

## Scalability Considerations

| Concern | At 2 containers | At 10 containers | At 50 containers |
|---------|-----------------|------------------|------------------|
| **VNC Displays** | Sequential allocation (0, 1) | Sequential allocation (0-9) | Need display pooling or VNC proxy |
| **Port Forwards** | Direct allocation | Direct allocation | Need dynamic port range |
| **Memory** | 4-8GB host | 20-40GB host | Need memory limits per container |
| **Boot Time** | ~2s parallel | ~2-3s parallel | Need staged boot with limits |
| **Network** | User-mode QEMU | User-mode QEMU | Need bridge or SDN |

## Suggested Build Order

### Phase 1: Core Infrastructure (No Networking)
1. **ResourceAllocator** - Port and display allocation
2. **ContainerSpec/MultiBootResult** - Data structures
3. **MultiBootManager (basic)** - Boot multiple containers without interconnect

### Phase 2: Virtual Networking
4. **NetworkConfig/NetworkInfo** - Network data structures
5. **VirtualNetwork** - Basic user-mode networking
6. **QemuBoot network extensions** - Multi-container netdev args

### Phase 3: CLI Integration
7. **CLI multi-container parsing** - Handle multiple paths
8. **Dependency ordering** - Topological sort for depends_on
9. **Aggregate status display** - Show all container statuses

### Phase 4: Advanced Features
10. **Health checks** - Wait for containers to be "ready"
11. **TAP/Bridge networking** - Alternative to user-mode
12. **Compose file support** - YAML specification format

## Sources

- Existing BootBridge implementation: `/systems/pixel_compiler/boot/boot_bridge.py`
- Existing QemuBoot implementation: `/systems/pixel_compiler/integration/qemu_boot.py`
- Existing MountHelper implementation: `/systems/pixel_compiler/boot/mount_helper.py`
- Existing PixelRTSServer (network boot): `/systems/pixel_compiler/serve/server.py`
- Existing pixelrts CLI: `/systems/pixel_compiler/pixelrts_cli.py`
- Test patterns: `/systems/pixel_compiler/tests/test_boot_bridge.py`
