import time
import requests
import json
import subprocess
import os
import sys
import re
from typing import Dict, List, Any, Optional

# Configuration
WP_URL = "http://localhost:8080/ai-publisher.php"
POLL_INTERVAL = 5  # seconds
SKILL_PATH = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", ".gemini", "skills", "ascii-desktop-control")
GET_VIEW_SCRIPT = os.path.join(SKILL_PATH, "scripts", "get_ascii_view.py")
ACTION_SCRIPT = os.path.join(SKILL_PATH, "scripts", "desktop_action.py")

# LLM Configuration (Phase 3.2)
USE_LLM = os.environ.get("USE_LLM", "false").lower() in ("true", "1", "yes")
LLM_ENDPOINT = os.environ.get("LLM_ENDPOINT", "http://localhost:11434/api/generate")
LLM_MODEL = os.environ.get("LLM_MODEL", "llama3.2:latest")
LLM_TIMEOUT = int(os.environ.get("LLM_TIMEOUT", "30"))

# ============================================================================
# Heuristic Intent Parsing (Phase 3.1)
# ============================================================================

# Action keywords mapping to xdotool commands
ACTION_KEYWORDS = {
    'click': ['click', 'press', 'tap', 'select', 'open', 'launch', 'activate'],
    'type': ['type', 'enter', 'write', 'input', 'fill', 'send'],
    'key': ['press', 'hit', 'key', 'shortcut', 'hotkey'],
    'move': ['move', 'drag', 'scroll', 'hover'],
    'wait': ['wait', 'sleep', 'pause', 'delay'],
    'focus': ['focus', 'switch', 'activate', 'bring'],
    'close': ['close', 'quit', 'exit', 'dismiss'],
}

# Target patterns for extracting clickable elements
TARGET_PATTERNS = [
    r'window\s+([A-Z0-9])',           # "window A" or "window B"
    r'button\s+([A-Z0-9])',           # "button C"
    r'click\s+([A-Z0-9])',            # "click A"
    r'([A-Z0-9])\s+button',           # "A button"
    r'element\s+([A-Z0-9])',          # "element X"
]

def parse_directive_intent(directive: Dict) -> Dict:
    """
    Parse a directive to extract action, target, and text heuristically.

    Args:
        directive: Dict with 'title', 'content', and optionally 'id'

    Returns:
        Dict with:
            - action: str (click, type, key, move, wait, focus, close)
            - target: Optional[str] (window label like 'A', 'B', etc.)
            - text: Optional[str] (text to type or key sequence)
            - confidence: float (0.0-1.0 confidence in parsing)
    """
    title = directive.get('title', '').lower()
    content = directive.get('content', '').lower()
    combined = f"{title} {content}"

    result = {
        'action': 'unknown',
        'target': None,
        'text': None,
        'confidence': 0.0,
    }

    # Detect action type
    best_action = 'click'  # default
    best_score = 0
    for action, keywords in ACTION_KEYWORDS.items():
        score = sum(1 for kw in keywords if kw in combined)
        if score > best_score:
            best_score = score
            best_action = action

    result['action'] = best_action
    result['confidence'] = min(0.5 + (best_score * 0.1), 0.9)  # scale confidence

    # Extract target (window/element label)
    for pattern in TARGET_PATTERNS:
        match = re.search(pattern, combined)
        if match:
            result['target'] = match.group(1).upper()
            result['confidence'] = min(result['confidence'] + 0.1, 0.95)
            break

    # Extract text to type (text in quotes or after "type"/"enter" keywords)
    type_match = re.search(r'["\'](.+?)["\']', combined)
    if type_match:
        result['text'] = type_match.group(1)
        result['confidence'] = min(result['confidence'] + 0.1, 0.95)
    else:
        # Look for text after type/enter keyword
        text_after = re.search(r'(?:type|enter|write|input)\s+([^\n]+?)(?:\s+(?:in|into|on)|$)', combined)
        if text_after:
            result['text'] = text_after.group(1).strip()

    # Extract key sequences (e.g., "Ctrl+C", "Alt+Tab")
    key_match = re.search(r'([A-Z][a-z]+(?:\+[A-Z][a-z]+)+)', combined)
    if key_match and result['action'] in ('key', 'click'):
        result['text'] = key_match.group(1)
        result['action'] = 'key'
        result['confidence'] = min(result['confidence'] + 0.15, 0.98)

    return result


# ============================================================================
# LLM Integration (Phase 3.2)
# ============================================================================

def call_llm(prompt: str, model: Optional[str] = None, endpoint: Optional[str] = None) -> str:
    """
    Call an LLM API (Ollama or LM Studio) with a prompt.

    Supports:
    - Ollama: http://localhost:11434/api/generate
    - LM Studio: http://localhost:1234/v1/chat/completions

    Args:
        prompt: The prompt to send to the LLM
        model: Model name (defaults to LLM_MODEL env var)
        endpoint: API endpoint URL (defaults to LLM_ENDPOINT env var)

    Returns:
        The LLM response text

    Raises:
        RuntimeError: If LLM call fails
    """
    model = model or LLM_MODEL
    endpoint = endpoint or LLM_ENDPOINT

    # Detect endpoint type and format request accordingly
    if "/api/generate" in endpoint:
        # Ollama format
        payload = {
            "model": model,
            "prompt": prompt,
            "stream": False,
        }
    elif "/v1/chat/completions" in endpoint:
        # LM Studio / OpenAI-compatible format
        payload = {
            "model": model,
            "messages": [
                {"role": "user", "content": prompt}
            ],
            "temperature": 0.7,
        }
    else:
        # Default to Ollama format
        payload = {
            "model": model,
            "prompt": prompt,
            "stream": False,
        }

    try:
        response = requests.post(
            endpoint,
            json=payload,
            timeout=LLM_TIMEOUT,
            headers={"Content-Type": "application/json"},
        )
        response.raise_for_status()
        data = response.json()

        # Extract response text based on endpoint type
        if "/v1/chat/completions" in endpoint:
            # OpenAI/LM Studio format
            return data.get("choices", [{}])[0].get("message", {}).get("content", "")
        else:
            # Ollama format
            return data.get("response", "")

    except requests.exceptions.Timeout:
        raise RuntimeError(f"LLM request timed out after {LLM_TIMEOUT}s")
    except requests.exceptions.ConnectionError:
        raise RuntimeError(f"Failed to connect to LLM at {endpoint}")
    except requests.exceptions.HTTPError as e:
        raise RuntimeError(f"LLM API error: {e.response.status_code} - {e.response.text}")
    except Exception as e:
        raise RuntimeError(f"LLM call failed: {e}")


def build_llm_prompt(ascii_view: str, bindings: Dict, directive: Dict) -> str:
    """
    Build a prompt for an LLM to analyze the ASCII view and plan actions.

    Args:
        ascii_view: ASCII representation of the desktop
        bindings: Dict mapping labels (A-Z, 0-9) to screen coordinates
        directive: The directive to execute

    Returns:
        A formatted prompt string for the LLM
    """
    directive_title = directive.get('title', 'Unknown')
    directive_content = directive.get('content', '')

    # Format bindings for readability
    bindings_text = ""
    for label, coords in sorted(bindings.items()):
        x, y, w, h = coords.get('x', 0), coords.get('y', 0), coords.get('w', 0), coords.get('h', 0)
        desc = coords.get('description', '')
        bindings_text += f"  [{label}] x={x}, y={y}, w={w}, h={h}"
        if desc:
            bindings_text += f" - {desc}"
        bindings_text += "\n"

    prompt = f"""You are a desktop automation assistant. Analyze this ASCII desktop view and plan actions to complete the directive.

## Directive
Title: {directive_title}
Content: {directive_content}

## ASCII Desktop View (80x24 grid)
```
{ascii_view}
```

## Clickable Elements (bindings)
{bindings_text}

## Task
1. Analyze the directive and identify required actions
2. Map actions to the labeled elements above
3. Output actions in JSON format

## Output Format
Return a JSON array of actions. Each action should be:
{{"action": "click|type|key|move|wait", "target": "LABEL or null", "text": "text to type or key combo"}}

Example responses:
- Click window A: [{{"action": "click", "target": "A", "text": null}}]
- Type "hello": [{{"action": "type", "target": null, "text": "hello"}}]
- Press Ctrl+C: [{{"action": "key", "target": null, "text": "ctrl+c"}}]

Now analyze and respond with the action sequence:
"""
    return prompt


def parse_llm_response(response: str) -> Dict:
    """
    Parse LLM response to extract actions.

    Args:
        response: Raw LLM response text

    Returns:
        Dict with:
            - actions: List of action dicts
            - raw_response: Original response
            - parse_success: bool
            - error: Optional error message
    """
    result = {
        'actions': [],
        'raw_response': response,
        'parse_success': False,
        'error': None,
    }

    # Try to extract JSON array from response
    # Look for content between [ ] brackets
    json_patterns = [
        r'\[\s*\{.*?\}\s*\]',  # Simple JSON array
        r'```json\s*(\[.*?\])\s*```',  # JSON in code block
        r'```\s*(\[.*?\])\s*```',  # Array in code block without json label
    ]

    for pattern in json_patterns:
        match = re.search(pattern, response, re.DOTALL)
        if match:
            try:
                json_str = match.group(1) if match.lastindex else match.group(0)
                actions = json.loads(json_str)
                if isinstance(actions, list):
                    # Validate each action has required fields
                    validated = []
                    for action in actions:
                        if isinstance(action, dict) and 'action' in action:
                            validated.append({
                                'action': action.get('action', 'click'),
                                'target': action.get('target'),
                                'text': action.get('text'),
                            })
                    if validated:
                        result['actions'] = validated
                        result['parse_success'] = True
                        return result
            except json.JSONDecodeError as e:
                result['error'] = f"JSON parse error: {e}"
                continue

    # Fallback: try to extract individual action objects
    action_pattern = r'\{\s*"action"\s*:\s*"(\w+)"(?:,\s*"target"\s*:\s*(?:"(\w+)"|null))?(?:,\s*"text"\s*:\s*(?:"([^"]*)"|null))?\s*\}'
    matches = re.findall(action_pattern, response)
    if matches:
        for match in matches:
            result['actions'].append({
                'action': match[0],
                'target': match[1] if match[1] else None,
                'text': match[2] if match[2] else None,
            })
        result['parse_success'] = True
        return result

    # No valid actions found
    if not result['error']:
        result['error'] = "No valid action JSON found in response"

    return result


def poll_directives():
    try:
        response = requests.post(WP_URL, json={"action": "getDirectives"}, timeout=10)
        if response.status_code == 200:
            return response.json().get("directives", [])
    except Exception as e:
        print(f"Error polling: {e}")
    return []

def mark_processed(post_id):
    requests.post(WP_URL, json={"action": "markDirectiveProcessed", "post_id": post_id})

def post_response(post_id, result, status="COMPLETED"):
    payload = {
        "action": "postDirectiveResponse",
        "post_id": post_id,
        "response": result,
        "status": status
    }
    requests.post(WP_URL, json=payload)

def parse_ascii_view_output(output: str) -> tuple:
    """
    Parse the output from get_ascii_view.py to extract ASCII view and bindings.

    Args:
        output: Raw output from get_ascii_view.py (ASCII + JSON)

    Returns:
        Tuple of (ascii_view: str, bindings: Dict)
    """
    lines = output.strip().split('\n')

    # Find where JSON starts (look for lines starting with { or [)
    json_start_idx = None
    for i, line in enumerate(lines):
        stripped = line.strip()
        if stripped.startswith('{') or stripped.startswith('['):
            json_start_idx = i
            break

    if json_start_idx is None:
        # No JSON found, return entire output as ASCII
        return output, {}

    # Split into ASCII and JSON parts
    ascii_lines = lines[:json_start_idx]
    json_lines = lines[json_start_idx:]
    ascii_view = '\n'.join(ascii_lines)
    json_str = '\n'.join(json_lines)

    # Parse JSON
    try:
        bindings = json.loads(json_str)
    except json.JSONDecodeError:
        bindings = {}

    return ascii_view, bindings


def execute_action(action: Dict, bindings: Dict) -> bool:
    """
    Execute a single action using desktop_action.py.

    Args:
        action: Dict with 'action', 'target', 'text' fields
        bindings: Dict mapping labels to coordinates

    Returns:
        True if action succeeded, False otherwise
    """
    action_type = action.get('action', 'click')
    target = action.get('target')
    text = action.get('text')

    try:
        if action_type == 'click' and target:
            # Get coordinates from bindings
            if target in bindings:
                coords = bindings[target]
                x = coords.get('x', 0) + coords.get('w', 0) // 2
                y = coords.get('y', 0) + coords.get('h', 0) // 2
                subprocess.run(["python3", ACTION_SCRIPT, "click", str(x), str(y)], check=True)
                return True
        elif action_type == 'type' and text:
            subprocess.run(["python3", ACTION_SCRIPT, "type", text], check=True)
            return True
        elif action_type == 'key' and text:
            subprocess.run(["python3", ACTION_SCRIPT, "key", text], check=True)
            return True
        elif action_type == 'move' and target:
            if target in bindings:
                coords = bindings[target]
                x = coords.get('x', 0) + coords.get('w', 0) // 2
                y = coords.get('y', 0) + coords.get('h', 0) // 2
                subprocess.run(["python3", ACTION_SCRIPT, "move", str(x), str(y)], check=True)
                return True
        elif action_type == 'wait':
            import time
            wait_time = float(text) if text else 1.0
            time.sleep(wait_time)
            return True
    except subprocess.CalledProcessError as e:
        print(f"Action failed: {e}")
        return False

    return False


def execute_directive(directive):
    """Execute a directive using heuristic parsing or LLM-powered decision making."""
    print(f"Executing Directive: {directive['title']}")
    content = directive['content']

    # 1. Get current state (ASCII view + bindings)
    try:
        view_output = subprocess.check_output(["python3", GET_VIEW_SCRIPT]).decode()
        ascii_view, bindings = parse_ascii_view_output(view_output)
    except Exception as e:
        return f"Failed to get desktop view: {e}"

    # 2. Decide how to process the directive
    if USE_LLM:
        # LLM-powered execution
        try:
            prompt = build_llm_prompt(ascii_view, bindings, directive)
            llm_response = call_llm(prompt)
            parsed = parse_llm_response(llm_response)

            if parsed['parse_success'] and parsed['actions']:
                results = []
                for action in parsed['actions']:
                    success = execute_action(action, bindings)
                    results.append(f"  - {action['action']}: {'OK' if success else 'FAILED'}")

                result = f"""LLM-powered execution completed.
Directive: {content}

Actions planned by LLM:
{chr(10).join(results)}

Raw LLM response excerpt:
{llm_response[:500]}..."""
            else:
                # LLM parsing failed, fall back to heuristic
                result = f"""LLM parsing failed: {parsed.get('error', 'Unknown error')}
Falling back to heuristic parsing.

"""
                intent = parse_directive_intent(directive)
                success = execute_action(intent, bindings)
                result += f"Heuristic action: {intent['action']} -> {'OK' if success else 'FAILED'}"

        except RuntimeError as e:
            result = f"LLM call failed: {e}\nDirective '{content}' not executed."
    else:
        # Heuristic execution (no LLM)
        intent = parse_directive_intent(directive)
        success = execute_action(intent, bindings)

        result = f"""Heuristic execution completed.
Directive: {content}

Parsed intent:
  - Action: {intent['action']}
  - Target: {intent['target']}
  - Text: {intent['text']}
  - Confidence: {intent['confidence']:.2f}

Execution: {'SUCCESS' if success else 'FAILED'}
[HEURISTIC MODE - Set USE_LLM=true for LLM-powered execution]"""

    return result

def main():
    print("🚀 Geometry OS: Directive Polling Daemon Started.")
    print(f"Polling {WP_URL} every {POLL_INTERVAL}s...")
    if USE_LLM:
        print(f"🧠 LLM Mode: ENABLED (model={LLM_MODEL}, endpoint={LLM_ENDPOINT})")
    else:
        print("⚙️ LLM Mode: DISABLED (using heuristic parsing)")

    while True:
        directives = poll_directives()
        for d in directives:
            post_id = d['id']
            mark_processed(post_id)
            result = execute_directive(d)
            post_response(post_id, result)
            print(f"✅ Processed Directive {post_id}")

        time.sleep(POLL_INTERVAL)

if __name__ == "__main__":
    main()
