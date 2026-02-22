# Cross-Worktree Thought Transmission Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable agents in separate git worktrees to share thoughts (embeddings, insights, status) using the `TelepathyProtocol`. This connects the isolated "islands" of execution into a single "collective consciousness".

**Architecture:**
1.  **Telepathy Bridge:** A script that wraps `TelepathyNode` and connects it to the `ThoughtEngine` and `ConsciousnessState`.
2.  **Thought-to-Signal Mapping:** Logic to convert `Thought` objects from the consciousness module into `TelepathySignal` objects for the swarm module.
3.  **Cross-Worktree Discovery:** Utilization of the existing UDP broadcast discovery to find "neighboring" Claude sessions (nodes) on the same machine.

**Tech Stack:** Python 3.12, asyncio, `systems.swarm.telepathy_protocol`, `systems.visual_shell.swarm.consciousness`

---

## Task 1: Telepathy Consciousness Bridge

**Files:**
- Create: `systems/swarm/telepathy_bridge.py`
- Create: `tests/isolation/test_cross_worktree_telepathy.py`

**Step 1: Implement the Bridge**

The bridge will:
- Initialize a `TelepathyNode`.
- Observe the `TelepathyNode` for incoming signals.
- Convert `TelepathySignal` -> `Thought` and push to a local `ConsciousnessState`.
- Provide a method to take a local `Thought` and `broadcast_thought` via Telepathy.

**Step 2: Integration Test**

A test that:
1. Spawns two `TelepathyBridge` instances on different ports.
2. Injects a `Thought` into Bridge A.
3. Verifies Bridge B receives it and updates its `ConsciousnessState`.
4. (Simulates cross-worktree by using different ports/IDs).

---

## Task 3: Automatic Thought Synchronization

**Files:**
- Create: `systems/intelligence/thought_sync_daemon.py`

**Description:**
A background daemon that:
1. Initializes a `ThoughtEngine` and `TelepathyBridge`.
2. Periodically broadcasts "STATUS" or "EMBEDDING" thoughts about the current worktree's state.
3. Listens for thoughts from other worktrees and logs them to `thought_logger.py`.

---

## Summary

This connects the **Swarm** (P2P networking) with **Consciousness** (data structures for thought) to solve **Isolation** (the "lonely agent" problem in worktrees).
