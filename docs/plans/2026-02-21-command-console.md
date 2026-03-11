# Command Console Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable bidirectional human-AI collaboration where humans write WordPress posts (Directives) and AI agents read, parse, and execute them, posting results as comments.

**Architecture:** A DirectiveAgent polls WordPress for unprocessed posts in the "Directives" category, parses the directive scope and action, executes informational/research tasks using the Neural Substrate Map, and publishes results as WordPress comments.

**Tech Stack:** Python 3.12, WordPress REST API (via ai-publisher.php), requests library

---

## Scope Definition

| Scope | Allowed | Example |
|-------|---------|---------|
| **Informational** | Yes | "Explain how the Evolution Daemon works" |
| **Research Tasks** | Yes | "Investigate why Hilbert decoding is slow" |
| Code Modifications | No | Future phase |
| System Operations | No | Future phase |

---

## Task 1: Extend ai-publisher.php with Directive Actions

**Files:**
- Modify: `wordpress_zone/wordpress/ai-publisher.php:54-101`
- Modify: `wordpress_zone/wordpress/ai-publisher.php:199-221`

**Step 1: Add directive action routes to the dispatcher**

Add to the `switch` statement in ai-publisher.php (after line 96):

```php
    // Directive Console Actions
    case 'getDirectives':
        handle_get_directives($args);
        break;

    case 'markDirectiveProcessed':
        handle_mark_directive_processed($args);
        break;

    case 'postDirectiveResponse':
        handle_post_directive_response($args);
        break;
```

**Step 2: Add the handler functions**

Add these functions at the end of ai-publisher.php (after `handle_list_tools`):

```php
/**
 * Get unprocessed directives from WordPress
 */
function handle_get_directives($data) {
    $category_slug = 'directives';
    $category = get_term_by('slug', $category_slug, 'category');

    if (!$category) {
        // Create the category if it doesn't exist
        $cat_id = wp_create_category($category_slug, 'Human-to-AI Directives');
    } else {
        $cat_id = $category->term_id;
    }

    // Get posts in directives category that haven't been processed
    $args = array(
        'category' => $cat_id,
        'post_status' => 'publish',
        'posts_per_page' => 10,
        'meta_query' => array(
            array(
                'key' => 'directive_processed',
                'compare' => 'NOT EXISTS'
            )
        )
    );

    $posts = get_posts($args);
    $directives = array();

    foreach ($posts as $post) {
        $directives[] = array(
            'id' => $post->ID,
            'title' => $post->post_title,
            'content' => $post->post_content,
            'date' => $post->post_date,
            'author' => get_the_author_meta('display_name', $post->post_author)
        );
    }

    echo json_encode(array('success' => true, 'directives' => $directives, 'category_id' => $cat_id));
}

/**
 * Mark a directive as processed
 */
function handle_mark_directive_processed($data) {
    $post_id = isset($data['post_id']) ? intval($data['post_id']) : 0;

    if (!$post_id) {
        echo json_encode(array('success' => false, 'error' => 'Missing post_id'));
        return;
    }

    update_post_meta($post_id, 'directive_processed', true);
    update_post_meta($post_id, 'directive_processed_at', current_time('mysql'));

    echo json_encode(array('success' => true, 'post_id' => $post_id));
}

/**
 * Post a response as a comment on a directive
 */
function handle_post_directive_response($data) {
    $post_id = isset($data['post_id']) ? intval($data['post_id']) : 0;
    $response = isset($data['response']) ? $data['response'] : '';
    $status = isset($data['status']) ? $data['status'] : 'completed';

    if (!$post_id || !$response) {
        echo json_encode(array('success' => false, 'error' => 'Missing post_id or response'));
        return;
    }

    // Format the response as HTML
    $comment_content = "<div class='directive-response'>\n";
    $comment_content .= "<h4>🤖 Agent Response</h4>\n";
    $comment_content .= "<p><strong>Status:</strong> $status</p>\n";
    $comment_content .= "<div class='response-body'>$response</div>\n";
    $comment_content .= "</div>";

    // Insert as a comment
    $comment_data = array(
        'comment_post_ID' => $post_id,
        'comment_content' => $comment_content,
        'comment_author' => 'Geometry OS Agent',
        'comment_author_email' => 'agent@geometry.os',
        'comment_approved' => 1
    );

    $comment_id = wp_insert_comment($comment_data);

    if (is_wp_error($comment_id)) {
        echo json_encode(array('success' => false, 'error' => $comment_id->get_error_message()));
    } else {
        echo json_encode(array(
            'success' => true,
            'comment_id' => $comment_id,
            'post_id' => $post_id
        ));
    }
}
```

**Step 3: Update handle_list_tools to include new tools**

Modify `handle_list_tools()` to include the new directive tools:

```php
function handle_list_tools() {
    echo json_encode(array(
        'success' => true,
        'tools' => array(
            'createPost',
            'editPage',
            'logEvolution',
            'updateArchitecture',
            'getDirectives',
            'markDirectiveProcessed',
            'postDirectiveResponse'
        )
    ));
}
```

**Step 4: Verify the changes manually**

Run: `curl -X POST http://localhost:8080/ai-publisher.php -H "Content-Type: application/json" -d '{"tool": "getDirectives"}'`

Expected: `{"success": true, "directives": [], "category_id": <number>}`

**Step 5: Commit**

```bash
git add wordpress_zone/wordpress/ai-publisher.php
git commit -m "feat(wp): add Directive Console API endpoints (getDirectives, markDirectiveProcessed, postDirectiveResponse)"
```

---

## Task 2: Create DirectiveAgent Core Class

**Files:**
- Create: `systems/intelligence/directive_agent.py`
- Create: `systems/intelligence/__init__.py`

**Step 1: Create the __init__.py file**

```python
# systems/intelligence/__init__.py
"""
Geometry OS Intelligence Layer

Agents that provide self-awareness, semantic indexing, and directive processing.
"""

from .architect_agent_wp import ArchitectAgent
from .directive_agent import DirectiveAgent

__all__ = ['ArchitectAgent', 'DirectiveAgent']
```

**Step 2: Write the DirectiveAgent class**

Create `systems/intelligence/directive_agent.py`:

```python
#!/usr/bin/env python3
"""
🎯 DIRECTIVE AGENT (GEOMETRY OS)
================================

The Directive Agent enables bidirectional human-AI collaboration.
Humans write WordPress posts (Directives), and this agent:
1. Polls for unprocessed directives
2. Parses the directive scope and action
3. Executes informational/research tasks
4. Posts results as WordPress comments

Scope: Informational + Research only (no code modifications or system ops)
"""

import os
import sys
import json
import re
import requests
import time
from pathlib import Path
from dataclasses import dataclass
from typing import Optional, List, Dict, Any
from enum import Enum

# Add project root to path
sys.path.insert(0, os.getcwd())


class DirectiveScope(Enum):
    """Allowed directive scopes for Phase 3"""
    INFORMATIONAL = "informational"  # Explain how X works
    RESEARCH = "research"            # Investigate Y
    UNKNOWN = "unknown"              # Not understood or out of scope


class DirectiveStatus(Enum):
    """Status of directive execution"""
    COMPLETED = "completed"
    FAILED = "failed"
    OUT_OF_SCOPE = "out_of_scope"
    NEEDS_CLARIFICATION = "needs_clarification"


@dataclass
class Directive:
    """Represents a human-written directive"""
    id: int
    title: str
    content: str
    date: str
    author: str
    scope: DirectiveScope = DirectiveScope.UNKNOWN
    action: str = ""
    target: str = ""


class DirectiveAgent:
    """
    Polls WordPress for directives and executes them.

    Communication Flow:
    1. Poll getDirectives from ai-publisher.php
    2. Parse directive to extract scope, action, target
    3. Execute using Neural Substrate Map knowledge
    4. Post response via postDirectiveResponse
    5. Mark as processed via markDirectiveProcessed
    """

    WP_URL = "http://localhost:8080"
    POLL_INTERVAL = 30  # seconds

    # Keywords for scope detection
    INFORMATIONAL_KEYWORDS = [
        "explain", "what is", "how does", "describe", "tell me about",
        "what are", "show me", "overview", "summary"
    ]

    RESEARCH_KEYWORDS = [
        "investigate", "analyze", "find out", "why is", "debug",
        "troubleshoot", "explore", "check", "examine", "look into"
    ]

    # Out of scope patterns
    OUT_OF_SCOPE_PATTERNS = [
        r"delete\s+",
        r"remove\s+",
        r"restart\s+",
        r"shutdown\s+",
        r"kill\s+",
        r"modify\s+",
        r"change\s+the\s+code",
        r"rewrite\s+",
        r"execute\s+command",
    ]

    def __init__(self, wp_url: str = None):
        self.wp_api = f"{wp_url or self.WP_URL}/?rest_route=/geometry-os/v1/invoke"
        self.substrate_map = self._load_substrate_map()
        self.processed_count = 0

    def _load_substrate_map(self) -> Dict[str, Any]:
        """Load the Neural Substrate Map for context"""
        # Try to load from cached architecture data
        cache_path = Path(".geometry/substrate_map.json")
        if cache_path.exists():
            try:
                with open(cache_path) as f:
                    return json.load(f)
            except:
                pass
        return {}

    def poll_directives(self) -> List[Directive]:
        """Fetch unprocessed directives from WordPress"""
        try:
            response = requests.post(
                self.wp_api,
                json={"tool": "getDirectives"},
                timeout=10
            )
            response.raise_for_status()
            data = response.json()

            if data.get("success"):
                return [
                    Directive(
                        id=d["id"],
                        title=d["title"],
                        content=d["content"],
                        date=d["date"],
                        author=d["author"]
                    )
                    for d in data.get("directives", [])
                ]
        except Exception as e:
            print(f"❌ Failed to poll directives: {e}")

        return []

    def parse_directive(self, directive: Directive) -> Directive:
        """
        Parse directive to extract scope, action, and target.

        Returns the directive with populated scope/action/target fields.
        """
        text = f"{directive.title} {directive.content}".lower()

        # Check for out-of-scope patterns first
        for pattern in self.OUT_OF_SCOPE_PATTERNS:
            if re.search(pattern, text, re.IGNORECASE):
                directive.scope = DirectiveScope.UNKNOWN
                directive.action = "out_of_scope"
                return directive

        # Detect scope
        for keyword in self.INFORMATIONAL_KEYWORDS:
            if keyword in text:
                directive.scope = DirectiveScope.INFORMATIONAL
                break

        for keyword in self.RESEARCH_KEYWORDS:
            if keyword in text:
                directive.scope = DirectiveScope.RESEARCH
                break

        # Extract action and target
        directive.action = self._extract_action(text)
        directive.target = self._extract_target(text)

        return directive

    def _extract_action(self, text: str) -> str:
        """Extract the action verb from directive text"""
        actions = ["explain", "investigate", "analyze", "describe", "show"]
        for action in actions:
            if action in text:
                return action
        return "unknown"

    def _extract_target(self, text: str) -> str:
        """Extract the target component/subject from directive text"""
        # Common component names to look for
        components = [
            "evolution daemon", "infinite map", "visual bridge",
            "memory beams", "hilbert", "rts", "pixel compiler",
            "vector vm", "neural city", "tectonic", "healer"
        ]

        for component in components:
            if component in text:
                return component

        # Try to extract quoted or capitalized terms
        quoted = re.findall(r'"([^"]+)"', text)
        if quoted:
            return quoted[0]

        return "unknown"

    def execute_directive(self, directive: Directive) -> tuple[DirectiveStatus, str]:
        """
        Execute a parsed directive.

        Returns (status, response_text).
        """
        if directive.scope == DirectiveScope.UNKNOWN:
            if directive.action == "out_of_scope":
                return (
                    DirectiveStatus.OUT_OF_SCOPE,
                    "This directive requires code modifications or system operations, "
                    "which are not enabled in Phase 3. Please rephrase as an "
                    "informational or research request."
                )
            return (
                DirectiveStatus.NEEDS_CLARIFICATION,
                "I couldn't understand the scope of this directive. "
                "Please use phrases like 'Explain...' or 'Investigate...' "
                "to help me understand what you need."
            )

        if directive.scope == DirectiveScope.INFORMATIONAL:
            return self._execute_informational(directive)

        if directive.scope == DirectiveScope.RESEARCH:
            return self._execute_research(directive)

        return (DirectiveStatus.FAILED, "Unknown directive scope")

    def _execute_informational(self, directive: Directive) -> tuple[DirectiveStatus, str]:
        """Execute an informational directive using the substrate map"""
        target = directive.target

        # Look up target in substrate map
        component_info = self._lookup_component(target)

        if component_info:
            response = f"## {component_info.get('name', target).title()}\n\n"
            response += f"**Path:** `{component_info.get('path', 'N/A')}`\n\n"
            response += f"**Description:** {component_info.get('description', 'No description available.')}\n\n"
            response += f"**Stack:** {component_info.get('language', 'Unknown')}\n"
            response += f"**Files:** {component_info.get('files', 'N/A')}\n"
            response += f"**Entry Points:** {', '.join(component_info.get('entry_points', []))}\n"
            return (DirectiveStatus.COMPLETED, response)

        # Fallback: generic response
        return (
            DirectiveStatus.NEEDS_CLARIFICATION,
            f"I couldn't find specific information about '{target}' in the Neural Substrate Map. "
            f"Could you be more specific about which component you're asking about?"
        )

    def _execute_research(self, directive: Directive) -> tuple[DirectiveStatus, str]:
        """Execute a research directive"""
        target = directive.target

        # Look up target and provide analysis
        component_info = self._lookup_component(target)

        if component_info:
            path = component_info.get('path', '')
            response = f"## Research: {target.title()}\n\n"
            response += f"**Component Location:** `{path}`\n\n"
            response += "### Analysis\n\n"
            response += f"- **Language:** {component_info.get('language', 'Unknown')}\n"
            response += f"- **File Count:** {component_info.get('files', 'N/A')}\n"
            response += f"- **Entry Points:** {', '.join(component_info.get('entry_points', []))}\n\n"
            response += "### Potential Investigation Points\n\n"

            # Add investigation suggestions based on component type
            if "daemon" in target.lower():
                response += "- Check daemon logs for recent activity\n"
                response += "- Review configuration for runtime parameters\n"
                response += "- Examine cycle count and evolution metrics\n"
            elif "map" in target.lower() or "visual" in target.lower():
                response += "- Check renderer frame rate and GPU utilization\n"
                response += "- Review tile loading patterns\n"
                response += "- Examine WebSocket connection stability\n"
            else:
                response += "- Review component source code\n"
                response += "- Check for recent commits affecting this area\n"
                response += "- Look for related test coverage\n"

            return (DirectiveStatus.COMPLETED, response)

        return (
            DirectiveStatus.NEEDS_CLARIFICATION,
            f"I couldn't find '{target}' in the system. "
            f"Please specify a component name from the Neural Substrate Map."
        )

    def _lookup_component(self, target: str) -> Optional[Dict[str, Any]]:
        """Look up a component by name in the substrate map"""
        if not self.substrate_map:
            return None

        target_lower = target.lower().replace(" ", "_")

        # Direct match
        if target_lower in self.substrate_map:
            return self.substrate_map[target_lower]

        # Partial match
        for key, value in self.substrate_map.items():
            if target_lower in key.lower() or key.lower() in target_lower:
                return value

        return None

    def post_response(self, directive: Directive, status: DirectiveStatus, response: str) -> bool:
        """Post the execution response as a WordPress comment"""
        try:
            result = requests.post(
                self.wp_api,
                json={
                    "tool": "postDirectiveResponse",
                    "arguments": {
                        "post_id": directive.id,
                        "response": response,
                        "status": status.value
                    }
                },
                timeout=10
            )
            result.raise_for_status()
            data = result.json()
            return data.get("success", False)
        except Exception as e:
            print(f"❌ Failed to post response: {e}")
            return False

    def mark_processed(self, directive_id: int) -> bool:
        """Mark a directive as processed"""
        try:
            result = requests.post(
                self.wp_api,
                json={
                    "tool": "markDirectiveProcessed",
                    "arguments": {"post_id": directive_id}
                },
                timeout=10
            )
            result.raise_for_status()
            data = result.json()
            return data.get("success", False)
        except Exception as e:
            print(f"❌ Failed to mark directive as processed: {e}")
            return False

    def process_one_cycle(self) -> int:
        """Process one polling cycle. Returns count of processed directives."""
        directives = self.poll_directives()
        processed = 0

        for directive in directives:
            print(f"📋 Processing Directive #{directive.id}: {directive.title}")

            # Parse
            parsed = self.parse_directive(directive)
            print(f"   Scope: {parsed.scope.value}, Action: {parsed.action}, Target: {parsed.target}")

            # Execute
            status, response = self.execute_directive(parsed)
            print(f"   Status: {status.value}")

            # Post response
            if self.post_response(parsed, status, response):
                print(f"   ✅ Response posted")

            # Mark processed
            if self.mark_processed(parsed.id):
                print(f"   ✅ Marked as processed")
                processed += 1
                self.processed_count += 1

        return processed

    def run_forever(self):
        """Run the directive processing loop forever"""
        print("🎯 Directive Agent: Starting polling loop...")
        print(f"   WordPress URL: {self.WP_URL}")
        print(f"   Poll Interval: {self.POLL_INTERVAL}s")

        while True:
            try:
                processed = self.process_one_cycle()
                if processed > 0:
                    print(f"🎯 Directive Agent: Processed {processed} directive(s)")
            except KeyboardInterrupt:
                print("\n🎯 Directive Agent: Shutting down...")
                break
            except Exception as e:
                print(f"❌ Directive Agent error: {e}")

            time.sleep(self.POLL_INTERVAL)


if __name__ == "__main__":
    agent = DirectiveAgent()
    agent.run_forever()
```

**Step 3: Verify the file syntax**

Run: `python3 -m py_compile systems/intelligence/directive_agent.py`

Expected: No output (success)

**Step 4: Commit**

```bash
git add systems/intelligence/directive_agent.py systems/intelligence/__init__.py
git commit -m "feat(intelligence): add DirectiveAgent for bidirectional human-AI collaboration"
```

---

## Task 3: Create Unit Tests for DirectiveAgent

**Files:**
- Create: `tests/test_directive_agent.py`

**Step 1: Write the test file**

```python
#!/usr/bin/env python3
"""
Tests for DirectiveAgent

Covers:
- Directive parsing (scope, action, target extraction)
- Out-of-scope detection
- Component lookup
- API mock responses
"""

import pytest
from unittest.mock import Mock, patch
import sys
import os

# Add project root to path
sys.path.insert(0, os.getcwd())

from systems.intelligence.directive_agent import (
    DirectiveAgent,
    Directive,
    DirectiveScope,
    DirectiveStatus
)


class TestDirectiveParsing:
    """Test directive text parsing"""

    @pytest.fixture
    def agent(self):
        """Create a DirectiveAgent instance"""
        return DirectiveAgent()

    def test_parse_informational_explain(self, agent):
        """Test parsing 'explain' directives"""
        directive = Directive(
            id=1,
            title="Explain the Evolution Daemon",
            content="I want to understand how it works",
            date="2026-02-21",
            author="admin"
        )

        parsed = agent.parse_directive(directive)

        assert parsed.scope == DirectiveScope.INFORMATIONAL
        assert parsed.action == "explain"
        assert "evolution daemon" in parsed.target

    def test_parse_informational_how_does(self, agent):
        """Test parsing 'how does' directives"""
        directive = Directive(
            id=2,
            title="How does the Infinite Map work?",
            content="",
            date="2026-02-21",
            author="admin"
        )

        parsed = agent.parse_directive(directive)

        assert parsed.scope == DirectiveScope.INFORMATIONAL

    def test_parse_research_investigate(self, agent):
        """Test parsing 'investigate' directives"""
        directive = Directive(
            id=3,
            title="Investigate Hilbert decoding",
            content="Why is it slow?",
            date="2026-02-21",
            author="admin"
        )

        parsed = agent.parse_directive(directive)

        assert parsed.scope == DirectiveScope.RESEARCH
        assert parsed.action == "investigate"

    def test_parse_research_analyze(self, agent):
        """Test parsing 'analyze' directives"""
        directive = Directive(
            id=4,
            title="Please analyze the Visual Bridge",
            content="I need to understand its performance",
            date="2026-02-21",
            author="admin"
        )

        parsed = agent.parse_directive(directive)

        assert parsed.scope == DirectiveScope.RESEARCH
        assert parsed.action == "analyze"

    def test_parse_out_of_scope_delete(self, agent):
        """Test detecting out-of-scope 'delete' directives"""
        directive = Directive(
            id=5,
            title="Delete the old files",
            content="Remove everything in temp",
            date="2026-02-21",
            author="admin"
        )

        parsed = agent.parse_directive(directive)

        assert parsed.scope == DirectiveScope.UNKNOWN
        assert parsed.action == "out_of_scope"

    def test_parse_out_of_scope_restart(self, agent):
        """Test detecting out-of-scope 'restart' directives"""
        directive = Directive(
            id=6,
            title="Restart the daemon",
            content="",
            date="2026-02-21",
            author="admin"
        )

        parsed = agent.parse_directive(directive)

        assert parsed.scope == DirectiveScope.UNKNOWN
        assert parsed.action == "out_of_scope"

    def test_parse_out_of_scope_modify_code(self, agent):
        """Test detecting out-of-scope 'modify code' directives"""
        directive = Directive(
            id=7,
            title="Change the code to add a button",
            content="",
            date="2026-02-21",
            author="admin"
        )

        parsed = agent.parse_directive(directive)

        assert parsed.scope == DirectiveScope.UNKNOWN
        assert parsed.action == "out_of_scope"

    def test_parse_unknown_directive(self, agent):
        """Test handling unparseable directives"""
        directive = Directive(
            id=8,
            title="Do the thing",
            content="Make it happen",
            date="2026-02-21",
            author="admin"
        )

        parsed = agent.parse_directive(directive)

        assert parsed.scope == DirectiveScope.UNKNOWN
        assert parsed.action == "unknown"


class TestDirectiveExecution:
    """Test directive execution"""

    @pytest.fixture
    def agent_with_map(self):
        """Create an agent with a mock substrate map"""
        agent = DirectiveAgent()
        agent.substrate_map = {
            "evolution_daemon": {
                "name": "Evolution Daemon",
                "path": "systems/evolution_daemon",
                "description": "Natural Selection for Operating Systems",
                "language": "Python",
                "files": 42,
                "entry_points": ["main.py", "daemon.py"]
            },
            "visual_bridge": {
                "name": "Visual Bridge",
                "path": "systems/visual_shell/api/visual_bridge.py",
                "description": "WebSocket hub for real-time visualization",
                "language": "Python",
                "files": 1,
                "entry_points": ["visual_bridge.py"]
            }
        }
        return agent

    def test_execute_informational_found(self, agent_with_map):
        """Test executing informational directive with known target"""
        directive = Directive(
            id=1,
            title="Explain the Evolution Daemon",
            content="",
            date="2026-02-21",
            author="admin",
            scope=DirectiveScope.INFORMATIONAL,
            action="explain",
            target="evolution daemon"
        )

        status, response = agent_with_map.execute_directive(directive)

        assert status == DirectiveStatus.COMPLETED
        assert "Evolution Daemon" in response
        assert "systems/evolution_daemon" in response

    def test_execute_informational_not_found(self, agent_with_map):
        """Test executing informational directive with unknown target"""
        directive = Directive(
            id=2,
            title="Explain the Flux Capacitor",
            content="",
            date="2026-02-21",
            author="admin",
            scope=DirectiveScope.INFORMATIONAL,
            action="explain",
            target="flux capacitor"
        )

        status, response = agent_with_map.execute_directive(directive)

        assert status == DirectiveStatus.NEEDS_CLARIFICATION
        assert "couldn't find" in response.lower()

    def test_execute_research_found(self, agent_with_map):
        """Test executing research directive with known target"""
        directive = Directive(
            id=3,
            title="Investigate Visual Bridge",
            content="",
            date="2026-02-21",
            author="admin",
            scope=DirectiveScope.RESEARCH,
            action="investigate",
            target="visual bridge"
        )

        status, response = agent_with_map.execute_directive(directive)

        assert status == DirectiveStatus.COMPLETED
        assert "Research:" in response
        assert "Analysis" in response

    def test_execute_out_of_scope(self, agent_with_map):
        """Test executing out-of-scope directive"""
        directive = Directive(
            id=4,
            title="Delete files",
            content="",
            date="2026-02-21",
            author="admin",
            scope=DirectiveScope.UNKNOWN,
            action="out_of_scope",
            target=""
        )

        status, response = agent_with_map.execute_directive(directive)

        assert status == DirectiveStatus.OUT_OF_SCOPE
        assert "not enabled in Phase 3" in response


class TestDirectiveAPI:
    """Test WordPress API interactions"""

    @pytest.fixture
    def agent(self):
        return DirectiveAgent()

    @patch('systems.intelligence.directive_agent.requests.post')
    def test_poll_directives_success(self, mock_post, agent):
        """Test successful directive polling"""
        mock_response = Mock()
        mock_response.json.return_value = {
            "success": True,
            "directives": [
                {
                    "id": 1,
                    "title": "Explain Evolution Daemon",
                    "content": "How does it work?",
                    "date": "2026-02-21",
                    "author": "admin"
                }
            ]
        }
        mock_response.raise_for_status = Mock()
        mock_post.return_value = mock_response

        directives = agent.poll_directives()

        assert len(directives) == 1
        assert directives[0].id == 1
        assert directives[0].title == "Explain Evolution Daemon"

    @patch('systems.intelligence.directive_agent.requests.post')
    def test_poll_directives_empty(self, mock_post, agent):
        """Test polling when no directives exist"""
        mock_response = Mock()
        mock_response.json.return_value = {"success": True, "directives": []}
        mock_response.raise_for_status = Mock()
        mock_post.return_value = mock_response

        directives = agent.poll_directives()

        assert len(directives) == 0

    @patch('systems.intelligence.directive_agent.requests.post')
    def test_poll_directives_error(self, mock_post, agent):
        """Test polling with API error"""
        mock_post.side_effect = Exception("Connection refused")

        directives = agent.poll_directives()

        assert len(directives) == 0

    @patch('systems.intelligence.directive_agent.requests.post')
    def test_mark_processed_success(self, mock_post, agent):
        """Test marking directive as processed"""
        mock_response = Mock()
        mock_response.json.return_value = {"success": True}
        mock_response.raise_for_status = Mock()
        mock_post.return_value = mock_response

        result = agent.mark_processed(1)

        assert result is True

    @patch('systems.intelligence.directive_agent.requests.post')
    def test_post_response_success(self, mock_post, agent):
        """Test posting directive response"""
        mock_response = Mock()
        mock_response.json.return_value = {"success": True, "comment_id": 42}
        mock_response.raise_for_status = Mock()
        mock_post.return_value = mock_response

        directive = Directive(
            id=1, title="Test", content="", date="", author=""
        )
        result = agent.post_response(directive, DirectiveStatus.COMPLETED, "Done!")

        assert result is True


class TestComponentLookup:
    """Test component lookup in substrate map"""

    @pytest.fixture
    def agent_with_map(self):
        agent = DirectiveAgent()
        agent.substrate_map = {
            "evolution_daemon": {"name": "Evolution Daemon"},
            "visual_bridge": {"name": "Visual Bridge"},
            "infinite_map_rs": {"name": "Infinite Map RS"}
        }
        return agent

    def test_lookup_exact_match(self, agent_with_map):
        """Test exact component name match"""
        result = agent_with_map._lookup_component("evolution_daemon")
        assert result is not None
        assert result["name"] == "Evolution Daemon"

    def test_lookup_partial_match(self, agent_with_map):
        """Test partial component name match"""
        result = agent_with_map._lookup_component("visual bridge")
        assert result is not None

    def test_lookup_no_match(self, agent_with_map):
        """Test component not found"""
        result = agent_with_map._lookup_component("nonexistent component")
        assert result is None

    def test_lookup_empty_map(self):
        """Test lookup with empty substrate map"""
        agent = DirectiveAgent()
        agent.substrate_map = {}

        result = agent._lookup_component("anything")
        assert result is None
```

**Step 2: Run tests to verify they fail (TDD)**

Run: `python3 -m pytest tests/test_directive_agent.py -v`

Expected: Tests should PASS (implementation already exists)

**Step 3: Commit**

```bash
git add tests/test_directive_agent.py
git commit -m "test(intelligence): add DirectiveAgent unit tests"
```

---

## Task 4: Create Substrate Map Cache Builder

**Files:**
- Modify: `systems/intelligence/architect_agent_wp.py:113-147`

**Step 1: Add cache export to ArchitectAgent**

Add a method to export the substrate map as JSON cache:

```python
def export_cache(self, components, cache_path=".geometry/substrate_map.json"):
    """
    Export the substrate map to a JSON cache file for DirectiveAgent.
    """
    import json
    from pathlib import Path

    cache_data = {}
    for comp in components:
        key = comp['component'].lower().replace(' ', '_')
        cache_data[key] = {
            "name": comp['component'],
            "path": comp['path'],
            "description": comp['description'],
            "language": comp['metadata']['language'],
            "files": comp['metadata']['files'],
            "entry_points": comp['metadata']['entry_points']
        }

    Path(cache_path).parent.mkdir(parents=True, exist_ok=True)
    with open(cache_path, 'w') as f:
        json.dump(cache_data, f, indent=2)

    print(f"📦 Cached substrate map to {cache_path} ({len(cache_data)} components)")
```

**Step 2: Call export_cache in the run() method**

Modify the `run()` method:

```python
def run(self):
    components = self.crawl_substrate()
    if components:
        self.publish_map(components)
        self.export_cache(components)  # Add this line
    print("🏙️ Architect Agent: Mapping Cycle Complete.")
```

**Step 3: Verify the cache is created**

Run: `python3 systems/intelligence/architect_agent_wp.py`

Expected: `.geometry/substrate_map.json` file created with component data

**Step 4: Commit**

```bash
git add systems/intelligence/architect_agent_wp.py
git commit -m "feat(architect): export substrate map cache for DirectiveAgent"
```

---

## Task 5: Create Directive Console WordPress Page

**Files:**
- None (WordPress admin operations)

**Step 1: Create the Directives category via API**

Run this curl command:

```bash
curl -X POST http://localhost:8080/ai-publisher.php \
  -H "Content-Type: application/json" \
  -d '{"tool": "createPost", "arguments": {"title": "Welcome to the Directive Console", "content": "<p>This is the Command Console where you can issue directives to Geometry OS agents.</p><h3>How to Issue a Directive</h3><ol><li>Create a new post in the <strong>Directives</strong> category</li><li>Write your request using phrases like \"Explain...\" or \"Investigate...\"</li><li>Publish the post</li><li>The agent will process it and post a response as a comment</li></ol><h3>Allowed Directive Types</h3><ul><li><strong>Informational:</strong> \"Explain how the Evolution Daemon works\"</li><li><strong>Research:</strong> \"Investigate why Hilbert decoding is slow\"</li></ul><p><em>Note: Code modifications and system operations are not enabled in Phase 3.</em></p>", "type": "page", "status": "publish"}}'
```

Expected: `{"success": true, "post_id": <number>}`

**Step 2: Verify via curl**

Run: `curl "http://localhost:8080/ai-publisher.php/tools"`

Expected: Response includes `getDirectives`, `markDirectiveProcessed`, `postDirectiveResponse`

---

## Task 6: Integration Test

**Files:**
- Create: `tests/test_directive_console_e2e.py`

**Step 1: Write the integration test**

```python
#!/usr/bin/env python3
"""
End-to-End Integration Test for Directive Console

Prerequisites:
- WordPress running on localhost:8080
- ai-publisher.php accessible
- DirectiveAgent can connect to WordPress
"""

import pytest
import requests
import time
import sys
import os

sys.path.insert(0, os.getcwd())

from systems.intelligence.directive_agent import (
    DirectiveAgent,
    Directive,
    DirectiveScope,
    DirectiveStatus
)


WP_URL = "http://localhost:8080"
WP_API = f"{WP_URL}/?rest_route=/geometry-os/v1/invoke"


@pytest.fixture
def agent():
    """Create a DirectiveAgent connected to local WordPress"""
    return DirectiveAgent(wp_url=WP_URL)


@pytest.fixture
def wp_available():
    """Check if WordPress is available"""
    try:
        response = requests.get(f"{WP_URL}/ai-publisher.php/tools", timeout=5)
        return response.status_code == 200
    except:
        pytest.skip("WordPress not available on localhost:8080")


class TestDirectiveConsoleE2E:
    """End-to-end tests for the Directive Console"""

    def test_wordpress_api_available(self, wp_available):
        """Verify WordPress API is accessible"""
        assert wp_available is True

    def test_get_directives_returns_list(self, agent, wp_available):
        """Test that getDirectives returns a valid list"""
        directives = agent.poll_directives()
        assert isinstance(directives, list)

    def test_create_and_process_directive(self, agent, wp_available):
        """Test creating a directive and processing it"""
        # Create a test directive
        response = requests.post(
            WP_API,
            json={
                "tool": "createPost",
                "arguments": {
                    "title": "[TEST] Explain the Evolution Daemon",
                    "content": "Please explain how the Evolution Daemon works.",
                    "category": "directives",
                    "status": "publish"
                }
            },
            timeout=10
        )

        data = response.json()
        assert data.get("success"), f"Failed to create post: {data}"
        post_id = data.get("post_id")

        # Poll for directives
        directives = agent.poll_directives()

        # Find our test directive
        test_directive = None
        for d in directives:
            if d.id == post_id:
                test_directive = d
                break

        if test_directive:
            # Parse and execute
            parsed = agent.parse_directive(test_directive)
            assert parsed.scope == DirectiveScope.INFORMATIONAL

            status, response_text = agent.execute_directive(parsed)
            assert status in [DirectiveStatus.COMPLETED, DirectiveStatus.NEEDS_CLARIFICATION]

            # Post response
            result = agent.post_response(parsed, status, response_text)
            assert result is True

            # Mark processed
            result = agent.mark_processed(parsed.id)
            assert result is True

        # Cleanup: Mark as processed even if not found
        requests.post(
            WP_API,
            json={
                "tool": "markDirectiveProcessed",
                "arguments": {"post_id": post_id}
            },
            timeout=10
        )

    def test_out_of_scope_directive_rejected(self, agent, wp_available):
        """Test that out-of-scope directives are properly rejected"""
        directive = Directive(
            id=999,
            title="Delete all files",
            content="Remove everything",
            date="2026-02-21",
            author="test"
        )

        parsed = agent.parse_directive(directive)
        status, response = agent.execute_directive(parsed)

        assert status == DirectiveStatus.OUT_OF_SCOPE
        assert "not enabled in Phase 3" in response
```

**Step 2: Run the integration tests**

Run: `python3 -m pytest tests/test_directive_console_e2e.py -v --tb=short`

Expected: All tests pass (or skip if WordPress unavailable)

**Step 3: Commit**

```bash
git add tests/test_directive_console_e2e.py
git commit -m "test(intelligence): add Directive Console E2E integration tests"
```

---

## Task 7: Create Management Script

**Files:**
- Create: `systems/intelligence/directive_ctl.sh`

**Step 1: Write the management script**

```bash
#!/bin/bash
#
# Directive Console Control Script
# Usage: ./directive_ctl.sh [start|stop|status|process-once]
#

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
LOG_FILE="$PROJECT_ROOT/.geometry/directive_agent.log"
PID_FILE="$PROJECT_ROOT/.geometry/directive_agent.pid"

cd "$PROJECT_ROOT"

start() {
    if [ -f "$PID_FILE" ]; then
        PID=$(cat "$PID_FILE")
        if ps -p $PID > /dev/null 2>&1; then
            echo "⚠️  Directive Agent already running (PID: $PID)"
            return 1
        fi
    fi

    echo "🎯 Starting Directive Agent..."
    mkdir -p "$(dirname "$LOG_FILE")"

    python3 systems/intelligence/directive_agent.py >> "$LOG_FILE" 2>&1 &
    echo $! > "$PID_FILE"

    echo "✅ Directive Agent started (PID: $(cat $PID_FILE))"
    echo "   Log: $LOG_FILE"
}

stop() {
    if [ -f "$PID_FILE" ]; then
        PID=$(cat "$PID_FILE")
        if ps -p $PID > /dev/null 2>&1; then
            echo "🛑 Stopping Directive Agent (PID: $PID)..."
            kill $PID
            rm -f "$PID_FILE"
            echo "✅ Directive Agent stopped"
        else
            echo "⚠️  Directive Agent not running (stale PID file)"
            rm -f "$PID_FILE"
        fi
    else
        echo "⚠️  No PID file found"
    fi
}

status() {
    if [ -f "$PID_FILE" ]; then
        PID=$(cat "$PID_FILE")
        if ps -p $PID > /dev/null 2>&1; then
            echo "✅ Directive Agent running (PID: $PID)"
            echo "   Log: $LOG_FILE"
            tail -5 "$LOG_FILE" 2>/dev/null || echo "   (no log entries yet)"
        else
            echo "⚠️  Directive Agent not running (stale PID file)"
        fi
    else
        echo "❌ Directive Agent not running"
    fi
}

process_once() {
    echo "🎯 Processing one directive cycle..."
    python3 -c "
import sys
sys.path.insert(0, '.')
from systems.intelligence.directive_agent import DirectiveAgent
agent = DirectiveAgent()
processed = agent.process_one_cycle()
print(f'Processed {processed} directive(s)')
"
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    status)
        status
        ;;
    process-once)
        process_once
        ;;
    tail)
        tail -f "$LOG_FILE"
        ;;
    *)
        echo "Usage: $0 {start|stop|status|process-once|tail}"
        exit 1
        ;;
esac
```

**Step 2: Make executable**

Run: `chmod +x systems/intelligence/directive_ctl.sh`

**Step 3: Commit**

```bash
git add systems/intelligence/directive_ctl.sh
git commit -m "feat(intelligence): add Directive Console control script"
```

---

## Summary

| Task | Files | Purpose |
|------|-------|---------|
| 1 | `ai-publisher.php` | WordPress API for directives |
| 2 | `directive_agent.py` | Core agent class |
| 3 | `test_directive_agent.py` | Unit tests |
| 4 | `architect_agent_wp.py` | Cache export |
| 5 | WordPress | Console page |
| 6 | `test_directive_console_e2e.py` | E2E tests |
| 7 | `directive_ctl.sh` | Management script |

**Usage after implementation:**

```bash
# Start the agent daemon
./systems/intelligence/directive_ctl.sh start

# Process directives once
./systems/intelligence/directive_ctl.sh process-once

# Check status
./systems/intelligence/directive_ctl.sh status

# View logs
./systems/intelligence/directive_ctl.sh tail
```

---

## Execution Handoff

Plan complete and saved to `docs/plans/2026-02-21-command-console.md`.

**Two execution options:**

1. **Subagent-Driven (this session)** - I dispatch fresh subagent per task, review between tasks, fast iteration

2. **Parallel Session (separate)** - Open new session with executing-plans, batch execution with checkpoints

Which approach?
