#!/usr/bin/env python3
"""Parse criterion benchmark results from JSON estimates."""
import json, os, glob, sys, csv

def parse_criterion_results(criterion_dir="target/criterion"):
    results = []
    for ef in sorted(glob.glob(os.path.join(criterion_dir, "*/new/estimates.json"))):
        bench_name = ef.split("/criterion/")[1].rsplit("/new/", 1)[0]
        with open(ef) as f:
            data = json.load(f)
        mean_ns = data.get("mean", {}).get("point_estimate", 0)
        median_ns = data.get("median", {}).get("point_estimate", 0)
        std_dev = data.get("std_dev", {}).get("point_estimate", 0)
        throughput = data.get("throughput", {})
        throughput_val = throughput.get("point_estimate", 0)
        throughput_unit = throughput.get("unit", "")
        results.append({
            "benchmark": bench_name,
            "mean_ns": mean_ns,
            "median_ns": median_ns,
            "std_dev_ns": std_dev,
            "throughput": throughput_val,
            "throughput_unit": throughput_unit,
        })

    # Also check subdirectory patterns (e.g., vm_arithmetic/1000_iters)
    for ef in sorted(glob.glob(os.path.join(criterion_dir, "*/*/new/estimates.json"))):
        # Skip if already caught by */new/ pattern
        if "/new/estimates.json" in ef:
            parts = ef.split("/criterion/")[1].rsplit("/new/", 1)[0]
            if parts.count("/") >= 1:
                bench_name = parts
                already = any(r["benchmark"] == bench_name for r in results)
                if not already:
                    with open(ef) as f:
                        data = json.load(f)
                    mean_ns = data.get("mean", {}).get("point_estimate", 0)
                    median_ns = data.get("median", {}).get("point_estimate", 0)
                    std_dev = data.get("std_dev", {}).get("point_estimate", 0)
                    throughput = data.get("throughput", {})
                    throughput_val = throughput.get("point_estimate", 0)
                    throughput_unit = throughput.get("unit", "")
                    results.append({
                        "benchmark": bench_name,
                        "mean_ns": mean_ns,
                        "median_ns": median_ns,
                        "std_dev_ns": std_dev,
                        "throughput": throughput_val,
                        "throughput_unit": throughput_unit,
                    })

    return results

def print_table(results):
    print(f"{'Benchmark':<55} {'Mean (ns)':>12} {'Median (ns)':>12} {'Std Dev':>10}")
    print("-" * 91)
    for r in sorted(results, key=lambda x: x["benchmark"]):
        mean_us = r["mean_ns"] / 1000.0 if r["mean_ns"] > 0 else 0
        median_us = r["median_ns"] / 1000.0 if r["median_ns"] > 0 else 0
        std_us = r["std_dev_ns"] / 1000.0 if r["std_dev_ns"] > 0 else 0
        if mean_us > 1000:
            print(f"{r['benchmark']:<55} {mean_us/1000:>10.2f} ms {median_us/1000:>10.2f} ms {std_us/1000:>8.2f} ms")
        else:
            print(f"{r['benchmark']:<55} {mean_us:>10.2f} us {median_us:>10.2f} us {std_us:>8.2f} us")

def write_csv(results, path):
    with open(path, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=["benchmark", "mean_ns", "median_ns", "std_dev_ns", "throughput", "throughput_unit"])
        writer.writeheader()
        writer.writerows(results)
    print(f"Wrote {len(results)} results to {path}")

if __name__ == "__main__":
    fmt = sys.argv[1] if len(sys.argv) > 1 else "table"
    results = parse_criterion_results()
    if not results:
        print("No benchmark results found in target/criterion/")
        sys.exit(1)
    if fmt == "csv":
        outpath = sys.argv[2] if len(sys.argv) > 2 else "benchmark_results.csv"
        write_csv(results, outpath)
    else:
        print_table(results)
