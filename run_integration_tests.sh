#!/bin/bash
# VectorOS Integration Test Runner
# Comprehensive CI/CD integration for VectorOS end-to-end testing

set -e  # Exit on any error

# Configuration
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEST_RESULTS_DIR="${PROJECT_ROOT}/test_results"
COVERAGE_DIR="${TEST_RESULTS_DIR}/coverage"
LOG_FILE="${TEST_RESULTS_DIR}/integration_test.log"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Setup function
setup_test_environment() {
    log_info "Setting up test environment..."

    # Create test results directory
    mkdir -p "$TEST_RESULTS_DIR"
    mkdir -p "$COVERAGE_DIR"

    # Clean up any existing test artifacts
    rm -f "$LOG_FILE"

    # Check Python availability
    if ! command -v python3 &> /dev/null; then
        log_error "Python 3 is not available"
        exit 1
    fi

    # Check pytest availability
    if ! python3 -m pytest --version &> /dev/null; then
        log_error "pytest is not available. Install with: pip install pytest"
        exit 1
    fi

    # Check coverage availability (optional)
    if python3 -m pytest --cov --version &> /dev/null 2>/dev/null; then
        COVERAGE_AVAILABLE=true
        log_info "Coverage reporting is available"
    else
        COVERAGE_AVAILABLE=false
        log_warning "Coverage reporting not available (install pytest-cov for coverage reports)"
    fi

    log_success "Test environment setup complete"
}

# Run unit tests
run_unit_tests() {
    log_info "Running unit tests..."

    local test_cmd="python3 -m pytest tests/ -v --tb=short --continue-on-collection-errors --ignore=tests/intelligence --ignore=tests/skills --ignore=tests/system --junitxml=${TEST_RESULTS_DIR}/unit_tests.xml"

    if [ "$COVERAGE_AVAILABLE" = true ]; then
        # Test if coverage actually works
        if python3 -c "import pytest_cov" 2>/dev/null; then
            test_cmd="$test_cmd --cov=. --cov-report=html:${COVERAGE_DIR} --cov-report=xml:${TEST_RESULTS_DIR}/coverage.xml"
        else
            log_warning "pytest-cov not properly installed, skipping coverage"
            COVERAGE_AVAILABLE=false
        fi
    fi

    if eval "$test_cmd"; then
        log_success "Unit tests passed"
        return 0
    else
        log_error "Unit tests failed"
        return 1
    fi
}

# Run integration tests
run_integration_tests() {
    log_info "Running integration tests..."

    local test_cmd="python3 -m pytest tests/integration/ -v --tb=short --junitxml=${TEST_RESULTS_DIR}/integration_tests.xml"

    if [ "$COVERAGE_AVAILABLE" = true ]; then
        # Test if coverage actually works
        if python3 -c "import pytest_cov" 2>/dev/null; then
            test_cmd="$test_cmd --cov=. --cov-report=html:${COVERAGE_DIR} --cov-report=xml:${TEST_RESULTS_DIR}/integration_coverage.xml --cov-append"
        else
            log_warning "pytest-cov not properly installed, skipping coverage"
            COVERAGE_AVAILABLE=false
        fi
    fi

    if eval "$test_cmd"; then
        log_success "Integration tests passed"
        return 0
    else
        log_error "Integration tests failed"
        return 1
    fi
}

# Run performance benchmarks
run_performance_tests() {
    log_info "Running performance benchmarks..."

    if python3 -m pytest test_integration.py::TestPerformanceBenchmarks -v --tb=short --junitxml=${TEST_RESULTS_DIR}/performance_tests.xml; then
        log_success "Performance tests passed"
        return 0
    else
        log_error "Performance tests failed"
        return 1
    fi
}

# Generate test report
generate_report() {
    log_info "Generating test report..."

    local report_file="${TEST_RESULTS_DIR}/test_report.md"

    cat > "$report_file" << EOF
# VectorOS Integration Test Report
Generated: $(date)

## Test Results Summary

### Unit Tests
$(if [ -f "${TEST_RESULTS_DIR}/unit_tests.xml" ]; then
    echo "- Results: Available in unit_tests.xml"
else
    echo "- Status: Not run"
fi)

### Integration Tests
$(if [ -f "${TEST_RESULTS_DIR}/integration_tests.xml" ]; then
    echo "- Results: Available in integration_tests.xml"
else
    echo "- Status: Not run"
fi)

### Performance Tests
$(if [ -f "${TEST_RESULTS_DIR}/performance_tests.xml" ]; then
    echo "- Results: Available in performance_tests.xml"
else
    echo "- Status: Not run"
fi)

### Coverage
$(if [ "$COVERAGE_AVAILABLE" = true ] && [ -d "${COVERAGE_DIR}" ]; then
    echo "- HTML Report: ${COVERAGE_DIR}/index.html"
    echo "- XML Report: Available in coverage XML files"
else
    echo "- Status: Not available"
fi)

## Test Categories Covered

1. **System Boot Process** - GGUF loading to shell interaction
2. **Agent Lifecycle** - Creation, perception, action, memory operations
3. **CTRM Safety Validation** - Decision validation with confidence thresholds
4. **Evolution Loop** - Introspection, code generation, mutation application
5. **Metabolic Daemon** - Continuous optimization and entropy monitoring
6. **LLM Synthesis Toolchain** - Integration with RTS mutations
7. **Phase 7 Features** - Init system, hallucination engine, deep sleep
8. **Cross-Component Interactions** - Data flow validation
9. **Error Handling** - Recovery scenarios
10. **Performance Benchmarks** - Critical path timing

## Logs
- Full log: ${LOG_FILE}
- Test results: ${TEST_RESULTS_DIR}/

---
*Report generated by VectorOS CI/CD pipeline*
EOF

    log_success "Test report generated: $report_file"
}

# Main execution
main() {
    # Create test results directory FIRST before any logging
    mkdir -p "$TEST_RESULTS_DIR"
    mkdir -p "$COVERAGE_DIR"

    local run_unit=true
    local run_integration=true
    local run_performance=true

    # Parse command line arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --no-unit)
                run_unit=false
                shift
                ;;
            --no-integration)
                run_integration=false
                shift
                ;;
            --no-performance)
                run_performance=false
                shift
                ;;
            --only-unit)
                run_unit=true
                run_integration=false
                run_performance=false
                shift
                ;;
            --only-integration)
                run_unit=false
                run_integration=true
                run_performance=false
                shift
                ;;
            --only-performance)
                run_unit=false
                run_integration=false
                run_performance=true
                shift
                ;;
            --help)
                echo "Usage: $0 [OPTIONS]"
                echo ""
                echo "Options:"
                echo "  --no-unit          Skip unit tests"
                echo "  --no-integration   Skip integration tests"
                echo "  --no-performance   Skip performance tests"
                echo "  --only-unit        Run only unit tests"
                echo "  --only-integration Run only integration tests"
                echo "  --only-performance Run only performance tests"
                echo "  --help             Show this help"
                exit 0
                ;;
            *)
                log_error "Unknown option: $1"
                exit 1
                ;;
        esac
    done

    log_info "Starting VectorOS Integration Test Suite"
    log_info "========================================="

    # Setup
    setup_test_environment

    local exit_code=0

    # Run tests
    if [ "$run_unit" = true ]; then
        if ! run_unit_tests; then
            exit_code=1
        fi
    fi

    if [ "$run_integration" = true ]; then
        if ! run_integration_tests; then
            exit_code=1
        fi
    fi

    if [ "$run_performance" = true ]; then
        if ! run_performance_tests; then
            exit_code=1
        fi
    fi

    # Generate report
    generate_report

    # Summary
    log_info "========================================="
    if [ $exit_code -eq 0 ]; then
        log_success "All tests completed successfully!"
        log_info "Results available in: ${TEST_RESULTS_DIR}"
    else
        log_error "Some tests failed. Check logs for details."
        log_info "Results available in: ${TEST_RESULTS_DIR}"
    fi

    exit $exit_code
}

# Run main function
main "$@"