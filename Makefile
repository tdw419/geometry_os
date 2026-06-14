# Geometry OS Build System
# Unified incremental build with automatic testing support
#
# Usage:
#   make build        - Build all components
#   make test         - Run all tests
#   make watch        - Auto-run tests on file changes
#   make lint         - Run all linters
#   make ci           - Full CI pipeline locally
#   make clean        - Clean build artifacts

SHELL := /bin/bash
.PHONY: all build test watch lint ci clean install-deps \
        build-rust build-python test-rust test-python \
        lint-python lint-rust format check-format \
        bench coverage help

# Colors for output
RED    := \033[0;31m
GREEN  := \033[0;32m
YELLOW := \033[0;33m
BLUE   := \033[0;34m
RESET  := \033[0m

# Project paths
PROJECT_ROOT := $(shell pwd)
RUST_DIR     := systems/infinite_map_rs
PYTHON_DIRS  := systems tests
TEST_DIR     := tests

# Rust target directory (for caching)
CARGO_TARGET_DIR ?= $(RUST_DIR)/target

# Default target
all: build

# ============================================================================
# Installation & Setup
# ============================================================================

install-deps: ## Install all dependencies
	@echo "$(BLUE)Installing Python dependencies...$(RESET)"
	pip3 install -r requirements.txt
	pip3 install -r requirements-dev.txt 2>/dev/null || true
	@echo "$(BLUE)Installing Rust toolchain...$(RESET)"
	rustup show active-toolchain || curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
	@echo "$(GREEN)Dependencies installed successfully!$(RESET)"

# ============================================================================
# Build Targets
# ============================================================================

build: build-rust build-python ## Build all components (incremental)
	@echo "$(GREEN)✓ Build complete$(RESET)"

build-rust: ## Build Rust compositor (incremental via cargo)
	@echo "$(BLUE)Building Rust components...$(RESET)"
	cd $(RUST_DIR) && cargo build --all-features $(CARGO_FLAGS) 2>&1 | tee -a $(PROJECT_ROOT)/.build.log
	@touch .build-rust-stamp

build-python: ## Build Python bytecode cache (incremental)
	@echo "$(BLUE)Compiling Python bytecode...$(RESET)"
	@for dir in $(PYTHON_DIRS); do \
		if [ -d "$$dir" ]; then \
			python3 -m compileall -q $$dir 2>/dev/null || true; \
		fi; \
	done
	@touch .build-python-stamp

build-release: ## Build Rust in release mode
	@echo "$(BLUE)Building Rust components (release)...$(RESET)"
	cd $(RUST_DIR) && cargo build --release --all-features
	@touch .build-rust-release-stamp

# ============================================================================
# Test Targets
# ============================================================================

test: test-python test-rust ## Run all tests
	@echo "$(GREEN)✓ All tests passed$(RESET)"

test-python: ## Run Python tests (incremental via pytest cache)
	@echo "$(BLUE)Running Python tests...$(RESET)"
	python3 -m pytest $(TEST_DIR) \
		--tb=short \
		--strict-markers \
		-x \
		$(PYTEST_ARGS) \
		$(PYTEST_EXTRA)

test-rust: ## Run Rust tests
	@echo "$(BLUE)Running Rust tests...$(RESET)"
	cd $(RUST_DIR) && cargo test --all-features --no-fail-fast $(CARGO_TEST_FLAGS) 2>&1

test-unit: ## Run only unit tests (fast)
	@echo "$(BLUE)Running unit tests only...$(RESET)"
	python3 -m pytest $(TEST_DIR) -m "not integration and not slow" \
		--tb=short -x $(PYTEST_ARGS)

test-integration: ## Run integration tests
	@echo "$(BLUE)Running integration tests...$(RESET)"
	python3 -m pytest $(TEST_DIR) -m "integration" \
		--tb=short $(PYTEST_ARGS)

test-async: ## Run async tests only
	@echo "$(BLUE)Running async tests...$(RESET)"
	python3 -m pytest $(TEST_DIR) -k "async" \
		--asyncio-mode=auto \
		--tb=short $(PYTEST_ARGS)

test-coverage: ## Run tests with coverage report
	@echo "$(BLUE)Running tests with coverage...$(RESET)"
	python3 -m pytest $(TEST_DIR) \
		--cov=systems \
		--cov=core \
		--cov-report=html:htmlcov \
		--cov-report=term-missing \
		--cov-report=json:coverage.json \
		--cov-fail-under=30 \
		$(PYTEST_ARGS)
	@echo "$(GREEN)Coverage report: htmlcov/index.html$(RESET)"

test-coverage-full: ## Run all tests with full coverage (including integration)
	@echo "$(BLUE)Running all tests with full coverage...$(RESET)"
	python3 -m pytest $(TEST_DIR) \
		--cov=systems \
		--cov=core \
		--cov-report=html:htmlcov \
		--cov-report=term-missing \
		--cov-report=json:coverage.json \
		--cov-report=xml:coverage.xml \
		$(PYTEST_ARGS)
	@echo "$(GREEN)Coverage report: htmlcov/index.html$(RESET)"

test-parallel: ## Run tests in parallel (auto-detect workers)
	@echo "$(BLUE)Running tests in parallel...$(RESET)"
	python3 -m pytest $(TEST_DIR) \
		-n auto \
		--dist loadscope \
		--tb=short \
		$(PYTEST_ARGS)

test-report: ## Run tests and generate HTML report
	@echo "$(BLUE)Running tests with HTML report...$(RESET)"
	python3 -m pytest $(TEST_DIR) \
		--html=test-report.html \
		--self-contained-html \
		--tb=short \
		$(PYTEST_ARGS)
	@echo "$(GREEN)Test report: test-report.html$(RESET)"

test-ci: ## Run tests for CI (with JUnit XML output)
	@echo "$(BLUE)Running tests for CI...$(RESET)"
	python3 -m pytest $(TEST_DIR) \
		--junitxml=junit.xml \
		--cov=systems \
		--cov-report=xml:coverage.xml \
		--cov-report=json:coverage.json \
		--tb=short \
		$(PYTEST_ARGS)

test-random: ## Run tests in random order (find hidden dependencies)
	@echo "$(BLUE)Running tests in random order...$(RESET)"
	python3 -m pytest $(TEST_DIR) \
		--randomly-seed=last \
		--tb=short \
		$(PYTEST_ARGS)

test-property: ## Run property-based tests (Hypothesis)
	@echo "$(BLUE)Running property-based tests...$(RESET)"
	python3 -m pytest $(TEST_DIR) \
		-k "property or hypothesis" \
		--hypothesis-seed=0 \
		--tb=short \
		$(PYTEST_ARGS)

test-benchmark: ## Run benchmark tests
	@echo "$(BLUE)Running benchmark tests...$(RESET)"
	python3 -m pytest $(TEST_DIR) \
		--benchmark-only \
		--benchmark-autosave \
		$(PYTEST_ARGS)

# ============================================================================
# Watch Mode - Auto-run tests on file changes
# ============================================================================

watch: ## Watch for file changes and run tests automatically
	@echo "$(BLUE)Starting file watcher...$(RESET)"
	@echo "$(YELLOW)Watching: $(PYTHON_DIRS) $(RUST_DIR)/src$(RESET)"
	@echo "$(YELLOW)Press Ctrl+C to stop$(RESET)"
	@$(PROJECT_ROOT)/watch.sh

watch-python: ## Watch Python files only
	@echo "$(BLUE)Watching Python files...$(RESET)"
	@command -v pytest-watch >/dev/null 2>&1 || pip3 install pytest-watch
	pytest-watch $(TEST_DIR) -- -x --tb=short

watch-rust: ## Watch Rust files only
	@echo "$(BLUE)Watching Rust files...$(RESET)"
	@command -v cargo-watch >/dev/null 2>&1 || cargo install cargo-watch
	cd $(RUST_DIR) && cargo watch -x test

# ============================================================================
# Linting & Formatting
# ============================================================================

lint: lint-python lint-rust ## Run all linters
	@echo "$(GREEN)✓ Linting complete$(RESET)"

lint-python: ## Run Python linters (ruff, mypy)
	@echo "$(BLUE)Running Python linters...$(RESET)"
	@command -v ruff >/dev/null 2>&1 || pip3 install ruff
	ruff check $(PYTHON_DIRS) --fix || true
	@echo "$(BLUE)Running type checker...$(RESET)"
	@command -v mypy >/dev/null 2>&1 || pip3 install mypy
	mypy $(PYTHON_DIRS) --ignore-missing-imports || true

lint-rust: ## Run Rust linters (clippy)
	@echo "$(BLUE)Running Rust linters...$(RESET)"
	cd $(RUST_DIR) && cargo clippy --all-features -- -D warnings 2>&1 || true

format: ## Format all code
	@echo "$(BLUE)Formatting code...$(RESET)"
	@command -v ruff >/dev/null 2>&1 || pip3 install ruff
	ruff format $(PYTHON_DIRS)
	cd $(RUST_DIR) && cargo fmt
	@echo "$(GREEN)✓ Formatting complete$(RESET)"

check-format: ## Check formatting without modifying
	@echo "$(BLUE)Checking code format...$(RESET)"
	ruff format --check $(PYTHON_DIRS) || true
	cd $(RUST_DIR) && cargo fmt --check || true

# ============================================================================
# Benchmarks
# ============================================================================

bench: ## Run performance benchmarks
	@echo "$(BLUE)Running benchmarks...$(RESET)"
	cd $(RUST_DIR) && cargo bench --all-features
	python3 -m pytest $(TEST_DIR)/test_brain_benchmarks.py -v

bench-quick: ## Run quick benchmarks (reduced sample size)
	@echo "$(BLUE)Running quick benchmarks...$(RESET)"
	cd $(RUST_DIR) && cargo bench --all-features -- --sample-size 10
	python3 benchmarks/comprehensive_benchmark.py --quick

bench-compare: ## Compare benchmarks with baseline
	@echo "$(BLUE)Comparing benchmarks with baseline...$(RESET)"
	python3 benchmarks/run_benchmarks.py --compare benchmarks/baseline_results_v2.json

bench-baseline: ## Generate new baseline benchmark results
	@echo "$(BLUE)Generating baseline benchmark results...$(RESET)"
	python3 benchmarks/comprehensive_benchmark.py -o benchmarks/baseline_results_v2.json

# ============================================================================
# Profiling
# ============================================================================

profile-check: ## Check profiling tool dependencies
	@echo "$(BLUE)Checking profiling dependencies...$(RESET)"
	python3 scripts/profiling/profile_toolkit.py check

profile-cpu: ## Profile CPU usage (use MODULE=name or SCRIPT=path)
	@echo "$(BLUE)CPU profiling...$(RESET)"
	@if [ -n "$(MODULE)" ]; then \
		python3 scripts/profiling/profile_toolkit.py cpu --module $(MODULE) $(if $(FUNCTION),--function $(FUNCTION)) --output profiling_results; \
	elif [ -n "$(SCRIPT)" ]; then \
		python3 scripts/profiling/profile_toolkit.py cpu --script $(SCRIPT) --output profiling_results; \
	else \
		echo "$(YELLOW)Usage: make profile-cpu MODULE=systems.evolution_daemon$(RESET)"; \
		echo "$(YELLOW)   or: make profile-cpu SCRIPT=tests/test_brain.py$(RESET)"; \
	fi

profile-memory: ## Profile memory usage (use MODULE=name or SCRIPT=path)
	@echo "$(BLUE)Memory profiling...$(RESET)"
	@if [ -n "$(MODULE)" ]; then \
		python3 scripts/profiling/profile_toolkit.py memory --module $(MODULE) --output profiling_results; \
	elif [ -n "$(SCRIPT)" ]; then \
		python3 scripts/profiling/profile_toolkit.py memory --script $(SCRIPT) --output profiling_results; \
	else \
		echo "$(YELLOW)Usage: make profile-memory MODULE=systems.evolution_daemon$(RESET)"; \
		echo "$(YELLOW)   or: make profile-memory SCRIPT=tests/test_brain.py$(RESET)"; \
	fi

profile-flamegraph: ## Generate flamegraph (use PID=1234 or BINARY=path)
	@echo "$(BLUE)Generating flamegraph...$(RESET)"
	@if [ -n "$(PID)" ]; then \
		python3 scripts/profiling/profile_toolkit.py flamegraph --pid $(PID) --output profiling_results; \
	elif [ -n "$(BINARY)" ]; then \
		python3 scripts/profiling/profile_toolkit.py flamegraph --binary $(BINARY) --output profiling_results; \
	else \
		echo "$(YELLOW)Usage: make profile-flamegraph PID=12345$(RESET)"; \
		echo "$(YELLOW)   or: make profile-flamegraph BINARY=$(RUST_DIR)/target/release/infinite_map_rs$(RESET)"; \
	fi

profile-rust: ## Profile Rust binary with cargo-flamegraph
	@echo "$(BLUE)Profiling Rust code...$(RESET)"
	@command -v cargo-flamegraph >/dev/null 2>&1 || cargo install flamegraph
	cd $(RUST_DIR) && cargo flamegraph --root --open

profile-rust-bench: ## Profile Rust benchmarks with flamegraph
	@echo "$(BLUE)Profiling Rust benchmarks...$(RESET)"
	@command -v cargo-flamegraph >/dev/null 2>&1 || cargo install flamegraph
	cd $(RUST_DIR) && cargo flamegraph --root --bench compositor_benchmark -- --bench

profile-heap: ## Profile heap allocations (requires valgrind)
	@echo "$(BLUE)Heap profiling with valgrind...$(RESET)"
	@if [ -z "$(BINARY)" ]; then \
		echo "$(YELLOW)Usage: make profile-heap BINARY=path/to/binary$(RESET)"; \
	else \
		mkdir -p profiling_results; \
		valgrind --tool=massif --massif-out-file=profiling_results/massif.out $(BINARY); \
		ms_print profiling_results/massif.out; \
	fi

profile-callgrind: ## Profile with callgrind (requires valgrind)
	@echo "$(BLUE)Callgrind profiling...$(RESET)"
	@if [ -z "$(BINARY)" ]; then \
		echo "$(YELLOW)Usage: make profile-callgrind BINARY=path/to/binary$(RESET)"; \
	else \
		mkdir -p profiling_results; \
		valgrind --tool=callgrind --callgrind-out-file=profiling_results/callgrind.out $(BINARY); \
		echo "$(GREEN)Results: profiling_results/callgrind.out$(RESET)"; \
		echo "$(GREEN)Visualize with: kcachegrind profiling_results/callgrind.out$(RESET)"; \
	fi

perf-report: ## Generate comprehensive performance report
	@echo "$(BLUE)Generating performance report...$(RESET)"
	@mkdir -p profiling_results
	@echo "\n=== Python Benchmarks ===" > profiling_results/perf_report.txt
	@python3 benchmarks/comprehensive_benchmark.py -o profiling_results/benchmark_$(shell date +%Y%m%d_%H%M%S).json 2>&1 | tee -a profiling_results/perf_report.txt
	@echo "\n=== Rust Benchmarks ===" >> profiling_results/perf_report.txt
	@cd $(RUST_DIR) && cargo bench --all-features 2>&1 | tee -a $(PROJECT_ROOT)/profiling_results/perf_report.txt
	@echo "$(GREEN)Report saved to profiling_results/perf_report.txt$(RESET)"

# ============================================================================
# CI Pipeline
# ============================================================================

ci: clean install-deps lint build test ## Run full CI pipeline locally
	@echo "$(GREEN)✓ CI pipeline passed$(RESET)"

ci-quick: lint-python test-unit ## Quick CI check (lint + unit tests only)
	@echo "$(GREEN)✓ Quick CI check passed$(RESET)"

# ============================================================================
# Cleanup
# ============================================================================

clean: ## Clean all build artifacts
	@echo "$(YELLOW)Cleaning build artifacts...$(RESET)"
	rm -rf .build.log .build-*-stamp
	rm -rf htmlcov .coverage .pytest_cache .ruff_cache
	rm -rf __pycache__ */__pycache__ */*/__pycache__
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete 2>/dev/null || true
	find . -type f -name "*.pyo" -delete 2>/dev/null || true
	cd $(RUST_DIR) && cargo clean 2>/dev/null || true
	@echo "$(GREEN)✓ Clean complete$(RESET)"

clean-deep: clean ## Deep clean including caches
	@echo "$(YELLOW)Deep cleaning caches...$(RESET)"
	rm -rf ~/.cache/pip
	rm -rf $(CARGO_TARGET_DIR)
	@echo "$(GREEN)✓ Deep clean complete$(RESET)"

# ============================================================================
# Development Helpers
# ============================================================================

check-changes: ## Check which files changed since last build
	@echo "$(BLUE)Checking for changes...$(RESET)"
	@if [ -f .build-rust-stamp ]; then \
		echo "$(YELLOW)Rust changes:$(RESET)"; \
		find $(RUST_DIR)/src -newer .build-rust-stamp -type f 2>/dev/null | head -10; \
	fi
	@if [ -f .build-python-stamp ]; then \
		echo "$(YELLOW)Python changes:$(RESET)"; \
		find $(PYTHON_DIRS) -newer .build-python-stamp -name "*.py" -type f 2>/dev/null | head -10; \
	fi

status: ## Show build status
	@echo "$(BLUE)Build Status:$(RESET)"
	@echo "  Python stamp: $$(stat -c %y .build-python-stamp 2>/dev/null || echo 'not built')"
	@echo "  Rust stamp:   $$(stat -c %y .build-rust-stamp 2>/dev/null || echo 'not built')"
	@echo ""
	@echo "$(BLUE)Test cache:$(RESET)"
	@ls -la .pytest_cache 2>/dev/null || echo "  No test cache"

help: ## Show this help message
	@echo "$(BLUE)Geometry OS Build System$(RESET)"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  $(YELLOW)%-20s$(RESET) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(BLUE)Environment Variables:$(RESET)"
	@echo "  PYTEST_ARGS      Additional pytest arguments"
	@echo "  CARGO_FLAGS      Additional cargo build arguments"
	@echo "  CARGO_TEST_FLAGS Additional cargo test arguments"
