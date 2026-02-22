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

def execute_directive(directive):
    print(f"Executing Directive: {directive['title']}")
    content = directive['content']
    
    # 1. Get current state
    try:
        view_output = subprocess.check_output(["python3", GET_VIEW_SCRIPT]).decode()
        # The script prints ASCII and then JSON Bindings. We need to parse.
        # This is a simplified version; in a real scenario, we'd pass this to an LLM.
    except Exception as e:
        return f"Failed to get desktop view: {e}"

    # 2. Logic: For now, we simulate a 'read-only' success or simple action
    # In a full integration, we would call an LLM API here with the ASCII view + Directive.
    
    result = f"""I've scanned the desktop. The current focused window is visible in ASCII.
Directive '{content}' received.

[SIMULATED EXECUTION COMPLETED]"""
    return result

def main():
    print("🚀 Geometry OS: Directive Polling Daemon Started.")
    print(f"Polling {WP_URL} every {POLL_INTERVAL}s...")
    
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
