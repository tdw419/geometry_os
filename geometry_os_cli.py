#!/usr/bin/env python3
"""
Geometry OS CLI - Command-line interface for PixelBrain system.

Usage:
    python3 geometry_os_cli.py [command] [options]

Commands:
    status          Show system status
    agents          List/manage agents
    districts       List/manage districts
    train           Run training rounds
    evolve          Run evolution cycle
    demo            Run full demo
    serve           Start servers
"""

import argparse
import asyncio
import json
import sys
from pathlib import Path
from datetime import datetime

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent))


def cmd_status(args):
    """Show system status."""
    print("=" * 60)
    print("GEOMETRY OS STATUS")
    print("=" * 60)
    
    # Check LM Studio
    import requests
    try:
        r = requests.get("http://localhost:1234/v1/models", timeout=2)
        models = [m["id"] for m in r.json().get("data", [])]
        print(f"\n✅ LM Studio: Connected ({len(models)} models)")
        print(f"   Primary: {models[0] if models else 'None'}")
    except:
        print("\n❌ LM Studio: Not connected")
    
    # Check test count
    import subprocess
    result = subprocess.run(
        ["pytest", "--collect-only", "-q", "tests/"],
        capture_output=True, text=True, cwd=Path(__file__).parent
    )
    if "test" in result.stdout:
        lines = result.stdout.strip().split("\n")
        test_count = lines[-1] if lines else "Unknown"
        print(f"✅ Tests: {test_count}")
    
    # Check systems
    systems_path = Path(__file__).parent / "systems"
    systems = [d.name for d in systems_path.iterdir() if d.is_dir() and not d.name.startswith("_")]
    print(f"✅ Systems: {len(systems)} modules")
    print(f"   {', '.join(sorted(systems)[:5])}...")
    
    print("\n" + "=" * 60)
    return 0


def cmd_agents(args):
    """List and manage agents."""
    from systems.tectonic import TectonicAgent, TectonicNegotiator, StrategyType
    
    print("=" * 60)
    print("TECTONIC AGENTS")
    print("=" * 60)
    
    negotiator = TectonicNegotiator()
    
    if args.create:
        # Create new agents
        count = args.create
        print(f"\nCreating {count} agents...")
        for i in range(count):
            strategy = list(StrategyType)[i % len(StrategyType)]
            agent = TectonicAgent(
                negotiator=negotiator,
                agent_id=f"agent_{i:03d}",
                spatial_budget=args.budget,
            )
            print(f"  Created: {agent.agent_id} (strategy: {strategy.value})")
        print(f"\n✅ Created {count} agents")
    else:
        # Show agent info
        print("\nUse --create N to create N agents")
        print("Use --budget B to set budget (default: 100)")
    
    print("\n" + "=" * 60)
    return 0


def cmd_districts(args):
    """List and manage districts."""
    from systems.tectonic import DistrictFormer
    import numpy as np
    
    print("=" * 60)
    print("NEURAL DISTRICTS")
    print("=" * 60)
    
    if args.form:
        # Create sample districts
        former = DistrictFormer(similarity_threshold=args.threshold)
        
        # Generate sample agents
        n = args.form
        agents = {}
        for i in range(n):
            vec = np.random.randn(64).astype(np.float32)
            vec = vec / np.linalg.norm(vec)  # Normalize
            agents[f"agent_{i:03d}"] = {
                "vector": vec,
                "budget": 100.0
            }
        
        plates = former.form_districts(agents)
        
        print(f"\nFormed {len(plates)} districts from {n} agents:")
        for plate in plates:
            print(f"\n  🏘️ {plate.plate_id}")
            print(f"     Agents: {len(plate.agents)}")
            print(f"     Cohesion: {plate.cohesion:.2f}")
            print(f"     State: {plate.state.value}")
            print(f"     Force: {plate.calculate_force():.1f}")
    else:
        print("\nUse --form N to form districts from N agents")
        print("Use --threshold T to set similarity threshold (default: 0.75)")
    
    print("\n" + "=" * 60)
    return 0


def cmd_train(args):
    """Run training rounds."""
    from systems.tectonic import SimulationArena, AgentConfig, StrategyType, StrategyLearner
    
    print("=" * 60)
    print("AGENT TRAINING")
    print("=" * 60)
    
    print(f"\nRunning {args.rounds} training rounds...")
    
    arena = SimulationArena(agent_configs=[
        AgentConfig("agg_1", 100.0, StrategyType.AGGRESSIVE),
        AgentConfig("agg_2", 100.0, StrategyType.AGGRESSIVE),
        AgentConfig("cons_1", 100.0, StrategyType.CONSERVATIVE),
        AgentConfig("cons_2", 100.0, StrategyType.CONSERVATIVE),
        AgentConfig("dist_1", 100.0, StrategyType.DISTANCE_AWARE),
    ])
    
    arena.run_rounds(count=args.rounds)
    stats = arena.get_statistics()
    
    print(f"\n✅ Completed {stats['rounds_completed']} rounds")
    print("\nWin rates:")
    for agent_id, wins in sorted(stats['win_rates'].items()):
        rate = wins / args.rounds * 100
        bar = "█" * int(rate / 5)
        print(f"  {agent_id}: {rate:5.1f}% {bar}")
    
    if args.learn:
        print("\nLearning strategy...")
        learner = StrategyLearner()
        learner.learn_from_arena(arena)
        profile = learner.derive_strategy()
        print(f"✅ Learned profile:")
        print(f"   base_bid_fraction: {profile.base_bid_fraction:.3f}")
        print(f"   aggression_level: {profile.aggression_level:.3f}")
        print(f"   distance_weight: {profile.distance_weight:.3f}")
    
    print("\n" + "=" * 60)
    return 0


def cmd_evolve(args):
    """Run evolution cycle."""
    from systems.evolution_daemon.tectonic_stage import TectonicStage, TectonicStageConfig
    
    print("=" * 60)
    print("STRATEGY EVOLUTION")
    print("=" * 60)
    
    config = TectonicStageConfig(
        rounds_per_cycle=args.rounds,
        mutation_rate=args.mutation_rate
    )
    stage = TectonicStage(config=config)
    
    print(f"\nRunning evolution cycle...")
    print(f"  Rounds: {config.rounds_per_cycle}")
    print(f"  Mutation rate: {config.mutation_rate}")
    
    result = stage.run_cycle()
    
    print(f"\n✅ Evolution complete:")
    print(f"   Win rate improved: {result.get('win_rate_improved', False)}")
    print(f"   Generations: {result.get('generations', 0)}")
    
    if 'best_fitness' in result:
        print(f"   Best fitness: {result['best_fitness']:.3f}")
    
    print("\n" + "=" * 60)
    return 0


def cmd_demo(args):
    """Run full demo."""
    print("=" * 60)
    print("RUNNING FULL DEMO")
    print("=" * 60)
    
    import subprocess
    demo_path = Path(__file__).parent / "scripts" / "run_geometry_os_demo.py"
    
    if demo_path.exists():
        cmd = ["python3", str(demo_path), "--agents", str(args.agents), "--rounds", str(args.rounds)]
        if args.output:
            cmd.extend(["--output", args.output])
        subprocess.run(cmd)
    else:
        print("Demo script not found")
        return 1
    
    return 0


def cmd_serve(args):
    """Start servers."""
    import subprocess
    
    print("=" * 60)
    print("STARTING SERVERS")
    print("=" * 60)
    
    servers = []
    
    if args.district:
        print("\nStarting district server on port 8773...")
        server_path = Path(__file__).parent / "systems" / "visual_shell" / "web" / "district_server.py"
        p = subprocess.Popen(["python3", str(server_path)])
        servers.append(("District", p))
    
    if args.tectonic:
        print("Starting tectonic server on port 8772...")
        server_path = Path(__file__).parent / "systems" / "visual_shell" / "web" / "tectonic_server.py"
        p = subprocess.Popen(["python3", str(server_path)])
        servers.append(("Tectonic", p))
    
    if servers:
        print(f"\n✅ Started {len(servers)} server(s)")
        print("Press Ctrl+C to stop")
        try:
            import time
            while True:
                time.sleep(1)
        except KeyboardInterrupt:
            print("\n\nStopping servers...")
            for name, p in servers:
                p.terminate()
            print("✅ Servers stopped")
    else:
        print("\nUse --district and/or --tectonic to start servers")
    
    return 0


def main():
    parser = argparse.ArgumentParser(
        description="Geometry OS CLI - Manage PixelBrain system",
        formatter_class=argparse.RawDescriptionHelpFormatter
    )
    subparsers = parser.add_subparsers(dest="command", help="Commands")
    
    # status
    p_status = subparsers.add_parser("status", help="Show system status")
    
    # agents
    p_agents = subparsers.add_parser("agents", help="List/manage agents")
    p_agents.add_argument("--create", type=int, help="Create N agents")
    p_agents.add_argument("--budget", type=float, default=100.0, help="Agent budget")
    
    # districts
    p_districts = subparsers.add_parser("districts", help="List/manage districts")
    p_districts.add_argument("--form", type=int, help="Form districts from N agents")
    p_districts.add_argument("--threshold", type=float, default=0.75, help="Similarity threshold")
    
    # train
    p_train = subparsers.add_parser("train", help="Run training rounds")
    p_train.add_argument("--rounds", type=int, default=100, help="Number of rounds")
    p_train.add_argument("--learn", action="store_true", help="Learn strategy after training")
    
    # evolve
    p_evolve = subparsers.add_parser("evolve", help="Run evolution cycle")
    p_evolve.add_argument("--rounds", type=int, default=100, help="Rounds per cycle")
    p_evolve.add_argument("--mutation-rate", type=float, default=0.1, help="Mutation rate")
    
    # demo
    p_demo = subparsers.add_parser("demo", help="Run full demo")
    p_demo.add_argument("--agents", type=int, default=10, help="Number of agents")
    p_demo.add_argument("--rounds", type=int, default=50, help="Number of rounds")
    p_demo.add_argument("--output", type=str, default="demo_output", help="Output directory")
    
    # serve
    p_serve = subparsers.add_parser("serve", help="Start servers")
    p_serve.add_argument("--district", action="store_true", help="Start district server")
    p_serve.add_argument("--tectonic", action="store_true", help="Start tectonic server")
    
    args = parser.parse_args()
    
    if args.command is None:
        parser.print_help()
        return 0
    
    commands = {
        "status": cmd_status,
        "agents": cmd_agents,
        "districts": cmd_districts,
        "train": cmd_train,
        "evolve": cmd_evolve,
        "demo": cmd_demo,
        "serve": cmd_serve,
    }
    
    return commands[args.command](args)


if __name__ == "__main__":
    sys.exit(main())
