#!/usr/bin/env python3
"""
Wave-Logic Unit Evolution Loop - Simplified

Autonomously evolves wave parameters to find stable logic gates.
"""

import random
import math
from datetime import datetime
from pathlib import Path

RESULTS_FILE = Path(__file__).parent / "wave_logic_results.tsv"

# Best known configuration
best = {
    'osc_a': (64, 128),
    'osc_b': (192, 128),
    'sensor': (128, 128),
    'freq_a': 1.0,
    'freq_b': 1.0,
    'phase_a': 0.0,
    'phase_b': 0.0,
    'damping': 0.995,
    'wave_speed': 0.1,
    'stability': 0.0,
}

def log_result(stability, desc):
    ts = datetime.now().isoformat()
    with open(RESULTS_FILE, 'a') as f:
        f.write(f"{ts}\t{stability:.4f}\t{best['osc_a']}\t{best['osc_b']}\t"
                f"{best['sensor']}\t{best['freq_a']:.2f}\t{best['freq_b']:.2f}\t"
                f"{best['phase_a']:.2f}\t{best['phase_b']:.2f}\t"
                f"{best['damping']}\t{best['wave_speed']}\t{desc}\n")
    print(f"  [{ts}] stability={stability:.4f} {desc}")

def simulate():
    """Simulate wave stability based on config."""
    osc_a = best['osc_a']
    osc_b = best['osc_b']
    sensor = best['sensor']

    # Distance factors
    dist_a = math.sqrt((osc_a[0] - sensor[0])**2 + (osc_a[1] - sensor[1])**2)
    dist_b = math.sqrt((osc_b[0] - sensor[0])**2 + (osc_b[1] - sensor[1])**2)

    # Phase alignment (0 = perfect, pi = worst)
    phase_score = 1.0 - abs(best['phase_a'] - best['phase_b']) / math.pi

    # Frequency match (1.0 = perfect)
    freq_score = 1.0 - abs(1.0 - best['freq_a'] / best['freq_b'])

    # Damping optimal near 0.99
    damp_score = 1.0 - abs(best['damping'] - 0.99) * 50

    # Combined stability
    stability = (
        (1.0 / (1.0 + dist_a / 128)) * 0.25 +
        (1.0 / (1.0 + dist_b / 128)) * 0.25 +
        phase_score * 0.2 +
        freq_score * 0.1 +
        damp_score * 0.1 +
        random.uniform(0, 0.05)  # Small noise
    )
    return min(1.0, max(0.0, stability))

def mutate():
    """Mutate one parameter."""
    param = random.choice(['osc_a', 'osc_b', 'sensor', 'freq_a', 'freq_b', 'phase_a', 'phase_b', 'damping', 'wave_speed'])

    if param == 'osc_a':
        best['osc_a'] = (random.randint(32, 224), random.randint(32, 224))
    elif param == 'osc_b':
        best['osc_b'] = (random.randint(32, 224), random.randint(32, 224))
    elif param == 'sensor':
        best['sensor'] = (random.randint(32, 224), random.randint(32, 224))
    elif param == 'freq_a':
        best['freq_a'] = random.uniform(0.5, 2.0)
    elif param == 'freq_b':
        best['freq_b'] = random.uniform(0.5, 2.0)
    elif param == 'phase_a':
        best['phase_a'] = random.uniform(0, 2 * math.pi)
    elif param == 'phase_b':
        best['phase_b'] = random.uniform(0, 2 * math.pi)
    elif param == 'damping':
        best['damping'] = random.uniform(0.98, 0.999)
    elif param == 'wave_speed':
        best['wave_speed'] = random.uniform(0.05, 0.2)

    return param

def main():
    print("=" * 60)
    print("WAVE-LOGIC UNIT EVOLUTION")
    print("=" * 60)
    print(f"Started: {datetime.now().isoformat()}")
    print(f"Results: {RESULTS_FILE}")
    print()

    # Initialize results file
    with open(RESULTS_FILE, 'w') as f:
        f.write("timestamp\tstability\tosc_a\tosc_b\tsensor\tfreq_a\tfreq_b\tphase_a\tphase_b\tdamping\twave_speed\tdescription\n")

    # Baseline
    stability = simulate()
    log_result(stability, "baseline")
    print(f"Baseline: {stability:.4f}")

    # Evolution loop
    iteration = 0
    no_improve = 0

    print("\nStarting evolution (Ctrl+C to stop)...\n")

    try:
        while True:
            iteration += 1

            # Mutate
            param = mutate()

            # Evaluate
            new_stability = simulate()

            # Decide
            if new_stability > best['stability']:
                best['stability'] = new_stability
                desc = f"IMPROVED: {param}"
                log_result(new_stability, desc)
                print(f"  [{iteration}] IMPROVEMENT! {param} -> {new_stability:.4f}")
                no_improve = 0
            else:
                no_improve += 1

            # Progress every 20 iterations
            if iteration % 20 == 0:
                print(f"  [{iteration}] best={best['stability']:.4f} (no improve for {no_improve})")

            pass

    except KeyboardInterrupt:
        print("\nStopped!")

    # Final summary
    print("\n" + "=" * 60)
    print("FINAL RESULTS")
    print("=" * 60)
    print(f"Iterations: {iteration}")
    print(f"Best stability: {best['stability']:.4f}")
    print(f"Best config: {best}")
    print(f"\nResults: {RESULTS_FILE}")

if __name__ == "__main__":
    main()
