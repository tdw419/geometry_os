#!/usr/bin/env python3
"""
Geometry OS - Full System Integration Demo

Demonstrates all phases working together:
1. Create agents with strategies
2. Form districts via clustering
3. Run negotiations
4. Apply foundry mutations
5. Show memory drift
6. Render final visualization

Usage:
    python3 scripts/run_geometry_os_demo.py --agents 10 --rounds 50 --output demo_output
"""

import argparse
import asyncio
import json
import logging
import random
import time
from pathlib import Path
from typing import Any, Dict, List, Tuple

import numpy as np

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(name)s: %(message)s"
)
logger = logging.getLogger("geometry_os_demo")

# =============================================================================
# System Imports
# =============================================================================

# Tectonic System (Phases 48-49)
from systems.tectonic import (
    TectonicAgent,
    TectonicNegotiator,
    TectonicPlate,
    StrategyProfile,
    StrategyType,
    DistrictHeatmap,
)
from systems.tectonic.district import DistrictFormer

# Foundry System (Phase 50)
from systems.foundry import (
    Forge,
    ForgeTarget,
    ForgeOperation,
)

# Memory Drift System (Phase 51)
from systems.memory_drift import (
    MemoryEntry,
    DriftEngine,
    CodeAnchor,
    SemanticAnchors,
    DriftVisualizer,
)


# =============================================================================
# Demo Configuration
# =============================================================================

class DemoConfig:
    """Configuration for the demo."""
    agents: int = 10
    rounds: int = 50
    output_dir: str = "demo_output"
    map_width: int = 256
    map_height: int = 256
    vector_dim: int = 64

    def __init__(self, agents: int = 10, rounds: int = 50, output: str = "demo_output"):
        self.agents = agents
        self.rounds = rounds
        self.output_dir = output


# =============================================================================
# Phase 1: Agent Creation
# =============================================================================

def create_agents(config: DemoConfig) -> Tuple[TectonicNegotiator, List[TectonicAgent]]:
    """
    Create agents with different strategies.

    Creates a diverse population of agents with:
    - Different strategy types (aggressive, conservative, etc.)
    - Random spatial budgets
    - Unique semantic vectors
    """
    print(f"\n[1] Creating {config.agents} Agents with Strategies...")

    # Create negotiator
    negotiator = TectonicNegotiator(
        semantic_weight=1.0,
        competing_weight=0.8,
        anchor_constant=0.1,
    )

    # Strategy distribution
    strategy_types = [
        StrategyType.AGGRESSIVE,
        StrategyType.CONSERVATIVE,
        StrategyType.DISTANCE_AWARE,
        StrategyType.ADAPTIVE,
        StrategyType.RANDOM,
    ]

    agents = []
    for i in range(config.agents):
        # Assign strategy (cycle through types)
        strategy_type = strategy_types[i % len(strategy_types)]
        strategy = StrategyProfile.get_preset(strategy_type)

        # Random budget between 50 and 200
        budget = random.uniform(50, 200)

        # Create agent
        agent = TectonicAgent(
            negotiator=negotiator,
            agent_id=f"agent_{i:03d}",
            spatial_budget=budget,
            strategy=strategy,
        )
        agents.append(agent)

        print(f"    Created {agent.agent_id}: strategy={strategy_type.value}, budget={budget:.1f}")

    print(f"    Total agents: {len(agents)}")
    return negotiator, agents


# =============================================================================
# Phase 2: District Formation
# =============================================================================

def form_districts(
    agents: List[TectonicAgent],
    config: DemoConfig
) -> List[TectonicPlate]:
    """
    Form neural districts by clustering agents based on semantic similarity.

    Uses the DistrictFormer to cluster agents with cosine similarity >= 0.75.
    """
    print("\n[2] Forming Neural Districts...")

    # Create district former with clustering threshold
    former = DistrictFormer(
        similarity_threshold=0.75,
        min_plate_size=1,
    )

    # Generate random semantic vectors for agents
    agent_data: Dict[str, Dict] = {}
    for agent in agents:
        # Create a random 64-dimensional vector
        # Agents with similar indices get similar vectors (for clustering demo)
        base_vector = np.random.randn(config.vector_dim).astype(np.float32)
        # Add some correlation based on agent index
        cluster_id = hash(agent.agent_id) % 5
        base_vector[:10] += cluster_id * 0.5

        agent_data[agent.agent_id] = {
            "vector": base_vector,
            "budget": agent.spatial_budget,
        }

    # Form districts
    plates = former.form_districts(agent_data)

    # Assign tiles to plates based on their centroids
    for plate in plates:
        # Generate some random tiles for this plate
        num_tiles = random.randint(5, 20)
        # Use centroid to bias tile positions
        center_x = int(np.mean([hash(aid) % config.map_width for aid in plate.agents]))
        center_y = int(np.mean([hash(aid) % config.map_height for aid in plate.agents]))

        for _ in range(num_tiles):
            x = (center_x + random.randint(-30, 30)) % config.map_width
            y = (center_y + random.randint(-30, 30)) % config.map_height
            plate.tiles.append((x, y))

    print(f"    Formed {len(plates)} districts:")
    for plate in plates:
        print(f"      - {plate.plate_id}: {len(plate.agents)} agents, "
              f"cohesion={plate.cohesion:.2f}, state={plate.state.value}")

    return plates


# =============================================================================
# Phase 3: Tectonic Negotiations
# =============================================================================

def run_negotiations(
    negotiator: TectonicNegotiator,
    agents: List[TectonicAgent],
    plates: List[TectonicPlate],
    config: DemoConfig
) -> Dict[str, Any]:
    """
    Run tectonic negotiations between agents.

    Simulates multiple rounds of:
    1. Agents submitting claims on tiles
    2. Counter-bids from competing agents
    3. Settlement via force calculation
    """
    print(f"\n[3] Running Tectonic Negotiations ({config.rounds} rounds)...")

    history = []
    total_claims = 0
    total_settlements = 0

    for round_num in range(config.rounds):
        # Each round, each active agent may submit a claim
        for agent in agents:
            if agent.get_budget_remaining() < 5:
                continue  # Skip agents with low budget

            # Pick a random tile
            tile = (
                random.randint(0, config.map_width - 1),
                random.randint(0, config.map_height - 1),
            )

            # Use strategy to calculate bid
            try:
                bid = agent.calculate_bid(tile, f"Round {round_num} claim")
                if bid > 0 and agent.can_afford(bid):
                    claim_id = agent.submit_claim(tile, f"Round {round_num}", bid)
                    total_claims += 1

                    # Some agents may counter-bid
                    for other in agents:
                        if other.agent_id == agent.agent_id:
                            continue
                        if other.should_counter_bid(bid) and other.can_afford(bid * 1.1):
                            counter_amount = other.strategy.calculate_counter_bid(bid)
                            other.counter_bid(claim_id, counter_amount)
            except ValueError:
                pass  # Budget exceeded

        # Settle all pending claims
        settlements = asyncio.run(negotiator.settle_all_pending())
        total_settlements += len(settlements)

        # Process settlements for each agent
        for settlement in settlements:
            for agent in agents:
                if settlement.claim.agent_id == agent.agent_id or settlement.winner == agent.agent_id:
                    agent.handle_settlement(settlement)

            history.append({
                "round": round_num,
                "tile": settlement.claim.tile,
                "winner": settlement.winner,
                "force": settlement.force,
            })

        if (round_num + 1) % 10 == 0:
            print(f"    Round {round_num + 1}/{config.rounds}: "
                  f"{len(settlements)} settlements")

    # Collect statistics
    stats = {
        "total_claims": total_claims,
        "total_settlements": total_settlements,
        "rounds": config.rounds,
        "agent_stats": [agent.get_statistics() for agent in agents],
        "negotiator_stats": negotiator.get_statistics(),
    }

    print(f"    Total claims submitted: {total_claims}")
    print(f"    Total settlements: {total_settlements}")

    # Find top agents by wins
    agent_wins = sorted(
        [(a.agent_id, len(a.won_claims)) for a in agents],
        key=lambda x: x[1],
        reverse=True
    )[:5]
    print(f"    Top agents by wins: {agent_wins}")

    return {"stats": stats, "history": history}


# =============================================================================
# Phase 4: Foundry Mutations
# =============================================================================

def apply_foundry_mutations(config: DemoConfig) -> Dict[str, Any]:
    """
    Apply foundry mutations to demonstrate self-modification capabilities.

    Shows:
    - Shader inspection
    - GeoASM mutation proposals
    - Safety validation
    """
    print("\n[4] Applying Foundry Mutations...")

    forge = Forge(project_root=str(Path(__file__).parent.parent))

    results = {
        "inspections": [],
        "mutations": [],
        "rollbacks": [],
    }

    # Find some WGSL shaders to inspect
    wgsl_files = list(Path(forge.project_root).rglob("*.wgsl"))[:5]

    print(f"    Found {len(wgsl_files)} WGSL files to inspect")

    for wgsl_file in wgsl_files:
        try:
            rel_path = str(wgsl_file.relative_to(forge.project_root))
            metrics = forge.assess(ForgeTarget.SHADER, rel_path)
            results["inspections"].append({
                "path": rel_path,
                "metrics": metrics,
            })
            print(f"    Inspected: {rel_path} ({metrics.get('lines', 0)} lines)")
        except Exception as e:
            print(f"    Failed to inspect {wgsl_file}: {e}")

    # Simulate a mutation proposal (without actually modifying files)
    demo_operation = ForgeOperation(
        target=ForgeTarget.SHADER,
        path="systems/visual_shell/wgsl/demo.wgsl",
        operation="create",
        patch="// Demo mutation from Geometry OS integration test\n",
        reason="Demo mutation for integration test",
    )

    # Check safety
    is_safe, reason = forge.safety.check_patch(demo_operation.target, demo_operation.patch)
    results["mutations"].append({
        "operation_id": demo_operation.operation_id,
        "target": demo_operation.target.value,
        "safe": is_safe,
        "reason": reason,
    })
    print(f"    Mutation safety check: safe={is_safe}, reason={reason}")

    return results


# =============================================================================
# Phase 5: Memory Drift
# =============================================================================

def run_memory_drift(
    plates: List[TectonicPlate],
    config: DemoConfig
) -> Tuple[DriftEngine, SemanticAnchors, List[MemoryEntry], List[CodeAnchor]]:
    """
    Run memory drift simulation.

    Creates KV-Cache entries that drift toward semantically similar code tiles.
    """
    print("\n[5] Running Memory Drift...")

    # Initialize drift engine
    engine = DriftEngine(
        drift_rate=0.1,
        decay_rate=0.5,
        bounds=(0, 0, config.map_width, config.map_height),
    )

    # Initialize semantic anchors
    anchors = SemanticAnchors(vector_dim=config.vector_dim)

    # Create code anchors based on plate positions
    for plate in plates:
        for tile in plate.tiles[:5]:  # Use first 5 tiles per plate
            # Create a code anchor with semantic vector similar to plate centroid
            anchors.add_anchor(
                tile=tile,
                code_content=f"# Code for {plate.plate_id}\n# Purpose: {plate.purpose}",
                semantic_vector=plate.centroid,
                metadata={"plate_id": plate.plate_id},
            )

    print(f"    Created {anchors.count} code anchors")

    # Create memory entries
    entries = []
    for i in range(20):
        # Random starting position
        initial_pos = (
            random.uniform(0, config.map_width),
            random.uniform(0, config.map_height),
        )

        # Random semantic vector
        vector = np.random.randn(config.vector_dim).astype(np.float32)

        # Create entry
        entry = engine.add_entry(
            key=f"memory_{i:03d}",
            value={"data": f"Memory entry {i}"},
            semantic_vector=vector,
            initial_position=initial_pos,
        )
        entries.append(entry)

    print(f"    Created {len(entries)} memory entries")

    # Run drift simulation
    code_tiles = [
        (anchor.tile, anchor.semantic_vector)
        for anchor in anchors.anchors.values()
    ]

    drift_rounds = 10
    for dr in range(drift_rounds):
        # Access some entries to update their last_access time
        for entry in random.sample(entries, min(5, len(entries))):
            engine.access_entry(entry.key)

        # Run batch drift
        new_positions = engine.batch_drift(code_tiles=code_tiles)
        print(f"    Drift round {dr + 1}: {len(new_positions)} entries moved")

    # Get statistics
    stats = engine.get_statistics()
    print(f"    Final stats: {stats['entry_count']} entries, "
          f"avg access count: {stats['avg_access_count']:.1f}")

    return engine, anchors, entries, list(anchors.anchors.values())


# =============================================================================
# Phase 6: Visualization
# =============================================================================

def render_visualizations(
    plates: List[TectonicPlate],
    entries: List[MemoryEntry],
    anchors: List[CodeAnchor],
    config: DemoConfig
) -> Dict[str, str]:
    """
    Render final visualizations.

    Creates:
    - districts.png: District heatmap showing plate territories
    - memory_drift.png: Memory positions and drift trails
    """
    print("\n[6] Rendering Final Visualization...")

    output_path = Path(config.output_dir)
    output_path.mkdir(parents=True, exist_ok=True)

    output_files = {}

    # Render district heatmap
    heatmap = DistrictHeatmap(width=config.map_width, height=config.map_height)
    districts_path = str(output_path / "districts.png")

    try:
        heatmap.render_to_png(plates, districts_path)
        output_files["districts"] = districts_path
        print(f"    Saved: {districts_path}")
    except ImportError:
        # PIL not available, save as numpy array
        frame = heatmap.render(plates)
        np_path = str(output_path / "districts.npy")
        np.save(np_path, frame)
        output_files["districts"] = np_path
        print(f"    Saved (numpy): {np_path}")

    # Render memory drift visualization
    visualizer = DriftVisualizer(
        width=config.map_width,
        height=config.map_height,
    )
    drift_path = str(output_path / "memory_drift.png")

    try:
        visualizer.render_to_png(
            entries=entries,
            anchors=anchors,
            path=drift_path,
            show_trails=True,
        )
        output_files["memory_drift"] = drift_path
        print(f"    Saved: {drift_path}")
    except ImportError:
        # PIL not available, save as numpy array
        image = visualizer.render(entries, anchors, show_trails=True)
        np_path = str(output_path / "memory_drift.npy")
        np.save(np_path, image)
        output_files["memory_drift"] = np_path
        print(f"    Saved (numpy): {np_path}")

    return output_files


# =============================================================================
# Main Entry Point
# =============================================================================

def main():
    parser = argparse.ArgumentParser(
        description="Geometry OS - Full System Integration Demo"
    )
    parser.add_argument(
        "--agents",
        type=int,
        default=10,
        help="Number of agents to create (default: 10)"
    )
    parser.add_argument(
        "--rounds",
        type=int,
        default=50,
        help="Number of negotiation rounds (default: 50)"
    )
    parser.add_argument(
        "--output",
        type=str,
        default="demo_output",
        help="Output directory for visualizations and stats (default: demo_output)"
    )
    args = parser.parse_args()

    # Create config
    config = DemoConfig(
        agents=args.agents,
        rounds=args.rounds,
        output=args.output,
    )

    print("=" * 60)
    print("GEOMETRY OS - FULL SYSTEM DEMO")
    print("=" * 60)
    print(f"Agents: {config.agents}")
    print(f"Rounds: {config.rounds}")
    print(f"Output: {config.output_dir}")
    print("=" * 60)

    start_time = time.time()

    # Phase 1: Create Agents
    negotiator, agents = create_agents(config)

    # Phase 2: Form Districts
    plates = form_districts(agents, config)

    # Phase 3: Run Negotiations
    negotiation_results = run_negotiations(negotiator, agents, plates, config)

    # Phase 4: Foundry Mutations
    foundry_results = apply_foundry_mutations(config)

    # Phase 5: Memory Drift
    engine, anchors, entries, anchor_list = run_memory_drift(plates, config)

    # Phase 6: Render Visualizations
    output_files = render_visualizations(plates, entries, anchor_list, config)

    # Save statistics and history
    output_path = Path(config.output_dir)
    output_path.mkdir(parents=True, exist_ok=True)

    stats = {
        "config": {
            "agents": config.agents,
            "rounds": config.rounds,
            "map_size": [config.map_width, config.map_height],
        },
        "negotiation": negotiation_results["stats"],
        "foundry": {
            "inspections": len(foundry_results["inspections"]),
            "mutations": len(foundry_results["mutations"]),
        },
        "memory_drift": engine.get_statistics(),
        "districts": {
            "count": len(plates),
            "plates": [plate.to_dict() for plate in plates],
        },
        "output_files": output_files,
        "elapsed_time": time.time() - start_time,
    }

    stats_path = output_path / "stats.json"
    with open(stats_path, "w") as f:
        json.dump(stats, f, indent=2, default=str)
    print(f"\n    Saved stats: {stats_path}")

    history_path = output_path / "history.json"
    with open(history_path, "w") as f:
        json.dump(negotiation_results["history"], f, indent=2)
    print(f"    Saved history: {history_path}")

    # Summary
    print("\n" + "=" * 60)
    print("DEMO COMPLETE")
    print("=" * 60)
    print(f"Elapsed time: {time.time() - start_time:.2f}s")
    print(f"Output directory: {config.output_dir}")
    print("\nGenerated files:")
    for name, path in output_files.items():
        print(f"  - {name}: {path}")
    print(f"  - stats: {stats_path}")
    print(f"  - history: {history_path}")
    print("=" * 60)

    return 0


if __name__ == "__main__":
    exit(main())
