#!/usr/bin/env python3
"""
Pixel-Native vs Traditional Syscall Performance Benchmark
Measures execution time overhead for syscall dispatch paths.

Usage:
    python3 scripts/benchmark_pixel_native.py --help
"""

import argparse
import json
import os
import subprocess
import sys
import time
from pathlib import Path
from datetime import datetime

# Set TMPDIR for builds
os.environ['TMPDIR'] = str(Path.cwd() / '.tmp')
Path('.tmp').mkdir(exist_ok=True)


def run_workload_benchmark(workload: str, mode: str) -> dict:
    """Run a workload in hypervisor and measure performance."""
    # Build first to ensure fresh measurement
    subprocess.run(['cargo', 'build', '--release'], capture_output=True, timeout=120)

    cmd = [
        'cargo', 'run', '--release', '--quiet',
        '--example', 'boot_with_traces',
        '--', '--workload', workload
    ]

    if mode == 'traditional':
        cmd.extend(['--disable-pixel-native'])

    print(f"Running: {' '.join(cmd)}", file=sys.stderr)
    start = time.time()
    result = subprocess.run(cmd, capture_output=True, text=True, timeout=30)
    elapsed = time.time() - start

    if result.returncode != 0:
        print(f"Workload failed: {workload} (mode: {mode})", file=sys.stderr)
        print(result.stderr, file=sys.stderr)
        return {'error': result.stderr}

    return {
        'time_s': elapsed,
        'output_length': len(result.stdout)
    }


def compare_modes(workload: str, iterations: int = 10) -> dict:
    """Compare traditional vs pixel-native execution."""
    print(f"\n{'='*60}", file=sys.stderr)
    print(f"Workload: {workload}", file=sys.stderr)
    print(f"Iterations: {iterations}", file=sys.stderr)
    print(f"{'='*60}", file=sys.stderr)

    traditional_times = []
    pixel_native_times = []

    for i in range(iterations):
        print(f"  Iteration {i+1}/{iterations}...", file=sys.stderr)

        # Traditional mode
        trad = run_workload_benchmark(workload, 'traditional')
        if 'error' not in trad:
            traditional_times.append(trad['time_s'])

        # Pixel-native mode
        pixel = run_workload_benchmark(workload, 'pixel_native')
        if 'error' not in pixel:
            pixel_native_times.append(pixel['time_s'])

    if not traditional_times or not pixel_native_times:
        print(f"  ERROR: Failed to collect timing data", file=sys.stderr)
        return {'error': 'Failed to collect timing data'}

    avg_traditional = sum(traditional_times) / len(traditional_times)
    avg_pixel = sum(pixel_native_times) / len(pixel_native_times)
    speedup = avg_traditional / avg_pixel if avg_pixel > 0 else 0
    improvement_pct = ((avg_traditional - avg_pixel) / avg_traditional * 100) if avg_traditional > 0 else 0

    return {
        'workload': workload,
        'iterations': iterations,
        'traditional_avg_s': avg_traditional,
        'traditional_min_s': min(traditional_times),
        'traditional_max_s': max(traditional_times),
        'pixel_native_avg_s': avg_pixel,
        'pixel_native_min_s': min(pixel_native_times),
        'pixel_native_max_s': max(pixel_native_times),
        'speedup': speedup,
        'improvement_pct': improvement_pct
    }


def main():
    parser = argparse.ArgumentParser(
        description='Benchmark pixel-native vs traditional syscall performance'
    )
    parser.add_argument('--workloads', nargs='+', default=['echo TEST', 'fork_test'],
                        help='Workloads to test')
    parser.add_argument('--iterations', type=int, default=3,
                        help='Iterations per workload')
    parser.add_argument('--output', type=str, help='Save results to JSON file')
    parser.add_argument('--quick', action='store_true', help='Quick mode (1 iteration)')

    args = parser.parse_args()

    iterations = 1 if args.quick else args.iterations

    results = []
    for workload in args.workloads:
        result = compare_modes(workload, iterations)
        results.append(result)

        if 'error' not in result:
            print(f"\nResults:", file=sys.stderr)
            print(f"  Traditional:", file=sys.stderr)
            print(f"    Avg: {result['traditional_avg_s']:.6f}s", file=sys.stderr)
            print(f"    Min: {result['traditional_min_s']:.6f}s", file=sys.stderr)
            print(f"    Max: {result['traditional_max_s']:.6f}s", file=sys.stderr)
            print(f"  Pixel-Native:", file=sys.stderr)
            print(f"    Avg: {result['pixel_native_avg_s']:.6f}s", file=sys.stderr)
            print(f"    Min: {result['pixel_native_min_s']:.6f}s", file=sys.stderr)
            print(f"    Max: {result['pixel_native_max_s']:.6f}s", file=sys.stderr)
            print(f"  Performance:", file=sys.stderr)
            print(f"    Speedup: {result['speedup']:.2f}x", file=sys.stderr)
            print(f"    Improvement: {result['improvement_pct']:.1f}%", file=sys.stderr)

    # Summary
    valid_results = [r for r in results if 'error' not in r]
    if valid_results:
        avg_speedup = sum(r['speedup'] for r in valid_results) / len(valid_results)
        avg_improvement = sum(r['improvement_pct'] for r in valid_results) / len(valid_results)

        print(f"\n{'='*60}", file=sys.stderr)
        print(f"SUMMARY ({len(valid_results)}/{len(results)} workloads)", file=sys.stderr)
        print(f"{'='*60}", file=sys.stderr)
        print(f"  Average speedup: {avg_speedup:.2f}x", file=sys.stderr)
        print(f"  Average improvement: {avg_improvement:.1f}%", file=sys.stderr)

        summary = {
            'avg_speedup': avg_speedup,
            'avg_improvement': avg_improvement
        }
    else:
        print(f"\n{'='*60}", file=sys.stderr)
        print(f"SUMMARY: No valid results collected", file=sys.stderr)
        print(f"{'='*60}", file=sys.stderr)
        summary = {
            'avg_speedup': 0,
            'avg_improvement': 0
        }

    if args.output:
        output_data = {
            'timestamp': datetime.now().isoformat(),
            'iterations': iterations,
            'results': results,
            'summary': summary
        }
        with open(args.output, 'w') as f:
            json.dump(output_data, f, indent=2)
        print(f"\nResults saved to: {args.output}", file=sys.stderr)


if __name__ == '__main__':
    main()