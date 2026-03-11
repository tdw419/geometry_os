# Delta for visual-shell

## ADDED Requirements

### Requirement: Golden Path Boot Test
The Visual Shell SHALL provide a Golden Path Boot Test that verifies end-to-end GPU-native RISC-V execution with AI control via WebMCP.

#### Scenario: Hypervisor Ready Check
- **WHEN** the test starts
- **THEN** it SHALL verify the WebMCP bridge is available
- **AND** it SHALL verify the hypervisor is initialized

#### Scenario: Boot Completion Detection
- **WHEN** waiting for boot
- **THEN** the test SHALL poll console output for shell prompt indicators
- **AND** it SHALL detect patterns: `login:`, `# `, `$ `, `alpine`
- **AND** it SHALL timeout after 45 seconds if no prompt detected

#### Scenario: Command Execution via WebMCP
- **WHEN** the shell prompt is detected
- **THEN** the test SHALL send `uname -a\n` via `hypervisor_input` tool
- **AND** it SHALL fallback to direct `injectInput` if WebMCP fails

#### Scenario: Output Validation
- **WHEN** the command completes
- **THEN** the test SHALL capture console output
- **AND** it SHALL validate output contains `riscv64`
- **AND** it SHALL set `outputValid = true` on success

### Requirement: Test Runner Availability
The Visual Shell SHALL provide multiple test execution environments.

#### Scenario: Browser Console Runner
- **WHEN** `window.runGoldenPathTest()` is called
- **THEN** it SHALL execute the Golden Path Boot Test
- **AND** it SHALL return a results object

#### Scenario: HTML Test Page
- **WHEN** `test_golden_path.html` is opened
- **THEN** it SHALL display boot controls
- **AND** it SHALL provide a "Run Golden Path Test" button

#### Scenario: Node.js CI Runner
- **WHEN** `node tests/test_golden_path_node.js` is executed
- **THEN** it SHALL run with mocked WebMCP bridge
- **AND** it SHALL exit with code 0 on success
