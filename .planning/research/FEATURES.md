# Feature Landscape: Multi-Container Boot

**Domain:** Multi-VM / Multi-Container Boot Systems with Primary + Helper Pattern
**Researched:** 2026-03-08
**Confidence:** HIGH (based on official Kubernetes, Docker documentation)

## Executive Summary

Multi-container boot systems follow established patterns from Kubernetes sidecars and Docker Compose orchestration. The "primary + helper" pattern is well-documented: a primary container runs the main workload while helper containers provide supporting services (networking, monitoring, logging). For PixelRTS multi-boot, this translates to: one primary OS container plus utility containers that can communicate over a virtual network.

## Table Stakes (Users Expect These)

Features users assume exist. Missing these = product feels incomplete.

| Feature | Why Expected | Complexity | Notes |
|---------|--------------|------------|-------|
| **Simultaneous boot** | Running multiple VMs at once is standard; users expect `pixelrts boot a.png b.png` | MEDIUM | Parallel boot orchestration needed |
| **Network connectivity** | Containers MUST be able to communicate; isolated boot is useless | HIGH | Virtual network (tap/bridge) required |
| **Container discovery** | Containers need to find each other by name (DNS or /etc/hosts) | MEDIUM | Service name → IP resolution |
| **Boot ordering** | Primary boots first, helpers wait; or explicit dependency order | MEDIUM | `depends_on` pattern from Docker Compose |
| **Graceful shutdown** | Stop helpers before primary; reverse boot order | LOW | Signal handling (SIGTERM) |
| **Status visibility** | Which containers are running? What's their state? | LOW | `pixelrts ps` or status command |
| **Individual control** | Start/stop/restart individual containers in the group | MEDIUM | Selective lifecycle management |
| **Shared storage** | Containers may need to share files (e.g., config, sockets) | MEDIUM | Shared directory or volume mount |
| **Error propagation** | If primary fails, helpers should know; if helper fails, decision needed | MEDIUM | Restart policy per container |

## Differentiators (Competitive Advantage)

Features that set the product apart. Not required, but valuable.

| Feature | Value Proposition | Complexity | Notes |
|---------|-------------------|------------|-------|
| **One-command multi-boot** | `pixelrts boot-group group.yaml` or `pixelrts boot primary.png --with helper.png` | MEDIUM | Opinionated, minimal friction |
| **Visual topology view** | See container relationships in catalog UI | HIGH | Visual graph of primary + helpers |
| **Blueprint-defined groups** | Embed group definition in PNG metadata (which helpers to boot) | HIGH | Self-describing containers |
| **Auto-network setup** | No manual bridge/tap config; PixelRTS creates virtual network | HIGH | Zero-config networking |
| **Helper templates** | Pre-defined helper configs (network-tools, monitoring, logging) | LOW | Common patterns ready to use |
| **Hot-add helpers** | Add a helper container to a running primary without reboot | HIGH | Live attach pattern |
| **Resource sharing** | Helpers share memory regions with primary (memfd, shared memory) | HIGH | Advanced inter-container IPC |
| **Health-aware startup** | Wait for primary to be "healthy" before starting helpers | MEDIUM | `service_healthy` condition pattern |
| **Coordinated snapshots** | Atomic snapshot of all containers together | HIGH | Consistent state capture |
| **Visual diff of groups** | Compare two boot groups, see what changed | MEDIUM | Extends existing diff infrastructure |

## Anti-Features (Commonly Requested, Often Problematic)

Features to explicitly NOT build. Common mistakes in this domain.

| Anti-Feature | Why Avoid | What to Do Instead |
|--------------|-----------|-------------------|
| **Full container orchestration** | Docker/Kubernetes already exist; re-inventing scheduler is scope creep | Focus on boot coordination only; single-host scenarios |
| **Distributed multi-host** | Network boot (v1.2) handles remote boot; multi-host orchestration is out of scope | Single machine with multiple local VMs |
| **Complex networking (SDN)** | CNI plugins, VXLAN, etc. are overkill for local multi-boot | Simple bridge/tap networking; static IPs or DHCP |
| **Container image building** | Building containers is a separate concern | Assume containers already exist as .rts.png files |
| **Live migration** | State transfer between hosts is complex; not needed for boot scenario | Cold boot; install for persistence |
| **Arbitrary pod topologies** | Supporting any DAG of dependencies adds complexity | Linear dependency chains; primary + flat helpers |
| **Resource quotas per container** | Full resource management is orchestration territory | Global limits only; let QEMU manage per-VM |

## Feature Dependencies

```
[Multi-Container Boot]
    ├──requires──> [Parallel boot orchestration]
    │                   └──requires──> [QEMU process management per container]
    │
    ├──requires──> [Virtual network (bridge/tap)]
    │                   └──requires──> [IP allocation (static or DHCP)]
    │                   └──requires──> [Container DNS/hosts entries]
    │
    ├──requires──> [Boot ordering / depends_on]
    │                   └──requires──> [Health/readiness detection]
    │
    └──optionally──> [Shared storage]
                        └──requires──> [Directory sharing between QEMU instances]

[Primary + Helper Pattern]
    └──defines──> [Primary: main workload, first to boot, last to stop]
    └──defines──> [Helper: supporting service, waits for primary, stops first]
    └──defines──> [Restart policy: on-failure, always, never]

[CLI Multi-Boot Interface]
    └──requires──> [Boot group configuration format (YAML or CLI args)]
    └──requires──> [Status command for running containers]
    └──requires──> [Individual container control (start/stop/restart)]
```

### Dependency Notes

- **Virtual network requires IP allocation**: Can use static IPs (192.168.100.1, .2, .3...) or a lightweight DHCP server
- **Boot ordering requires health detection**: Primary signals "ready" via TCP port, file creation, or custom protocol
- **Shared storage requires QEMU 9p/virtfs**: Or simpler host directory mount via FUSE in guest

## MVP Recommendation

For v1.3 multi-boot MVP, prioritize:

1. **Simultaneous boot of 2+ containers** — Core functionality
2. **Bridge networking between containers** — Containers can ping each other
3. **`pixelrts boot-group` command with YAML config** — Declarative configuration
4. **Primary + helper pattern** — Explicit boot ordering with primary first
5. **Status visibility** — `pixelrts ps` shows running containers

Defer to post-MVP:
- **Hot-add helpers**: Complex state management
- **Health-aware startup**: Requires guest agent or port probing
- **Coordinated snapshots**: Atomic state capture is complex
- **Visual topology view**: UI work, not core functionality

## Primary + Helper Pattern Details

Based on Kubernetes sidecar pattern and Docker Compose practices:

### Primary Container Characteristics
- **Lifecycle**: Starts first, stops last
- **Role**: Main workload (e.g., application server, database)
- **Network**: Typically has exposed ports
- **Failure handling**: If primary fails, consider whole group failed

### Helper Container Characteristics
- **Lifecycle**: Waits for primary to be "running" (not necessarily healthy)
- **Role**: Supporting service (network tools, monitoring, logging, proxy)
- **Network**: Internal only, or specific ports
- **Failure handling**: Restart on failure, but don't fail the group

### Example Configuration

```yaml
# boot-group.yaml
primary:
  file: alpine.rts.png
  name: main
  memory: 512M
  expose:
    - 8080:80

helpers:
  - file: network-tools.rts.png
    name: nettools
    memory: 128M
    depends_on: main

  - file: monitoring.rts.png
    name: monitor
    memory: 256M
    depends_on: main

network:
  name: pixelrts-net
  subnet: 192.168.100.0/24
  gateway: 192.168.100.1
```

### Boot Sequence

```
1. Create bridge network (pixelrts-net)
2. Start primary container (main) → IP 192.168.100.2
3. Wait for primary to be "running" (QEMU process started)
4. Start helper: nettools → IP 192.168.100.3
5. Start helper: monitor → IP 192.168.100.4
6. Configure /etc/hosts or DNS:
   - main → 192.168.100.2
   - nettools → 192.168.100.3
   - monitor → 192.168.100.4
```

### Shutdown Sequence (Reverse)

```
1. Stop helper: monitor (SIGTERM, wait, SIGKILL)
2. Stop helper: nettools (SIGTERM, wait, SIGKILL)
3. Stop primary: main (SIGTERM, wait, SIGKILL)
4. Destroy bridge network
```

## Existing Infrastructure to Leverage

| Component | File | Reuse |
|-----------|------|-------|
| Boot management | `pixelrts_boot.py` | BootManager, BootConfig, BootMetrics |
| QEMU integration | `boot/boot_bridge.py` | QEMU launch, serial console |
| Progress indication | `boot/boot_progress.py` | TTY-aware progress output |
| Network boot | `serve/server.py` | Async server orchestration |
| DHCP proxy | `serve/dhcp_proxy.py` | IP allocation patterns |

## Sources

### Kubernetes Sidecar Pattern
- [Kubernetes Sidecar Containers](https://kubernetes.io/docs/concepts/workloads/pods/sidecar-containers/) - Official documentation on sidecar pattern (HIGH confidence)
- Sidecars defined as `initContainers` with `restartPolicy: Always` since Kubernetes v1.29

### Docker Compose Patterns
- [Docker Compose Networking](https://docs.docker.com/compose/networking/) - Default network, service discovery (HIGH confidence)
- [Control Startup Order in Compose](https://docs.docker.com/compose/startup-order/) - `depends_on` with conditions (HIGH confidence)

### Docker Compose Startup Conditions
- `service_started`: Default, just wait for container to start
- `service_healthy`: Wait for healthcheck to pass
- `service_completed_successfully`: Wait for container to exit with code 0

### Key Insights from Documentation

1. **Compose default networking**: Each container joins a default network and is discoverable by service name
2. **Startup order**: `depends_on` with `condition: service_healthy` ensures readiness
3. **Sidecar lifecycle**: Sidecars start before main container and stop after main container

---
*Feature research for: Multi-Container Boot (v1.3)*
*Researched: 2026-03-08*
