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
import logging
import os
import sys
from pathlib import Path

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent))

# Setup error handling
from core.exceptions import (
    GeometryOSError,
    handle_errors,
    error_context,
    LMStudioError,
    NeuralInferenceError,
    NetworkError,
)
from core.error_handler import (
    setup_global_error_handler,
    CircuitBreaker,
    error_boundary,
)

# Initialize global error handler
_error_handler = setup_global_error_handler(enable_reporting=False)

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(message)s',
)
logger = logging.getLogger("geometry_os_cli")


def cmd_status(args):
    """Show system status."""
    print("=" * 60)
    print("GEOMETRY OS STATUS")
    print("=" * 60)
    
    # Check LM Studio with proper error handling
    try:
        import requests
        from core.error_handler import CircuitBreaker
        
        # Use circuit breaker for external service
        cb = CircuitBreaker.get("lm_studio") or CircuitBreaker("lm_studio", failure_threshold=3)
        
        with error_boundary("cli", "check_lm_studio", reraise=False):
            if not cb.is_open:
                r = requests.get("http://localhost:1234/v1/models", timeout=2)
                r.raise_for_status()
                models = [m["id"] for m in r.json().get("data", [])]
                print(f"\n✅ LM Studio: Connected ({len(models)} models)")
                print(f"   Primary: {models[0] if models else 'None'}")
            else:
                print("\n⚠️  LM Studio: Circuit breaker open (service unavailable)")
    except ImportError:
        print("\n⚠️  Requests library not available")
    except Exception as e:
        logger.debug(f"LM Studio check failed: {e}")
        print("\n❌ LM Studio: Not connected")
        print(f"   Hint: Ensure LM Studio is running on localhost:1234")
    
    # Check test count with error handling
    try:
        import subprocess
        result = subprocess.run(
            ["pytest", "--collect-only", "-q", "tests/"],
            capture_output=True, text=True, cwd=Path(__file__).parent,
            timeout=30  # Add timeout to prevent hanging
        )
        if "test" in result.stdout:
            lines = result.stdout.strip().split("\n")
            test_count = lines[-1] if lines else "Unknown"
            print(f"✅ Tests: {test_count}")
        else:
            print("⚠️  Tests: Could not collect tests")
    except subprocess.TimeoutExpired:
        print("⚠️  Tests: Collection timed out")
    except FileNotFoundError:
        print("⚠️  Tests: pytest not found")
    except Exception as e:
        logger.debug(f"Test collection failed: {e}")
        print("⚠️  Tests: Collection failed")
    
    # Check systems with error handling
    try:
        systems_path = Path(__file__).parent / "systems"
        if systems_path.exists():
            systems = [d.name for d in systems_path.iterdir() if d.is_dir() and not d.name.startswith("_")]
            print(f"✅ Systems: {len(systems)} modules")
            print(f"   {', '.join(sorted(systems)[:5])}...")
        else:
            print("⚠️  Systems: Directory not found")
    except Exception as e:
        logger.debug(f"Systems check failed: {e}")
        print("⚠️  Systems: Check failed")
    
    print("\n" + "=" * 60)
    return 0


@handle_errors(recoverable=True, default_return=1)
def cmd_agents(args):
    """List and manage agents."""
    from systems.tectonic import TectonicAgent, TectonicNegotiator, StrategyType
    from core.exceptions import AgentSpawnError
    
    print("=" * 60)
    print("TECTONIC AGENTS")
    print("=" * 60)
    
    try:
        negotiator = TectonicNegotiator()
    except Exception as e:
        logger.error(f"Failed to create negotiator: {e}")
        print("\n❌ Failed to initialize tectonic system")
        return 1
    
    if args.create:
        # Create new agents with error handling
        count = args.create
        print(f"\nCreating {count} agents...")
        created = 0
        
        for i in range(count):
            try:
                strategy = list(StrategyType)[i % len(StrategyType)]
                with error_boundary("tectonic", f"spawn_agent_{i}", reraise=False):
                    agent = TectonicAgent(
                        negotiator=negotiator,
                        agent_id=f"agent_{i:03d}",
                        spatial_budget=args.budget,
                    )
                    print(f"  Created: {agent.agent_id} (strategy: {strategy.value})")
                    created += 1
            except Exception as e:
                logger.warning(f"Failed to create agent {i}: {e}")
                print(f"  ⚠️  Failed to create agent_{i:03d}")
        
        if created == count:
            print(f"\n✅ Created {created} agents")
        else:
            print(f"\n⚠️  Created {created}/{count} agents (some failed)")
    else:
        # Show agent info
        print("\nUse --create N to create N agents")
        print("Use --budget B to set budget (default: 100)")
    
    print("\n" + "=" * 60)
    return 0


@handle_errors(recoverable=True, default_return=1)
def cmd_districts(args):
    """List and manage districts."""
    from systems.tectonic import DistrictFormer
    import numpy as np
    from core.exceptions import ValidationError
    
    print("=" * 60)
    print("NEURAL DISTRICTS")
    print("=" * 60)
    
    if args.form:
        # Create sample districts with error handling
        try:
            former = DistrictFormer(similarity_threshold=args.threshold)
        except Exception as e:
            logger.error(f"Failed to create district former: {e}")
            print("\n❌ Failed to initialize district system")
            return 1
        
        # Generate sample agents
        n = args.form
        agents = {}
        
        for i in range(n):
            try:
                vec = np.random.randn(64).astype(np.float32)
                vec = vec / np.linalg.norm(vec)  # Normalize
                agents[f"agent_{i:03d}"] = {
                    "vector": vec,
                    "budget": 100.0
                }
            except Exception as e:
                logger.warning(f"Failed to generate agent {i}: {e}")
                continue
        
        if not agents:
            print("\n❌ No agents generated")
            return 1
        
        # Form districts with error handling
        try:
            plates = former.form_districts(agents)
        except Exception as e:
            logger.error(f"Failed to form districts: {e}")
            print(f"\n❌ District formation failed: {e}")
            return 1
        
        print(f"\nFormed {len(plates)} districts from {n} agents:")
        for plate in plates:
            try:
                print(f"\n  🏘️ {plate.plate_id}")
                print(f"     Agents: {len(plate.agents)}")
                print(f"     Cohesion: {plate.cohesion:.2f}")
                print(f"     State: {plate.state.value}")
                print(f"     Force: {plate.calculate_force():.1f}")
            except Exception as e:
                logger.warning(f"Failed to display plate info: {e}")
                print(f"\n  ⚠️  {plate.plate_id} (display error)")
    else:
        print("\nUse --form N to form districts from N agents")
        print("Use --threshold T to set similarity threshold (default: 0075)")
    
    print("\n" + "=" * 60)
    return 0


@handle_errors(recoverable=True, default_return=1)
def cmd_train(args):
    """Run training rounds."""
    from systems.tectonic import SimulationArena, AgentConfig, StrategyType, StrategyLearner
    
    print("=" * 60)
    print("AGENT TRAINING")
    print("=" * 60)
    
    print(f"\nRunning {args.rounds} training rounds...")
    
    try:
        arena = SimulationArena(agent_configs=[
            AgentConfig("agg_1", 100.0, StrategyType.AGGRESSIVE),
            AgentConfig("agg_2", 100.0, StrategyType.AGGRESSIVE),
            AgentConfig("cons_1", 100.0, StrategyType.CONSERVATIVE),
            AgentConfig("cons_2", 100.0, StrategyType.CONSERVATIVE),
            AgentConfig("dist_1", 100.0, StrategyType.DISTANCE_AWARE),
        ])
    except Exception as e:
        logger.error(f"Failed to create arena: {e}")
        print("\n❌ Failed to initialize training arena")
        return 1
    
    try:
        arena.run_rounds(count=args.rounds)
    except Exception as e:
        logger.error(f"Training failed: {e}")
        print(f"\n❌ Training failed: {e}")
        return 1
    
    try:
        stats = arena.get_statistics()
    except Exception as e:
        logger.warning(f"Failed to get statistics: {e}")
        stats = {"rounds_completed": args.rounds, "win_rates": {}}
    
    print(f"\n✅ Completed {stats.get('rounds_completed', args.rounds)} rounds")
    
    if stats.get('win_rates'):
        print("\nWin rates:")
        for agent_id, wins in sorted(stats['win_rates'].items()):
            rate = wins / args.rounds * 100
            bar = "█" * int(rate / 5)
            print(f"  {agent_id}: {rate:5.1f}% {bar}")
    
    if args.learn:
        print("\nLearning strategy...")
        try:
            learner = StrategyLearner()
            learner.learn_from_arena(arena)
            profile = learner.derive_strategy()
            print(f"✅ Learned profile:")
            print(f"   base_bid_fraction: {profile.base_bid_fraction:.3f}")
            print(f"   aggression_level: {profile.aggression_level:.3f}")
            print(f"   distance_weight: {profile.distance_weight:.3f}")
        except Exception as e:
            logger.error(f"Strategy learning failed: {e}")
            print(f"\n⚠️  Strategy learning failed: {e}")
    
    print("\n" + "=" * 60)
    return 0


@handle_errors(recoverable=True, default_return=1)
def cmd_evolve(args):
    """Run evolution cycle."""
    from systems.evolution_daemon.tectonic_stage import TectonicStage, TectonicStageConfig
    from core.exceptions import EvolutionError
    
    print("=" * 60)
    print("STRATEGY EVOLUTION")
    print("=" * 60)
    
    try:
        config = TectonicStageConfig(
            rounds_per_cycle=args.rounds,
            mutation_rate=args.mutation_rate
        )
        stage = TectonicStage(config=config)
    except Exception as e:
        logger.error(f"Failed to initialize evolution stage: {e}")
        print(f"\n❌ Failed to initialize evolution system: {e}")
        return 1
    
    print(f"\nRunning evolution cycle...")
    print(f"  Rounds: {config.rounds_per_cycle}")
    print(f"  Mutation rate: {config.mutation_rate}")
    
    try:
        result = stage.run_cycle()
    except Exception as e:
        logger.error(f"Evolution cycle failed: {e}")
        print(f"\n❌ Evolution cycle failed: {e}")
        return 1
    
    print(f"\n✅ Evolution complete:")
    print(f"   Win rate improved: {result.get('win_rate_improved', 'Unknown')}")
    print(f"   Generations: {result.get('generations', 0)}")
    
    if 'best_fitness' in result:
        print(f"   Best fitness: {result['best_fitness']:.3f}")
    
    if 'error' in result:
        print(f"   ⚠️  Warning: {result['error']}")
    
    print("\n" + "=" * 60)
    return 0


@handle_errors(recoverable=True, default_return=1)
def cmd_demo(args):
    """Run full demo."""
    print("=" * 60)
    print("RUNNING FULL DEMO")
    print("=" * 60)
    
    import subprocess
    
    demo_path = Path(__file__).parent / "scripts" / "run_geometry_os_demo.py"
    
    if not demo_path.exists():
        print("\n❌ Demo script not found")
        print(f"   Expected: {demo_path}")
        return 1
    
    cmd = ["python3", str(demo_path), "--agents", str(args.agents), "--rounds", str(args.rounds)]
    if args.output:
        cmd.extend(["--output", args.output])
    
    try:
        result = subprocess.run(cmd, timeout=300)  # 5 minute timeout
        if result.returncode != 0:
            print(f"\n⚠️  Demo exited with code {result.returncode}")
            return result.returncode
    except subprocess.TimeoutExpired:
        print("\n❌ Demo timed out after 5 minutes")
        return 1
    except Exception as e:
        logger.error(f"Demo execution failed: {e}")
        print(f"\n❌ Demo failed: {e}")
        return 1
    
    return 0


@handle_errors(recoverable=True, default_return=1)
def cmd_serve(args):
    """Start servers."""
    import subprocess
    import signal
    
    print("=" * 60)
    print("STARTING SERVERS")
    print("=" * 60)
    
    servers = []
    
    if args.district:
        print("\nStarting district server on port 8773...")
        server_path = Path(__file__).parent / "systems" / "visual_shell" / "web" / "district_server.py"
        
        if not server_path.exists():
            print(f"  ❌ Server script not found: {server_path}")
        else:
            try:
                p = subprocess.Popen(["python3", str(server_path)])
                servers.append(("District", p))
                print("  ✅ District server started")
            except Exception as e:
                logger.error(f"Failed to start district server: {e}")
                print(f"  ❌ Failed to start district server: {e}")
    
    if args.tectonic:
        print("Starting tectonic server on port 8772...")
        server_path = Path(__file__).parent / "systems" / "visual_shell" / "web" / "tectonic_server.py"
        
        if not server_path.exists():
            print(f"  ❌ Server script not found: {server_path}")
        else:
            try:
                p = subprocess.Popen(["python3", str(server_path)])
                servers.append(("Tectonic", p))
                print("  ✅ Tectonic server started")
            except Exception as e:
                logger.error(f"Failed to start tectonic server: {e}")
                print(f"  ❌ Failed to start tectonic server: {e}")
    
    if servers:
        print(f"\n✅ Started {len(servers)} server(s)")
        print("Press Ctrl+C to stop")
        
        try:
            import time
            while True:
                time.sleep(1)
                # Check if any servers have died
                for name, p in servers:
                    if p.poll() is not None:
                        print(f"\n⚠️  {name} server exited with code {p.returncode}")
        except KeyboardInterrupt:
            print("\n\nStopping servers...")
            stopped = 0
            for name, p in servers:
                try:
                    p.terminate()
                    p.wait(timeout=5)
                    stopped += 1
                except subprocess.TimeoutExpired:
                    p.kill()
                    stopped += 1
                except Exception as e:
                    logger.warning(f"Error stopping {name} server: {e}")
            
            print(f"✅ Stopped {stopped}/{len(servers)} servers")
    else:
        print("\n⚠️  No servers started")
        print("Use --district and/or --tectonic to start servers")
    
    return 0


@handle_errors(recoverable=True, default_return=1)
def cmd_shell(args):
    """Start Geometry OS Shell (G-Shell)."""
    print("=" * 60)
    print("GEOMETRY OS SHELL")
    print("=" * 60)
    
    import subprocess
    from pathlib import Path
    
    if args.native:
        shell_path = Path(__file__).parent / "systems" / "visual_shell" / "native_geos_terminal.py"
        mode = "Native (RGBA/Hilbert)"
    else:
        shell_path = Path(__file__).parent / "systems" / "visual_shell" / "geos_terminal.py"
        mode = "Hybrid (ASCII/GNB)"
    
    if not shell_path.exists():
        print(f"\n❌ {mode} Shell script not found")
        print(f"   Expected: {shell_path}")
        return 1
    
    print(f"\nLaunching G-Shell ({mode})...")
    if args.native:
        print("AI Context: Image-Native (.rts.png)")
    else:
        print("AI Context: .geometry/gnb_state.ascii")
    print("-" * 60)
    
    try:
        os.execvpe("python3", ["python3", str(shell_path)], os.environ)
    except Exception as e:
        logger.error(f"Failed to launch G-Shell: {e}")
        print(f"\n❌ G-Shell failed: {e}")
        return 1
    
    return 0


def main():
    """Main entry point with comprehensive error handling."""
    parser = argparse.ArgumentParser(
        description="Geometry OS CLI - Manage PixelBrain system",
        formatter_class=argparse.RawDescriptionHelpFormatter
    )
    subparsers = parser.add_subparsers(dest="command", help="Commands")
    
    # status
    subparsers.add_parser("status", help="Show system status")

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
    
    # shell
    p_shell = subparsers.add_parser("shell", help="Start Geometry OS Shell")
    p_shell.add_argument("--native", action="store_true", help="Launch v2 Native Shell (RGBA/Hilbert)")
    
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
        "shell": cmd_shell,
    }
    
    # Execute command with global error handling
    try:
        with error_boundary("cli", args.command, reraise=False):
            return commands[args.command](args)
    except GeometryOSError as e:
        logger.error(f"Command failed: {e}")
        print(f"\n❌ Error: {e.message}")
        if e.recovery_hint:
            print(f"   Hint: {e.recovery_hint}")
        return 1
    except KeyboardInterrupt:
        print("\n\n⚠️  Interrupted by user")
        return 130
    except Exception as e:
        logger.exception(f"Unexpected error in {args.command}")
        print(f"\n❌ Unexpected error: {e}")
        print("   Please check logs for details")
        return 1


if __name__ == "__main__":
    sys.exit(main())
