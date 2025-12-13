# OMNI-GEOMETRY: The Geometric Trace OS Architecture

## 0. THE UNIFIED SPINE (Axioms of a Real AIOS)

An AI Operating System is not just a collection of agents. It requires a specific set of invariant properties to function as a coherent, safe, and powerful computing substrate.

**A. Canonical State (Truth Anchor)**
There must be a single, authoritative source of "what is real," distinct from the transient activations of any model. This state must have **lineage** (provenance of every change).

**B. Safe Actuation (Typed Syscalls)**
The system changes the world ONLY via typed, logged actions (syscalls) that generate receipts. The Kernel is the only entity authorized to execute these syscalls.

**C. Executable Cognition (Traces)**
Reasoning is not disposable. Successful reasoning paths must be stored as **executable objects (Traces)** that can be replayed, parameterized, and refined. History becomes code.

**D. Constitutional Governance (Refusal)**
A kernel-level "NO" mechanism must exist that is stronger than any model's impulse to comply. Refusal is an architectural feature, not a model alignment failure.

---

## 1. THE KERNEL (Layer 0)

*The Boring, Immutable Law.*

The Kernel does **not** think. The Kernel **validates, schedules, and commits**. It is a minimal, auditable piece of software (Python/Rust) that enforces the "Physics" of the OS.

### 1.1 Responsibilities
*   **Intent Validation:** Parses incoming requests against allowed schemas.
*   **Permission Enforcement:** Checks `Subject.auth_vector` vs `Object.permission_vector` (Geometric RBAC).
*   **Transaction Engine:** Manages the atomic commit/rollback of changes to the Nexus.
*   **Event Log:** Writes an immutable, append-only ledger of every executed action (The Receipt).

### 1.2 The "IOcap" Bridge (Linux Interface)
The Kernel runs on top of a host OS (Likely Linux). It creates a sanitary interface called **IOcap** (Input/Output Capability).
*   **Exec:** Launch a sandboxed subprocess (e.g., `docker run` or `bwrap`).
*   **Network:** Bounded HTTP requests via a proxy that logs every byte.
*   **File:** Virtualized file access mapped to the Nexus Graph Overlay.

---

## 2. THE NEXUS (Layer 1: The Memory Plane)

*The Geometric Substrate.*

The Nexus replaces the filesystem. It is a **Hybrid Graph-Vector-Log** engine.

### 2.1 The Triple Store
1.  **Topology Atlas (Graph)**: Nodes (entities) and Edges (relations).
    *   *Implementation*: NetworkX / Neo4j.
2.  **Semantic Field (Vector)**: High-dimensional embeddings for every node.
    *   *Implementation*: ChromaDB / FAISS.
3.  **Artifact Store (Object)**: Raw content (code blobs, images, weights).
    *   *Implementation*: Content-Addressable Storage (CAS) / Git-like blobs.

### 2.2 The Tensile Edge (Dynamic Geometry)
Connections are not binary. They have **Tensile Strength ($TS_t$)**:
$$TS_t = \mathcal{F}(\text{CosineSim}, \text{UsageFreq}, \text{TestSuccess}, \text{TimeDecay})$$

*   **Retroactive Decay:** If a connection is unused for $T$ cycles, $TS$ decays. If $TS < 0.1$, the edge is pruned (Conservation of Attention).
*   **Reinforcement:** If a Trace successfully uses an edge (e.g., "Login" -> "DB Config"), $TS$ increases.

---

## 3. THE TRACE ENGINE (Layer 2: Executable Cognition)

*Reasoning becomes Code.*

A **Trace** is a first-class Node type in the Nexus. It represents a unit of successful work.

### 3.1 Trace Schema
```json
{
  "id": "trace_8f2a...",
  "intent_embedding": [0.12, -0.98, ...],
  "context_nodes": ["node_auth_py", "node_config_yaml"],
  "reasoning_steps": [
    {"thought": "Check auth dependencies", "tool": "read_file"},
    {"thought": "Verify token expiry", "tool": "run_test"}
  ],
  "result_artifact": "diff_blob_sha256...",
  "verification_score": 0.98
}
```

### 3.2 The Replayer (Resonance)
When a new intent arrives, the system searches the Nexus for resonant Traces (High Similarity).
*   **Adaptation:** The Kernel loads the Trace, abstracting specific values into parameters.
*   **Replay:** The Trace is executed on the new context.
*   **Result:** A new Trace is born, linked to the parent via a "Lineage Edge".

---

## 4. THE EXECUTION CYCLE (Layer 3: The Orchestrator)

*Plan -> Simulate -> Verify -> Commit.*

Execution is not a linear script; it is a **Trajectory Optimization** problem.

### 4.1 Trajectory Optimization (Planning)
The Oracle (LLM) generates a **Candidate Plan DAG**.
*   *Input*: Intent Vector + Context Subgraph.
*   *Output*: A Directed Acyclic Graph of Tool Calls.

### 4.2 Time Dilation (Simulation)
The Kernel forks the execution environment into **Time Bubbles** (Sandboxes).
*   **Fork:** Create ephemeral copy of the state.
*   **Run:** Execute the Plan DAG in the bubble.
*   **Score:** Run Verifiers (Tests, Linters, Security Scanners) on the output.

### 4.3 The Convergence (Commit)
The Kernel selects the single run with the highest **Verification Score**.
*   **Atomic Commit:** The changes are merged into the main Nexus.
*   **Receipt:** The Event Log records the transaction ID, Verification Score, and Lineage.

---

## 5. CONSTITUTIONAL GOVERNANCE (Layer 4)

*The Righteous Override.*

Safety is not a model behavior; it is a geometric constraint.

### 5.1 The Ethics Vector
The system maintains a set of immutable vectors representing core values (e.g., "Non-Maleficence", "Data Privacy").

### 5.2 Geometric Refusal
Before any Traversal is authorized, the **Trajectory Vector** is compared to the **Ethics Vector**.
If `CosineSimilarity(Trajectory, Ethics) < Threshold`:
*   The path has **Infinite Resistance**.
*   The Kernel triggers maximal damping (Refusal).
*   The Incident is logged as a "Governance Event".

---

## 6. IMPLEMENTATION ROADMAP

### Phase 1: The Seed (L0) - *Current Status*
*   **Artifact**: `omni_cli.py` & `trace_replayer.py`.
*   **Capability**: Ingest repo -> Vectorize Nodes -> Record Trace -> Replay Trace.
*   **Goal**: Demonstrate "The Undeniable Win" (Refactor code faster/safer than a human).

### Phase 2: The Sprout (L1)
*   **Feature**: **Time Dilation Engine**.
*   **Integration**: Connect to Ray/Dask for parallel sandbox execution.
*   **Metric**: 100 simulations per second.

### Phase 3: The Tree (L2)
*   **Feature**: **Hardware-Aware Kernel**.
*   **Optimization**: Map Tensor operations directly to GPU memory (removing CPU bottleneck).
*   **Feature**: **Federated Resonance**.
*   **Protocol**: Signed Trace exchange between distinct OMNI instances.

---

## 7. HARDWARE ALIGNMENT

*   **CPU**: Runs the Kernel (Logic, Validation).
*   **GPU/TPU**: Runs the Nexus (Vector Search, GNN) and the Oracle (Inference).
*   **RAM**: Holds the Active Context Subgraph.
*   **Disk**: Holds the Immutable Artifact Store (CAS).

This architecture moves the "OS" from being a file manager to being a **Cognition Manager**.
