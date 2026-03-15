# Geometry OS: Self-Hosting & Autonomous Evolution

## Overview

**Self-Hosting** in Geometry OS is the capability of the system to modify, rebuild, and re-deploy its own components (drivers, compilers, and the HAL daemon) using its own infrastructure. In this paradigm, the AI assistant (the "Neural Cognitive Agent") acts as the system architect, using the **Self-Hosting Loop** to evolve the OS without external human intervention.

"The computer that builds itself, inside itself."

---

## The Architecture of Autonomy

The self-hosting capability is built on a tiered bridge between high-level reasoning and low-level spatial execution.

```
┌─────────────────┐     MCP Protocol      ┌─────────────────┐     HTTP/Unix      ┌─────────────────┐
│  AI Assistant   │ ◄──────────────────► │  GEOS MCP Server │ ◄───────────────► │  Ouroboros HAL  │
│ (Architect/Dev) │                       │  (Tool Bridge)   │                   │ (Daemon/Substrate)│
└─────────────────┘                       └─────────────────┘                    └─────────────────┘
        │                                         │                                      │
        │ [Analyze & Plan]                        │ [Translate & Execute]                │ [Apply & Run]
        ▼                                         ▼                                      ▼
┌─────────────────┐                       ┌─────────────────┐                    ┌─────────────────┐
│ Source Code     │ ◄───────────────────► │ Build Tools     │ ◄────────────────► │ GPU Substrate   │
│ (.rs, .glyph)   │                       │ (cargo, python) │                    │ (.rts.png)      │
└─────────────────┘                       └─────────────────┘                    └─────────────────┘
```

### Core Components

1.  **Neural Cognitive Agent (AI)**: Analyzes system health, identifies performance bottlenecks (e.g., low SLS scores), and generates source code updates.
2.  **Ouroboros HAL Daemon**: The "nervous system" of the OS. It manages the GPU substrate and exposes a remote execution API (`/exec`).
3.  **MCP Server**: The "Rosetta Stone" that turns AI intent into daemon actions.
4.  **GPU Substrate**: The "Hard Drive" and "RAM". The entire OS state is stored as a 2D Hilbert-mapped texture.

---

## The Self-Hosting Loop

The system evolves through a five-stage iterative process:

### 1. Analyze (Substrate Inspection)
The AI uses `mem_peek` and `vcc_validate` to inspect the current state of the running OS.
*   **Tool**: `vcc_validate({"region": "0x0000-0x1000"})`
*   **Outcome**: Detection of memory corruption or performance drift.

### 2. Plan (Architectural Design)
The AI identifies the required change (e.g., "The UART driver needs a larger buffer"). It modifies the `.glyph` or `.rs` source code in the workspace.

### 3. Execute (Remote Build)
The AI triggers the build process *through* the running daemon. This is the critical "Self-Hosting" step.
*   **Tool**: `gpu_exec({"cmd": "cargo build --release --bin gpu_dev_daemon"})`
*   **Outcome**: A new binary or texture is generated on the host.

### 4. Deploy (Hot-Swap)
The new component is loaded into the active environment.
*   **Tool**: `substrate_load({"rts_file": "kernel.rts.png"})` or restarting the daemon.
*   **Outcome**: The OS begins executing the updated code.

### 5. Verify (Integrity Check)
The AI re-runs the VCC validation to confirm the new state matches the intended architecture.
*   **Tool**: `vcc_validate({"region": "0x0000-0x1000", "expected_hash": "..."})`
*   **Outcome**: A "Visual Consistency Contract" is signed, confirming a successful evolution.

---

## Key Capabilities

### Autonomous Driver Evolution
The AI can write a new driver in **Glyph Assembly**, compile it into a texture, and hot-patch it into a running VM's memory space using `mem_poke`.

### HAL Self-Correction
If the `gpu_dev_daemon` identifies a bug in its own API handling, the AI can:
1.  Edit the Rust source code.
2.  Rebuild the daemon via `gpu_exec`.
3.  Restart the daemon via a background shell command.
4.  Re-connect to the new version.

### Visual Consistency Contract (VCC)
The VCC is the "Legal System" of the self-hosting OS. It ensures that any autonomous change follows the architectural specification. No change is considered "Final" until its SHA256 hash is recorded in the `vcc_manifest.yaml`.

---

## Security & Safety

In a self-hosting environment, safety is maintained through:
*   **Spatial Sandboxing**: Each VM is restricted to a specific region of the Hilbert map.
*   **VCC Guardrails**: The AI will refuse to apply a patch that violates the VCC of critical regions (like the Boot Sector).
*   **Audit Trails**: Every `gpu_exec` and `mem_poke` is logged, creating a "Time-Travel Debugger" for the OS's evolution.

---

## Future Vision: Recursive Geometry
As the system matures, the human role transitions from "Coder" to "Policy Setter". Humans define the **Intent** (e.g., "Maximize FPS while keeping memory under 150MB"), and the **Self-Hosting Loop** autonomously navigates the geometric search space to achieve that state.

**"The Screen is the Hard Drive. The AI is the CPU. The Geometry is the Code."**
