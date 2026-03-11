#!/usr/bin/env python3
"""
Performance Profiling Toolkit for Geometry OS

Provides comprehensive profiling capabilities:
- CPU profiling with cProfile and py-spy
- Memory profiling with memory_profiler and tracemalloc
- Flamegraph generation for Python and Rust
- Automated bottleneck detection
- Performance regression testing

Usage:
    python scripts/profiling/profile_toolkit.py --help
    python scripts/profiling/profile_toolkit.py cpu --module systems.evolution_daemon
    python scripts/profiling/profile_toolkit.py memory --script my_script.py
    python scripts/profiling/profile_toolkit.py flamegraph --pid 12345
    python scripts/profiling/profile_toolkit.py compare baseline.json current.json
"""

import argparse
import cProfile
import json
import pstats
import subprocess
import sys
import time
from dataclasses import dataclass, asdict
from datetime import datetime
from io import StringIO
from pathlib import Path
from typing import Dict, List, Optional, Any

PROJECT_ROOT = Path(__file__).parent.parent.parent


@dataclass
class ProfileResult:
    """Result of a profiling session"""
    profile_type: str
    timestamp: str
    duration_seconds: float
    metrics: Dict[str, Any]
    top_functions: List[Dict[str, Any]]
    bottlenecks: List[Dict[str, Any]]
    output_file: Optional[str] = None

    def to_dict(self) -> Dict[str, Any]:
        return asdict(self)


class CPUProfiler:
    """CPU profiling using cProfile"""

    def __init__(self, verbose: bool = False):
        self.verbose = verbose

    def profile_module(
        self,
        module_path: str,
        function_name: Optional[str] = None,
        duration: float = 5.0,
        output_dir: Optional[Path] = None
    ) -> ProfileResult:
        """Profile a Python module"""
        start_time = time.time()

        # Build profiling command
        profiler_script = f'''
import sys
sys.path.insert(0, "{PROJECT_ROOT}")
import {module_path}

# Run for specified duration or call function
import time
start = time.time()
'''

        if function_name:
            profiler_script += f'''
# Call the specified function
func = getattr({module_path}, "{function_name}")
if callable(func):
    result = func()
'''
        else:
            profiler_script += f'''
# Keep module loaded for profiling duration
while time.time() - start < {duration}:
    pass
'''

        # Run with cProfile
        profiler = cProfile.Profile()
        
        try:
            profiler.enable()
            exec(profiler_script, {"__name__": "__main__", "PROJECT_ROOT": str(PROJECT_ROOT)})
            profiler.disable()
        except Exception as e:
            return ProfileResult(
                profile_type="cpu",
                timestamp=datetime.now().isoformat(),
                duration_seconds=time.time() - start_time,
                metrics={"error": str(e)},
                top_functions=[],
                bottlenecks=[{"type": "error", "message": str(e)}]
            )

        # Parse results
        s = StringIO()
        stats = pstats.Stats(profiler, stream=s)
        stats.sort_stats('cumulative')

        # Get top functions
        stats.print_stats(30)
        output = s.getvalue()

        top_functions = self._parse_stats_output(output)

        # Calculate metrics
        total_calls = sum(f.get('calls', 0) for f in top_functions)
        total_time = sum(f.get('cumtime', 0) for f in top_functions[:5])

        metrics = {
            "total_calls": total_calls,
            "total_cumulative_time": total_time,
            "profiled_module": module_path,
            "function": function_name
        }

        # Identify bottlenecks
        bottlenecks = self._identify_bottlenecks(top_functions)

        # Save profile data
        output_file = None
        if output_dir:
            output_dir = Path(output_dir)
            output_dir.mkdir(parents=True, exist_ok=True)
            output_file = str(output_dir / f"cpu_profile_{datetime.now().strftime('%Y%m%d_%H%M%S')}.prof")
            profiler.dump_stats(output_file)

        return ProfileResult(
            profile_type="cpu",
            timestamp=datetime.now().isoformat(),
            duration_seconds=time.time() - start_time,
            metrics=metrics,
            top_functions=top_functions[:20],
            bottlenecks=bottlenecks,
            output_file=output_file
        )

    def profile_script(
        self,
        script_path: str,
        args: List[str] = None,
        output_dir: Optional[Path] = None
    ) -> ProfileResult:
        """Profile a Python script"""
        start_time = time.time()

        script_path = Path(script_path)
        if not script_path.exists():
            return ProfileResult(
                profile_type="cpu",
                timestamp=datetime.now().isoformat(),
                duration_seconds=0,
                metrics={"error": f"Script not found: {script_path}"},
                top_functions=[],
                bottlenecks=[{"type": "error", "message": f"Script not found: {script_path}"}]
            )

        # Run with cProfile
        profiler = cProfile.Profile()

        try:
            import runpy
            sys.argv = [str(script_path)] + (args or [])
            
            profiler.enable()
            runpy.run_path(str(script_path), run_name="__main__")
            profiler.disable()
        except SystemExit:
            profiler.disable()
        except Exception as e:
            return ProfileResult(
                profile_type="cpu",
                timestamp=datetime.now().isoformat(),
                duration_seconds=time.time() - start_time,
                metrics={"error": str(e)},
                top_functions=[],
                bottlenecks=[{"type": "error", "message": str(e)}]
            )

        # Parse results
        s = StringIO()
        stats = pstats.Stats(profiler, stream=s)
        stats.sort_stats('cumulative')
        stats.print_stats(30)
        output = s.getvalue()

        top_functions = self._parse_stats_output(output)
        bottlenecks = self._identify_bottlenecks(top_functions)

        # Save profile data
        output_file = None
        if output_dir:
            output_dir = Path(output_dir)
            output_dir.mkdir(parents=True, exist_ok=True)
            output_file = str(output_dir / f"cpu_profile_{script_path.stem}_{datetime.now().strftime('%Y%m%d_%H%M%S')}.prof")
            profiler.dump_stats(output_file)

        return ProfileResult(
            profile_type="cpu",
            timestamp=datetime.now().isoformat(),
            duration_seconds=time.time() - start_time,
            metrics={"script": str(script_path)},
            top_functions=top_functions[:20],
            bottlenecks=bottlenecks,
            output_file=output_file
        )

    def _parse_stats_output(self, output: str) -> List[Dict[str, Any]]:
        """Parse pstats output into structured data"""
        functions = []
        lines = output.strip().split('\n')

        for line in lines:
            # Parse lines like:
            #   123456  0.123  0.456  function_name (file:line)
            parts = line.strip().split()
            if len(parts) >= 6:
                try:
                    calls = int(parts[0])
                    tottime = float(parts[1])
                    cumtime = float(parts[2])
                    name = ' '.join(parts[5:])

                    functions.append({
                        "calls": calls,
                        "tottime": tottime,
                        "cumtime": cumtime,
                        "name": name
                    })
                except (ValueError, IndexError):
                    continue

        return functions

    def _identify_bottlenecks(self, functions: List[Dict]) -> List[Dict[str, Any]]:
        """Identify potential bottlenecks from profiling data"""
        bottlenecks = []

        for func in functions[:10]:
            # High cumulative time
            if func.get('cumtime', 0) > 1.0:
                bottlenecks.append({
                    "type": "high_cumulative_time",
                    "function": func['name'],
                    "cumtime": func['cumtime'],
                    "severity": "high" if func['cumtime'] > 5.0 else "medium"
                })

            # High call count
            if func.get('calls', 0) > 100000:
                bottlenecks.append({
                    "type": "high_call_count",
                    "function": func['name'],
                    "calls": func['calls'],
                    "severity": "medium"
                })

        return bottlenecks


class MemoryProfiler:
    """Memory profiling using tracemalloc"""

    def __init__(self, verbose: bool = False):
        self.verbose = verbose

    def profile_module(
        self,
        module_path: str,
        function_name: Optional[str] = None,
        duration: float = 5.0,
        output_dir: Optional[Path] = None
    ) -> ProfileResult:
        """Profile memory usage of a module"""
        import tracemalloc

        start_time = time.time()

        # Enable tracemalloc
        tracemalloc.start()

        try:
            # Import and run module
            sys.path.insert(0, str(PROJECT_ROOT))
            module = __import__(module_path, fromlist=[''])

            if function_name and hasattr(module, function_name):
                func = getattr(module, function_name)
                if callable(func):
                    func()

            # Take snapshot
            snapshot = tracemalloc.take_snapshot()
            top_stats = snapshot.statistics('lineno')

            # Parse results
            top_allocations = []
            stat: Any
            for stat in top_stats[:20]:
                top_allocations.append({
                    "size_kb": stat.size / 1024,
                    "count": stat.count,
                    "traceback": str(stat.traceback)
                })

            # Calculate metrics
            total_size = sum(s.size for s in top_stats)
            total_count = sum(s.count for s in top_stats)

            metrics = {
                "total_allocated_mb": total_size / (1024 * 1024),
                "total_allocations": total_count,
                "profiled_module": module_path
            }

            # Identify bottlenecks
            bottlenecks = []
            for alloc in top_allocations[:5]:
                if alloc['size_kb'] > 1024:  # > 1MB
                    bottlenecks.append({
                        "type": "large_allocation",
                        "size_kb": alloc['size_kb'],
                        "traceback": alloc['traceback'],
                        "severity": "high" if alloc['size_kb'] > 10240 else "medium"
                    })

            tracemalloc.stop()

            return ProfileResult(
                profile_type="memory",
                timestamp=datetime.now().isoformat(),
                duration_seconds=time.time() - start_time,
                metrics=metrics,
                top_functions=top_allocations,
                bottlenecks=bottlenecks
            )

        except Exception as e:
            tracemalloc.stop()
            return ProfileResult(
                profile_type="memory",
                timestamp=datetime.now().isoformat(),
                duration_seconds=time.time() - start_time,
                metrics={"error": str(e)},
                top_functions=[],
                bottlenecks=[{"type": "error", "message": str(e)}]
            )

    def profile_script(
        self,
        script_path: str,
        output_dir: Optional[Path] = None
    ) -> ProfileResult:
        """Profile memory usage of a script"""
        import tracemalloc
        import runpy

        start_time = time.time()
        script_path = Path(script_path)

        if not script_path.exists():
            return ProfileResult(
                profile_type="memory",
                timestamp=datetime.now().isoformat(),
                duration_seconds=0,
                metrics={"error": f"Script not found: {script_path}"},
                top_functions=[],
                bottlenecks=[{"type": "error", "message": f"Script not found: {script_path}"}]
            )

        tracemalloc.start()

        try:
            sys.argv = [str(script_path)]
            runpy.run_path(str(script_path), run_name="__main__")

            snapshot = tracemalloc.take_snapshot()
            top_stats = snapshot.statistics('lineno')

            top_allocations = []
            for stat in top_stats[:20]:
                top_allocations.append({
                    "size_kb": stat.size / 1024,
                    "count": stat.count,
                    "traceback": str(stat.traceback)
                })

            total_size = sum(s.size for s in top_stats)

            bottlenecks = []
            for alloc in top_allocations[:5]:
                if alloc['size_kb'] > 1024:
                    bottlenecks.append({
                        "type": "large_allocation",
                        "size_kb": alloc['size_kb'],
                        "traceback": alloc['traceback'],
                        "severity": "high" if alloc['size_kb'] > 10240 else "medium"
                    })

            tracemalloc.stop()

            return ProfileResult(
                profile_type="memory",
                timestamp=datetime.now().isoformat(),
                duration_seconds=time.time() - start_time,
                metrics={
                    "total_allocated_mb": total_size / (1024 * 1024),
                    "script": str(script_path)
                },
                top_functions=top_allocations,
                bottlenecks=bottlenecks
            )

        except SystemExit:
            tracemalloc.stop()
            return ProfileResult(
                profile_type="memory",
                timestamp=datetime.now().isoformat(),
                duration_seconds=time.time() - start_time,
                metrics={"status": "completed"},
                top_functions=[],
                bottlenecks=[]
            )
        except Exception as e:
            tracemalloc.stop()
            return ProfileResult(
                profile_type="memory",
                timestamp=datetime.now().isoformat(),
                duration_seconds=time.time() - start_time,
                metrics={"error": str(e)},
                top_functions=[],
                bottlenecks=[{"type": "error", "message": str(e)}]
            )


class FlamegraphGenerator:
    """Generate flamegraphs using py-spy and perf"""

    def __init__(self, verbose: bool = False):
        self.verbose = verbose

    def check_dependencies(self) -> Dict[str, bool]:
        """Check if required tools are installed"""
        deps = {}

        # Check py-spy
        try:
            result = subprocess.run(['py-spy', '--version'], capture_output=True, text=True)
            deps['py-spy'] = result.returncode == 0
        except FileNotFoundError:
            deps['py-spy'] = False

        # Check perf
        try:
            result = subprocess.run(['perf', '--version'], capture_output=True, text=True)
            deps['perf'] = result.returncode == 0
        except FileNotFoundError:
            deps['perf'] = False

        # Check flamegraph tools
        try:
            result = subprocess.run(['stackcollapse-perf.pl', '--help'], capture_output=True, text=True, shell=True)
            deps['flamegraph'] = result.returncode == 0
        except:
            deps['flamegraph'] = False

        return deps

    def profile_python_process(
        self,
        pid: int,
        duration: float = 10.0,
        output_dir: Optional[Path] = None,
        output_format: str = "flamegraph"
    ) -> ProfileResult:
        """Profile a running Python process with py-spy"""
        start_time = time.time()

        # Check py-spy is available
        try:
            subprocess.run(['py-spy', '--version'], capture_output=True, check=True)
        except (subprocess.CalledProcessError, FileNotFoundError):
            return ProfileResult(
                profile_type="flamegraph",
                timestamp=datetime.now().isoformat(),
                duration_seconds=0,
                metrics={"error": "py-spy not installed. Install with: pip install py-spy"},
                top_functions=[],
                bottlenecks=[{"type": "error", "message": "py-spy not installed"}]
            )

        output_file = None
        if output_dir:
            output_dir = Path(output_dir)
            output_dir.mkdir(parents=True, exist_ok=True)
            output_file = str(output_dir / f"flamegraph_pid{pid}_{datetime.now().strftime('%Y%m%d_%H%M%S')}.svg")

        try:
            cmd = [
                'py-spy', 'record',
                '--pid', str(pid),
                '--duration', str(duration),
                '--format', output_format,
                '--rate', '100'
            ]

            if output_file:
                cmd.extend(['--output', output_file])

            result = subprocess.run(cmd, capture_output=True, text=True)

            return ProfileResult(
                profile_type="flamegraph",
                timestamp=datetime.now().isoformat(),
                duration_seconds=time.time() - start_time,
                metrics={
                    "pid": pid,
                    "duration": duration,
                    "format": output_format
                },
                top_functions=[],
                bottlenecks=[],
                output_file=output_file
            )

        except Exception as e:
            return ProfileResult(
                profile_type="flamegraph",
                timestamp=datetime.now().isoformat(),
                duration_seconds=time.time() - start_time,
                metrics={"error": str(e)},
                top_functions=[],
                bottlenecks=[{"type": "error", "message": str(e)}]
            )

    def profile_rust_binary(
        self,
        binary_path: str,
        args: List[str] = None,
        duration: float = 10.0,
        output_dir: Optional[Path] = None
    ) -> ProfileResult:
        """Profile a Rust binary with perf"""
        start_time = time.time()

        # Check perf is available
        try:
            subprocess.run(['perf', '--version'], capture_output=True, check=True)
        except (subprocess.CalledProcessError, FileNotFoundError):
            return ProfileResult(
                profile_type="flamegraph",
                timestamp=datetime.now().isoformat(),
                duration_seconds=0,
                metrics={"error": "perf not installed. Install with: sudo apt-get install linux-perf"},
                top_functions=[],
                bottlenecks=[{"type": "error", "message": "perf not installed"}]
            )

        output_file = None
        perf_data = None
        if output_dir:
            output_dir = Path(output_dir)
            output_dir.mkdir(parents=True, exist_ok=True)
            timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
            perf_data = str(output_dir / f"perf_{timestamp}.data")
            output_file = str(output_dir / f"flamegraph_rust_{timestamp}.svg")

        try:
            # Record perf data
            cmd = ['perf', 'record', '-g', '-o', perf_data, '--', binary_path] + (args or [])
            subprocess.run(cmd, capture_output=True, timeout=duration)

            # Generate flamegraph if tools available
            if output_file and perf_data:
                # Try with flamegraph.pl if available
                try:
                    subprocess.run([
                        'perf', 'script', '-i', perf_data,
                        '|', 'stackcollapse-perf.pl',
                        '|', 'flamegraph.pl', '>', output_file
                    ], shell=True, capture_output=True)
                except:
                    pass

            return ProfileResult(
                profile_type="flamegraph",
                timestamp=datetime.now().isoformat(),
                duration_seconds=time.time() - start_time,
                metrics={
                    "binary": binary_path,
                    "duration": duration
                },
                top_functions=[],
                bottlenecks=[],
                output_file=output_file
            )

        except Exception as e:
            return ProfileResult(
                profile_type="flamegraph",
                timestamp=datetime.now().isoformat(),
                duration_seconds=time.time() - start_time,
                metrics={"error": str(e)},
                top_functions=[],
                bottlenecks=[{"type": "error", "message": str(e)}]
            )


class PerformanceComparator:
    """Compare benchmark results for regression detection"""

    def __init__(self, threshold_percent: float = 20.0):
        self.threshold_percent = threshold_percent

    def compare(
        self,
        baseline_path: str,
        current_path: str
    ) -> Dict[str, Any]:
        """Compare two benchmark result files"""
        with open(baseline_path) as f:
            baseline = json.load(f)

        with open(current_path) as f:
            current = json.load(f)

        results = {
            "timestamp": datetime.now().isoformat(),
            "baseline_file": baseline_path,
            "current_file": current_path,
            "threshold_percent": self.threshold_percent,
            "comparisons": [],
            "regressions": [],
            "improvements": [],
            "summary": {
                "total_compared": 0,
                "regressions": 0,
                "improvements": 0,
                "unchanged": 0
            }
        }

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
                    if baseline_val and baseline_val > 0:
                        change_percent = ((current_val['mean'] - baseline_val) / baseline_val) * 100

                        comparison = {
                            "benchmark": name,
                            "metric": metric_name,
                            "baseline": baseline_val,
                            "current": current_val['mean'],
                            "change_percent": change_percent
                        }
                        results['comparisons'].append(comparison)
                        results['summary']['total_compared'] += 1

                        if change_percent > self.threshold_percent:
                            results['regressions'].append(comparison)
                            results['summary']['regressions'] += 1
                        elif change_percent < -self.threshold_percent:
                            results['improvements'].append(comparison)
                            results['summary']['improvements'] += 1
                        else:
                            results['summary']['unchanged'] += 1

        return results


def print_profile_report(result: ProfileResult):
    """Print a formatted profile report"""
    print("\n" + "=" * 70)
    print(f"PROFILE REPORT: {result.profile_type.upper()}")
    print("=" * 70)
    print(f"Timestamp: {result.timestamp}")
    print(f"Duration: {result.duration_seconds:.2f}s")

    if result.output_file:
        print(f"Output file: {result.output_file}")

    if result.metrics:
        print("\nMETRICS:")
        for key, val in result.metrics.items():
            print(f"  {key}: {val}")

    if result.top_functions:
        print("\nTOP FUNCTIONS/ALLOCATIONS:")
        for i, func in enumerate(result.top_functions[:10], 1):
            if result.profile_type == "memory":
                print(f"  {i}. {func.get('size_kb', 0):.2f} KB - {func.get('traceback', 'unknown')}")
            else:
                print(f"  {i}. {func.get('cumtime', 0):.4f}s cumtime, {func.get('calls', 0)} calls - {func.get('name', 'unknown')}")

    if result.bottlenecks:
        print("\nBOTTLENECKS:")
        for b in result.bottlenecks:
            severity_icon = {"high": "🔴", "medium": "🟡", "low": "🟢"}.get(b.get('severity', 'low'), "⚪")
            print(f"  {severity_icon} [{b.get('type', 'unknown')}] {b}")

    print("=" * 70)


def main():
    parser = argparse.ArgumentParser(
        description="Geometry OS Performance Profiling Toolkit",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Profile CPU usage of a module
  python scripts/profiling/profile_toolkit.py cpu --module systems.evolution_daemon

  # Profile memory of a script
  python scripts/profiling/profile_toolkit.py memory --script tests/test_brain.py

  # Generate flamegraph of a running process
  python scripts/profiling/profile_toolkit.py flamegraph --pid 12345

  # Compare benchmark results
  python scripts/profiling/profile_toolkit.py compare baseline.json current.json
        """
    )

    subparsers = parser.add_subparsers(dest='command', help='Profiling command')

    # CPU profiling
    cpu_parser = subparsers.add_parser('cpu', help='CPU profiling with cProfile')
    cpu_parser.add_argument('--module', '-m', help='Module to profile')
    cpu_parser.add_argument('--function', '-f', help='Function to call')
    cpu_parser.add_argument('--script', '-s', help='Script to profile')
    cpu_parser.add_argument('--duration', '-d', type=float, default=5.0, help='Duration in seconds')
    cpu_parser.add_argument('--output', '-o', help='Output directory')

    # Memory profiling
    mem_parser = subparsers.add_parser('memory', help='Memory profiling with tracemalloc')
    mem_parser.add_argument('--module', '-m', help='Module to profile')
    mem_parser.add_argument('--function', '-f', help='Function to call')
    mem_parser.add_argument('--script', '-s', help='Script to profile')
    mem_parser.add_argument('--duration', '-d', type=float, default=5.0, help='Duration in seconds')
    mem_parser.add_argument('--output', '-o', help='Output directory')

    # Flamegraph generation
    flame_parser = subparsers.add_parser('flamegraph', help='Generate flamegraphs')
    flame_parser.add_argument('--pid', '-p', type=int, help='Process ID to profile')
    flame_parser.add_argument('--binary', '-b', help='Rust binary to profile')
    flame_parser.add_argument('--duration', '-d', type=float, default=10.0, help='Duration in seconds')
    flame_parser.add_argument('--output', '-o', help='Output directory')

    # Comparison
    compare_parser = subparsers.add_parser('compare', help='Compare benchmark results')
    compare_parser.add_argument('baseline', help='Baseline benchmark JSON')
    compare_parser.add_argument('current', help='Current benchmark JSON')
    compare_parser.add_argument('--threshold', '-t', type=float, default=20.0, help='Regression threshold percent')

    # Check dependencies
    deps_parser = subparsers.add_parser('check', help='Check profiling dependencies')

    args = parser.parse_args()

    if not args.command:
        parser.print_help()
        return

    if args.command == 'check':
        gen = FlamegraphGenerator()
        deps = gen.check_dependencies()
        print("\nProfiling Dependencies:")
        for tool, installed in deps.items():
            status = "✓ installed" if installed else "✗ not installed"
            print(f"  {tool}: {status}")
        return

    if args.command == 'cpu':
        profiler = CPUProfiler()
        if args.script:
            result = profiler.profile_script(args.script, output_dir=args.output)
        elif args.module:
            result = profiler.profile_module(args.module, args.function, args.duration, args.output)
        else:
            print("Error: --module or --script required")
            return
        print_profile_report(result)

    elif args.command == 'memory':
        profiler = MemoryProfiler()
        if args.script:
            result = profiler.profile_script(args.script, output_dir=args.output)
        elif args.module:
            result = profiler.profile_module(args.module, args.function, args.duration, args.output)
        else:
            print("Error: --module or --script required")
            return
        print_profile_report(result)

    elif args.command == 'flamegraph':
        gen = FlamegraphGenerator()
        if args.pid:
            result = gen.profile_python_process(args.pid, args.duration, args.output)
        elif args.binary:
            result = gen.profile_rust_binary(args.binary, duration=args.duration, output_dir=args.output)
        else:
            print("Error: --pid or --binary required")
            return
        print_profile_report(result)

    elif args.command == 'compare':
        comparator = PerformanceComparator(args.threshold)
        results = comparator.compare(args.baseline, args.current)
        print(json.dumps(results, indent=2))


if __name__ == "__main__":
    main()
