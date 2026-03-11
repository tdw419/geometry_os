#!/usr/bin/env python3
"""
Live PixelBrain Demo - Real-time inference with LM Studio.

Demonstrates the full system with actual LLM decisions.
"""

import asyncio
import sys
import os
from pathlib import Path

# Add project to path
sys.path.insert(0, str(Path(__file__).parent.parent))

import numpy as np
from systems.tectonic import (
    TectonicAgent,
    TectonicNegotiator,
    DistrictFormer,
    DistrictHeatmap,
    StrategyProfile,
    StrategyType,
)
from systems.pixel_brain import PixelBrainBridge


async def run_live_demo():
    """Run live demo with LM Studio inference."""
    
    print("=" * 60)
    print("PIXELBRAIN LIVE DEMO - Real LLM Inference")
    print("=" * 60)
    
    # Check LM Studio availability
    print("\n[1] Checking LM Studio connection...")
    bridge = PixelBrainBridge()
    
    if not await bridge.health_check():
        print("    ❌ LM Studio not available on localhost:1234")
        print("    Start LM Studio and try again.")
        return 1
    print("    ✅ LM Studio connected")
    
    # Create negotiator and agents
    print("\n[2] Creating agents with LLM inference enabled...")
    negotiator = TectonicNegotiator()
    
    agents = []
    for i, strategy_type in enumerate([StrategyType.AGGRESSIVE, StrategyType.CONSERVATIVE]):
        agent = TectonicAgent(
            negotiator=negotiator,
            agent_id=f"agent_{i}_{strategy_type.value}",
            spatial_budget=100.0,
            strategy=StrategyProfile.get_preset(strategy_type),
            use_llm=True  # Enable live inference
        )
        agents.append(agent)
    print(f"    ✅ Created {len(agents)} agents with LLM inference")
    
    # Run live claim analysis
    print("\n[3] Running live claim analysis...")
    tile = (42, 17)
    purpose = "Build a Code Palace for neural projection optimization"
    
    for agent in agents:
        print(f"\n    Agent: {agent.agent_id[:20]}...")
        
        # Get LLM recommendation
        analysis = await bridge.analyze_claim(tile, purpose, agent.get_budget_remaining())
        recommended_bid = analysis.get("recommended_bid", 10.0)
        reasoning = analysis.get("reasoning", "No reasoning provided")
        
        print(f"    LLM recommends bid: {recommended_bid:.2f}")
        print(f"    Reasoning: {reasoning[:60]}...")
        
        # Submit claim
        bid = min(recommended_bid, agent.get_budget_remaining())
        claim_id = agent.submit_claim(tile, purpose, bid)
        print(f"    Submitted claim: {claim_id[:20]}...")
    
    # Settle negotiations
    print("\n[4] Settling negotiations...")
    results = []
    for claim_id in list(negotiator._pending_claims.keys()):
        settlement = negotiator.settle(claim_id)
        if settlement:
            results.append(settlement)
            print(f"    Winner: {settlement.winner[:20]}... (force: {settlement.force:.2f})")
    
    # Form districts
    print("\n[5] Forming neural districts...")
    former = DistrictFormer(similarity_threshold=0.75)
    
    agent_data = {}
    for agent in agents:
        # Create synthetic vector based on strategy
        if "aggressive" in agent.agent_id:
            vec = np.ones(64, dtype=np.float32) * 0.8
        else:
            vec = np.ones(64, dtype=np.float32) * 0.3
        agent_data[agent.agent_id] = {"vector": vec, "budget": agent.spatial_budget}
    
    plates = former.form_districts(agent_data)
    print(f"    ✅ Formed {len(plates)} districts")
    
    # Generate district names with LLM
    print("\n[6] Generating district names with LLM...")
    for plate in plates:
        name = await bridge.name_district(
            purposes=["Code Palace", "Neural Hub"],
            cohesion=plate.cohesion
        )
        plate.name = name
        print(f"    District: {name} (cohesion: {plate.cohesion:.2f})")
    
    # Render visualization
    print("\n[7] Rendering district heatmap...")
    heatmap = DistrictHeatmap(width=256, height=256)
    
    output_path = "live_demo_output"
    os.makedirs(output_path, exist_ok=True)
    
    heatmap.render_to_png(plates, f"{output_path}/districts_live.png")
    print(f"    ✅ Saved: {output_path}/districts_live.png")
    
    # Summary
    print("\n" + "=" * 60)
    print("LIVE DEMO COMPLETE")
    print("=" * 60)
    print(f"\nResults:")
    print(f"  - Agents created: {len(agents)}")
    print(f"  - Claims settled: {len(results)}")
    print(f"  - Districts formed: {len(plates)}")
    print(f"  - Output: {output_path}/")
    
    return 0


if __name__ == "__main__":
    exit(asyncio.run(run_live_demo()))
