# Architecture Research

**Domain:** PixelRTS v2 Expansion (Vision, FUSE, Installer, Catalog, Network Boot)
**Researched:** 2026-02-11 (Updated: 2026-03-08 for Network Boot)
**Confidence:** HIGH

## Standard Architecture

### System Overview

```
+-----------------------------------------------------------------------+
|                        Presentation Layer                             |
+-----------------------------------------------------------------------+
|  +---------------------+  +---------------------+  +---------------+  |
|  |  Visual Catalog     |  |  Installer UI       |  |  CLI Tools    |  |
|  |  (Thumbnail Gallery)|  |  (Progress Display) |  |  (boot, etc)  |  |
|  +---------+-----------+  +----------+----------+  +-------+-------+  |
+------------|---------------------------|-------------------|----------+
             |                           |                   |
+------------|---------------------------|-------------------|----------+
|            v                           v                   v          |
|                    Integration / Orchestration Layer                 |
|  +---------------------+  +---------------------+  +---------------+  |
|  |  Vision Pipeline    |  |  FUSE Bridge        |  |  Installer    |  |
|  |  (Analyzer + VLM)   |  |  (Virtual Files)    |  |  (Extractor)  |  |
|  +----------+----------+  +----------+----------+  +-------+-------+  |
+-------------|---------------------------|-------------------|----------+
              |                           |                   |
              v                           v                   v
+-----------------------------------------------------------------------+
|                        Core PixelRTS v2 Layer                         |
|  +---------------------+  +---------------------+  +---------------+  |
|  |  Encoder/Decoder    |  |  Registry Manager   |  |  Metadata     |  |
|  |  (Hilbert + PNG)    |  |  (Catalog Storage)  |  |  (tEXt chunks)|  |
|  +---------------------+  +---------------------+  +---------------+  |
+-----------------------------------------------------------------------+
                                |
                                v
+-----------------------------------------------------------------------+
|                        Storage Layer                                  |
|  +---------------------+  +---------------------+  +---------------+  |
|  |  .rts.png Files     |  |  .meta.json         |  |  SQLite       |  |
|  |  (PNG Containers)   |  |  (Sidecar Metadata) |  |  (Registry)   |  |
|  +---------------------+  +---------------------+  +---------------+  |
+-----------------------------------------------------------------------+
```

### Network Boot Extension (NEW)

```
+------------------------------------------------------------------+
|                    Network Boot Layer (NEW)                       |
+------------------------------------------------------------------+
                                |
        +-----------------------+-----------------------+
        |                       |                       |
+-------v-------+       +-------v-------+       +-------v-------+
| PXEServer     |       | NBDServer     |       | DeltaServer   |
| (DHCP+TFTP)   |       | (Block Dev)   |       | (Diff-based   |
|               |       |               |       |  updates)     |
+---------------+       +---------------+       +---------------+
        |                       |                       |
+-------v-----------------------v-----------------------v--------+
|                    Network Boot Core                            |
|  - NetworkBootManager: Orchestrates PXE + NBD services         |
|  - ClientRegistry: Tracks connected boot clients               |
|  - LeaseManager: DHCP lease tracking                           |
+----------------------------------------------------------------+
                                |
        +-----------------------+-----------------------+
        |                       |                       |
+-------v-------+       +-------v-------+       +-------v-------+
| BootBridge    |       | PixelRTS      |       | PixelRTSDiff  |
| (existing)    |       | Decoder       |       | (existing)    |
|               |       | (existing)    |       |               |
+---------------+       +---------------+       +---------------+
```

### Component Responsibilities

| Component | Responsibility | Typical Implementation | Communicates With |
|-----------|----------------|------------------------|-------------------|
| **Vision Analyzer** | Extract visual features from PNG, prepare for VLM analysis | `PixelRTSVisionAnalyzer` class | Vision Model Client, Pattern Detector |
| **Vision Model Client** | Interface to Claude/VLM APIs for image understanding | API client with retry logic | Vision Analyzer, Installer |
| **FUSE Bridge** | Present .rts.png contents as virtual filesystem (kernel/initrd) | FUSE filesystem using `fusepy` | QEMU, boot loaders, shell tools |
| **Installer Engine** | Extract and write OS to disk with progress tracking | Threaded extractor with callbacks | Vision Analyzer, FUSE Bridge |
| **Visual Catalog** | Display thumbnail gallery with spatial layout | GUI using PyQt/Tk or TUI | Registry Manager, Vision Analyzer |
| **Registry Manager** | Store and query cartridge metadata | SQLite + JSON indexing | All components |
| **PXEServer** (NEW) | DHCP discovery + TFTP boot file serving | Python sockets, scapy for DHCP | NetworkBootManager |
| **NBDServer** (NEW) | Export PixelRTS as network block device | NBD protocol implementation | PixelRTSDecoder, NetworkBootManager |
| **DeltaServer** (NEW) | Serve byte-level OS updates | FastAPI HTTP server | PixelRTSDiffer, NetworkBootManager |

## Recommended Project Structure

```
systems/pixel_compiler/
+-- network/                      # NEW: Network boot infrastructure
|   +-- __init__.py
|   +-- pxe_server.py             # PXEServer: DHCP + TFTP
|   +-- nbd_server.py             # NBDServer: Block device export
|   +-- delta_server.py           # DeltaServer: Delta updates
|   +-- delta_engine.py           # DeltaEngine: Patch compute/apply
|   +-- network_boot_manager.py   # NetworkBootManager: Orchestrator
|   +-- ipxe_config.py            # BootConfig: iPXE templates
|   +-- client_registry.py        # ClientRegistry: Connected clients
|   +-- tests/
|       +-- test_pxe_server.py
|       +-- test_nbd_server.py
|       +-- test_delta_engine.py
|       +-- test_network_boot_manager.py
+-- vision/                    # Vision analysis pipeline
|   +-- __init__.py
|   +-- analyzer.py           # PixelRTSVisionAnalyzer (exists)
|   +-- vlm_client.py         # Claude/VLM API client
|   +-- prompts.py            # Analysis prompt templates
|   +-- findings.py           # Response parsing
+-- fuse/                      # FUSE filesystem bridge
|   +-- __init__.py
|   +-- rts_filesystem.py     # Main FUSE operations
|   +-- container.py          # PNG container handler
|   +-- mount.py              # Mount/unmount CLI
|   +-- boot_integration.py   # QEMU integration
+-- installer/                 # Installation engine
|   +-- __init__.py
|   +-- engine.py             # Main installer logic
|   +-- progress.py           # Progress tracking
|   +-- visualizer.py         # Visual progress display
|   +-- disk.py               # Disk operations
+-- catalog/                   # Visual catalog manager
|   +-- __init__.py
|   +-- gallery.py            # Thumbnail browser
|   +-- spatial_layout.py     # Spatial arrangement engine
|   +-- launcher.py           # Boot-from-catalog handler
+-- boot/                      # Boot infrastructure (existing)
|   +-- __init__.py
|   +-- boot_bridge.py        # MODIFY: Add network boot mode
|   +-- mount_helper.py       # KEEP: Used by local boot
|   +-- boot_progress.py      # EXTEND: Add network stages
+-- install/                   # Install infrastructure (existing)
|   +-- __init__.py
|   +-- install_engine.py     # KEEP: Used for local install
|   +-- disk_writer.py        # KEEP: Chunked I/O utility
+-- integration/               # QEMU integration (existing)
|   +-- qemu_boot.py          # EXTEND: Add network boot params
+-- rts_registry_manager.py   # Existing registry backend
```

### Structure Rationale

- **network/**: New top-level directory for network boot components, follows existing patterns (boot/, install/, catalog/)
- **vision/**: Isolated because vision analysis is optional (API key required). Can be mocked for testing.
- **fuse/**: Platform-specific (Linux FUSE). Clear boundary for portability concerns.
- **installer/**: Potentially dangerous (disk writes). Isolated for security and testing.
- **catalog/**: UI component that depends on other modules. Placed last in dependency order.
- **boot/**: Existing, minimal changes - BootBridge gains optional network mode
- **integration/**: QEMU integration extended for NBD boot parameters

## Architectural Patterns

### Pattern 1: Provider Interface for Vision Models

**What:** Abstract interface for multiple vision model providers (Claude, LM Studio, local VLMs).

**When to use:** When you need to support multiple VLM backends or mock for testing.

**Trade-offs:** Adds abstraction layer (extra code) but enables flexibility and testing.

**Example:**
```python
from abc import ABC, abstractmethod
from typing import Dict, Any

class VisionModelProvider(ABC):
    """Abstract interface for vision model providers."""

    @abstractmethod
    def analyze(self, image_b64: str, prompt: str) -> str:
        """Analyze image and return text response."""
        pass

    @abstractmethod
    def build_kernel_prompt(self, metadata: Dict[str, Any]) -> str:
        """Build prompt for kernel version detection."""
        pass

class ClaudeVisionProvider(VisionModelProvider):
    """Claude API implementation."""

    def __init__(self, api_key: str):
        self.api_key = api_key

    def analyze(self, image_b64: str, prompt: str) -> str:
        # Anthropic API call
        pass

class MockVisionProvider(VisionModelProvider):
    """Mock for testing without API calls."""

    def analyze(self, image_b64: str, prompt: str) -> str:
        return '{"kernel_version": "6.6.0", "distro": "Alpine"}'
```

### Pattern 2: Lazy FUSE Mount

**What:** Mount FUSE filesystem only when first accessed, unmount after idle timeout.

**When to use:** When you want to present .rts.png as always available but avoid resource overhead.

**Trade-offs:** Adds complexity (mount/unmount lifecycle) but improves UX and resource usage.

**Example:**
```python
class LazyFUSEMount:
    """Lazy-mounting FUSE filesystem."""

    def __init__(self, rts_path: str, mountpoint: str, idle_timeout: int = 300):
        self.rts_path = rts_path
        self.mountpoint = mountpoint
        self.idle_timeout = idle_timeout
        self._mount_thread = None
        self._last_access = None

    def __enter__(self):
        """Mount on context entry."""
        self._ensure_mounted()
        return self.mountpoint

    def __exit__(self, *args):
        """Schedule unmount after timeout."""
        self._schedule_unmount()

    def _ensure_mounted(self):
        """Mount if not already mounted."""
        if not self._is_mounted():
            self._mount_thread = threading.Thread(
                target=self._mount_forever,
                daemon=True
            )
            self._mount_thread.start()
```

### Pattern 3: Progress Callback Chain

**What:** Chain of progress observers for visual installer feedback.

**When to use:** When multiple components need progress updates (UI, logger, metrics).

**Trade-offs:** More complex than single callback but enables multiple observers.

**Example:**
```python
class ProgressChain:
    """Chain multiple progress observers."""

    def __init__(self):
        self.observers = []

    def add_observer(self, observer):
        """Add progress observer (callable with progress, message)."""
        self.observers.append(observer)

    def update(self, progress: float, message: str):
        """Notify all observers."""
        for observer in self.observers:
            try:
                observer(progress, message)
            except Exception:
                pass  # Don't let one observer break others

class VisualProgressObserver:
    """Visual progress bar for installer."""

    def __call__(self, progress: float, message: str):
        # Update progress bar
        pass
```

### Pattern 4: Layered Server Architecture (NEW)

**What:** Network boot uses layered services where each layer handles a specific protocol (DHCP -> TFTP -> NBD/HTTP).

**When to use:** Network boot requires multiple protocols that must work together.

**Trade-offs:**
- Pros: Clean separation, testable layers, can run services independently
- Cons: More files, need to coordinate startup/shutdown

```
NetworkBootManager
    |
    +-- PXEServer (DHCP:67, TFTP:69)
    |       |
    |       +-- Handles client discovery
    |       +-- Serves iPXE binary
    |       +-- Generates boot configuration
    |
    +-- NBDServer (TCP:10809)
    |       |
    |       +-- Exports PixelRTS as block device
    |       +-- Uses PixelRTSDecoder for on-demand decode
    |
    +-- DeltaServer (HTTP:8081)
            |
            +-- Serves delta manifests
            +-- Applies delta patches
```

### Pattern 5: Stream-On-Demand Decoding (NEW)

**What:** NBD server decodes PixelRTS data on-demand rather than pre-decoding entire image.

**When to use:** Large images where full decode would waste memory/bandwidth.

**Trade-offs:**
- Pros: Low memory footprint, fast startup, supports larger images
- Cons: Slightly higher latency per block, decoder must support seeking

```python
class NBDServer:
    def read_block(self, offset: int, length: int) -> bytes:
        # Decode only the requested region
        # Uses Hilbert coordinate mapping to find PNG region
        return self.decoder.decode_range(offset, length)
```

### Pattern 6: Delta-First Updates (NEW)

**What:** Check for delta updates before full download, apply byte-level patches.

**When to use:** OS updates where only small portions change.

**Trade-offs:**
- Pros: 90%+ bandwidth savings for small changes, fast updates
- Cons: Requires delta manifest generation, patch application overhead

```
Current Image: alpine-v1.rts.png
Target Image:  alpine-v2.rts.png

1. Client requests delta manifest from DeltaServer
2. DeltaServer uses PixelRTSDiffer to compute changed regions
3. Client downloads only changed byte ranges
4. DeltaEngine applies patches to local image
```

## Data Flow

### Vision Analysis Flow

```
[User selects .rts.png]
         |
         v
[PixelRTSVisionAnalyzer loads PNG]
         |
         v
[generate_entropy_overlay() -> creates visualization]
         |
         v
[prepare_for_vision_model() -> resize + base64]
         |
         v
[VlmClient.analyze() -> Claude API call]
         |
         v
[parse_vision_findings() -> structured JSON]
         |
         v
[generate_findings_overlay() -> annotated PNG]
         |
         v
[Display results: version, distro, architecture, anomalies]
```

### FUSE Boot Flow

```
[User: boot_os alpine.rts.png]
         |
         v
[InstallerEngine extracts kernel/initrd from PNG]
         |
         v
[FUSERtsFilesystem.mount(mountpoint)]
         |
         v
[QEMU reads /mount/vmlinuz via FUSE]
         |
         v
[HilbertLUT translates file offset -> PNG pixels]
         |
         v
[RGBA bytes extracted from PNG image]
         |
         v
[QEMU boots kernel from virtual file]
         |
         v
[After boot, FUSE unmounts automatically]
```

### Installer Progress Flow

```
[User: install_os alpine.rts.png /dev/sda]
         |
         v
[InstallerEngine.start()]
         |
         v
[ProgressChain.add_observer(VisualProgressObserver)]
         |
         v
[Analyzer: Vision analysis -> verify OS type]
         | update(0.1, "Verifying OS type...")
[Extractor: Decode PNG -> get kernel + initrd]
         | update(0.4, "Extracting kernel...")
[DiskWriter: Write kernel to disk]
         | update(0.7, "Writing to /dev/sda...")
[DiskWriter: Write initrd to disk]
         | update(0.9, "Writing filesystem...")
[Bootloader: Install GRUB/Syslinux]
         | update(1.0, "Installation complete!")
[Cleanup: Unmount, close files]
```

### Catalog Boot Flow

```
[User launches visual catalog]
         |
         v
[CatalogGallery.scan_directory() -> find all .rts.png]
         |
         v
[For each file: generate thumbnail via VisionAnalyzer]
         |
         v
[SpatialLayout.arrange() -> organize by similarity/type]
         |
         v
[User double-clicks thumbnail]
         |
         v
[CatalogLauncher.boot_selected()]
         |
         v
[FUSERtsFilesystem.mount() -> present as /mnt/rts]
         |
         v
[QEMU boots: -kernel /mnt/rts/kernel -initrd /mnt/rts/initrd]
         |
         v
[After boot, catalog updates status: "Last booted: now"]
```

### Network Boot Flow (NEW)

```
[Client powers on]
    |
    v
[PXE ROM broadcasts DHCPDISCOVER]
    |
    v
[PXEServer responds with DHCPOFFER + boot filename]
    |
    v
[Client requests iPXE via TFTP]
    |
    v
[PXEServer serves ipxe.krn + boot script]
    |
    v
[iPXE configures network, connects to NBDServer]
    |
    v
[NBDServer exports PixelRTS image as block device]
    |
    v
[Client boots kernel from NBD block device]
    |
    v
[OS running, uses PixelRTS rootfs over NBD]
```

### Delta Update Flow (NEW)

```
[Client has alpine-v1.rts.png installed]
    |
    v
[Client polls DeltaServer for updates]
    |
    v
[DeltaServer checks manifest, returns delta info]
    |
    v
[DeltaEngine computes changed regions using PixelRTSDiffer]
    |
    v
[DeltaServer returns byte-level patches]
    |
    v
[Client DeltaEngine applies patches to local image]
    |
    v
[Verify hash, reboot into updated system]
```

### Key Data Flows Summary

1. **Boot Request Flow:** Client PXE -> PXEServer (DHCP+TFTP) -> NBDServer (block export) -> Client kernel
2. **Delta Request Flow:** Client -> DeltaServer (manifest) -> DeltaEngine (diff) -> Client (patch apply)
3. **Block Read Flow:** NBD client -> NBDServer -> PixelRTSDecoder -> PNG region decode -> NBD client

## Scaling Considerations

| Scale | Architecture Adjustments |
|-------|--------------------------|
| 1-50 cartridges | Single-process, in-memory thumbnails, SQLite catalog |
| 50-500 cartridges | Thumbnail caching on disk, async vision analysis, catalog indexing |
| 500+ cartridges | Background thumbnail generation, pagination, search indexing, distributed cache |

### Network Boot Scaling (NEW)

| Scale | Architecture Adjustments |
|-------|--------------------------|
| 1-10 clients | Single-process Python, built-in PXE+NBD |
| 10-100 clients | Async NBD (asyncio), separate TFTP process |
| 100+ clients | Dedicated dnsmasq for DHCP, multiple NBD workers |

### Scaling Priorities

1. **First bottleneck:** Vision analysis is slow (API latency). Mitigation: Cache results, parallel analysis, background generation.
2. **Second bottleneck:** PNG decoding for many thumbnails. Mitigation: Thumbnail cache, lazy loading, downsized previews.
3. **Third bottleneck (NEW):** DHCP/TFTP single-threaded. Fix: Use dnsmasq or async TFTP.
4. **Fourth bottleneck (NEW):** NBD decode latency. Fix: Block caching, pre-decode hot regions.

## Anti-Patterns

### Anti-Pattern 1: Blocking Vision API Calls on UI Thread

**What people do:** Call `VlmClient.analyze()` directly in button click handler.

**Why it's wrong:** Freezes UI during API call (seconds to minutes).

**Do this instead:** Run vision analysis in background thread, show loading spinner, update UI when complete.

```python
# BAD
def on_button_click():
    result = vlm_client.analyze(img_b64, prompt)  # Blocks!
    update_ui(result)

# GOOD
def on_button_click():
    show_loading_spinner()
    threading.Thread(
        target=lambda: update_ui(vlm_client.analyze(img_b64, prompt)),
        daemon=True
    ).start()
```

### Anti-Pattern 2: Holding FUSE Mount Open Indefinitely

**What people do:** Mount FUSE and never unmount, leaking mounts.

**Why it's wrong:** Exhausts system resources, prevents cleanup, locks files.

**Do this instead:** Use context managers or atexit handlers to ensure unmount.

```python
# BAD
fuse_mount = mount_rts(path)  # Never unmounted!

# GOOD
with mount_rts(path) as mountpoint:
    use_mount(mountpoint)
# Automatically unmounted
```

### Anti-Pattern 3: Tight Coupling Between Installer and Vision

**What people do:** Installer directly calls Claude API, hard to test.

**Why it's wrong:** Can't test installer without API key, slow tests.

**Do this instead:** Use provider interface, inject mock for testing.

### Anti-Pattern 4: Pre-Decoding Entire Image for NBD (NEW)

**What people do:** Decode entire PixelRTS to disk before serving via NBD.

**Why it's wrong:** Wastes disk space (2x), slow startup for large images, defeats streaming purpose.

**Do this instead:** Implement on-demand decoding in NBDServer.read_block().

### Anti-Pattern 5: Full Image Transfer for Updates (NEW)

**What people do:** Download entire new .rts.png for OS updates.

**Why it's wrong:** 1GB download for 50MB of actual changes.

**Do this instead:** Use DeltaEngine to compute and transfer only changed byte ranges.

### Anti-Pattern 6: Running as Root for DHCP (NEW)

**What people do:** Run entire PixelRTS server as root to bind DHCP port 67.

**Why it's wrong:** Security risk, unnecessary privilege escalation.

**Do this instead:**
- Use CAP_NET_RAW capability on Linux
- Or use dnsmasq as DHCP proxy
- Or use port 4011 (PXE port) with relay agent

### Anti-Pattern 7: Tightly Coupled Network Services (NEW)

**What people do:** Mix DHCP, TFTP, NBD code in single file.

**Why it's wrong:** Hard to test, hard to debug, can't run services independently.

**Do this instead:** Separate classes for each protocol, NetworkBootManager orchestrates.

## Integration Points

### External Services

| Service | Integration Pattern | Notes |
|---------|---------------------|-------|
| **Claude API** | HTTP client with retry, async support | Needs API key in env/config |
| **LM Studio** | Local HTTP API (localhost:1234) | No auth required, fallback |
| **QEMU** | Subprocess with -kernel/-initrd pointing to FUSE mount | FUSE must be mounted before QEMU start |
| **dnsmasq** (NEW) | Alternative to built-in PXEServer | Can proxy DHCP for existing networks |
| **iPXE** (NEW) | Bootloader for network boot | Embedded in PXE ROM or chainloaded |

### Internal Boundaries

| Boundary | Communication | Notes |
|----------|---------------|-------|
| **Vision <-> VLM Client** | Provider interface | Enables multiple backends |
| **Installer <-> FUSE** | Context manager | Ensures cleanup |
| **Catalog <-> Registry** | SQLite queries | Read-heavy, add caching |
| **Installer <-> Vision** | Callback/observer | Async progress updates |
| **NetworkBootManager <-> PXEServer** (NEW) | Direct method calls | Same process, orchestrated lifecycle |
| **NetworkBootManager <-> NBDServer** (NEW) | Direct method calls | Same process, shared decoder |
| **NBDServer <-> PixelRTSDecoder** (NEW) | Function calls | Decoder instance per-server |
| **DeltaServer <-> PixelRTSDiffer** (NEW) | Function calls | Uses existing diff engine |
| **DeltaServer <-> CatalogServer** (NEW) | REST API | Optional: list available images |

### BootBridge Integration (NEW)

```python
# Existing local boot
bridge = BootBridge("alpine.rts.png")
result = bridge.boot()  # FUSE mount + QEMU

# NEW: Network boot mode
bridge = BootBridge("alpine.rts.png", mode="network")
result = bridge.boot()  # NBD export + QEMU with -drive file=nbd:localhost:10809
```

## Build Order Implications

### Dependencies

```
1. Core PixelRTS v2 (DONE)
   +-- Encoder/Decoder
   +-- Registry Manager
   +-- Metadata handling

2. Vision Pipeline (Phase 1)
   +-- VisionAnalyzer (exists, needs enhancement)
   +-- VLM Client (NEW)
   +-- Prompt templates (NEW)

3. FUSE Bridge (Phase 2)
   +-- RTSFilesystem (exists, needs adaptation for boot)
   +-- Mount helpers (NEW)
   +-- QEMU integration (NEW)

4. Installer Engine (Phase 3)
   +-- Extractor (exists in pixelrts_v2_extractor.py)
   +-- Progress tracking (NEW)
   +-- Visual feedback (NEW)

5. Visual Catalog (Phase 4)
   +-- Thumbnail generation (uses VisionAnalyzer)
   +-- Spatial layout (NEW)
   +-- Boot launcher (uses FUSE + QEMU)

6. Network Boot (Phase 5) - NEW
   +-- NBDServer (NEW)
   +-- PXEServer (NEW)
   +-- NetworkBootManager (NEW)
   +-- DeltaEngine + DeltaServer (NEW)
```

### Recommended Build Order

**Phase 1: Vision Analysis (Foundational)**
- Rationale: Demonstrates PixelRTS unique advantage, informs all other components
- Builds on: Existing PixelRTSVisionAnalyzer
- Outputs: Kernel version detection, OS identification, tamper detection

**Phase 2: FUSE Bridge (Enables Direct Boot)**
- Rationale: Removes extraction step, enables "one-command boot"
- Builds on: Existing RTSFilesystem (systems/rts_fuse/)
- Outputs: Virtual /kernel and /initrd files from PNG

**Phase 3: Installer Engine (User Value)**
- Rationale: Enables OS installation, practical use case
- Builds on: VisionAnalyzer (verification), FUSE (access), extractor (writing)
- Outputs: Visual installer with progress tracking

**Phase 4: Visual Catalog (Complete Experience)**
- Rationale: Delivers on "visual OS" promise, spatial UI
- Builds on: All previous components
- Outputs: Thumbnail gallery, spatial layout, one-click boot

**Phase 5: Network Boot (NEW)**
- Rationale: Enables diskless boot, centralized OS management, delta updates
- Builds on: PixelRTSDecoder (streaming), PixelRTSDiffer (delta), BootBridge (boot orchestration)
- Outputs: PXE boot server, NBD block export, delta update system

**Network Boot Sub-phases:**

1. **NBD Server Foundation**
   - `systems/pixel_compiler/network/nbd_server.py` - Core NBD protocol
   - `systems/pixel_compiler/network/tests/test_nbd_server.py` - Protocol tests
   - Modify `PixelRTSDecoder` to support range decoding
   - Deliverable: Can export PixelRTS as NBD block device, mountable via nbd-client

2. **PXE Boot Infrastructure**
   - `systems/pixel_compiler/network/pxe_server.py` - DHCP + TFTP
   - `systems/pixel_compiler/network/ipxe_config.py` - Boot script templates
   - `systems/pixel_compiler/network/tests/test_pxe_server.py` - PXE tests
   - Deliverable: Can PXE boot a client that connects to NBD server

3. **Network Boot Manager**
   - `systems/pixel_compiler/network/network_boot_manager.py` - Orchestrator
   - `systems/pixel_compiler/network/client_registry.py` - Client tracking
   - Extend `BootBridge` with network mode
   - Deliverable: Single `pixelrts serve --network-boot alpine.rts.png` command

4. **Delta Updates**
   - `systems/pixel_compiler/network/delta_engine.py` - Patch compute/apply
   - `systems/pixel_compiler/network/delta_server.py` - HTTP delta API
   - `systems/pixel_compiler/network/tests/test_delta_engine.py` - Delta tests
   - Deliverable: Can update installed OS with only changed bytes

**Why this order:**
1. Vision first: Unique differentiator, validates technical approach
2. FUSE second: Enables all subsequent "direct from PNG" workflows
3. Installer third: First practical application using vision + FUSE
4. Catalog fourth: Polished experience combining all features
5. Network boot fifth: Extends existing boot/install capabilities to network

## Sources

### FUSE Filesystems
- [A hand-holding guide to writing FUSE filesystems in Python (Gunnar Wolf, 2024)](https://gwolf.org/2024/10/started-a-guide-to-writing-fuse-filesystems-in-python.html)
- [explosive.fuse Python Package](https://pypi.org/project/explosive.fuse/)
- [Building a virtual filesystem in Python using FUSE (DevGenius, 2025)](https://blog.devgenius.io/building-a-virtual-file-system-in-python-using-fuse-956f140c55b6)
- [Google mount-zip Project](https://github.com/google/mount-zip)

### Network Boot (NEW)
- NBD protocol: https://github.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md
- PXE specification: Intel PXE specification
- iPXE integration: https://ipxe.org/

### Existing Codebase
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler/pixelrts_vision_analyzer.py`
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler/infinite_map_fuse.py`
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/rts_fuse/filesystem.py`
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler/boot/boot_bridge.py`
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler/install/install_engine.py`
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler/pixelrts_diff.py`
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler/catalog/catalog_server.py`
- `/home/jericho/zion/projects/geometry_os/geometry_os/.planning/codebase/ARCHITECTURE.md`
- `/home/jericho/zion/projects/geometry_os/geometry_os/.planning/PROJECT.md`

---
*Architecture research for: PixelRTS v2 Expansion including Network Boot*
*Researched: 2026-02-11 (Updated: 2026-03-08 for Network Boot)*
