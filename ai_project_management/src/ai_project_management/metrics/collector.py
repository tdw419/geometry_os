"""Collects code metrics across the codebase."""

from pathlib import Path
from typing import Dict, List, Any
import structlog

from .rust_analyzer import RustAnalyzer

class MetricsCollector:
    """Collects structural metrics from codebase."""

    def __init__(self, codebase_path: Path):
        self.codebase_path = codebase_path
        self.logger = structlog.get_logger()

    def collect(self) -> Dict[str, Any]:
        """Collect all metrics."""
        results = {
            "sloc": 0,
            "files": 0,
            "hotspots": [],
            "maintainability": {},
            "complexity_by_file": {},
        }

        # Find all Rust files
        rust_files = list(self.codebase_path.rglob("*.rs"))
        rust_files = [f for f in rust_files if "target" not in str(f)]

        for file_path in rust_files:
            analyzer = RustAnalyzer(file_path)
            file_metrics = analyzer.analyze()

            if "error" in file_metrics:
                self.logger.debug("Skipping file due to error", file=str(file_path), error=file_metrics.get("error"))
                continue

            results["sloc"] += file_metrics["sloc"]
            results["files"] += 1

            # Track complexity
            rel_path = str(file_path.absolute().relative_to(self.codebase_path.absolute()))
            results["complexity_by_file"][rel_path] = {
                "complexity": file_metrics["cyclomatic_complexity"],
                "sloc": file_metrics["sloc"]
            }
            results["maintainability"][rel_path] = file_metrics["maintainability_index"]

            # Track hotspots (high complexity or low maintainability)
            if file_metrics["cyclomatic_complexity"] > 15 or file_metrics["maintainability_index"] < 20:
                results["hotspots"].append({
                    "file": rel_path,
                    "complexity": file_metrics["cyclomatic_complexity"],
                    "maintainability": file_metrics["maintainability_index"],
                    "functions": file_metrics["functions"]
                })

        # Sort hotspots by severity
        results["hotspots"].sort(key=lambda x: x["complexity"], reverse=True)

        self.logger.info(
            "Metrics collected",
            sloc=results["sloc"],
            files=results["files"],
            hotspots=len(results["hotspots"])
        )

        return results
