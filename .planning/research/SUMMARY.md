# Project Research Summary

**Project:** PixelRTS v1.3 Multi-Container Boot
**Domain:** Multi-VM Orchestration with Virtual Networking
**Researched:** 2026-03-08
**Confidence:** HIGH

## Executive Summary

PixelRTS v1.3 extends the existing vision-based OS boot system to support simultaneous multi-container boot with inter-VM networking. This follows established patterns from Kubernetes sidecars and Docker Compose, adapted for QEMU-based VM orchestration rather than container runtimes. The key innovation is using QEMU's native socket netdev (multicast and stream modes) to create VM meshes without requiring root privileges or complex TAP/bridge setup.

The recommended architecture is **composition-based**: a new `MultiBootManager` orchestrates multiple existing `BootBridge` instances, with a `VirtualNetwork` component managing QEMU socket-based interconnect. This preserves the proven single-container boot flow while adding multi-container coordination. The critical design decision is using asyncio for concurrent process management rather than external orchestration tools (libvirt, Docker SDK, supervisord) - all of which are overkill for single-host multi-VM scenarios.

Key risks include: (1) resource exhaustion from unbounded parallel boot, (2) network race conditions when VMs start before the mesh is ready, and (3) cascade failures when one VM fails affecting the entire group. Mitigation requires resource allocation before boot, phased startup with dependency ordering, and graceful degradation when networking fails.

## Key Findings

### Recommended Stack

No new Python packages required for v1.3 multi-container boot. The extension uses Python 3.12+ stdlib (`asyncio`) and existing QEMU 8.0+ features (socket netdev). This is a deliberate architectural choice to avoid heavy dependencies.

**Core technologies for multi-container:**
- **asyncio (stdlib):** Concurrent subprocess orchestration - native async/await for non-blocking QEMU process management, zero new dependencies
- **QEMU Socket Netdev (8.0+):** VM-to-VM networking without root - multicast for mesh (`-netdev socket,mcast=`), stream for point-to-point (`-netdev stream,reconnect-ms=`)
- **NetworkMode enum extension:** Add SOCKET_MCAST, SOCKET_STREAM, SOCKET_DGRAM to existing enum in `QemuBoot`

**What NOT to add:**
- libvirt Python bindings - heavy C dependency, requires libvirtd daemon, overkill for single-host
- Docker/Podman SDK - wrong abstraction (we boot OS images in VMs, not container images)
- TAP/bridge networking - requires root or CAP_NET_ADMIN, complex cleanup, security exposure
- VDE (Virtual Distributed Ethernet) - unmaintained since 2015, complex setup

### Expected Features

**Must have (table stakes):**
- **Simultaneous boot:** `pixelrts boot a.png b.png c.png` boots all in parallel - users expect multi-VM to "just work"
- **Network connectivity:** VMs can communicate via virtual network - isolated boot is useless for multi-container
- **Container discovery:** VMs find each other by name (DNS-like or /etc/hosts) - required for service-to-service communication
- **Boot ordering:** Primary boots first, helpers wait; or explicit `depends_on` - matches Docker Compose expectations
- **Status visibility:** `pixelrts ps` shows running containers - users need to know what's running
- **Graceful shutdown:** Stop helpers before primary (reverse boot order) - matches Kubernetes sidecar lifecycle

**Should have (competitive):**
- **One-command multi-boot:** `pixelrts boot-group group.yaml` with declarative config - minimal friction
- **Auto-network setup:** Zero-config networking - PixelRTS creates virtual network automatically
- **Health-aware startup:** Wait for primary to be "healthy" before helpers start - `service_healthy` condition pattern

**Defer (v2+):**
- Hot-add helpers - complex live state management
- Coordinated snapshots - atomic state capture across VMs is complex
- Visual topology view - UI work, not core functionality
- Distributed multi-host - out of scope for single-host boot

### Architecture Approach

The architecture extends existing components via composition, not modification. `MultiBootManager` is the new orchestration layer managing multiple `BootBridge` instances. `VirtualNetwork` handles QEMU socket netdev configuration. `ResourceAllocator` prevents port/VNC conflicts.

**Major components:**
1. **MultiBootManager:** Orchestrates multiple BootBridge instances, handles dependency ordering via topological sort, provides aggregate status
2. **VirtualNetwork:** Manages QEMU socket netdev (mcast/stream), allocates IPs, provides container name resolution
3. **ResourceAllocator:** Allocates VNC displays, serial sockets, port forwards; prevents conflicts between containers
4. **QemuFleet (asyncio):** Concurrent boot/stop with `asyncio.gather()`, per-VM events for coordination

**Key patterns:**
- **Composition over inheritance:** MultiBootManager composes BootBridge instances; BootBridge stays focused on single container
- **Resource allocation before boot:** Allocate all resources before starting any VM to prevent partial failures leaving orphaned resources
- **Graceful degradation:** If VirtualNetwork setup fails, containers still boot with isolated networking

### Critical Pitfalls

1. **Unbounded parallel boot** — Without limits, booting 50+ VMs exhausts memory/ports. Mitigation: max concurrent limit (10), `asyncio.Semaphore`, staged boot for large groups.
2. **Network race conditions** — VMs may try to communicate before mesh is established. Mitigation: Primary must be "running" before helpers join; use `asyncio.Event` for boot completion signaling.
3. **Cascade failure** — If one VM fails, entire group appears broken. Mitigation: Configurable failure policy (fail group vs continue degraded), individual container restart.
4. **Resource leaks on failure** — Partial boot leaves allocated VNC displays/ports orphaned. Mitigation: Cleanup in `finally` blocks, ResourceAllocator.release() on any exception.
5. **Using TAP/bridge instead of socket** — Requires root, complex cleanup, security exposure. Mitigation: Use QEMU socket netdev - works unprivileged.

## Implications for Roadmap

Based on research, suggested phase structure for v1.3:

### Phase 1: Core Infrastructure (No Networking)
**Rationale:** Foundation layer - resource management and basic multi-boot without interconnect reduces initial complexity
**Delivers:** Ability to boot multiple containers simultaneously with isolated (user-mode) networking
**Addresses:** Simultaneous boot, status visibility, graceful shutdown, individual control
**Avoids:** Pitfall 1 (unbounded parallel) via ResourceAllocator with configurable limits
**Components:** `MultiBootConfig`, `ContainerSpec`, `MultiBootResult` dataclasses; `ResourceAllocator` class; basic `MultiBootManager`

### Phase 2: Virtual Networking
**Rationale:** Networking is complex; build on stable multi-boot foundation
**Delivers:** VM-to-VM communication via QEMU socket netdev (multicast for mesh, stream for point-to-point)
**Uses:** asyncio, QEMU socket netdev, extended NetworkMode enum
**Implements:** `VirtualNetwork`, `NetworkConfig`, `NetworkInfo` classes; extend `QemuBoot._build_network_args()`
**Avoids:** Pitfall 2 (network race conditions) via boot event signaling; Pitfall 5 (TAP/bridge) by using socket netdev
**Components:** `VirtualNetwork` class, extend `NetworkMode` enum, extend `QemuConfig` fields

### Phase 3: CLI Integration & Dependency Ordering
**Rationale:** User-facing features depend on stable infrastructure
**Delivers:** `pixelrts boot a.png b.png c.png`, `pixelrts boot-group group.yaml`, `depends_on` ordering, aggregate status display
**Uses:** YAML config parsing, topological sort for dependencies
**Implements:** CLI argument parsing for multiple paths, boot-group YAML format, health-aware startup
**Avoids:** Pitfall 3 (cascade failure) via configurable failure policies per container
**Components:** Extend `pixelrts_cli.py`, add `boot-group` subcommand, add `BootGroupSpec` YAML schema

### Phase 4: Polish & Edge Cases
**Rationale:** Production readiness after core features complete
**Delivers:** Graceful degradation (network fails -> isolated mode), error recovery, performance tuning, scale testing
**Addresses:** Scale limits (10+ VMs), cleanup on crash, resource exhaustion handling, shared storage
**Avoids:** Pitfall 4 (resource leaks) via comprehensive cleanup paths
**Components:** Error handling improvements, scale testing, documentation

### Phase Ordering Rationale

- **Dependencies:** Resource allocation must exist before multi-boot; multi-boot must exist before networking; networking must exist before dependency ordering
- **Architecture:** Composition pattern allows building MultiBootManager after BootBridge is stable; VirtualNetwork is optional layer
- **Risk mitigation:** Phase 1 establishes resource cleanup patterns; Phase 2 adds network-specific cleanup; Phase 3 adds user-facing error handling

### Research Flags

Phases likely needing deeper research during planning:
- **Phase 2 (Networking):** QEMU socket netdev behavior under load - multicast reliability at 10+ VMs, stream reconnection edge cases, buffer sizes
- **Phase 4 (Polish):** Scale limits on typical hardware - practical max VMs, memory per VM, port exhaustion thresholds

Phases with standard patterns (skip research-phase):
- **Phase 1 (Infrastructure):** asyncio subprocess patterns are well-documented stdlib, resource allocation is straightforward
- **Phase 3 (CLI):** YAML parsing (PyYAML), topological sort are standard algorithms with clear implementations

## Confidence Assessment

| Area | Confidence | Notes |
|------|------------|-------|
| Stack | HIGH | asyncio and QEMU socket netdev are mature, well-documented; zero new external dependencies |
| Features | HIGH | Based on Kubernetes sidecar and Docker Compose patterns from official documentation |
| Architecture | HIGH | Composition pattern is proven; existing BootBridge provides stable foundation |
| Pitfalls | MEDIUM | Based on general multi-container patterns; PixelRTS-specific integration needs validation |

**Overall confidence:** HIGH

### Gaps to Address

- **VM health detection:** How to know when a VM is "ready" for dependents to start? Options: (1) guest agent, (2) TCP port probing, (3) serial console output parsing. Defer decision to Phase 3 implementation.
- **Scale limits:** What's the practical max VMs on typical hardware (16GB RAM, 8 cores)? Need benchmarking during Phase 4.
- **Shared storage:** How do containers share files? QEMU 9p/virtfs or host directory mount via FUSE in guest. Defer to post-v1.3 if needed.

## Sources

### Primary (HIGH confidence)
- QEMU Invocation Documentation (https://www.qemu.org/docs/master/system/invocation.html) - Socket netdev options
- Python asyncio subprocess (https://docs.python.org/3/library/asyncio-subprocess.html) - Concurrent process management
- Kubernetes Sidecar Containers (https://kubernetes.io/docs/concepts/workloads/pods/sidecar-containers/) - Primary/helper lifecycle pattern
- Docker Compose Networking (https://docs.docker.com/compose/networking/) - Service discovery patterns
- Docker Compose Startup Order (https://docs.docker.com/compose/startup-order/) - depends_on with conditions

### Secondary (MEDIUM confidence)
- QEMU Networking Wiki (https://wiki.qemu.org/Documentation/Networking) - General patterns (some outdated, verified with official docs)
- Existing BootBridge (`/systems/pixel_compiler/boot/boot_bridge.py`) - Proven single-container patterns to compose
- Existing QemuBoot (`/systems/pixel_compiler/integration/qemu_boot.py`) - Extension point for NetworkMode

### Tertiary (context)
- Existing pixelrts CLI (`/systems/pixel_compiler/pixelrts_cli.py`) - CLI patterns to extend
- Existing PixelRTSServer (`/systems/pixel_compiler/serve/server.py`) - Async server patterns

---
*Research completed: 2026-03-08*
*Ready for roadmap: yes*
