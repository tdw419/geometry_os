---
name: parallel-swarm-production
description: Productionizes agent coordination for real-world tasks within Geometry OS. Use this skill when transforming the multi-agent demo infrastructure into a functional system for tasks like distributed catalog scanning or tectonic optimization.
category: coordination
---

# Parallel Swarm Production

This skill moves beyond the demo phase to enable autonomous agents to perform coordinated work on the infinite map.

## Core Architecture

Agents collaborate via the A2A (Agent-to-Agent) Router using:
- **Distributed Locks**: To claim regions of the infinite map.
- **Barriers**: To synchronize phases across the swarm.
- **Task Delegation**: For horizontal scaling of specialized work (Scanner -> Processor).

## Workflow: Productionizing a Task

1. **Define the Domain**: Identify a real task (e.g., `CatalogScanner`).
2. **Implement Agent Subclasses**:
    - Extend `BaseAgent` from `multi_agent_demo.js`.
    - Implement `getCapabilities()` and `handleMessage()`.
3. **Set Up the Router**: Ensure `scripts/start_a2a_dev.sh` is running.
4. **Deploy the Swarm**:
    - Launch agents in the browser or via Node.js workers.
    - Monitor progress via the A2A Router logs.

## Target Production Tasks

### 1. Distributed Catalog Scanning
- **ScannerAgent**: Iterates through `.rts.png` files on the infinite map.
- **ProcessorAgent**: Extracts metadata and validates SHA256 hashes.
- **CoordinatorAgent**: Ensures no duplicate work via locks.

### 2. Tectonic Saccadic Optimization
- Agents collaborate to optimize layout and minimize "saccadic noise" during map navigation.
- Uses barriers to ensure all regions are optimized before moving to the next zoom level.
