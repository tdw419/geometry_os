# Feature Research

**Domain:** Network Boot (PXE/NBD) and Delta Updates for PixelRTS
**Researched:** 2026-03-08
**Confidence:** HIGH (based on official documentation from nbdkit, NBD protocol, iPXE)

## Feature Landscape

### Table Stakes (Users Expect These)

Features users assume exist. Missing these = product feels incomplete.

| Feature | Why Expected | Complexity | Notes |
|---------|--------------|------------|-------|
| **PXE boot server** | Network boot is standard infrastructure in data centers; TFTP/DHCP setup is expected | MEDIUM | dnsmasq, isc-dhcp-server are standard tools |
| **DHCP configuration** | PXE requires DHCP options (66=next-server, 67=bootfile); automatic configuration expected | LOW | Standard DHCP options, well-documented |
| **TFTP file serving** | Legacy PXE uses TFTP for initial boot; expected as fallback | LOW | Python tftpy, standard tftp-hpa |
| **Boot progress indication** | Network boot can take time; users need visual feedback | LOW | Reuse existing InstallProgress patterns |
| **Error recovery** | Network failures happen; graceful error messages and retry expected | MEDIUM | Timeout handling, retry logic |
| **Multiple client support** | PXE server must handle multiple machines booting simultaneously | MEDIUM | Threaded or async architecture |
| **NBD block device export** | For disk image serving over network; expected for full OS boot | HIGH | nbdkit or custom NBD server implementation |
| **Authentication/Security** | Network boot without auth is a security risk | MEDIUM | TLS, pre-shared keys, or IP restrictions |

### Differentiators (Competitive Advantage)

Features that set the product apart. Not required, but valuable.

| Feature | Value Proposition | Complexity | Notes |
|---------|-------------------|------------|-------|
| **PixelRTS-native NBD plugin** | Serve .rts.png files directly as block devices via nbdkit plugin | HIGH | Custom nbdkit plugin in Python; unique to PixelRTS |
| **HTTP boot via iPXE** | Faster than TFTP; modern alternative; iPXE supports HTTP natively | MEDIUM | Chainload iPXE from legacy PXE, then HTTP boot |
| **Delta updates via visual diff** | Download only changed bytes/regions; leverages Hilbert encoding for efficient patches | HIGH | Uses existing `pixelrts diff` infrastructure; unique advantage |
| **Chunk-based delta transfer** | Binary diff (bsdiff-style) for minimal bandwidth; rsync-like rolling checksum | HIGH | Reduces update bandwidth by 90%+ for similar images |
| **Visual boot menu** | Network boot with visual catalog integration; thumbnail-based OS selection | MEDIUM | Leverage existing CatalogServer infrastructure |
| **Zero-config server** | `pixelrts serve <file.png>` starts everything (DHCP proxy, TFTP, NBD, HTTP) | MEDIUM | Opinionated defaults; minimal setup friction |
| **Chunked streaming** | Stream kernel/initrd to client without full download; start boot immediately | HIGH | Byte-range HTTP requests; progressive boot |
| **Checksum verification** | SHA256 verification of transferred data; integrity guarantee | LOW | Standard security practice |

### Anti-Features (Commonly Requested, Often Problematic)

Features that seem good but create problems.

| Feature | Why Requested | Why Problematic | Alternative |
|---------|---------------|-----------------|-------------|
| **Full PXE stack (DHCP server)** | "I want one command to boot my network" | Conflicts with existing network infrastructure; DHCP conflicts cause network outages | DHCP proxy mode or require existing DHCP server with PXE options |
| **Automatic network configuration** | "Just work on any network" | Cannot safely auto-detect network topology; may interfere with production networks | Explicit configuration with sensible defaults; `--detect` flag for safe probing |
| **Real-time image sync** | "Keep all nodes in sync automatically" | Adds significant complexity; network partitions cause divergence | Explicit `pixelrts sync` command; pull-based updates |
| **Cloud-init integration** | "Boot cloud instances from PixelRTS" | Cloud providers have their own boot mechanisms; out of scope for v1.2 | Focus on local/bare-metal network boot first |
| **Multicast boot** | "Boot 100 machines at once efficiently" | Multicast is complex; requires specialized network config; TFTP doesn't support it | HTTP with caching proxy; or dedicated multicast tools |
| **Live migration** | "Migrate running VM between hosts via NBD" | Complex state management; not needed for boot/install use case | Cold boot; install to local disk for persistence |

## Feature Dependencies

```
[PXE Boot Server]
    └──requires──> [DHCP configuration (proxy or full)]
    └──requires──> [TFTP server for legacy PXE]
                       └──enhances──> [HTTP server via iPXE chainload]

[NBD Block Export]
    └──requires──> [PixelRTS v2 decoder]
    └──requires──> [nbdkit plugin OR custom NBD server]
                       └──requires──> [NBD protocol implementation]

[Delta Updates]
    └──requires──> [PixelRTS diff infrastructure] (existing)
    └──requires──> [Chunk-based binary diff algorithm]
                       └──requires──> [Rolling checksum (rsync-style) OR bsdiff]
    └──requires──> [Delta manifest format]
    └──requires──> [Client-side patch application]

[HTTP Boot (iPXE)]
    └──requires──> [iPXE chainload from TFTP]
    └──requires──> [HTTP server for kernel/initrd]
                       └──requires──> [Range request support for streaming]
    └──enhances──> [Delta updates] (byte-range requests)

[Visual Boot Menu]
    └──requires──> [CatalogServer infrastructure] (existing)
    └──requires──> [iPXE script generation]
    └──enhances──> [PXE Boot Server]
```

### Dependency Notes

- **PXE Boot Server requires DHCP configuration**: Can use proxy DHCP (responds only to PXE requests) to avoid network conflicts
- **NBD Block Export requires PixelRTS v2 decoder**: Must decode PNG to raw bytes for block device emulation
- **Delta Updates require diff infrastructure**: Leverage existing `pixelrts diff` for region detection; add binary patch generation
- **HTTP Boot enhances Delta Updates**: HTTP range requests enable efficient delta transfer
- **Visual Boot Menu enhances PXE**: Makes network boot user-friendly without adding core complexity

## MVP Definition

### Launch With (v1.2)

Minimum viable product — what's needed to validate network boot concept.

- [ ] **TFTP server for legacy PXE** — Table stakes; most PXE implementations expect TFTP
- [ ] **DHCP proxy mode** — Respond to PXE DHCP requests without full DHCP server
- [ ] **Basic NBD export** — Serve .rts.png as block device via nbdkit Python plugin
- [ ] **Boot progress indication** — Reuse existing progress patterns
- [ ] **`pixelrts serve <file.png>` command** — Single command to start network boot server

### Add After Validation (v1.2.x)

Features to add once core is working.

- [ ] **HTTP boot via iPXE chainload** — Faster boot; modern alternative to TFTP
- [ ] **Delta manifest generation** — Generate diff manifest between versions
- [ ] **Delta patch application** — Client-side patching with bsdiff-style algorithm
- [ ] **Visual boot menu** — Network boot with catalog integration

### Future Consideration (v2+)

Features to defer until network boot is validated.

- [ ] **Chunked streaming boot** — Start boot before full download
- [ ] **Multi-file NBD export** — Serve multiple .rts.png files
- [ ] **TLS/encryption** — Secure network boot
- [ ] **Advanced caching** — CDN integration for large deployments

## Feature Prioritization Matrix

| Feature | User Value | Implementation Cost | Priority |
|---------|------------|---------------------|----------|
| TFTP server | HIGH | LOW | P1 |
| DHCP proxy mode | HIGH | MEDIUM | P1 |
| Basic NBD export | HIGH | HIGH | P1 |
| `pixelrts serve` command | HIGH | MEDIUM | P1 |
| Boot progress indication | MEDIUM | LOW | P1 |
| HTTP boot via iPXE | HIGH | MEDIUM | P2 |
| Delta manifest generation | MEDIUM | MEDIUM | P2 |
| Delta patch application | MEDIUM | HIGH | P2 |
| Visual boot menu | LOW | MEDIUM | P3 |
| Chunked streaming boot | MEDIUM | HIGH | P3 |
| TLS/encryption | MEDIUM | MEDIUM | P3 |

**Priority key:**
- P1: Must have for launch (MVP)
- P2: Should have, add when possible
- P3: Nice to have, future consideration

## Competitor Feature Analysis

| Feature | Cobbler | Foreman | FOG Project | MAAS | Our Approach |
|---------|---------|---------|-------------|------|--------------|
| **PXE boot** | Yes | Yes | Yes | Yes | Yes (simplified) |
| **DHCP management** | Full | Full | Full | Full | Proxy mode only |
| **Image format** | ISO/IMG | ISO/IMG | ISO/IMG | ISO/IMG | .rts.png (unique) |
| **Delta updates** | No | No | No | No | Yes (unique advantage) |
| **Visual boot menu** | Text | Text | Basic GUI | Web UI | Visual catalog |
| **Setup complexity** | High | Very High | Medium | High | Low (single command) |
| **NBD support** | No | No | No | No | Yes (via nbdkit) |
| **HTTP boot** | Yes | Yes | Yes | Yes | Yes (via iPXE) |

## Technical Implementation Notes

### PXE Boot Sequence

1. **Client powers on** → NIC PXE ROM broadcasts DHCPDISCOVER with PXE option (60)
2. **DHCP server responds** → DHCPOFFER with IP + Option 66 (TFTP server IP) + Option 67 (bootfile name)
3. **Client downloads bootfile** → TFTP request for `undionly.kpxe` (BIOS) or `ipxe.efi` (UEFI)
4. **iPXE executes** → Issues new DHCP request, then chains to HTTP URL or script
5. **Kernel/initrd loaded** → HTTP download (faster) or TFTP (fallback)
6. **OS boots** → Uses NBD for root filesystem if network-root mode

### NBD Protocol Basics

```
Client                          Server
  |                               |
  |--- NBD_OPT handshake ------->|
  |<-- NBD_INFO (size, flags) ---|
  |                               |
  |--- NBD_CMD_READ (offset,len)->|
  |<-- NBD_REPLY (data) ---------|
  |                               |
  |--- NBD_CMD_WRITE (offset,data)>|
  |<-- NBD_REPLY (ack) ----------|
```

Default port: 10809 (TCP)
Magic number: `0x4e42444d41474943` ("NBDMAGIC")

### Delta Update Algorithm (rsync-style)

1. **Server has new version, client has old version**
2. **Client sends checksums** of fixed-size blocks (e.g., 4KB) from old file
   - Strong checksum: MD4/MD5 hash
   - Weak checksum: Rolling checksum (Adler-32 variant)
3. **Server compares checksums** against new file
4. **Server sends**:
   - Literal data for non-matching blocks
   - Block references for matching blocks ("copy block N from old file")
5. **Client reconstructs** new file from old + patches

### nbdkit Python Plugin Template

```python
# /usr/lib64/nbdkit/python/nbdkit-pixelrts-plugin.py
import nbdkit

API_VERSION = 2

pixelrts_file = None
pixelrts_data = None

def config(key, value):
    global pixelrts_file
    if key == "file":
        pixelrts_file = value

def open(readonly):
    global pixelrts_data
    # Decode .rts.png to raw bytes
    pixelrts_data = decode_pixelrts(pixelrts_file)
    return {"size": len(pixelrts_data)}

def get_size(h):
    return h["size"]

def pread(h, buf, offset, flags):
    buf[:] = pixelrts_data[offset:offset+len(buf)]
    return len(buf)
```

## Sources

### PXE / Network Boot
- [iPXE Documentation](https://ipxe.org/docs) - Official iPXE documentation (HIGH confidence)
- [iPXE Chainloading Guide](https://ipxe.org/howto/chainloading) - How to chainload iPXE (HIGH confidence)
- [wimboot - Windows Imaging Format bootloader](https://github.com/ipxe/wimboot) - HTTP boot example (HIGH confidence)

### NBD Protocol
- [NBD GitHub Repository](https://github.com/NetworkBlockDevice/nbd) - Official NBD protocol and tools (HIGH confidence)
- [nbdkit Manual](https://libguestfs.org/nbdkit.1.html) - nbdkit server documentation (HIGH confidence)

### Delta Updates
- [rsync Algorithm Technical Report](https://rsync.samba.org/tech_report/tech_report.html) - Rolling checksum algorithm (HIGH confidence)
- [bsdiff/bspatch](https://github.com/mendsley/bsdiff) - Binary diff library (HIGH confidence)

### Existing PixelRTS Infrastructure
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler/pixelrts_boot.py` - Boot management classes
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler/pixelrts_v2_core.py` - PNG encoding/decoding
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler/pixelrts_vision_analyzer.py` - Vision analysis

---
*Feature research for: Network Boot (PXE/NBD) and Delta Updates*
*Researched: 2026-03-08*
