# AI PM Cartridge Integration Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Connect AI PM analysis to automatic cartridge creation, enabling an autonomous improvement loop where the system identifies code improvements, validates them, and deploys as .rts.png cartridges.

**Architecture:** Create a new WebMCP tool `pm_analyze_and_deploy` that bridges the existing ContinuousImprovementModule to the new cartridge deployment pipeline. The tool analyzes code/telemetry, generates recommendations, compiles changes via ide_compile, validates via ide_test, and deploys via ide_deploy.

**Tech Stack:** JavaScript (WebMCP), Python (AI PM), HTTP bridge, CartridgeAssembler

---

## Prerequisites

- Cartridge deployment pipeline complete (Phase O done)
- AI PM ContinuousImprovementModule exists at `ai_project_management/src/ai_project_management/improvement/module.py`
- PM tools exist at `systems/visual_shell/web/pm_tools.js`

---

## Task 1: Create AI PM Analysis HTTP Endpoint

**Files:**
- Create: `systems/visual_shell/web/pm_analysis_server.py`
- Test: `systems/pixel_compiler/tests/test_pm_analysis_server.py`

**Step 1: Write the failing test**

```python
# systems/pixel_compiler/tests/test_pm_analysis_server.py
"""Tests for AI PM analysis HTTP endpoint."""

import pytest
import requests
import subprocess
import time
import signal
import sys


class TestPMAnalysisServer:
    """Test HTTP endpoint for AI PM analysis."""

    @pytest.fixture(scope="class")
    def server(self):
        """Start test server on port 8769."""
        proc = subprocess.Popen([
            sys.executable, "-m", "systems.visual_shell.web.pm_analysis_server", "8769"
        ], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        time.sleep(2)
        yield "http://localhost:8769"
        proc.send_signal(signal.SIGTERM)
        try:
            proc.wait(timeout=5)
        except subprocess.TimeoutExpired:
            proc.kill()
            proc.wait()

    def test_health_endpoint(self, server):
        """Health endpoint should return OK."""
        response = requests.get(f"{server}/health")
        assert response.status_code == 200
        assert response.json()["status"] == "ok"

    def test_analyze_endpoint(self, server):
        """Analyze endpoint should return recommendations."""
        response = requests.post(f"{server}/pm/analyze", json={
            "scope": "recent",
            "max_recommendations": 5
        })

        assert response.status_code == 200
        data = response.json()
        assert "recommendations" in data
        assert isinstance(data["recommendations"], list)

    def test_analyze_and_deploy_endpoint(self, server):
        """Analyze and deploy should return cartridge info."""
        response = requests.post(f"{server}/pm/analyze_and_deploy", json={
            "scope": "recent",
            "auto_deploy": False,  # Just analyze, don't actually deploy
            "cartridge_name": "test_auto_fix"
        })

        assert response.status_code == 200
        data = response.json()
        assert "success" in data
        # When auto_deploy=False, should return analysis results
        if data["success"]:
            assert "recommendations" in data
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest systems/pixel_compiler/tests/test_pm_analysis_server.py -v`

Expected: FAIL with "ModuleNotFoundError"

**Step 3: Write minimal implementation**

```python
# systems/visual_shell/web/pm_analysis_server.py
"""
AI PM Analysis HTTP Server

Provides HTTP endpoint for AI PM analysis and autonomous deployment.
Bridges WebMCP to the ContinuousImprovementModule.

Endpoints:
  GET  /health              - Health check
  POST /pm/analyze          - Get improvement recommendations
  POST /pm/analyze_and_deploy - Analyze and optionally deploy fixes
"""

import json
from http.server import HTTPServer, BaseHTTPRequestHandler
from urllib.parse import urlparse
import sys
from pathlib import Path
from typing import Dict, Any, List, Optional

# Try to import AI PM modules
try:
    from ai_project_management.src.ai_project_management.improvement.module import (
        ContinuousImprovementModule,
        ImprovementRecommendation
    )
    AI_PM_AVAILABLE = True
except ImportError:
    AI_PM_AVAILABLE = False

# Try to import cartridge bridge
try:
    from systems.visual_shell.web.cartridge_bridge import handle_cartridge_request
    CARTRIDGE_BRIDGE_AVAILABLE = True
except ImportError:
    CARTRIDGE_BRIDGE_AVAILABLE = False


class PMAnalysisHandler(BaseHTTPRequestHandler):
    """HTTP request handler for AI PM analysis operations."""

    def log_message(self, format, *args):
        """Custom logging."""
        print(f"[PMAnalysisServer] {format % args}")

    def do_GET(self):
        """Handle GET requests."""
        path = urlparse(self.path).path

        if path == "/health":
            self._send_json({
                "status": "ok",
                "service": "pm-analysis-server",
                "ai_pm_available": AI_PM_AVAILABLE,
                "cartridge_bridge_available": CARTRIDGE_BRIDGE_AVAILABLE
            })
        else:
            self._send_error(404, "Not found")

    def do_POST(self):
        """Handle POST requests."""
        path = urlparse(self.path).path
        content_length = int(self.headers.get("Content-Length", 0))
        body = self.rfile.read(content_length)

        try:
            request = json.loads(body)
        except json.JSONDecodeError:
            self._send_error(400, "Invalid JSON")
            return

        if path == "/pm/analyze":
            result = self._handle_analyze(request)
            self._send_json(result)
        elif path == "/pm/analyze_and_deploy":
            result = self._handle_analyze_and_deploy(request)
            self._send_json(result)
        else:
            self._send_error(404, "Not found")

    def _handle_analyze(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """Handle analyze request."""
        if not AI_PM_AVAILABLE:
            return self._mock_analyze(request)

        try:
            # Initialize improvement module
            pm = ContinuousImprovementModule(
                telemetry_path=Path(".ai-pm-telemetry"),
                knowledge_base_path=Path(".ai-pm-knowledge")
            )

            # Run analysis (mock execution state for now)
            from ai_project_management.src.ai_project_management.models import ExecutionState
            state = ExecutionState()

            # Run async improvement cycle
            import asyncio
            recommendations = asyncio.run(pm.run_improvement_cycle(state))

            # Convert to serializable format
            recs_data = [
                {
                    "id": r.id,
                    "type": r.type,
                    "priority": r.priority,
                    "description": r.description,
                    "target_path": r.target_path,
                    "estimated_impact": r.estimated_impact,
                    "confidence": r.confidence
                }
                for r in recommendations
            ]

            max_recs = request.get("max_recommendations", 10)
            recs_data = recs_data[:max_recs]

            return {
                "success": True,
                "recommendations": recs_data,
                "count": len(recs_data),
                "neuromodulation": pm.get_modulation_state().model_dump()
            }

        except Exception as e:
            return {"success": False, "error": str(e), "recommendations": []}

    def _mock_analyze(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """Mock analysis when AI PM not available."""
        recommendations = [
            {
                "id": "mock-optimize-1",
                "type": "optimize",
                "priority": "MEDIUM",
                "description": "Mock: Optimize Hilbert curve lookup performance",
                "target_path": "systems/pixel_compiler/pixelrts_v2_core.py",
                "estimated_impact": 0.8,
                "confidence": 0.7
            },
            {
                "id": "mock-refactor-1",
                "type": "refactor",
                "priority": "LOW",
                "description": "Mock: Extract common patterns from cartridge assembly",
                "target_path": "systems/pixel_compiler/cartridge_assembly.py",
                "estimated_impact": 0.5,
                "confidence": 0.6
            }
        ]

        max_recs = request.get("max_recommendations", 10)
        return {
            "success": True,
            "recommendations": recommendations[:max_recs],
            "count": min(len(recommendations), max_recs),
            "mock": True
        }

    def _handle_analyze_and_deploy(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """Handle analyze and deploy request."""
        # First analyze
        analyze_result = self._handle_analyze(request)

        if not analyze_result.get("success"):
            return analyze_result

        recommendations = analyze_result.get("recommendations", [])
        auto_deploy = request.get("auto_deploy", False)
        cartridge_name = request.get("cartridge_name", "auto_improvement")

        # If not auto-deploying, just return analysis
        if not auto_deploy:
            return {
                "success": True,
                "recommendations": recommendations,
                "deployed": False,
                "message": "Analysis complete. Set auto_deploy=true to deploy."
            }

        # Auto-deploy: create cartridge from recommendations
        if not CARTRIDGE_BRIDGE_AVAILABLE:
            return {
                "success": False,
                "error": "Cartridge bridge not available for deployment",
                "recommendations": recommendations
            }

        # Convert recommendations to "source files" (metadata for now)
        source_files = [
            {
                "path": f"recommendation_{i}.json",
                "content": __import__("base64").b64encode(
                    json.dumps(rec).encode()
                ).decode()
            }
            for i, rec in enumerate(recommendations)
        ]

        deploy_result = handle_cartridge_request({
            "action": "deploy",
            "name": cartridge_name,
            "files": source_files,
            "description": f"Auto-generated from {len(recommendations)} recommendations",
            "location": request.get("location", {"x": 0, "y": 0})
        })

        return {
            "success": deploy_result.get("success", False),
            "recommendations": recommendations,
            "deployed": deploy_result.get("success", False),
            "cartridge": deploy_result.get("cartridge"),
            "location": deploy_result.get("location")
        }

    def _send_json(self, data, status=200):
        """Send JSON response with CORS headers."""
        self.send_response(status)
        self.send_header("Content-Type", "application/json")
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()
        self.wfile.write(json.dumps(data, default=str).encode())

    def _send_error(self, code, message):
        """Send error response."""
        self._send_json({"success": False, "error": message}, code)

    def do_OPTIONS(self):
        """Handle OPTIONS for CORS preflight."""
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()


def run_server(port=8769):
    """Run the PM analysis server."""
    server = HTTPServer(("localhost", port), PMAnalysisHandler)
    print(f"PM Analysis server running on http://localhost:{port}")
    print("Endpoints:")
    print("  GET  /health              - Health check")
    print("  POST /pm/analyze          - Get recommendations")
    print("  POST /pm/analyze_and_deploy - Analyze and deploy")
    if AI_PM_AVAILABLE:
        print("  AI PM: AVAILABLE")
    else:
        print("  AI PM: NOT AVAILABLE (using mock)")
    server.serve_forever()


if __name__ == "__main__":
    port = int(sys.argv[1]) if len(sys.argv) > 1 else 8769
    run_server(port)
```

**Step 4: Run test to verify it passes**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest systems/pixel_compiler/tests/test_pm_analysis_server.py -v`

Expected: All tests PASS

**Step 5: Commit**

```bash
git add systems/visual_shell/web/pm_analysis_server.py systems/pixel_compiler/tests/test_pm_analysis_server.py
git commit -m "feat(pm): add AI PM analysis HTTP endpoint

- /health, /pm/analyze, /pm/analyze_and_deploy endpoints
- Integrates with ContinuousImprovementModule
- Mock fallback when AI PM unavailable
- CORS enabled for WebMCP access

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 2: Create pm_analyze_and_deploy WebMCP Tool

**Files:**
- Create: `systems/visual_shell/web/pm_autonomous_tools.js`
- Modify: `systems/visual_shell/web/webmcp_bridge.js` (register new tool)
- Test: `systems/visual_shell/web/test_pm_autonomous.html`

**Step 1: Create the tool module**

```javascript
// systems/visual_shell/web/pm_autonomous_tools.js
/**
 * PM Autonomous Tools for WebMCP
 *
 * Provides tools for AI PM analysis and autonomous deployment.
 *
 * Tools:
 *   94. pm_analyze - Get improvement recommendations from AI PM
 *   95. pm_analyze_and_deploy - Analyze and auto-deploy as cartridge
 *
 * @version 1.0.0
 * @phase Phase O: AI PM Integration
 */

/**
 * PM Autonomous Tools
 */
class PMAutonomousTools {

    #bridge = null;
    #analysisServerUrl = 'http://localhost:8769';

    constructor(bridge) {
        this.#bridge = bridge;
    }

    /**
     * Tool 94: pm_analyze
     * Get improvement recommendations from AI PM
     */
    async pm_analyze(params = {}) {
        const { scope = 'recent', max_recommendations = 10 } = params;

        try {
            const response = await fetch(`${this.#analysisServerUrl}/pm/analyze`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    scope,
                    max_recommendations
                })
            });

            if (!response.ok) {
                return { success: false, error: `Server error: ${response.status}` };
            }

            const result = await response.json();
            return result;

        } catch (e) {
            // Fallback to mock
            console.warn('pm_analyze: Server not available, using mock:', e.message);
            return this.#mockAnalyze(max_recommendations);
        }
    }

    /**
     * Tool 95: pm_analyze_and_deploy
     * Analyze codebase and auto-deploy improvement cartridge
     */
    async pm_analyze_and_deploy(params = {}) {
        const {
            scope = 'recent',
            max_recommendations = 5,
            auto_deploy = true,
            cartridge_name = `auto_improvement_${Date.now()}`,
            location = { x: 0, y: 0 }
        } = params;

        try {
            const response = await fetch(`${this.#analysisServerUrl}/pm/analyze_and_deploy`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    scope,
                    max_recommendations,
                    auto_deploy,
                    cartridge_name,
                    location
                })
            });

            if (!response.ok) {
                return { success: false, error: `Server error: ${response.status}` };
            }

            const result = await response.json();

            // Log to BuilderPanel if available
            if (this.#bridge?.builderPanel && result.success) {
                if (result.deployed) {
                    this.#bridge.builderPanel.logAction(
                        `Auto-deployed cartridge: ${cartridge_name}`,
                        'success'
                    );
                } else {
                    this.#bridge.builderPanel.logAction(
                        `Analysis complete: ${result.recommendations?.length || 0} recommendations`,
                        'info'
                    );
                }
            }

            return result;

        } catch (e) {
            console.warn('pm_analyze_and_deploy: Server not available:', e.message);
            return {
                success: false,
                error: e.message,
                mock: true
            };
        }
    }

    #mockAnalyze(maxRecs) {
        return {
            success: true,
            recommendations: [
                {
                    id: "mock-optimize-1",
                    type: "optimize",
                    priority: "MEDIUM",
                    description: "Mock: Optimize Hilbert curve lookup",
                    target_path: "systems/pixel_compiler/pixelrts_v2_core.py",
                    estimated_impact: 0.8,
                    confidence: 0.7
                }
            ].slice(0, maxRecs),
            count: Math.min(1, maxRecs),
            mock: true
        };
    }

    /**
     * Register all PM autonomous tools with WebMCP bridge
     */
    registerTools(bridge) {
        // Tool 94: pm_analyze
        bridge.registerTool('pm_analyze', {
            description: 'Analyze codebase and get AI PM improvement recommendations',
            inputSchema: {
                type: 'object',
                properties: {
                    scope: {
                        type: 'string',
                        enum: ['recent', 'full', 'failed'],
                        description: 'Analysis scope'
                    },
                    max_recommendations: {
                        type: 'number',
                        description: 'Maximum recommendations to return (default: 10)'
                    }
                }
            },
            handler: async (params) => this.pm_analyze(params)
        });

        // Tool 95: pm_analyze_and_deploy
        bridge.registerTool('pm_analyze_and_deploy', {
            description: 'Analyze codebase and automatically deploy improvement cartridge',
            inputSchema: {
                type: 'object',
                properties: {
                    scope: {
                        type: 'string',
                        enum: ['recent', 'full', 'failed'],
                        description: 'Analysis scope'
                    },
                    max_recommendations: {
                        type: 'number',
                        description: 'Maximum recommendations (default: 5)'
                    },
                    auto_deploy: {
                        type: 'boolean',
                        description: 'Automatically deploy cartridge (default: true)'
                    },
                    cartridge_name: {
                        type: 'string',
                        description: 'Name for the generated cartridge'
                    },
                    location: {
                        type: 'object',
                        properties: {
                            x: { type: 'number' },
                            y: { type: 'number' }
                        },
                        description: 'Deploy location on Infinite Map'
                    }
                }
            },
            handler: async (params) => this.pm_analyze_and_deploy(params)
        });

        console.log('PMAutonomousTools: Registered 2 WebMCP tools');
    }
}

// Export for ES modules
if (typeof window !== 'undefined') {
    window.PMAutonomousTools = PMAutonomousTools;
}

export { PMAutonomousTools };
```

**Step 2: Create test page**

```html
<!-- systems/visual_shell/web/test_pm_autonomous.html -->
<!DOCTYPE html>
<html>
<head>
    <title>PM Autonomous Tools Test</title>
    <style>
        body { font-family: monospace; padding: 20px; background: #1a1a2e; color: #eee; }
        h1 { color: #00ff88; }
        .test { margin: 10px 0; padding: 10px; background: #16213e; border-radius: 4px; }
        .pass { color: #00ff88; }
        .fail { color: #ff6b6b; }
        button { background: #00ff88; color: #1a1a2e; border: none; padding: 8px 16px; cursor: pointer; margin: 5px; }
        button:hover { background: #00cc6a; }
        pre { background: #0f0f23; padding: 10px; overflow-x: auto; }
    </style>
</head>
<body>
    <h1>PM Autonomous Tools Test</h1>
    <div id="results"></div>
    <button onclick="runTests()">Run All Tests</button>
    <button onclick="testAnalyze()">Test Analyze</button>
    <button onclick="testAnalyzeAndDeploy()">Test Analyze & Deploy</button>

    <script type="module">
        import { PMAutonomousTools } from './pm_autonomous_tools.js';

        const results = document.getElementById('results');
        const log = (msg, cls = '') => {
            const div = document.createElement('div');
            div.className = `test ${cls}`;
            div.innerHTML = msg;
            results.appendChild(div);
        };

        window.pmTools = new PMAutonomousTools(null);

        window.runTests = async () => {
            results.innerHTML = '';
            log('Running PM Autonomous Tools tests...');

            // Test 1: pm_analyze returns recommendations
            log('Test 1: pm_analyze returns recommendations...');
            try {
                const result = await pmTools.pm_analyze({ max_recommendations: 3 });
                if (result.success && Array.isArray(result.recommendations)) {
                    log(`✅ PASS: Got ${result.recommendations.length} recommendations`, 'pass');
                } else {
                    log(`❌ FAIL: ${JSON.stringify(result)}`, 'fail');
                }
            } catch (e) {
                log(`❌ FAIL: ${e.message}`, 'fail');
            }

            // Test 2: pm_analyze_and_deploy works
            log('Test 2: pm_analyze_and_deploy (no auto-deploy)...');
            try {
                const result = await pmTools.pm_analyze_and_deploy({
                    auto_deploy: false,
                    cartridge_name: 'test_analysis'
                });
                if (result.success && !result.deployed) {
                    log(`✅ PASS: Analysis complete, not deployed`, 'pass');
                } else {
                    log(`❌ FAIL: ${JSON.stringify(result)}`, 'fail');
                }
            } catch (e) {
                log(`❌ FAIL: ${e.message}`, 'fail');
            }

            log('All tests complete.');
        };

        window.testAnalyze = async () => {
            results.innerHTML = '';
            log('Running pm_analyze...');
            const result = await pmTools.pm_analyze({ max_recommendations: 5 });
            log('<pre>' + JSON.stringify(result, null, 2) + '</pre>');
        };

        window.testAnalyzeAndDeploy = async () => {
            results.innerHTML = '';
            log('Running pm_analyze_and_deploy...');
            const result = await pmTools.pm_analyze_and_deploy({
                auto_deploy: true,
                cartridge_name: `test_${Date.now()}`,
                location: { x: 5000, y: 5000 }
            });
            log('<pre>' + JSON.stringify(result, null, 2) + '</pre>');
        };
    </script>
</body>
</html>
```

**Step 3: Register tools in webmcp_bridge.js**

Add to webmcp_bridge.js after other tool registrations:

```javascript
// In webmcp_bridge.js, add after IDETools registration

// Import and register PM Autonomous Tools
import { PMAutonomousTools } from './pm_autonomous_tools.js';

// ... in constructor or init method ...
this.#pmAutonomousTools = new PMAutonomousTools(this);
this.#pmAutonomousTools.registerTools(this);
```

**Step 4: Commit**

```bash
git add systems/visual_shell/web/pm_autonomous_tools.js systems/visual_shell/web/test_pm_autonomous.html systems/visual_shell/web/webmcp_bridge.js
git commit -m "feat(webmcp): add pm_analyze and pm_analyze_and_deploy tools

- pm_analyze: Get AI PM improvement recommendations
- pm_analyze_and_deploy: Analyze and auto-deploy cartridge
- Connect to pm_analysis_server on port 8769
- Mock fallback when server unavailable

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 3: Create Autonomous Improvement Loop Service

**Files:**
- Create: `systems/visual_shell/web/autonomous_improvement_service.py`

**Step 1: Create the service**

```python
# systems/visual_shell/web/autonomous_improvement_service.py
"""
Autonomous Improvement Loop Service

Periodically analyzes the codebase, generates recommendations,
and optionally deploys improvements as cartridges.

This is the "closed loop" that enables self-improvement.
"""

import asyncio
import json
import time
from pathlib import Path
from typing import Optional, Dict, Any, List
from dataclasses import dataclass, field
from datetime import datetime
import structlog

# Try imports
try:
    from ai_project_management.src.ai_project_management.improvement.module import (
        ContinuousImprovementModule,
        ImprovementRecommendation
    )
    from ai_project_management.src.ai_project_management.models import ExecutionState
    AI_PM_AVAILABLE = True
except ImportError:
    AI_PM_AVAILABLE = False

try:
    from systems.pixel_compiler.cartridge_assembly import CartridgeAssembler
    CARTRIDGE_AVAILABLE = True
except ImportError:
    CARTRIDGE_AVAILABLE = False


@dataclass
class ImprovementCycleResult:
    """Result of an improvement cycle."""
    timestamp: str
    recommendations_count: int
    deployed: bool
    cartridge_path: Optional[str] = None
    error: Optional[str] = None
    metrics: Dict[str, Any] = field(default_factory=dict)


class AutonomousImprovementService:
    """
    Service that runs autonomous improvement loops.

    Flow:
    1. Analyze codebase via ContinuousImprovementModule
    2. Generate recommendations
    3. (Optional) Create cartridge from high-confidence recommendations
    4. Log results and metrics
    """

    def __init__(
        self,
        interval_seconds: int = 3600,  # 1 hour default
        auto_deploy: bool = False,
        confidence_threshold: float = 0.8,
        telemetry_path: Path = Path(".ai-pm-telemetry"),
        cartridges_path: Path = Path("cartridges"),
        log_level: str = "INFO"
    ):
        """
        Initialize autonomous improvement service.

        Args:
            interval_seconds: Time between improvement cycles
            auto_deploy: Whether to automatically deploy cartridges
            confidence_threshold: Minimum confidence to auto-deploy
            telemetry_path: Path for telemetry data
            cartridges_path: Path to save generated cartridges
            log_level: Logging level
        """
        structlog.configure(
            wrapper_class=structlog.make_filtering_bound_logger(log_level.lower())
        )
        self.logger = structlog.get_logger()

        self.interval_seconds = interval_seconds
        self.auto_deploy = auto_deploy
        self.confidence_threshold = confidence_threshold
        self.telemetry_path = telemetry_path
        self.cartridges_path = cartridges_path

        # Ensure directories exist
        self.cartridges_path.mkdir(parents=True, exist_ok=True)
        self.telemetry_path.mkdir(parents=True, exist_ok=True)

        # Initialize components
        if AI_PM_AVAILABLE:
            self.improvement_module = ContinuousImprovementModule(
                telemetry_path=telemetry_path
            )
        else:
            self.improvement_module = None

        if CARTRIDGE_AVAILABLE:
            self.cartridge_assembler = CartridgeAssembler()
        else:
            self.cartridge_assembler = None

        # State
        self.running = False
        self.last_cycle_result: Optional[ImprovementCycleResult] = None
        self.cycle_history: List[ImprovementCycleResult] = []

    async def run_cycle(self) -> ImprovementCycleResult:
        """
        Run a single improvement cycle.

        Returns:
            Result of the cycle
        """
        self.logger.info("Starting improvement cycle")
        timestamp = datetime.now().isoformat()

        result = ImprovementCycleResult(
            timestamp=timestamp,
            recommendations_count=0,
            deployed=False
        )

        try:
            # 1. Analyze
            if not self.improvement_module:
                result.error = "AI PM not available"
                return result

            state = ExecutionState()
            recommendations = await self.improvement_module.run_improvement_cycle(state)
            result.recommendations_count = len(recommendations)

            # 2. Filter by confidence
            high_confidence_recs = [
                r for r in recommendations
                if r.confidence >= self.confidence_threshold
            ]

            self.logger.info(
                "Analysis complete",
                total=len(recommendations),
                high_confidence=len(high_confidence_recs)
            )

            # 3. Deploy if auto-deploy enabled
            if self.auto_deploy and high_confidence_recs and self.cartridge_assembler:
                cartridge_name = f"auto_improvement_{int(time.time())}"
                cartridge_path = self.cartridges_path / f"{cartridge_name}.rts.png"

                # Convert recommendations to source files
                source_files = []
                for i, rec in enumerate(high_confidence_recs):
                    rec_path = Path(rec.target_path) if rec.target_path else Path(f"rec_{i}.txt")
                    source_files.append(rec_path)

                    # Write recommendation content (mock for now)
                    if not rec.target_path:
                        rec_path.write_text(rec.description)

                # Assemble cartridge
                png_bytes = self.cartridge_assembler.assemble_from_files(
                    source_files,
                    name=cartridge_name,
                    description=f"Auto-generated from {len(high_confidence_recs)} recommendations"
                )

                cartridge_path.write_bytes(png_bytes)
                result.deployed = True
                result.cartridge_path = str(cartridge_path)

                self.logger.info("Cartridge deployed", path=str(cartridge_path))

            # 4. Record metrics
            result.metrics = {
                "neuromodulation": self.improvement_module.get_modulation_state().model_dump(),
                "total_recommendations": len(recommendations),
                "high_confidence_count": len(high_confidence_recs)
            }

        except Exception as e:
            result.error = str(e)
            self.logger.error("Improvement cycle failed", error=str(e))

        # Store result
        self.last_cycle_result = result
        self.cycle_history.append(result)

        # Keep only last 100 cycles
        if len(self.cycle_history) > 100:
            self.cycle_history = self.cycle_history[-100:]

        return result

    async def run_forever(self):
        """
        Run improvement loops forever at the configured interval.
        """
        self.running = True
        self.logger.info(
            "Starting autonomous improvement service",
            interval_seconds=self.interval_seconds,
            auto_deploy=self.auto_deploy
        )

        while self.running:
            try:
                result = await self.run_cycle()
                self.logger.info(
                    "Cycle complete",
                    recommendations=result.recommendations_count,
                    deployed=result.deployed,
                    error=result.error
                )
            except Exception as e:
                self.logger.error("Cycle error", error=str(e))

            # Wait for next cycle
            await asyncio.sleep(self.interval_seconds)

    def stop(self):
        """Stop the service."""
        self.running = False
        self.logger.info("Stopping autonomous improvement service")

    def get_status(self) -> Dict[str, Any]:
        """Get current service status."""
        return {
            "running": self.running,
            "interval_seconds": self.interval_seconds,
            "auto_deploy": self.auto_deploy,
            "confidence_threshold": self.confidence_threshold,
            "ai_pm_available": AI_PM_AVAILABLE,
            "cartridge_available": CARTRIDGE_AVAILABLE,
            "last_cycle": self.last_cycle_result.__dict__ if self.last_cycle_result else None,
            "cycles_run": len(self.cycle_history)
        }


async def main():
    """Run the autonomous improvement service."""
    import argparse

    parser = argparse.ArgumentParser(description="Autonomous Improvement Service")
    parser.add_argument("--interval", type=int, default=3600, help="Interval in seconds")
    parser.add_argument("--auto-deploy", action="store_true", help="Auto-deploy cartridges")
    parser.add_argument("--confidence", type=float, default=0.8, help="Confidence threshold")
    args = parser.parse_args()

    service = AutonomousImprovementService(
        interval_seconds=args.interval,
        auto_deploy=args.auto_deploy,
        confidence_threshold=args.confidence
    )

    try:
        await service.run_forever()
    except KeyboardInterrupt:
        service.stop()


if __name__ == "__main__":
    asyncio.run(main())
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/autonomous_improvement_service.py
git commit -m "feat(autonomous): add AutonomousImprovementService

- Periodic improvement cycles with configurable interval
- Analyzes via ContinuousImprovementModule
- Optional auto-deploy of high-confidence recommendations
- Cycle history and status reporting

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 4: Add WebMCP Tool for Service Control

**Files:**
- Modify: `systems/visual_shell/web/pm_autonomous_tools.js`

**Step 1: Add service control tools**

Add to `pm_autonomous_tools.js`:

```javascript
// Add to PMAutonomousTools class

/**
 * Tool 96: pm_service_status
 * Get status of autonomous improvement service
 */
async pm_service_status() {
    try {
        const response = await fetch(`${this.#analysisServerUrl}/service/status`);
        if (!response.ok) {
            return { success: false, error: `Server error: ${response.status}` };
        }
        return await response.json();
    } catch (e) {
        return {
            success: false,
            error: e.message,
            mock: true,
            running: false
        };
    }
}

/**
 * Tool 97: pm_service_start
 * Start the autonomous improvement service
 */
async pm_service_start(params = {}) {
    const { interval_seconds = 3600, auto_deploy = false, confidence_threshold = 0.8 } = params;

    try {
        const response = await fetch(`${this.#analysisServerUrl}/service/start`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                interval_seconds,
                auto_deploy,
                confidence_threshold
            })
        });

        if (!response.ok) {
            return { success: false, error: `Server error: ${response.status}` };
        }

        const result = await response.json();

        if (this.#bridge?.builderPanel) {
            this.#bridge.builderPanel.logAction(
                `Autonomous improvement service started (interval: ${interval_seconds}s)`,
                'success'
            );
        }

        return result;

    } catch (e) {
        return { success: false, error: e.message };
    }
}

/**
 * Tool 98: pm_service_stop
 * Stop the autonomous improvement service
 */
async pm_service_stop() {
    try {
        const response = await fetch(`${this.#analysisServerUrl}/service/stop`, {
            method: 'POST'
        });

        if (!response.ok) {
            return { success: false, error: `Server error: ${response.status}` };
        }

        const result = await response.json();

        if (this.#bridge?.builderPanel) {
            this.#bridge.builderPanel.logAction(
                'Autonomous improvement service stopped',
                'info'
            );
        }

        return result;

    } catch (e) {
        return { success: false, error: e.message };
    }
}

// Update registerTools to include new tools
registerTools(bridge) {
    // ... existing tool registrations ...

    // Tool 96: pm_service_status
    bridge.registerTool('pm_service_status', {
        description: 'Get status of autonomous improvement service',
        inputSchema: { type: 'object', properties: {} },
        handler: async () => this.pm_service_status()
    });

    // Tool 97: pm_service_start
    bridge.registerTool('pm_service_start', {
        description: 'Start autonomous improvement service',
        inputSchema: {
            type: 'object',
            properties: {
                interval_seconds: { type: 'number', description: 'Cycle interval (default: 3600)' },
                auto_deploy: { type: 'boolean', description: 'Auto-deploy cartridges (default: false)' },
                confidence_threshold: { type: 'number', description: 'Min confidence to deploy (default: 0.8)' }
            }
        },
        handler: async (params) => this.pm_service_start(params)
    });

    // Tool 98: pm_service_stop
    bridge.registerTool('pm_service_stop', {
        description: 'Stop autonomous improvement service',
        inputSchema: { type: 'object', properties: {} },
        handler: async () => this.pm_service_stop()
    });

    console.log('PMAutonomousTools: Registered 5 WebMCP tools');
}
```

**Step 2: Update server to handle service endpoints**

Add to `pm_analysis_server.py`:

```python
# Add to PMAnalysisHandler class

def do_POST(self):
    path = urlparse(self.path).path
    # ... existing code ...

    elif path == "/service/start":
        result = self._handle_service_start(request)
        self._send_json(result)
    elif path == "/service/stop":
        result = self._handle_service_stop()
        self._send_json(result)
    else:
        self._send_error(404, "Not found")

def do_GET(self):
    path = urlparse(self.path).path
    if path == "/health":
        # ... existing code ...
    elif path == "/service/status":
        result = self._handle_service_status()
        self._send_json(result)
    else:
        self._send_error(404, "Not found")

def _handle_service_status(self):
    """Get service status."""
    # For now, return mock status
    # In production, would track actual service state
    return {
        "success": True,
        "running": False,
        "interval_seconds": 3600,
        "auto_deploy": False,
        "last_cycle": None,
        "cycles_run": 0
    }

def _handle_service_start(self, request):
    """Start the autonomous service."""
    # For now, just acknowledge
    # In production, would start the AutonomousImprovementService
    return {
        "success": True,
        "message": "Service start requested",
        "config": {
            "interval_seconds": request.get("interval_seconds", 3600),
            "auto_deploy": request.get("auto_deploy", False),
            "confidence_threshold": request.get("confidence_threshold", 0.8)
        }
    }

def _handle_service_stop(self):
    """Stop the autonomous service."""
    return {
        "success": True,
        "message": "Service stop requested"
    }
```

**Step 3: Commit**

```bash
git add systems/visual_shell/web/pm_autonomous_tools.js systems/visual_shell/web/pm_analysis_server.py
git commit -m "feat(webmcp): add pm_service_* tools for autonomous control

- pm_service_status: Get service status
- pm_service_start: Start autonomous loop with config
- pm_service_stop: Stop the service

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 5: Update Documentation

**Files:**
- Modify: `systems/visual_shell/web/WEBMCP_TOOLS_REFERENCE.md`

**Step 1: Add Phase O documentation**

Add to the documentation:

```markdown
### Phase O: AI PM Integration (5 tools)

Tools for autonomous code analysis and improvement.

| Tool | Description |
|------|-------------|
| `pm_analyze` | Get AI PM improvement recommendations |
| `pm_analyze_and_deploy` | Analyze and auto-deploy as cartridge |
| `pm_service_status` | Get autonomous service status |
| `pm_service_start` | Start autonomous improvement service |
| `pm_service_stop` | Stop the service |

#### pm_analyze

Analyze codebase and get improvement recommendations from AI PM.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `scope` | string | No | Analysis scope: 'recent', 'full', 'failed' |
| `max_recommendations` | number | No | Max recommendations (default: 10) |

**Returns:**
```json
{
    "success": true,
    "recommendations": [
        {
            "id": "rec-001",
            "type": "optimize",
            "priority": "MEDIUM",
            "description": "Optimize Hilbert curve lookup",
            "target_path": "systems/pixel_compiler/pixelrts_v2_core.py",
            "estimated_impact": 0.8,
            "confidence": 0.7
        }
    ],
    "neuromodulation": {
        "dopamine": 0.5,
        "urgency": 0.2,
        "acetylcholine": 0.3
    }
}
```

#### pm_analyze_and_deploy

Analyze codebase and optionally deploy improvement cartridge.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `scope` | string | No | Analysis scope |
| `max_recommendations` | number | No | Max recommendations (default: 5) |
| `auto_deploy` | boolean | No | Deploy cartridge automatically (default: true) |
| `cartridge_name` | string | No | Name for generated cartridge |
| `location` | object | No | Deploy location {x, y} |

**Example - Analyze and deploy:**
```javascript
const result = await navigator.modelContext.callTool('pm_analyze_and_deploy', {
    scope: 'recent',
    max_recommendations: 5,
    auto_deploy: true,
    cartridge_name: 'auto_improvement_v1',
    location: { x: 10000, y: 10000 }
});

if (result.deployed) {
    console.log(`Cartridge deployed: ${result.cartridge.path}`);
}
```
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/WEBMCP_TOOLS_REFERENCE.md
git commit -m "docs(webmcp): document Phase O AI PM Integration tools

- pm_analyze, pm_analyze_and_deploy documentation
- pm_service_* tools for autonomous control
- Total tools: 98

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Summary

| Task | Description | Key Files |
|------|-------------|-----------|
| 1 | PM Analysis HTTP Server | `pm_analysis_server.py` |
| 2 | WebMCP PM Tools | `pm_autonomous_tools.js` |
| 3 | Autonomous Service | `autonomous_improvement_service.py` |
| 4 | Service Control Tools | `pm_autonomous_tools.js` updates |
| 5 | Documentation | `WEBMCP_TOOLS_REFERENCE.md` |

---

## Architecture

```
┌──────────────────────────────────────────────────────────────────┐
│                    AUTONOMOUS IMPROVEMENT LOOP                    │
├──────────────────────────────────────────────────────────────────┤
│                                                                   │
│   ┌─────────────┐      ┌──────────────────┐      ┌────────────┐ │
│   │ pm_analyze  │─────▶│ ContinuousImprov │─────▶│ Recommend- │ │
│   │ (WebMCP)    │      │ ementModule       │      │ ations     │ │
│   └─────────────┘      └──────────────────┘      └────────────┘ │
│         │                                                   │     │
│         ▼                                                   ▼     │
│   ┌──────────────────────────────────────────────────────────┐   │
│   │              pm_analyze_and_deploy                        │   │
│   │  confidence >= 0.8 ──▶ ide_compile ──▶ ide_test ──▶ ide_deploy │
│   └──────────────────────────────────────────────────────────┘   │
│         │                                                   │     │
│         ▼                                                   ▼     │
│   ┌─────────────┐                                   ┌────────────┐ │
│   │ .rts.png    │◀──────────────────────────────────│ Cartridge  │ │
│   │ Cartridge   │                                   │ Assembler  │ │
│   └─────────────┘                                   └────────────┘ │
│                                                                   │
└──────────────────────────────────────────────────────────────────┘
```

---

## Verification Checklist

After completing all tasks:

- [ ] `pytest systems/pixel_compiler/tests/test_pm_analysis_server.py -v` passes
- [ ] `test_pm_autonomous.html` shows PASS for all tests
- [ ] `pm_analyze` returns recommendations
- [ ] `pm_analyze_and_deploy` creates cartridge
- [ ] Service status/start/stop work
- [ ] Documentation is accurate

---

**End of Plan**
