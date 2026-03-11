#!/usr/bin/env python3
"""
Performance Regression Detection Script

Checks for performance regressions by comparing current benchmarks with baseline.
Designed to be used in CI/pre-commit hooks.

Exit codes:
  0: No regressions detected
  1: Performance regressions found
  2: Error running benchmarks

Usage:
    python scripts/profiling/check_performance_regression.py
    python scripts/profiling/check_performance_regression.py --baseline path/to/baseline.json
    python scripts/profiling/check_performance_regression.py --threshold 15
"""

import argparse
import json
import subprocess
import sys
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Any

PROJECT_ROOT = Path(__file__).parent.parent.parent
DEFAULT_BASELINE = PROJECT_ROOT / "benchmarks" / "baseline_results_v2.json"


@dataclass
class RegressionResult:
    """Result of regression check"""
    benchmark: str
    metric: str
    baseline_value: float
    current_value: float
    change_percent: float
    severity: str  # 'critical', 'warning', 'ok'


def run_benchmarks(quick: bool = True) -> Dict[str, Any]:
    """Run benchmarks and return results"""
    cmd = ["python3", "benchmarks/comprehensive_benchmark.py"]
    if quick:
        # Use quick mode for faster CI feedback
        pass  # comprehensive_benchmark.py doesn't have quick mode

    try:
        result = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            timeout=300,  # 5 minute timeout
            cwd=str(PROJECT_ROOT)
        )

        # Find output file from last line
        lines = result.stdout.strip().split('\n')
        output_file = None
        for line in reversed(lines):
            if 'Results saved to:' in line:
                output_file = line.split('Results saved to:')[-1].strip()
                break

        if output_file and Path(output_file).exists():
            with open(output_file) as f:
                return json.load(f)

        # If we can't find the output file, try parsing stdout
        return {"error": "Could not find benchmark output", "stdout": result.stdout}

    except subprocess.TimeoutExpired:
        return {"error": "Benchmark timeout"}
    except Exception as e:
        return {"error": str(e)}


def load_baseline(path: Path) -> Dict[str, Any]:
    """Load baseline benchmark results"""
    if not path.exists():
        return {"error": f"Baseline file not found: {path}"}

    with open(path) as f:
        return json.load(f)


def check_regressions(
    baseline: Dict[str, Any],
    current: Dict[str, Any],
    threshold_warning: float = 15.0,
    threshold_critical: float = 30.0
) -> List[RegressionResult]:
    """Check for performance regressions"""
    results = []

    # Build lookup by benchmark name
    baseline_results = {r['name']: r for r in baseline.get('results', [])}
    current_results = {r['name']: r for r in current.get('results', [])}

    for name, current_result in current_results.items():
        if name not in baseline_results:
            continue

        baseline_result = baseline_results[name]

        # Compare metrics
        for metric_name, current_val in current_result.get('metrics', {}).items():
            if isinstance(current_val, dict) and 'mean' in current_val:
                baseline_val = baseline_result.get('metrics', {}).get(metric_name, {}).get('mean')

                if baseline_val is None or baseline_val <= 0:
                    continue

                change_percent = ((current_val['mean'] - baseline_val) / baseline_val) * 100

                # Determine severity (positive change = slower = regression)
                if change_percent > threshold_critical:
                    severity = "critical"
                elif change_percent > threshold_warning:
                    severity = "warning"
                else:
                    severity = "ok"

                results.append(RegressionResult(
                    benchmark=name,
                    metric=metric_name,
                    baseline_value=baseline_val,
                    current_value=current_val['mean'],
                    change_percent=change_percent,
                    severity=severity
                ))

    return results


def print_regression_report(results: List[RegressionResult], verbose: bool = False):
    """Print regression report"""
    critical = [r for r in results if r.severity == "critical"]
    warnings = [r for r in results if r.severity == "warning"]
    ok = [r for r in results if r.severity == "ok"]

    print("\n" + "=" * 70)
    print("PERFORMANCE REGRESSION REPORT")
    print("=" * 70)
    print(f"Timestamp: {datetime.now().isoformat()}")
    print(f"Total metrics checked: {len(results)}")

    if critical:
        print(f"\n🔴 CRITICAL REGRESSIONS ({len(critical)}):")
        for r in critical:
            print(f"  {r.benchmark} / {r.metric}")
            print(f"    Baseline: {r.baseline_value:.6f}")
            print(f"    Current:  {r.current_value:.6f}")
            print(f"    Change:   +{r.change_percent:.1f}%")

    if warnings:
        print(f"\n🟡 WARNINGS ({len(warnings)}):")
        for r in warnings:
            print(f"  {r.benchmark} / {r.metric}: +{r.change_percent:.1f}%")

    if verbose and ok:
        print(f"\n🟢 OK ({len(ok)}):")
        for r in ok[:10]:  # Show first 10
            symbol = "↑" if r.change_percent > 0 else "↓"
            print(f"  {r.benchmark} / {r.metric}: {symbol}{abs(r.change_percent):.1f}%")
        if len(ok) > 10:
            print(f"  ... and {len(ok) - 10} more")

    print("\n" + "=" * 70)

    if critical:
        print("❌ FAIL: Critical performance regressions detected!")
    elif warnings:
        print("⚠️  WARNING: Minor performance regressions detected")
    else:
        print("✅ PASS: No performance regressions detected")


def main():
    parser = argparse.ArgumentParser(
        description="Check for performance regressions"
    )
    parser.add_argument(
        "--baseline", "-b",
        type=str,
        default=str(DEFAULT_BASELINE),
        help="Path to baseline benchmark JSON"
    )
    parser.add_argument(
        "--threshold-warning", "-w",
        type=float,
        default=15.0,
        help="Warning threshold percent (default: 15)"
    )
    parser.add_argument(
        "--threshold-critical", "-c",
        type=float,
        default=30.0,
        help="Critical threshold percent (default: 30)"
    )
    parser.add_argument(
        "--verbose", "-v",
        action="store_true",
        help="Show all metrics, not just regressions"
    )
    parser.add_argument(
        "--update-baseline",
        action="store_true",
        help="Update baseline with current results"
    )
    parser.add_argument(
        "--current",
        type=str,
        help="Path to current benchmark JSON (skips running benchmarks)"
    )

    args = parser.parse_args()

    # Load baseline
    baseline = load_baseline(Path(args.baseline))
    if "error" in baseline:
        print(f"Error loading baseline: {baseline['error']}")
        return 2

    # Get current results
    if args.current:
        with open(args.current) as f:
            current = json.load(f)
    else:
        print("Running benchmarks...")
        current = run_benchmarks()

    if "error" in current:
        print(f"Error running benchmarks: {current['error']}")
        return 2

    # Check for regressions
    results = check_regressions(
        baseline,
        current,
        args.threshold_warning,
        args.threshold_critical
    )

    # Print report
    print_regression_report(results, args.verbose)

    # Update baseline if requested
    if args.update_baseline:
        import shutil
        output_path = Path(args.baseline)
        backup_path = output_path.with_suffix('.json.bak')

        shutil.copy(output_path, backup_path)

        with open(output_path, 'w') as f:
            json.dump(current, f, indent=2)

        print(f"\nBaseline updated: {output_path}")
        print(f"Backup saved: {backup_path}")

    # Return appropriate exit code
    critical = [r for r in results if r.severity == "critical"]
    if critical:
        return 1

    return 0


if __name__ == "__main__":
    sys.exit(main())
