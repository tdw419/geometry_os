#!/usr/bin/env python3
"""
Neural Pipeline Performance Benchmarking

Benchmarks the neural pipeline components:
1. LM Studio latency (mean, median, P95)
2. Throughput (requests per second, success rate)
3. Software SHM performance
4. Message serialization performance

Author: Neural Pipeline Specialist
Date: 2026-02-09
"""

import asyncio
import json
import statistics
import sys
import time
from dataclasses import dataclass, field, asdict
from datetime import datetime
from pathlib import Path
from typing import List, Dict, Any, Optional, Callable
import functools

# Add project root
sys.path.insert(0, str(Path(__file__).parent.parent))

from systems.neural_substrate.lm_studio_bridge import LMStudioBridge, HAS_AIOHTTP
from systems.health.software_shm import SoftwareSHM


@dataclass
class BenchmarkResult:
    """Result of a single benchmark"""
    name: str
    status: str  # 'PASS', 'FAIL', 'SKIP'
    duration: float
    metrics: Dict[str, Any]
    error: Optional[str] = None

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary"""
        return asdict(self)


@dataclass
class LatencyMetrics:
    """Latency measurement results"""
    samples: List[float] = field(default_factory=list)

    def add(self, value: float):
        """Add a latency sample"""
        self.samples.append(value)

    @property
    def count(self) -> int:
        """Number of samples"""
        return len(self.samples)

    @property
    def mean(self) -> float:
        """Mean latency in seconds"""
        if not self.samples:
            return 0.0
        return statistics.mean(self.samples)

    @property
    def median(self) -> float:
        """Median latency in seconds"""
        if not self.samples:
            return 0.0
        return statistics.median(self.samples)

    @property
    def p95(self) -> float:
        """95th percentile latency in seconds"""
        if not self.samples:
            return 0.0
        return statistics.quantiles(self.samples, n=20)[18] if len(self.samples) >= 20 else max(self.samples)

    @property
    def p99(self) -> float:
        """99th percentile latency in seconds"""
        if not self.samples:
            return 0.0
        return statistics.quantiles(self.samples, n=100)[98] if len(self.samples) >= 100 else max(self.samples)

    @property
    def min(self) -> float:
        """Minimum latency in seconds"""
        if not self.samples:
            return 0.0
        return min(self.samples)

    @property
    def max(self) -> float:
        """Maximum latency in seconds"""
        if not self.samples:
            return 0.0
        return max(self.samples)

    @property
    def stdev(self) -> float:
        """Standard deviation of latency"""
        if len(self.samples) < 2:
            return 0.0
        return statistics.stdev(self.samples)

    def to_dict(self) -> Dict[str, float]:
        """Convert to dictionary"""
        return {
            "count": self.count,
            "mean": self.mean,
            "median": self.median,
            "p95": self.p95,
            "p99": self.p99,
            "min": self.min,
            "max": self.max,
            "stdev": self.stdev
        }


@dataclass
class ThroughputMetrics:
    """Throughput measurement results"""
    total_requests: int = 0
    successful_requests: int = 0
    failed_requests: int = 0
    total_duration: float = 0.0

    @property
    def success_rate(self) -> float:
        """Success rate as percentage"""
        if self.total_requests == 0:
            return 0.0
        return (self.successful_requests / self.total_requests) * 100

    @property
    def rps(self) -> float:
        """Requests per second"""
        if self.total_duration == 0:
            return 0.0
        return self.total_requests / self.total_duration

    @property
    def successful_rps(self) -> float:
        """Successful requests per second"""
        if self.total_duration == 0:
            return 0.0
        return self.successful_requests / self.total_duration

    def to_dict(self) -> Dict[str, float]:
        """Convert to dictionary"""
        return {
            "total_requests": self.total_requests,
            "successful_requests": self.successful_requests,
            "failed_requests": self.failed_requests,
            "success_rate": self.success_rate,
            "rps": self.rps,
            "successful_rps": self.successful_rps,
            "total_duration": self.total_duration
        }


def measure_time(func: Callable) -> Callable:
    """Decorator to measure function execution time"""
    @functools.wraps(func)
    async def wrapper(*args, **kwargs):
        start = time.time()
        try:
            result = await func(*args, **kwargs)
            duration = time.time() - start
            return result, duration, None
        except Exception as e:
            duration = time.time() - start
            return None, duration, str(e)
    return wrapper


class NeuralPipelineBenchmark:
    """Benchmark suite for neural pipeline components"""

    def __init__(self, verbose: bool = False):
        self.verbose = verbose
        self.results: List[BenchmarkResult] = []
        self.lm_studio_url = "http://localhost:1234/v1"
        self.project_root = Path(__file__).parent.parent

    def log(self, message: str, level: str = "INFO"):
        """Log a message"""
        if self.verbose or level in ["WARN", "ERROR"]:
            print(f"[{level}] {message}")

    async def benchmark_lm_studio_latency(
        self,
        num_requests: int = 50,
        max_tokens: int = 10
    ) -> BenchmarkResult:
        """
        Benchmark 1: LM Studio Request Latency

        Measures:
        - Mean latency
        - Median latency
        - P95 latency
        - P99 latency
        - Min/Max latency
        - Standard deviation
        """
        name = "LM Studio Latency"
        start_time = time.time()

        latencies = LatencyMetrics()
        errors = []

        if not HAS_AIOHTTP:
            return BenchmarkResult(
                name=name,
                status="SKIP",
                duration=0,
                metrics={"reason": "aiohttp not installed"}
            )

        try:
            import aiohttp

            async def make_request(session):
                async with session.post(
                    f"{self.lm_studio_url}/chat/completions",
                    json={
                        "messages": [{"role": "user", "content": "Say 'test'"}],
                        "stream": False,
                        "max_tokens": max_tokens
                    },
                    timeout=aiohttp.ClientTimeout(total=30)
                ) as response:
                    if response.status == 200:
                        await response.json()
                        return True
                    return False

            async with aiohttp.ClientSession() as session:
                for i in range(num_requests):
                    req_start = time.time()
                    try:
                        success = await make_request(session)
                        req_duration = time.time() - req_start

                        if success:
                            latencies.add(req_duration)
                        else:
                            errors.append(f"HTTP error on request {i+1}")

                        self.log(f"Request {i+1}/{num_requests}: {req_duration:.3f}s")

                    except asyncio.TimeoutError:
                        errors.append(f"Timeout on request {i+1}")
                    except Exception as e:
                        errors.append(f"Request {i+1}: {e}")

                    # Small delay between requests
                    await asyncio.sleep(0.1)

            duration = time.time() - start_time

            if latencies.count > 0:
                metrics = {
                    "latency": latencies.to_dict(),
                    "errors": errors[:10],  # First 10 errors
                    "total_errors": len(errors)
                }

                self.log(f"Mean: {latencies.mean*1000:.1f}ms, P95: {latencies.p95*1000:.1f}ms")

                return BenchmarkResult(
                    name=name,
                    status="PASS",
                    duration=duration,
                    metrics=metrics
                )
            else:
                return BenchmarkResult(
                    name=name,
                    status="FAIL",
                    duration=duration,
                    metrics={},
                    error="No successful requests"
                )

        except ImportError as e:
            return BenchmarkResult(
                name=name,
                status="SKIP",
                duration=time.time() - start_time,
                metrics={},
                error=str(e)
            )
        except Exception as e:
            return BenchmarkResult(
                name=name,
                status="FAIL",
                duration=time.time() - start_time,
                metrics={},
                error=str(e)
            )

    async def benchmark_throughput(
        self,
        duration_seconds: int = 10,
        concurrent_requests: int = 5
    ) -> BenchmarkResult:
        """
        Benchmark 2: Throughput (Requests Per Second)

        Measures:
        - Total requests
        - Successful requests
        - Failed requests
        - Success rate
        - RPS (total)
        - RPS (successful)
        """
        name = "Throughput (RPS)"
        start_time = time.time()

        throughput = ThroughputMetrics()
        errors = []

        if not HAS_AIOHTTP:
            return BenchmarkResult(
                name=name,
                status="SKIP",
                duration=0,
                metrics={"reason": "aiohttp not installed"}
            )

        try:
            import aiohttp

            async def make_request(session, request_id):
                try:
                    async with session.post(
                        f"{self.lm_studio_url}/chat/completions",
                        json={
                            "messages": [{"role": "user", "content": "test"}],
                            "stream": False,
                            "max_tokens": 5
                        },
                        timeout=aiohttp.ClientTimeout(total=30)
                    ) as response:
                        return response.status == 200
                except Exception:
                    return False

            end_time = start_time + duration_seconds

            async with aiohttp.ClientSession() as session:
                request_id = 0

                while time.time() < end_time:
                    # Launch concurrent requests
                    tasks = []
                    for _ in range(concurrent_requests):
                        if time.time() >= end_time:
                            break
                        request_id += 1
                        throughput.total_requests += 1
                        tasks.append(make_request(session, request_id))

                    # Wait for all requests to complete
                    results = await asyncio.gather(*tasks, return_exceptions=True)

                    for result in results:
                        if result is True:
                            throughput.successful_requests += 1
                        else:
                            throughput.failed_requests += 1

                    self.log(f"Progress: {throughput.total_requests} requests, "
                            f"{throughput.successful_requests} successful")

                    # Small delay before next batch
                    await asyncio.sleep(0.05)

            throughput.total_duration = time.time() - start_time

            metrics = {
                "throughput": throughput.to_dict(),
                "errors_sample": errors[:10]
            }

            self.log(f"RPS: {throughput.rps:.2f}, Success rate: {throughput.success_rate:.1f}%")

            return BenchmarkResult(
                name=name,
                status="PASS",
                duration=throughput.total_duration,
                metrics=metrics
            )

        except Exception as e:
            return BenchmarkResult(
                name=name,
                status="FAIL",
                duration=time.time() - start_time,
                metrics={},
                error=str(e)
            )

    async def benchmark_shm_performance(
        self,
        iterations: int = 20
    ) -> BenchmarkResult:
        """
        Benchmark 3: Software SHM Performance

        Measures:
        - Health check latency (mean, median, P95)
        - Cache effectiveness
        """
        name = "Software SHM Performance"
        start_time = time.time()

        latencies = LatencyMetrics()
        cache_hits = 0
        cache_misses = 0

        try:
            shm = SoftwareSHM(project_root=str(self.project_root))

            # First run (cache miss)
            report = shm.check_health(use_cache=False)
            latencies.add(time.time() - start_time)
            cache_misses += 1

            # Subsequent runs (mix of cache hits and misses)
            for i in range(iterations - 1):
                req_start = time.time()
                use_cache = i % 3 != 0  # Use cache 2/3 of the time
                report = shm.check_health(use_cache=use_cache)
                req_duration = time.time() - req_start

                latencies.add(req_duration)

                if use_cache:
                    cache_hits += 1
                else:
                    cache_misses += 1

                self.log(f"Iteration {i+1}/{iterations}: {req_duration:.3f}s (cached: {use_cache})")

            # Get final cache stats
            cache_stats = shm.get_cache_stats()

            duration = time.time() - start_time

            metrics = {
                "latency": latencies.to_dict(),
                "cache_stats": cache_stats,
                "pas_score": report.score,
                "pas_status": report.status
            }

            self.log(f"Mean: {latencies.mean*1000:.1f}ms, Cache hit rate: {cache_stats['hit_rate']*100:.1f}%")

            return BenchmarkResult(
                name=name,
                status="PASS",
                duration=duration,
                metrics=metrics
            )

        except Exception as e:
            return BenchmarkResult(
                name=name,
                status="FAIL",
                duration=time.time() - start_time,
                metrics={},
                error=str(e)
            )

    async def benchmark_message_serialization(
        self,
        iterations: int = 10000
    ) -> BenchmarkResult:
        """
        Benchmark 4: Message Serialization Performance

        Measures:
        - Neural state message creation time
        - Token message creation time
        - JSON serialization time
        - Throughput (messages/second)
        """
        name = "Message Serialization"
        start_time = time.time()

        try:
            bridge = LMStudioBridge()

            # Benchmark neural state message creation
            neural_latencies = []
            for _ in range(iterations // 2):
                msg_start = time.time()
                message = bridge.create_neural_state_message(0.8)
                json_str = json.dumps(message)
                msg_duration = time.time() - msg_start
                neural_latencies.append(msg_duration)

            # Benchmark token message creation
            token_latencies = []
            for _ in range(iterations // 2):
                msg_start = time.time()
                message = bridge.create_token_message("test", 12345, 1.0, 0)
                json_str = json.dumps(message)
                msg_duration = time.time() - msg_start
                token_latencies.append(msg_duration)

            all_latencies = neural_latencies + token_latencies

            duration = time.time() - start_time

            metrics = {
                "neural_state": {
                    "mean_ms": statistics.mean(neural_latencies) * 1000,
                    "min_ms": min(neural_latencies) * 1000,
                    "max_ms": max(neural_latencies) * 1000
                },
                "token_message": {
                    "mean_ms": statistics.mean(token_latencies) * 1000,
                    "min_ms": min(token_latencies) * 1000,
                    "max_ms": max(token_latencies) * 1000
                },
                "overall": {
                    "total_messages": iterations,
                    "duration_seconds": duration,
                    "messages_per_second": iterations / duration,
                    "mean_latency_ms": statistics.mean(all_latencies) * 1000
                }
            }

            self.log(f"Messages/sec: {metrics['overall']['messages_per_second']:.0f}")

            return BenchmarkResult(
                name=name,
                status="PASS",
                duration=duration,
                metrics=metrics
            )

        except Exception as e:
            return BenchmarkResult(
                name=name,
                status="FAIL",
                duration=time.time() - start_time,
                metrics={},
                error=str(e)
            )

    def print_report(self):
        """Print benchmark report"""
        print("\n" + "=" * 70)
        print("NEURAL PIPELINE BENCHMARK REPORT")
        print("=" * 70)
        print(f"Timestamp: {datetime.now().isoformat()}")
        print()

        for result in self.results:
            status_symbol = {
                "PASS": "✓",
                "FAIL": "✗",
                "SKIP": "○"
            }.get(result.status, "?")

            print(f"{status_symbol} {result.name}")
            print(f"   Status: {result.status}")
            print(f"   Duration: {result.duration:.3f}s")

            if result.error:
                print(f"   Error: {result.error}")

            # Print key metrics
            if "latency" in result.metrics:
                lat = result.metrics["latency"]
                if "mean" in lat:
                    print(f"   Latency - Mean: {lat['mean']*1000:.1f}ms, "
                          f"Median: {lat['median']*1000:.1f}ms, "
                          f"P95: {lat['p95']*1000:.1f}ms")

            if "throughput" in result.metrics:
                tp = result.metrics["throughput"]
                if "rps" in tp:
                    print(f"   Throughput - RPS: {tp['rps']:.2f}, "
                          f"Success rate: {tp['success_rate']:.1f}%")

            if "overall" in result.metrics:
                ov = result.metrics["overall"]
                if "messages_per_second" in ov:
                    print(f"   Message throughput: {ov['messages_per_second']:.0f} msg/s")

            print()

        print("=" * 70)

    def save_results(self, output_path: str):
        """Save benchmark results to JSON file"""
        data = {
            "timestamp": datetime.now().isoformat(),
            "results": [r.to_dict() for r in self.results]
        }

        with open(output_path, 'w') as f:
            json.dump(data, f, indent=2)

        print(f"Results saved to: {output_path}")

    async def run_all(
        self,
        lm_studio_requests: int = 50,
        throughput_duration: int = 10,
        shm_iterations: int = 20,
        msg_iterations: int = 10000
    ):
        """Run all benchmarks"""
        print("\n" + "=" * 70)
        print("NEURAL PIPELINE BENCHMARK SUITE")
        print("=" * 70)
        print(f"Started at: {datetime.now().isoformat()}")
        print()

        # Run benchmarks
        self.results.append(await self.benchmark_lm_studio_latency(lm_studio_requests))
        print()

        self.results.append(await self.benchmark_throughput(throughput_duration))
        print()

        self.results.append(await self.benchmark_shm_performance(shm_iterations))
        print()

        self.results.append(await self.benchmark_message_serialization(msg_iterations))
        print()

        # Print report
        self.print_report()

        return self.results


async def main():
    """Main entry point"""
    import argparse

    parser = argparse.ArgumentParser(
        description="Neural Pipeline Performance Benchmarking"
    )
    parser.add_argument(
        "-v", "--verbose",
        action="store_true",
        help="Enable verbose output"
    )
    parser.add_argument(
        "--lm-requests",
        type=int,
        default=50,
        help="Number of requests for latency benchmark (default: 50)"
    )
    parser.add_argument(
        "--throughput-duration",
        type=int,
        default=10,
        help="Duration in seconds for throughput benchmark (default: 10)"
    )
    parser.add_argument(
        "--shm-iterations",
        type=int,
        default=20,
        help="Iterations for SHM benchmark (default: 20)"
    )
    parser.add_argument(
        "--msg-iterations",
        type=int,
        default=10000,
        help="Iterations for message serialization benchmark (default: 10000)"
    )
    parser.add_argument(
        "-o", "--output",
        type=str,
        default=None,
        help="Output path for JSON results"
    )

    args = parser.parse_args()

    benchmark = NeuralPipelineBenchmark(verbose=args.verbose)
    await benchmark.run_all(
        lm_studio_requests=args.lm_requests,
        throughput_duration=args.throughput_duration,
        shm_iterations=args.shm_iterations,
        msg_iterations=args.msg_iterations
    )

    if args.output:
        benchmark.save_results(args.output)


if __name__ == "__main__":
    asyncio.run(main())
