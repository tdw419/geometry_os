#!/usr/bin/env python3
"""
Language enforcement wrapper for LM Studio
"""

import json
import re

def enforce_english(text: str) -> str:
    """Enforce English language in responses"""
    # Check for common non-English patterns
    non_english_patterns = [
        r'用户', r'首先', r'然后', r'最后',  # Chinese
        r'utilisateur', r'd\'abord', r'ensuite',  # French
        r'Benutzer', r'zuerst', r'dann',  # German
        r'пользователь', r'сначала', r'затем'  # Russian
    ]

    for pattern in non_english_patterns:
        if re.search(pattern, text, re.IGNORECASE):
            return "Please provide the response in English."

    return text

def process_lm_response(response: dict) -> dict:
    """Process LM Studio response with language enforcement"""
    if 'content' in response:
        content = response['content']
        enforced_content = enforce_english(content)

        if enforced_content != content:
            print("⚠️  Language enforcement applied")
            response['content'] = enforced_content

    return response

if __name__ == "__main__":
    # Test the enforcer
    test_responses = [
        {"content": "用户需要帮助..."},
        {"content": "The user needs help..."},
        {"content": "首先，我们需要分析这个问题"}
    ]

    for resp in test_responses:
        print(f"Original: {resp['content'][:50]}...")
        processed = process_lm_response(resp)
        print(f"Processed: {processed['content'][:50]}...\n")
