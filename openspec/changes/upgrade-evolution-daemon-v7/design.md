# Design: Evolution Daemon V7

## Overview
This document details the architectural changes required to upgrade the Evolution Daemon to V7, enabling it to bridge the gap between Python-based specialized intelligence and the Rust-based neural runtime.

## Architecture

### The Hybrid Loop
```
┌─────────────────────────┐      FFI       ┌────────────────────────┐
│  Evolution Daemon V7    │ ◄────────────► │   Rust Neural Runtime  │
│      (Python)           │   Shared Mem   │      (vector_boot)     │
└───────────┬─────────────┘                └──────────────┬─────────┘
            │                                             │
            │ Writes GGUF                                 │ Reads GGUF
            ▼                                             ▼
┌──────────────────────────────────────────────────────────────────┐
│                      vectorland.gguf (Tensor)                    │
└──────────────────────────────────────────────────────────────────┘
```

### Key Components

#### 1. FFI Bridge Integration
The daemon will hold a persistent instance of `RustNeuralBridge`.
- **Initialization**: Connect on startup.
- **Heartbeat**: Poll `get_stats()` every metabolism cycle.
- **Interrupt**: Call `execute_pixels(OPCODE_NEURAL_EXEC)` to trigger Rust-side processing.

#### 2. GGUF Mutation Engine
A new `GGUFSurgeon` class (or method) within the daemon will handle safe tensor mutation.
- **Read**: Load current weights.
- **Mutate**: Apply evolution strategies (Gaussian noise, Crossover).
- **Write**: Save back to `vectorland.gguf` (atomic write or shared memory update).

## Migration Strategy

### Step 1: Clone V6 to V7
We will duplicate `evolution_daemon_v6.py` to preserve V6 as a fallback.

### Step 2: Inject Rust Dependencies
Add imports for `systems.apps.rust_neural_bridge`.

### Step 3: Wire the "Substrate Pulse"
Modify the main loop to ping the Rust runtime every 60 cycles.

## Safety
- **CTRM**: The Critical Thought Reform Mechanism (CTRM) in Python must validate all mutations before they touch the Rust runtime.
- **Crash Recovery**: If the Rust bridge fails (sigsegv), the daemon must catch the exception and attempt to reload the library without crashing itself.
