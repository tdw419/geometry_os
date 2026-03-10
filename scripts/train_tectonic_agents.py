#!/usr/bin/env python3
"""
CLI tool for training tectonic agent strategies.

Task 5.1 of Tectonic Realignment Plan.

Runs simulation rounds with various agent strategies and learns
optimal bidding parameters from the results.
"""

import argparse
import logging
import sys
from pathlib import Path

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent))

from systems.tectonic.strategy import StrategyType
from systems.tectonic.arena import SimulationArena, AgentConfig
from systems.tectonic.learner import StrategyLearner


def setup_logging(verbose: bool) -> None:
    """Configure logging based on verbosity level."""
    if verbose:
        logging.basicConfig(
            level=logging.DEBUG,
            format="%(name)s: %(message)s",
        )
    else:
        # Suppress module-level logging in non-verbose mode
        logging.basicConfig(
            level=logging.WARNING,
            format="%(message)s",
        )
        # Only show errors from tectonic modules
        logging.getLogger("tectonic").setLevel(logging.ERROR)


def create_arena() -> SimulationArena:
    """
    Create a simulation arena with 8 diverse agents.

    Agent distribution:
    - 2 random
    - 2 aggressive
    - 2 conservative
    - 1 distance_aware
    - 1 adaptive

    Returns:
        Configured SimulationArena
    """
    arena = SimulationArena()

    # Add 2 random agents
    arena.add_agent(AgentConfig(
        agent_id="random_1",
        budget=100.0,
        strategy_type=StrategyType.RANDOM,
    ))
    arena.add_agent(AgentConfig(
        agent_id="random_2",
        budget=100.0,
        strategy_type=StrategyType.RANDOM,
    ))

    # Add 2 aggressive agents
    arena.add_agent(AgentConfig(
        agent_id="aggressive_1",
        budget=100.0,
        strategy_type=StrategyType.AGGRESSIVE,
    ))
    arena.add_agent(AgentConfig(
        agent_id="aggressive_2",
        budget=100.0,
        strategy_type=StrategyType.AGGRESSIVE,
    ))

    # Add 2 conservative agents
    arena.add_agent(AgentConfig(
        agent_id="conservative_1",
        budget=100.0,
        strategy_type=StrategyType.CONSERVATIVE,
    ))
    arena.add_agent(AgentConfig(
        agent_id="conservative_2",
        budget=100.0,
        strategy_type=StrategyType.CONSERVATIVE,
    ))

    # Add 1 distance-aware agent
    arena.add_agent(AgentConfig(
        agent_id="distance_aware_1",
        budget=100.0,
        strategy_type=StrategyType.DISTANCE_AWARE,
    ))

    # Add 1 adaptive agent
    arena.add_agent(AgentConfig(
        agent_id="adaptive_1",
        budget=100.0,
        strategy_type=StrategyType.ADAPTIVE,
    ))

    return arena


def display_win_rates(arena: SimulationArena) -> None:
    """Display win rates sorted by number of wins."""
    stats = arena.get_statistics()
    win_counts = stats["win_counts"]
    total_rounds = stats["rounds_completed"]

    # Sort by wins (descending)
    sorted_agents = sorted(
        win_counts.items(),
        key=lambda x: x[1],
        reverse=True
    )

    for agent_id, wins in sorted_agents:
        win_rate = (wins / total_rounds * 100) if total_rounds > 0 else 0.0
        print(f"   - {agent_id}: {wins} wins ({win_rate:.1f}%)")


def display_learned_params(profile) -> None:
    """Display learned strategy parameters."""
    params = profile.to_dict()
    for param_name, value in params.items():
        if isinstance(value, float):
            print(f"   - {param_name}: {value:.4f}")
        else:
            print(f"   - {param_name}: {value}")


def main() -> int:
    """Main entry point for the training CLI."""
    parser = argparse.ArgumentParser(
        description="Train tectonic agent strategies through simulation"
    )
    parser.add_argument(
        "--rounds", "-r",
        type=int,
        default=1000,
        help="Number of simulation rounds (default: 1000)"
    )
    parser.add_argument(
        "--output", "-o",
        type=str,
        default="learned_strategy.json",
        help="Output file for learned strategy (default: learned_strategy.json)"
    )
    parser.add_argument(
        "--verbose", "-v",
        action="store_true",
        help="Enable verbose logging"
    )

    args = parser.parse_args()
    setup_logging(args.verbose)

    try:
        # Step 1: Create Simulation Arena
        print("=" * 60)
        print("[1] Creating Simulation Arena...")
        print("=" * 60)
        arena = create_arena()
        print("   - 8 agents: 2 random, 2 aggressive, 2 conservative, 1 distance_aware, 1 adaptive")
        print("   - All with 100.0 budget")
        print()

        # Step 2: Run simulation rounds
        print("=" * 60)
        print(f"[2] Running {args.rounds} simulation rounds...")
        print("=" * 60)
        arena.run_rounds(count=args.rounds)
        print()

        # Step 3: Display simulation results
        print("=" * 60)
        print("[3] Simulation Results:")
        print("=" * 60)
        stats = arena.get_statistics()
        print(f"   - Rounds completed: {stats['rounds_completed']}")
        print("   - Win rates by agent (sorted by wins):")
        display_win_rates(arena)
        print()

        # Step 4: Learn optimal strategy
        print("=" * 60)
        print("[4] Learning optimal strategy...")
        print("=" * 60)
        learner = StrategyLearner()
        learner.learn_from_arena(arena)
        learned_profile = learner.derive_strategy()
        print("   - Learned parameters:")
        display_learned_params(learned_profile)
        print()

        # Step 5: Save learned strategy
        print("=" * 60)
        print("[5] Saving learned strategy...")
        print("=" * 60)
        learner.save_profile(learned_profile, args.output)
        print(f"   Saved learned strategy to: {args.output}")
        print()

        return 0

    except KeyboardInterrupt:
        print("\nInterrupted by user")
        return 1
    except Exception as e:
        logging.error(f"Error during training: {e}")
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1


if __name__ == "__main__":
    sys.exit(main())
