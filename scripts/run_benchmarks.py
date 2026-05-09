#!/usr/bin/env python3
"""
Geometry OS Benchmark Runner (Phase 290)
Runs all Criterion benchmarks and collects results into CSV format.

Usage:
    python3 scripts/run_benchmarks.py              # Run all, output CSV to stdout
    python3 scripts/run_benchmarks.py --save        # Also save to docs/PERFORMANCE_BENCHMARK.md
    python3 scripts/run_benchmarks.py --quick       # Quick mode: fewer samples
    python3 scripts/run_benchmarks.py --bench NAME  # Run specific benchmark suite

Benchmark suites:
    vm_bench          - Core VM benchmarks (existing)
    vm_bench_extended - Extended VM benchmarks (Phase 290)
    assembler_bench   - Assembler benchmarks (existing)
    riscv_bench       - RISC-V comparison benchmarks (Phase 290)
"""

import argparse
import csv
import io
import json
import os
import re
import subprocess
import sys
import time
from datetime import datetime
from pathlib import Path


def parse_criterion_output(text: str) -> list[dict]:
    """Parse Criterion's --message-format=plain output into structured records."""
    results = []

    # Split into benchmark groups
    current_group = None
    for line in text.splitlines():
        line = line.strip()

        # Group header: "vm_arithmetic/1000_iters"
        match = re.match(r'^([\w/]+)/([\w_]+)\s+time:\s+', line)
        if match:
            group_name = match.group(1)
            bench_name = match.group(2)

            # Extract time value (e.g., "1.234 ms" or "456 µs" or "1.23 s")
            time_match = re.search(r'time:\s+\[([\d.]+)\s+(\w+)\s+([\d.]+)\s+(\w+)\s+([\d.]+)\s+(\w+)\]', line)
            if time_match:
                low = float(time_match.group(1))
                low_unit = time_match.group(2)
                est = float(time_match.group(3))
                est_unit = time_match.group(4)
                high = float(time_match.group(5))
                high_unit = time_match.group(6)

                # Convert to nanoseconds
                def to_ns(val, unit):
                    if unit in ('ns', ):
                        return val
                    elif unit in ('µs', 'us'):
                        return val * 1e3
                    elif unit in ('ms', ):
                        return val * 1e6
                    elif unit in ('s', ):
                        return val * 1e9
                    return val

                results.append({
                    'group': group_name,
                    'benchmark': bench_name,
                    'time_ns': to_ns(est, est_unit),
                    'time_low_ns': to_ns(low, low_unit),
                    'time_high_ns': to_ns(high, high_unit),
                    'time_str': f"{est} {est_unit}",
                })

    return results


def run_benchmark_suite(suite_name: str, project_dir: str, quick: bool = False) -> list[dict]:
    """Run a single Criterion benchmark suite and return parsed results."""
    print(f"  Running {suite_name}...", file=sys.stderr)

    cmd = ["cargo", "bench", "--bench", suite_name, "--", "--message-format=plain"]
    if quick:
        cmd.append("--quick")

    env = os.environ.copy()
    env["CARGO_TARGET_DIR"] = os.path.join(project_dir, "target")

    try:
        result = subprocess.run(
            cmd,
            cwd=project_dir,
            capture_output=True,
            text=True,
            timeout=600,  # 10 minute timeout per suite
            env=env,
        )
        output = result.stdout + result.stderr

        if result.returncode != 0 and "FAILED" in output:
            print(f"  WARNING: {suite_name} had failures", file=sys.stderr)
            # Still try to parse whatever output we got

        return parse_criterion_output(output)
    except subprocess.TimeoutExpired:
        print(f"  TIMEOUT: {suite_name} exceeded 10 minutes", file=sys.stderr)
        return []
    except Exception as e:
        print(f"  ERROR running {suite_name}: {e}", file=sys.stderr)
        return []


def generate_markdown_report(all_results: list[dict], project_dir: str) -> str:
    """Generate a markdown performance report from benchmark results."""
    lines = []
    lines.append("# Geometry OS Performance Benchmark")
    lines.append("")
    lines.append(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    lines.append(f"Commit: `{subprocess.run(['git', 'rev-parse', '--short', 'HEAD'], capture_output=True, text=True).stdout.strip()}`")
    lines.append("")

    # Group results by suite
    suites = {}
    for r in all_results:
        suite = r['group'].split('/')[0] if '/' in r['group'] else r['group']
        if suite not in suites:
            suites[suite] = []
        suites[suite].append(r)

    # Summary table
    lines.append("## Summary")
    lines.append("")
    lines.append("| Benchmark | Time (est) | Range |")
    lines.append("|-----------|------------|-------|")
    for r in all_results:
        full_name = f"{r['group']}/{r['benchmark']}"
        lines.append(f"| {full_name} | {r['time_str']} | [{r['time_low_ns']:.0f}ns, {r['time_high_ns']:.0f}ns] |")
    lines.append("")

    # Per-suite sections
    for suite_name, results in suites.items():
        lines.append(f"## {suite_name}")
        lines.append("")

        if suite_name == "vm_arithmetic" or suite_name == "dispatch":
            lines.append("### Instruction Dispatch Rates")
            lines.append("")
            lines.append("| Benchmark | Time | Throughput |")
            lines.append("|-----------|------|------------|")
            for r in results:
                full_name = r['benchmark']
                lines.append(f"| {full_name} | {r['time_str']} | {1e9/r['time_ns']:.0f} ops/s |")
            lines.append("")
        elif suite_name in ("vm_memory", "vm_random_memory", "vm_canvas_intercept"):
            lines.append("### Memory Access Performance")
            lines.append("")
            lines.append("| Benchmark | Time | Ops/sec |")
            lines.append("|-----------|------|---------|")
            for r in results:
                lines.append(f"| {r['benchmark']} | {r['time_str']} | {1e9/r['time_ns']:.0f} |")
            lines.append("")
        elif suite_name in ("vm_graphics", "vm_line", "vm_sprite", "vm_circle", "vm_text", "vm_scroll", "vm_flood", "vm_peek"):
            lines.append("### Graphics Opcode Performance")
            lines.append("")
            lines.append("| Benchmark | Time |")
            lines.append("|-----------|------|")
            for r in results:
                lines.append(f"| {r['benchmark']} | {r['time_str']} |")
            lines.append("")
        elif suite_name in ("full_program", "infinite_map"):
            lines.append("### Full-Program Frame Times")
            lines.append("")
            lines.append("| Benchmark | Time |")
            lines.append("|-----------|------|")
            for r in results:
                lines.append(f"| {r['benchmark']} | {r['time_str']} |")
            lines.append("")
        elif suite_name.startswith("riscv"):
            lines.append("### RISC-V Interpreter Performance")
            lines.append("")
            lines.append("| Benchmark | Time |")
            lines.append("|-----------|------|")
            for r in results:
                lines.append(f"| {r['benchmark']} | {r['time_str']} |")
            lines.append("")
        elif suite_name == "assembler":
            lines.append("### Assembler Performance")
            lines.append("")
            lines.append("| Benchmark | Time |")
            lines.append("|-----------|------|")
            for r in results:
                lines.append(f"| {r['benchmark']} | {r['time_str']} |")
            lines.append("")
        else:
            lines.append("| Benchmark | Time |")
            lines.append("|-----------|------|")
            for r in results:
                lines.append(f"| {r['benchmark']} | {r['time_str']} |")
            lines.append("")

    # Environment info
    lines.append("## Environment")
    lines.append("")
    lines.append(f"- OS: Linux")
    lines.append(f"- Rust: `{subprocess.run(['rustc', '--version'], capture_output=True, text=True).stdout.strip()}`")
    lines.append(f"- Build: release mode (Criterion default)")
    lines.append("")

    # GeOS vs RISC-V comparison
    riscv_results = [r for r in all_results if r['group'].startswith('riscv')]
    geos_results = [r for r in all_results if not r['group'].startswith('riscv') and 'dispatch' in r['group']]

    if riscv_results and geos_results:
        lines.append("## GeOS VM vs RISC-V Interpreter Comparison")
        lines.append("")
        lines.append("| Operation | GeOS VM | RISC-V VM | Ratio (RISC-V/GeOS) |")
        lines.append("|-----------|---------|-----------|---------------------|")

        # Find comparable benchmarks
        comparisons = [
            ("nop", "c_nop", "nop"),
            ("add", "addi", "add"),
            ("memory", "sw_lw", "loadstore"),
        ]

        for geos_key, riscv_key, label in comparisons:
            geos_r = next((r for r in geos_results if geos_key in r['benchmark'].lower()), None)
            riscv_r = next((r for r in riscv_results if riscv_key in r['benchmark'].lower()), None)
            if geos_r and riscv_r:
                ratio = riscv_r['time_ns'] / geos_r['time_ns']
                lines.append(f"| {label} | {geos_r['time_str']} | {riscv_r['time_str']} | {ratio:.1f}x |")

        lines.append("")

    return '\n'.join(lines)


def main():
    parser = argparse.ArgumentParser(description="Geometry OS Benchmark Runner")
    parser.add_argument("--save", action="store_true", help="Save results to docs/PERFORMANCE_BENCHMARK.md")
    parser.add_argument("--csv", action="store_true", help="Output CSV to stdout")
    parser.add_argument("--quick", action="store_true", help="Quick mode: fewer samples")
    parser.add_argument("--bench", type=str, help="Run specific benchmark suite only")
    parser.add_argument("--project-dir", type=str, default=None, help="Project directory")
    args = parser.parse_args()

    project_dir = args.project_dir or os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    if not os.path.exists(os.path.join(project_dir, "Cargo.toml")):
        # Try common locations
        for candidate in [
            os.path.expanduser("~/zion/projects/geometry_os/geometry_os"),
            os.path.expanduser("~/projects/geometry_os/geometry_os"),
        ]:
            if os.path.exists(os.path.join(candidate, "Cargo.toml")):
                project_dir = candidate
                break

    suites = ["vm_bench", "vm_bench_extended", "assembler_bench", "riscv_bench"]
    if args.bench:
        suites = [args.bench]

    all_results = []
    total_start = time.time()

    for suite in suites:
        results = run_benchmark_suite(suite, project_dir, quick=args.quick)
        all_results.extend(results)
        print(f"    {len(results)} benchmarks collected", file=sys.stderr)

    total_time = time.time() - total_start
    print(f"\n  Total: {len(all_results)} benchmarks in {total_time:.1f}s", file=sys.stderr)

    if not all_results:
        print("No benchmark results collected. Check build and benchmark names.", file=sys.stderr)
        sys.exit(1)

    # CSV output
    if args.csv:
        writer = csv.DictWriter(sys.stdout, fieldnames=['group', 'benchmark', 'time_ns', 'time_low_ns', 'time_high_ns', 'time_str'])
        writer.writeheader()
        for r in all_results:
            writer.writerow(r)
    else:
        # Markdown report
        report = generate_markdown_report(all_results, project_dir)
        print(report)

        if args.save:
            docs_dir = os.path.join(project_dir, "docs")
            os.makedirs(docs_dir, exist_ok=True)
            report_path = os.path.join(docs_dir, "PERFORMANCE_BENCHMARK.md")
            with open(report_path, 'w') as f:
                f.write(report)
            print(f"\n  Report saved to {report_path}", file=sys.stderr)


if __name__ == "__main__":
    main()
