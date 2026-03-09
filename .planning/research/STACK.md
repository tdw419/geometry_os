# Stack Research

**Domain:** Vision-based OS Boot and Installation + Network Boot + Multi-Container Boot
**Researched:** 2026-02-11 (v1.0/v1.1), 2026-03-08 (v1.2 Network Boot, v1.3 Multi-Container)
**Confidence:** HIGH

---

## Part 1: Existing Validated Stack (v1.0/v1.1)

*Already implemented and shipped. Do not re-research.*

### Core Technologies

| Technology | Version | Purpose | Why Recommended |
|------------|---------|---------|-----------------|
| Python | 3.12+ | Primary implementation language | Already used in codebase; async/await support; excellent library ecosystem |
| PyFuse3 | 3.4.0+ | FUSE filesystem bindings | Modern async API for libfuse3; actively maintained; official docs at pyfuse3.readthedocs.io |
| Pillow | 12.1.0+ | PNG/image processing | Already used in PixelRTS v2; latest version (2026-01-02); mature and stable |
| OpenCV | 4.14+ | Computer vision operations | Industry standard for image processing; extensive algorithm library; includes DNN module |
| FastAPI | 0.109+ | Catalog server | Already in codebase; async support; excellent for REST endpoints |

### Vision Model Integration

| Technology | Version | Purpose | Why Recommended |
|------------|---------|---------|-----------------|
| anthropic | 0.40+ | Claude Vision API | Already in codebase; excellent visual understanding; supports image analysis |
| openai | 1.10+ | GPT-4 Vision API | Alternative VLM with strong image analysis; good for cross-validation |
| numpy | 1.24+ | Numerical operations for image data | Already in codebase; foundation for most image processing; highly optimized |
| scipy | 1.12+ | Scientific computing (ndimage.label) | Used for diff region detection in v1.1 |

### Supporting Libraries

| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| rich | 13.7+ | Terminal UI for progress feedback | When building visual installer with CLI progress bars |
| pydantic | 2.5+ | Data validation for metadata | Already in codebase; validate vision model responses |
| httpx | 0.24+ | Async HTTP for vision APIs | Already in codebase dependency via anthropic; async support |
| aiofiles | 23.2+ | Async file operations | Use when building async FUSE filesystem or installer |
| reedsolo | 1.7.0+ | Reed-Solomon error correction | PixelRTS v2 encoding/decoding |

### Development Tools

| Tool | Purpose | Notes |
|------|---------|-------|
| pytest | 7.4+ | Testing framework | Already in codebase; use for FUSE and vision tests |
| pytest-asyncio | 0.21+ | Async test support | Required for pyfuse3 testing |
| pytest-benchmark | 4.0+ | Performance benchmarking | Already in requirements.txt |
| mypy | 1.5+ | Type checking | Already in codebase; essential for FUSE type safety |

---

## Part 2: Stack for v1.2 Network Boot (NETWORK-01, NETWORK-02)

*Research date: 2026-03-08*

### Core Technologies for Network Boot

| Technology | Version | Purpose | Why Recommended |
|------------|---------|---------|-----------------|
| tftpy | 0.8.6 | TFTP server for PXE boot | Pure Python, RFC 1350/2347/2348/2349 compliant, MIT license, active maintenance. Provides TftpServer class with configurable timeout and retry handling. |
| nbdkit | 1.40+ | NBD server with Python plugins | Industry-standard NBD server (Red Hat maintained), Python plugin API (API_VERSION=2), supports streaming and on-demand data serving from .rts.png containers. |
| pyrsync2 | 0.2.6 | Delta-based binary diff | Pure Python rsync algorithm implementation, MIT license. Provides blockchecksums(), rsyncdelta(), patchstream() for bandwidth-efficient updates. |
| bsdiff | 4.3 (C lib) | Binary diff/patch (alternative) | BSD 2-clause license, single .c file embeddable. Smaller deltas than rsync for large binary changes. Requires ctypes/cffi bindings. |

### Supporting Libraries for Network Boot

| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| dnspython | 2.6+ | DNS/DHCP integration helpers | For parsing DHCP options, DNS lookups for boot server discovery. Not a DHCP server itself. |
| construct | 2.10+ | Binary protocol parsing | For NBD protocol frame parsing if implementing custom NBD client features. |
| pyroute2 | 0.7+ | Network configuration | For dynamic network interface setup during PXE boot server initialization. |

### Development Tools for Network Boot

| Tool | Purpose | Notes |
|------|---------|-------|
| nbdkit-python-plugin | NBD Python binding | Part of nbdkit package, enables Python-based block device serving |
| qemu-nbd | NBD testing | QEMU tool for testing NBD exports, validating server implementation |

---

## Part 3: Stack for v1.3 Multi-Container Boot (MULTI-01, MULTI-02, MULTI-03)

*Research date: 2026-03-08*

### Question: What stack additions/changes for simultaneous multi-container boot with network connectivity?

**Answer:** Extend the existing `QemuBoot` class with new `NetworkMode` options and add a lightweight async orchestration layer. No new external libraries required - use Python's built-in `asyncio` with existing subprocess management.

### Core Technologies for Multi-Container

| Technology | Version | Purpose | Why Recommended |
|------------|---------|---------|-----------------|
| asyncio | stdlib | Async subprocess orchestration | Already in Python 3.12+. Use `asyncio.create_subprocess_exec()` for non-blocking QEMU process management. Native support for concurrent process lifecycle. |
| QEMU Socket Netdev | 8.0+ | VM-to-VM networking without root | Native QEMU feature. Use `-netdev socket,mcast=230.0.0.1:1234` for N-way VM networking. No TAP/bridge setup required. Works with unprivileged users. |
| QEMU Stream Netdev | 8.0+ | Resilient point-to-point links | Use `-netdev stream,addr.type=inet,addr.host=X,addr.port=Y,reconnect-ms=5000` for auto-reconnecting VM pairs. Handles restart gracefully. |

### New NetworkMode Enum Values (Add to Existing)

```python
class NetworkMode(Enum):
    """Network configuration modes."""
    NONE = "none"
    USER = "user"
    TAP = "tap"
    BRIDGE = "bridge"
    # NEW for v1.3 Multi-Container:
    SOCKET_MCAST = "socket_mcast"  # Multicast socket for N-way VM mesh
    SOCKET_STREAM = "socket_stream"  # Stream socket for point-to-point
    SOCKET_DGRAM = "socket_dgram"   # Datagram socket (UDP-like)
```

### Extended QemuConfig Fields

```python
@dataclass
class QemuConfig:
    # ... existing fields ...

    # NEW for v1.3 Multi-Container:
    socket_mcast_addr: str = "230.0.0.1"  # Multicast group address
    socket_mcast_port: int = 1234         # Multicast port
    socket_stream_host: str = "127.0.0.1" # Stream listen/connect host
    socket_stream_port: int = 12345       # Stream listen/connect port
    socket_stream_listen: bool = True     # True=listen, False=connect
    socket_stream_reconnect_ms: int = 5000  # Reconnect interval
```

### Supporting Patterns for Multi-Container

| Pattern | Implementation | Why |
|---------|----------------|-----|
| VM Fleet Manager | New `QemuFleet` class using `asyncio.gather()` | Orchestrates multiple QEMU instances concurrently. Manages collective lifecycle (start all, stop all, health checks). |
| Process Registry | `Dict[str, QemuBoot]` with async lock | Track VMs by name/id. Enable selective restart without affecting others. Use `asyncio.Lock` for thread-safe access. |
| Event Broadcasting | `asyncio.Event` per VM + fleet-wide | Signal boot completion, shutdown, errors. Enable coordinated startup sequences. |
| Health Monitoring | Periodic `asyncio.create_task()` pings | Check QEMU monitor socket via `info status` command. Auto-restart on failure if desired. |

### What NOT to Add (And Why)

| Avoid | Why | Use Instead |
|-------|-----|-------------|
| libvirt Python bindings | Heavy dependency (C library), overkill for simple multi-VM. Requires libvirtd daemon running. | Direct QEMU subprocess via asyncio (already have QemuBoot class) |
| Docker/Podman SDK | Containers don't match our use case (we boot OS images, not container images). Adds unnecessary complexity. | QEMU with direct kernel boot (already implemented) |
| Kubernetes client | Massively overkill. We're not orchestrating distributed clusters. | Simple `QemuFleet` class with asyncio |
| TAP interfaces for VM mesh | Requires root/CAP_NET_ADMIN. Complex setup (ip tuntap, bridge config). Security concerns. | QEMU socket netdev (mcast/stream) - works unprivileged |
| Linux bridge (br0) | Requires root. Persists state outside process lifecycle. | Socket multicast for mesh, stream for point-to-point |
| VDE (Virtual Distributed Ethernet) | Additional dependency (vde2). Unmaintained since 2015. Complex setup. | QEMU native socket netdev |
| Social networking libraries (ZeroMQ, etc.) | Overkill for VM-to-VM L2 connectivity. We need Ethernet, not message passing. | QEMU socket netdev provides L2 bridge emulation |
| External process managers (supervisord, circus) | Adds another daemon dependency. We already have Python process control. | asyncio subprocess management |

### Integration with Existing QemuBoot

The multi-container stack extends, not replaces, the existing `QemuBoot` class:

```python
# Existing _build_network_args() extension:
def _build_network_args(self) -> List[str]:
    args = []
    if self.config.network_mode == NetworkMode.NONE:
        args.extend(["-nic", "none"])
    elif self.config.network_mode == NetworkMode.USER:
        # ... existing code ...
    elif self.config.network_mode == NetworkMode.TAP:
        # ... existing code ...
    elif self.config.network_mode == NetworkMode.BRIDGE:
        # ... existing code ...
    # NEW for v1.3:
    elif self.config.network_mode == NetworkMode.SOCKET_MCAST:
        # Multicast socket - all VMs join same group
        args.extend([
            "-netdev", f"socket,id=net0,mcast={self.config.socket_mcast_addr}:{self.config.socket_mcast_port}",
            "-device", "virtio-net-pci,netdev=net0"
        ])
    elif self.config.network_mode == NetworkMode.SOCKET_STREAM:
        # Stream socket - point-to-point with reconnect
        if self.config.socket_stream_listen:
            args.extend([
                "-netdev", f"stream,id=net0,addr.type=inet,addr.host={self.config.socket_stream_host},addr.port={self.config.socket_stream_port},server=on",
                "-device", "virtio-net-pci,netdev=net0"
            ])
        else:
            args.extend([
                "-netdev", f"stream,id=net0,addr.type=inet,addr.host={self.config.socket_stream_host},addr.port={self.config.socket_stream_port},reconnect-ms={self.config.socket_stream_reconnect_ms}",
                "-device", "virtio-net-pci,netdev=net0"
            ])
    elif self.config.network_mode == NetworkMode.SOCKET_DGRAM:
        # Datagram socket - UDP-like
        args.extend([
            "-netdev", f"socket,id=net0,dgram=:12345",
            "-device", "virtio-net-pci,netdev=net0"
        ])
    return args
```

### QemuFleet Orchestration Pattern

```python
class QemuFleet:
    """
    Orchestrates multiple QEMU instances for multi-container boot.

    Uses asyncio for concurrent process management.
    No external dependencies beyond stdlib.
    """

    def __init__(self):
        self._vms: Dict[str, QemuBoot] = {}
        self._lock = asyncio.Lock()
        self._boot_events: Dict[str, asyncio.Event] = {}

    async def add_vm(self, name: str, qemu: QemuBoot) -> None:
        async with self._lock:
            self._vms[name] = qemu
            self._boot_events[name] = asyncio.Event()

    async def boot_all(self, **boot_kwargs) -> Dict[str, BootResult]:
        """Boot all VMs concurrently."""
        async def boot_one(name: str, qemu: QemuBoot) -> Tuple[str, BootResult]:
            result = await asyncio.to_thread(qemu.boot, **boot_kwargs)
            self._boot_events[name].set()
            return name, result

        tasks = [boot_one(name, qemu) for name, qemu in self._vms.items()]
        results = await asyncio.gather(*tasks, return_exceptions=True)
        return dict(results)

    async def stop_all(self) -> None:
        """Stop all VMs concurrently."""
        async def stop_one(qemu: QemuBoot) -> None:
            await asyncio.to_thread(qemu.stop)

        await asyncio.gather(*[stop_one(qemu) for qemu in self._vms.values()])

    async def wait_for_boot(self, name: str, timeout: float = 60.0) -> bool:
        """Wait for specific VM to complete boot."""
        try:
            await asyncio.wait_for(self._boot_events[name].wait(), timeout)
            return True
        except asyncio.TimeoutError:
            return False
```

### Network Topology Patterns

| Topology | NetworkMode | Configuration | Use Case |
|----------|-------------|---------------|----------|
| Full Mesh | SOCKET_MCAST | All VMs use same mcast addr:port | Cluster testing, distributed systems |
| Daisy Chain | SOCKET_STREAM | VM1 listens, VM2 connects to VM1, VM3 connects to VM2 | Pipeline processing |
| Star | SOCKET_STREAM | Central hub listens, spokes connect | Client-server within VMs |
| Isolated Pairs | SOCKET_STREAM | Each pair has unique port | Parallel independent workloads |

### Performance Characteristics

| Mode | Overhead | Scalability | Root Required |
|------|----------|-------------|---------------|
| USER (NAT) | ~5% | 1-10 VMs | No |
| SOCKET_MCAST | ~2% | 1-50 VMs | No |
| SOCKET_STREAM | ~1% | 1-100 VMs | No |
| TAP | ~1% | Unlimited | Yes |
| BRIDGE | ~1% | Unlimited | Yes |

Socket netdev modes have lower overhead than USER mode because they skip NAT translation.

---

## Installation

### Core (v1.0/v1.1)

```bash
# Core FUSE and vision libraries
pip install pyfuse3>=3.4.0 opencv-python>=4.14.0 anthropic>=0.40.0

# Already in codebase - verify versions
pip install "pillow>=12.1.0" "numpy>=1.24.0" "pydantic>=2.5.0" "httpx>=0.24.0"

# For installer UI
pip install "rich>=13.7.0"

# For async file operations
pip install "aiofiles>=23.2.0"

# Testing
pip install "pytest>=7.4.0" "pytest-asyncio>=0.21.0"
```

**System dependencies for FUSE:**
```bash
# Ubuntu/Debian
sudo apt-get install libfuse3-dev fuse3

# Alpine Linux
sudo apk add fuse3-dev fuse3
```

### Network Boot (v1.2)

```bash
# Core
pip install tftpy==0.8.6
pip install pyrsync2==0.2.6
pip install dnspython>=2.6.0

# NBD server (system package)
# Ubuntu/Debian:
sudo apt install nbdkit nbdkit-python-plugin

# Fedora/RHEL:
sudo dnf install nbdkit nbdkit-python-plugin

# Optional: bsdiff (if choosing C-based delta)
pip install bsdiff4  # Pre-built bindings
# OR compile from source for embed
```

### Multi-Container Boot (v1.3 NEW)

```bash
# No new pip packages required!
# Uses stdlib asyncio and existing QEMU installation

# Ensure QEMU 8.0+ for full socket netdev support
qemu-system-x86_64 --version  # Verify >= 8.0.0

# On Ubuntu/Debian:
sudo apt install qemu-system-x86 qemu-utils

# On Fedora/RHEL:
sudo dnf install qemu-kvm qemu-img
```

---

## Alternatives Considered

### v1.0/v1.1 Alternatives

| Recommended | Alternative | When to Use Alternative |
|-------------|-------------|-------------------------|
| pyfuse3 | llfuse | Only if you need Python 2.7 support (deprecated) or legacy libfuse2 |
| pyfuse3 | fusepy | Only if you need pure Python implementation without libfuse3 dependency |
| anthropic | openai | When you need GPT-4o specifically or cross-validation between models |
| Claude Vision | GPT-4 Vision | When cost is a concern (GPT-4o is cheaper but less capable visually) |
| rich | tqdm | When you only need simple progress bars (rich provides full TUI) |
| OpenCV | scikit-image | When you need scientific image processing algorithms vs computer vision |

### v1.2 Network Boot Alternatives

| Recommended | Alternative | When to Use Alternative |
|-------------|-------------|-------------------------|
| tftpy | pyftpdlib TFTP | pyftpdlib is heavier (FTP-focused). Use only if already using pyftpdlib for FTP. |
| tftpy | dnsmasq (external) | Use dnsmasq for production deployments with complex DHCP/TFTP integration. tftpy for embedded/self-contained. |
| nbdkit | qemu-nbd | qemu-nbd is client-only. Use nbdkit for server implementation. |
| pyrsync2 | bsdiff4 | Use bsdiff4 when deltas are larger (full OS image updates). pyrsync2 for incremental block-level changes. |
| pyrsync2 | xdelta3 | xdelta3 has better compression for similar binary data. Use if delta size is critical. |

### v1.3 Multi-Container Alternatives

| Recommended | Alternative | When to Use Alternative |
|-------------|-------------|-------------------------|
| asyncio + QEMU socket | libvirt | Only for production VM management with snapshots, live migration, complex storage |
| QEMU socket mcast | TAP + bridge | Only when VMs need full L2 access to host network or external network |
| QEMU socket stream | VDE switch | Never - VDE is unmaintained since 2015 |
| QemuFleet (custom) | Kubernetes | Never - overkill for single-host multi-VM |
| QemuFleet (custom) | Docker Compose | Never - we boot OS kernels, not containers |

---

## What NOT to Use

### v1.0/v1.1

| Avoid | Why | Use Instead |
|-------|-----|-------------|
| python-fuse (libfuse2 bindings) | Deprecated; libfuse2 is EOL; no async support | pyfuse3 (libfuse3) |
| PIL (original) | Abandoned in 2009; no Python 3 support | Pillow (active fork) |
| OpenCV 2.x or 3.x | End-of-life; missing modern features; security issues | OpenCV 4.14+ |
| synchronous vision APIs | Blocks event loop; poor UX for installer operations | Use async anthropic/openai clients |
| raw subprocess calls to QEMU | Fragile; poor error handling; hard to test | Use existing QEMU wrapper patterns from codebase |

### v1.2 Network Boot

| Avoid | Why | Use Instead |
|-------|-----|-------------|
| rsync (full package) | Requires subprocess, heavy dependencies, overkill for byte-level delta | pyrsync2 (pure Python algorithm) |
| dnsmasq Python wrappers | Unstable APIs, subprocess management complexity | tftpy + separate dnsmasq OR embedded DHCP via scapy |
| pure-Python NBD servers (nbd.py, etc.) | Immature, unmaintained, performance issues | nbdkit with Python plugin (industry standard) |
| PIL/Pillow for binary diff | Not designed for binary comparison, memory-inefficient | pyrsync2 or bsdiff4 |
| HTTP-based boot (HTTPBoot) | Requires UEFI 2.5+, more complex than PXE | PXE/TFTP for broad compatibility |
| NFS root filesystem | Adds complexity, not needed for kernel/initrd boot | NBD for block device, TFTP for kernel/initrd |

### v1.3 Multi-Container (NEW)

| Avoid | Why | Use Instead |
|-------|-----|-------------|
| libvirt Python bindings | Heavy C library dependency. Requires libvirtd daemon. Adds 50+ MB deps. | asyncio subprocess (stdlib, zero deps) |
| Docker SDK for Python | Wrong abstraction (containers vs VMs). Requires Docker daemon. | QEMU with direct kernel boot |
| TAP interfaces for mesh | Requires root or CAP_NET_ADMIN. Complex cleanup. Security exposure. | QEMU socket netdev (unprivileged) |
| Linux bridges (br0, etc.) | Requires root. Persists beyond process. Conflicts with system networking. | QEMU socket multicast (ephemeral, isolated) |
| VDE (Virtual Distributed Ethernet) | Unmaintained. Complex socket paths. Poor documentation. | QEMU native socket netdev |
| ZeroMQ/nanomsg for VM comms | Wrong layer (message passing vs L2 Ethernet). Requires agent in VM. | QEMU socket provides L2 bridge |
| Multiprocessing module | Overkill for I/O-bound process orchestration. GIL not a concern here. | asyncio (simpler, native async I/O) |
| Thread-based orchestration | Blocking subprocess calls complicate lifecycle. Thread safety issues. | asyncio subprocess (non-blocking) |

---

## Stack Patterns by Variant

### v1.0/v1.1 Patterns

**If building FUSE filesystem for direct PNG boot:**
- Use pyfuse3 with async/await
- Implement lazy loading (decode on read, not on mount)
- Cache decoded chunks to avoid repeated PNG decoding
- Because PNG decoding is CPU-intensive and FUSE operations should be fast

**If building vision-based OS detection:**
- Use Claude Vision API (anthropic) with structured prompts
- Extract metadata from PNG tEXt chunks first (fallback to vision)
- Use OpenCV for pre-processing (resize, entropy analysis)
- Because vision models have size limits and token costs

**If building visual installer:**
- Use rich for terminal UI with progress bars and live status
- Implement checkpoint/resume capability (install state persistence)
- Use async I/O for disk operations
- Because OS installation can take minutes and users need visibility

**If building thumbnail gallery:**
- Use Pillow thumbnail() method (efficient, preserves aspect ratio)
- Cache thumbnails in ~/.cache/pixelrts/
- Use rich for TUI or FastAPI for web interface
- Because generating thumbnails on-demand is slow

### v1.2 Network Boot Patterns

**If embedding boot server in .rts.png container:**
- Use tftpy (pure Python, no system dependencies)
- Use pyrsync2 (pure Python delta)
- Bootstrap from initramfs

**If production deployment with existing infrastructure:**
- Use dnsmasq (system package) for TFTP+DHCP
- Use nbdkit for NBD serving
- Integrate via FastAPI catalog server

**If delta size is critical (slow networks):**
- Use bsdiff4 instead of pyrsync2
- Trade-off: slower delta generation, smaller deltas
- Pre-compute deltas on catalog server

### v1.3 Multi-Container Patterns (NEW)

**If booting a cluster of VMs for distributed systems testing:**
- Use NetworkMode.SOCKET_MCAST with shared multicast address
- All VMs automatically see each other at L2
- No coordination needed beyond shared mcast:port

**If booting VM pairs for client-server scenarios:**
- Use NetworkMode.SOCKET_STREAM
- Server VM: listen=True, fixed port
- Client VM: listen=False, reconnect-ms=5000 for resilience

**If booting 10+ VMs with asyncio:**
- Use `asyncio.gather()` with `return_exceptions=True`
- Implement per-VM timeout with `asyncio.wait_for()`
- Track boot completion with `asyncio.Event` per VM

**If implementing coordinated startup:**
- Boot "infrastructure" VMs first (databases, etc.)
- Wait for their boot events before booting "application" VMs
- Use sequential phases within async context

---

## Version Compatibility

### v1.0/v1.1

| Package A | Compatible With | Notes |
|-----------|-----------------|-------|
| pyfuse3 3.4.0+ | Python 3.8+, libfuse3 3.2+ | Requires fuse3 kernel module (Linux 4.20+) |
| Pillow 12.1.0 | Python 3.9+, numpy 1.24+ | Released 2026-01-02, latest stable |
| OpenCV 4.14+ | Python 3.8+, numpy 1.24+ | Pre-built wheels available for most platforms |
| anthropic 0.40+ | Python 3.9+, httpx 0.24+ | Async client requires Python 3.9+ |
| rich 13.7+ | Python 3.8+ | Optional dependency for installer UI |
| scipy 1.12+ | Python 3.9+, numpy 1.24+ | Required for v1.1 diff region detection |

### v1.2 Network Boot

| Package A | Compatible With | Notes |
|-----------|-----------------|-------|
| tftpy 0.8.6 | Python 3.8+ | Pure Python, no native deps |
| nbdkit 1.40+ | Python 3.6+ (via python plugin) | Requires nbdkit-python-plugin package |
| pyrsync2 0.2.6 | Python 3.6+ | Pure Python |
| dnspython 2.6+ | Python 3.8+ | No compatibility issues known |

### v1.3 Multi-Container (NEW)

| Component | Compatible With | Notes |
|-----------|-----------------|-------|
| asyncio subprocess | Python 3.8+ | stdlib, no deps |
| QEMU socket mcast | QEMU 2.12+ | Available since 2018 |
| QEMU socket stream | QEMU 7.2+ | reconnect-ms added in 7.2 |
| QEMU socket dgram | QEMU 2.12+ | Available since 2018 |
| virtio-net-pci | QEMU 0.10+ | Mature, stable |

---

## Integration with Existing Stack

### v1.2 Integration

#### FastAPI Catalog Server
```
/catalog/{id}/boot     -> Start TFTP server, serve kernel/initrd
/catalog/{id}/nbd      -> Start nbdkit with Python plugin
/catalog/{id}/delta/{old_id} -> Generate pyrsync2 delta
```

#### FUSE Filesystem (MountHelper)
```
MountHelper mounts .rts.png
nbdkit Python plugin reads from mount point
NBD clients see block device
```

#### QEMU Integration
```bash
# Boot from network (PXE)
qemu-system-x86_64 -boot n -netdev user,id=net0,tftp=/boot,bootfile=pxelinux.0

# Boot from NBD
qemu-system-x86_64 -drive file=nbd://localhost:10809/rtspng,format=raw
```

### v1.3 Multi-Container Integration (NEW)

#### BootBridge + QemuFleet
```python
# Boot multiple containers with mesh networking
from systems.pixel_compiler.boot.boot_bridge import BootBridge
from systems.pixel_compiler.integration.qemu_boot import QemuConfig, NetworkMode

configs = [
    QemuConfig(
        memory="1G",
        cpus=2,
        network_mode=NetworkMode.SOCKET_MCAST,
        socket_mcast_addr="230.0.0.1",
        socket_mcast_port=1234,
    )
    for _ in range(3)  # 3 VMs in mesh
]

bridges = [BootBridge(f"vm{i}.rts.png", config=c) for i, c in enumerate(configs)]
fleet = QemuFleet()
for i, bridge in enumerate(bridges):
    await fleet.add_vm(f"vm{i}", bridge._qemu)

results = await fleet.boot_all(cmdline="console=ttyS0")
```

#### QEMU Socket Netdev CLI
```bash
# VM 1 - multicast mesh participant
qemu-system-x86_64 -kernel vmlinuz -initrd initrd \
  -netdev socket,id=net0,mcast=230.0.0.1:1234 \
  -device virtio-net-pci,netdev=net0

# VM 2 - same mesh
qemu-system-x86_64 -kernel vmlinuz -initrd initrd \
  -netdev socket,id=net0,mcast=230.0.0.1:1234 \
  -device virtio-net-pci,netdev=net0

# VM 1 - stream server
qemu-system-x86_64 -kernel vmlinuz \
  -netdev stream,id=net0,addr.type=inet,addr.host=127.0.0.1,addr.port=12345,server=on \
  -device virtio-net-pci,netdev=net0

# VM 2 - stream client with reconnect
qemu-system-x86_64 -kernel vmlinuz \
  -netdev stream,id=net0,addr.type=inet,addr.host=127.0.0.1,addr.port=12345,reconnect-ms=5000 \
  -device virtio-net-pci,netdev=net0
```

### Architecture Notes

#### v1.2 TFTP Server Flow
```
1. FastAPI endpoint receives boot request
2. tftpy.TftpServer starts on port 69
3. MountHelper exposes kernel/initrd from .rts.png
4. TFTP serves files from mount point
5. Client PXE boots
```

#### v1.2 NBD Server Flow
```
1. nbdkit loads Python plugin
2. Plugin's pread() reads from MountHelper-exposed .rts.png
3. NBD protocol serves block device
4. QEMU or Linux nbd client connects
5. Block device appears as /dev/nbd0
```

#### v1.2 Delta Update Flow
```
1. Client has old.rts.png, wants new.rts.png
2. Client computes pyrsync2 blockchecksums(old)
3. Server computes rsyncdelta(checksums, new)
4. Server sends delta (only changed blocks)
5. Client patches: patchstream(old, delta) -> new
```

#### v1.3 Multi-Container Boot Flow (NEW)
```
1. QemuFleet.add_vm() registers each BootBridge/QemuBoot
2. QemuFleet.boot_all() calls asyncio.gather() on all boot() calls
3. Each QemuBoot launches QEMU subprocess with socket netdev
4. VMs discover each other via multicast or connect via stream
5. QemuFleet.wait_for_boot() signals completion per VM
6. QemuFleet.stop_all() terminates all processes concurrently
```

---

## Sources

### v1.0/v1.1 Sources

- **pyfuse3** — Official documentation at https://pyfuse3.readthedocs.io/ (HIGH confidence)
- **Pillow** — Official docs at https://pillow.readthedocs.io/en/stable/ (HIGH confidence)
- **OpenCV** — Official docs at https://docs.opencv.org/4.x/ (HIGH confidence)
- **anthropic-sdk-python** — GitHub repository at https://github.com/anthropics/anthropic-sdk-python (HIGH confidence)
- **FUSE in Python guide (2024)** — Gunnar Wolf's guide: https://gwolf.org/2024/10/started-a-guide-to-writing-fuse-filesystems-in-python.html (MEDIUM confidence)
- **Deep learning binary analysis (2026)** — arXiv paper: https://arxiv.org/html/2601.09157v1 (MEDIUM confidence - vision approaches for binary analysis)
- **WebSearch 2026 results** — Computer vision for boot screen/logo detection, FUSE best practices (LOW confidence - verify with implementation)

### v1.2 Network Boot Sources

- **tftpy PyPI** (https://pypi.org/project/tftpy/) — HIGH confidence, official source
- **pyrsync2 PyPI** (https://pypi.org/project/pyrsync2/) — HIGH confidence, official source
- **nbdkit Python Plugin Docs** (https://libguestfs.org/nbdkit-python-plugin.3.html) — HIGH confidence, official docs
- **bsdiff GitHub** (https://github.com/mendsley/bsdiff) — HIGH confidence, upstream source
- **dnspython PyPI** — HIGH confidence, official source

### v1.3 Multi-Container Sources (NEW)

- **QEMU Invocation Documentation** (https://www.qemu.org/docs/master/system/invocation.html) — HIGH confidence, official docs
- **QEMU Socket Netdev** — `-netdev socket,mcast=` documented in QEMU man pages (HIGH confidence)
- **QEMU Stream Netdev** — `-netdev stream,reconnect-ms=` documented in QEMU 7.2+ release notes (HIGH confidence)
- **Python asyncio subprocess** — https://docs.python.org/3/library/asyncio-subprocess.html (HIGH confidence, stdlib docs)
- **QEMU Networking Wiki** — https://wiki.qemu.org/Documentation/Networking (MEDIUM confidence - wiki has outdated info, verified with official docs)

---
*Stack research for: PixelRTS v1.0/v1.1 (Vision Boot) + v1.2 (Network Boot) + v1.3 (Multi-Container Boot)*
*Original research: 2026-02-11*
*Network boot research: 2026-03-08*
*Multi-container boot research: 2026-03-08*
