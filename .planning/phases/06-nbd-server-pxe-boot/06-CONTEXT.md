# Phase 6: NBD Server + PXE Boot - Context

**Gathered:** 2026-03-08
**Status:** Ready for planning

<domain>
## Phase Boundary

Users can boot PixelRTS containers over the network using PXE/NBD. This phase delivers:
- NBD server that exports .rts.png files as network block devices
- PXE boot infrastructure (DHCP proxy + TFTP server)
- Unified `pixelrts serve` command for zero-config network boot

HTTP boot (Phase 7) and delta updates (Phase 8) are separate phases.

</domain>

<decisions>
## Implementation Decisions

### Serve command design
- **Foreground mode** — Blocks terminal, shows live logs, Ctrl+C to stop
- **Zero-config invocation** — `pixelrts serve <file.png>` is all that's needed
- **Auto-detect interface** — Automatically choose active interface with network access
- **Print config on startup** — Show auto-detected config, ports, and status before serving
- **All-or-nothing services** — All services (DHCP, TFTP, NBD) run together, no granular control
- **One container only** — Single file per serve instance
- **Validate file first** — Check .rts.png validity before starting services, show helpful error if invalid
- **Clean shutdown** — Graceful cleanup on Ctrl+C with cleanup message

### Network configuration
- **Bind to one interface** — Listen only on detected interface, not 0.0.0.0
- **Proxy DHCP only** — Use proxyDHCP mode (port 4011), safe alongside existing DHCP servers
- **Standard ports only** — DHCP:4011, TFTP:69, NBD:10809 — fail if occupied
- **Auto-detect network** — Infer IP range (e.g., 192.168.1.0/24) from interface config

### Error handling & logging
- **Rich terminal output** — Use Rich library for formatted, colored output
- **Log and continue** — If client boot fails mid-transfer, log error and continue serving others
- **Terminal only** — No log files, all output to terminal

### Boot progress feedback
- **Live progress display** — Show progress bars for TFTP/NBD transfer with client IP and status
- **Multi-client table** — Show all connected clients with their boot status simultaneously
- **Show all stages** — Display boot stages: DHCP → TFTP → NBD → Kernel load
- **Keep all clients visible** — Completed clients remain in display with success status

### Claude's Discretion
- Exact Rich progress bar layout and styling
- Error message wording and formatting
- Terminal color scheme
- How to handle network interface detection edge cases (multiple active interfaces, virtual interfaces)

</decisions>

<specifics>
## Specific Ideas

- "One command to serve" — zero-config is a core value
- Should feel like running a simple file server, not configuring enterprise infrastructure
- Safety first: proxyDHCP ensures we don't break existing networks

</specifics>

<deferred>
## Deferred Ideas

- Multiple container serving — future consideration
- HTTP boot (Phase 7) — faster transfers for large containers
- TLS/encryption for secure boot — future security enhancement
- Port override flags — not needed for zero-config MVP

</deferred>

---

*Phase: 06-nbd-server-pxe-boot*
*Context gathered: 2026-03-08*
