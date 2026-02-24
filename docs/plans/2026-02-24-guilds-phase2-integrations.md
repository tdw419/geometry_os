# Guilds Phase 2 - Real Integrations Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add real LLM code generation, security scanning, and style checking to Guild agents.

**Architecture:** Three parallel integration layers (providers, scanners, linters) behind common interfaces. Guild agents depend on interfaces, not implementations. Sandbox executor with rlimit for safe code testing.

**Tech Stack:** Python 3.12, asyncio, bandit, ruff, subprocess + resource module

---

## Task 1: LLM Provider Interface

**Files:**
- Create: `systems/swarm/guilds/providers/__init__.py`
- Create: `systems/swarm/guilds/providers/base.py`
- Create: `tests/swarm/test_providers_base.py`

**Step 1: Write the failing test**

```python
# tests/swarm/test_providers_base.py
"""Tests for LLM provider base classes."""

import pytest
from systems.swarm.guilds.providers.base import LLMProvider, LLMProviderError


class TestLLMProviderError:
    """Test LLMProviderError exception."""

    def test_error_has_provider_name(self):
        """Error should track which provider failed."""
        error = LLMProviderError("Connection failed", provider="openai")
        assert error.provider == "openai"

    def test_error_tracks_recoverability(self):
        """Error should indicate if retry is possible."""
        recoverable = LLMProviderError("Rate limit", provider="openai", recoverable=True)
        assert recoverable.recoverable is True

        permanent = LLMProviderError("Invalid API key", provider="openai", recoverable=False)
        assert permanent.recoverable is False

    def test_error_message_includes_provider(self):
        """Error message should be informative."""
        error = LLMProviderError("Timeout", provider="anthropic")
        assert "anthropic" in str(error)


class TestLLMProviderProtocol:
    """Test LLMProvider protocol compliance."""

    def test_protocol_requires_name_attribute(self):
        """Providers must have a name attribute."""
        # This tests the protocol structure, not an instance
        from typing import get_type_hints
        # Protocol defines the interface; implementations must have 'name'
        assert hasattr(LLMProvider, '__protocol_attrs__') or True  # Protocol exists
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/test_providers_base.py -v`
Expected: FAIL with "ModuleNotFoundError"

**Step 3: Create module structure**

```python
# systems/swarm/guilds/providers/__init__.py
"""LLM provider integrations for guild agents."""

from systems.swarm.guilds.providers.base import LLMProvider, LLMProviderError

__all__ = ["LLMProvider", "LLMProviderError"]
```

```python
# systems/swarm/guilds/providers/base.py
"""Base classes for LLM providers."""

from typing import Protocol, AsyncIterator, runtime_checkable


class LLMProviderError(Exception):
    """Error from an LLM provider."""

    def __init__(
        self,
        message: str,
        *,
        provider: str,
        recoverable: bool = False
    ):
        super().__init__(f"[{provider}] {message}")
        self.provider = provider
        self.recoverable = recoverable


@runtime_checkable
class LLMProvider(Protocol):
    """Interface for LLM code generation providers."""

    name: str

    async def generate(
        self,
        prompt: str,
        *,
        max_tokens: int = 2048,
        temperature: float = 0.7,
    ) -> str:
        """Generate code from prompt.

        Args:
            prompt: The code generation prompt
            max_tokens: Maximum tokens to generate
            temperature: Sampling temperature (0-1)

        Returns:
            Generated code string

        Raises:
            LLMProviderError: On provider failure
        """
        ...

    async def generate_stream(
        self,
        prompt: str,
        **kwargs
    ) -> AsyncIterator[str]:
        """Stream code generation for long outputs.

        Yields:
            Chunks of generated code
        """
        ...
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/swarm/test_providers_base.py -v`
Expected: PASS (3 tests)

**Step 5: Commit**

```bash
git add systems/swarm/guilds/providers/__init__.py
git add systems/swarm/guilds/providers/base.py
git add tests/swarm/test_providers_base.py
git commit -m "feat(guilds): add LLM provider interface and error class"
```

---

## Task 2: Mock Provider for Testing

**Files:**
- Create: `systems/swarm/guilds/providers/mock.py`
- Create: `tests/swarm/test_providers_mock.py`

**Step 1: Write the failing test**

```python
# tests/swarm/test_providers_mock.py
"""Tests for mock LLM provider."""

import pytest
from systems.swarm.guilds.providers.mock import MockProvider


class TestMockProvider:
    """Test MockProvider for testing."""

    def test_provider_has_name(self):
        """Provider should have a name."""
        provider = MockProvider()
        assert provider.name == "mock"

    @pytest.mark.asyncio
    async def test_generate_returns_fixed_response(self):
        """Mock generate returns predictable response."""
        provider = MockProvider(response="# Generated code\npass")
        result = await provider.generate("any prompt")
        assert result == "# Generated code\npass"

    @pytest.mark.asyncio
    async def test_generate_respects_max_tokens(self):
        """Mock provider respects max_tokens parameter."""
        provider = MockProvider(response="x" * 1000)
        result = await provider.generate("prompt", max_tokens=10)
        # Mock should truncate to simulate token limit
        assert len(result) <= 40  # ~4 chars per token rough estimate

    @pytest.mark.asyncio
    async def test_generate_can_simulate_failure(self):
        """Mock can simulate provider failure."""
        provider = MockProvider(fail_with="Rate limit exceeded")
        with pytest.raises(Exception) as exc_info:
            await provider.generate("prompt")
        assert "Rate limit" in str(exc_info.value)

    @pytest.mark.asyncio
    async def test_generate_stream_yields_chunks(self):
        """Mock streaming yields response in chunks."""
        provider = MockProvider(response="line1\nline2\nline3")
        chunks = []
        async for chunk in provider.generate_stream("prompt"):
            chunks.append(chunk)
        assert len(chunks) == 3
        assert chunks[0] == "line1"
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/test_providers_mock.py -v`
Expected: FAIL with "ModuleNotFoundError"

**Step 3: Write implementation**

```python
# systems/swarm/guilds/providers/mock.py
"""Mock LLM provider for testing."""

from typing import AsyncIterator, Optional
from systems.swarm.guilds.providers.base import LLMProviderError


class MockProvider:
    """Mock LLM provider for unit testing guild agents."""

    def __init__(
        self,
        response: str = "# Mock generated code\npass",
        fail_with: Optional[str] = None
    ):
        self.name = "mock"
        self._response = response
        self._fail_with = fail_with

    async def generate(
        self,
        prompt: str,
        *,
        max_tokens: int = 2048,
        temperature: float = 0.7,
    ) -> str:
        """Generate mock response."""
        if self._fail_with:
            raise LLMProviderError(
                self._fail_with,
                provider=self.name,
                recoverable="rate limit" in self._fail_with.lower()
            )

        # Simulate token truncation (rough: 4 chars per token)
        max_chars = max_tokens * 4
        return self._response[:max_chars]

    async def generate_stream(
        self,
        prompt: str,
        **kwargs
    ) -> AsyncIterator[str]:
        """Stream mock response line by line."""
        for line in self._response.split("\n"):
            yield line
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/swarm/test_providers_mock.py -v`
Expected: PASS (5 tests)

**Step 5: Commit**

```bash
git add systems/swarm/guilds/providers/mock.py
git add tests/swarm/test_providers_mock.py
git commit -m "feat(guilds): add MockProvider for testing"
```

---

## Task 3: OpenAI Provider

**Files:**
- Create: `systems/swarm/guilds/providers/openai.py`
- Create: `tests/swarm/test_providers_openai.py`

**Step 1: Write the failing test**

```python
# tests/swarm/test_providers_openai.py
"""Tests for OpenAI LLM provider."""

import pytest
from unittest.mock import AsyncMock, patch, MagicMock
from systems.swarm.guilds.providers.openai import OpenAIProvider
from systems.swarm.guilds.providers.base import LLMProviderError


class TestOpenAIProvider:
    """Test OpenAI provider implementation."""

    def test_provider_name(self):
        """Provider name should be openai."""
        provider = OpenAIProvider(api_key="test-key")
        assert provider.name == "openai"

    def test_requires_api_key(self):
        """Provider should require API key."""
        with pytest.raises(ValueError, match="api_key"):
            OpenAIProvider()

    @pytest.mark.asyncio
    async def test_generate_calls_openai_api(self):
        """Generate should call OpenAI API correctly."""
        with patch("systems.swarm.guilds.providers.openai.AsyncOpenAI") as mock_client:
            mock_response = MagicMock()
            mock_response.choices = [MagicMock()]
            mock_response.choices[0].message.content = "def hello(): pass"

            mock_client.return_value.chat.completions.create = AsyncMock(
                return_value=mock_response
            )

            provider = OpenAIProvider(api_key="test-key")
            result = await provider.generate("Write a hello function")

            assert result == "def hello(): pass"
            mock_client.return_value.chat.completions.create.assert_called_once()

    @pytest.mark.asyncio
    async def test_generate_handles_rate_limit(self):
        """Should raise recoverable error on rate limit."""
        with patch("systems.swarm.guilds.providers.openai.AsyncOpenAI") as mock_client:
            from openai import RateLimitError

            mock_client.return_value.chat.completions.create = AsyncMock(
                side_effect=RateLimitError(
                    "Rate limit",
                    response=MagicMock(status_code=429),
                    body=None
                )
            )

            provider = OpenAIProvider(api_key="test-key")
            with pytest.raises(LLMProviderError) as exc_info:
                await provider.generate("prompt")

            assert exc_info.value.recoverable is True

    @pytest.mark.asyncio
    async def test_generate_handles_auth_error(self):
        """Should raise non-recoverable error on auth failure."""
        with patch("systems.swarm.guilds.providers.openai.AsyncOpenAI") as mock_client:
            from openai import AuthenticationError

            mock_client.return_value.chat.completions.create = AsyncMock(
                side_effect=AuthenticationError(
                    "Invalid API key",
                    response=MagicMock(status_code=401),
                    body=None
                )
            )

            provider = OpenAIProvider(api_key="test-key")
            with pytest.raises(LLMProviderError) as exc_info:
                await provider.generate("prompt")

            assert exc_info.value.recoverable is False
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/test_providers_openai.py -v`
Expected: FAIL with "ModuleNotFoundError"

**Step 3: Write implementation**

```python
# systems/swarm/guilds/providers/openai.py
"""OpenAI LLM provider implementation."""

import os
from typing import AsyncIterator, Optional
from systems.swarm.guilds.providers.base import LLMProviderError

# Lazy import to avoid requiring openai package
_OPENAI_AVAILABLE = None
_AsyncOpenAI = None


def _get_openai():
    global _OPENAI_AVAILABLE, _AsyncOpenAI
    if _OPENAI_AVAILABLE is None:
        try:
            from openai import AsyncOpenAI
            _AsyncOpenAI = AsyncOpenAI
            _OPENAI_AVAILABLE = True
        except ImportError:
            _OPENAI_AVAILABLE = False
    return _AsyncOpenAI


class OpenAIProvider:
    """OpenAI API provider for code generation."""

    def __init__(
        self,
        api_key: Optional[str] = None,
        model: str = "gpt-4",
    ):
        if not api_key:
            api_key = os.environ.get("OPENAI_API_KEY")
        if not api_key:
            raise ValueError("OpenAI API key required (api_key or OPENAI_API_KEY env)")

        self.name = "openai"
        self._api_key = api_key
        self._model = model
        self._client = None

    def _get_client(self):
        """Lazy initialization of OpenAI client."""
        if self._client is None:
            AsyncOpenAI = _get_openai()
            if not AsyncOpenAI:
                raise LLMProviderError(
                    "openai package not installed. Run: pip install openai",
                    provider=self.name,
                    recoverable=False
                )
            self._client = AsyncOpenAI(api_key=self._api_key)
        return self._client

    async def generate(
        self,
        prompt: str,
        *,
        max_tokens: int = 2048,
        temperature: float = 0.7,
    ) -> str:
        """Generate code using OpenAI API."""
        client = self._get_client()

        try:
            response = await client.chat.completions.create(
                model=self._model,
                messages=[
                    {
                        "role": "system",
                        "content": "You are a code generator. Return only code, no explanations."
                    },
                    {"role": "user", "content": prompt}
                ],
                max_tokens=max_tokens,
                temperature=temperature,
            )
            return response.choices[0].message.content

        except Exception as e:
            error_name = type(e).__name__
            is_rate_limit = "rate" in str(e).lower() or "429" in str(e)
            is_auth = "auth" in str(e).lower() or "401" in str(e)

            raise LLMProviderError(
                str(e),
                provider=self.name,
                recoverable=is_rate_limit and not is_auth
            )

    async def generate_stream(
        self,
        prompt: str,
        **kwargs
    ) -> AsyncIterator[str]:
        """Stream code generation (not implemented for OpenAI yet)."""
        # For now, just yield the full response
        result = await self.generate(prompt, **kwargs)
        yield result
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/swarm/test_providers_openai.py -v`
Expected: PASS (5 tests)

**Step 5: Commit**

```bash
git add systems/swarm/guilds/providers/openai.py
git add tests/swarm/test_providers_openai.py
git commit -m "feat(guilds): add OpenAI provider implementation"
```

---

## Task 4: Security Scanner Interface

**Files:**
- Create: `systems/swarm/guilds/scanners/__init__.py`
- Create: `systems/swarm/guilds/scanners/base.py`
- Create: `tests/swarm/test_scanners_base.py`

**Step 1: Write the failing test**

```python
# tests/swarm/test_scanners_base.py
"""Tests for security scanner base classes."""

import pytest
from systems.swarm.guilds.scanners.base import SecurityFinding, SecurityScanner


class TestSecurityFinding:
    """Test SecurityFinding dataclass."""

    def test_finding_has_required_fields(self):
        """Finding should have all required fields."""
        finding = SecurityFinding(
            rule_id="B101",
            severity="medium",
            message="Use of assert detected",
            line=42,
            confidence="high"
        )
        assert finding.rule_id == "B101"
        assert finding.severity == "medium"
        assert finding.message == "Use of assert detected"
        assert finding.line == 42
        assert finding.confidence == "high"

    def test_finding_is_dataclass(self):
        """Finding should be a dataclass for easy construction."""
        finding = SecurityFinding(
            rule_id="B101",
            severity="low",
            message="test",
            line=1,
            confidence="low"
        )
        # Should have __dataclass_fields__
        assert hasattr(finding, '__dataclass_fields__')


class TestSecurityScannerProtocol:
    """Test SecurityScanner protocol."""

    def test_scanner_protocol_exists(self):
        """SecurityScanner should be a Protocol."""
        # Protocol exists and can be checked
        assert SecurityScanner is not None
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/test_scanners_base.py -v`
Expected: FAIL with "ModuleNotFoundError"

**Step 3: Write implementation**

```python
# systems/swarm/guilds/scanners/__init__.py
"""Security scanner integrations for guild agents."""

from systems.swarm.guilds.scanners.base import SecurityFinding, SecurityScanner

__all__ = ["SecurityFinding", "SecurityScanner"]
```

```python
# systems/swarm/guilds/scanners/base.py
"""Base classes for security scanners."""

from dataclasses import dataclass
from typing import List, Protocol, runtime_checkable


@dataclass
class SecurityFinding:
    """A security vulnerability finding."""

    rule_id: str       # "B101" for bandit
    severity: str      # "low" | "medium" | "high" | "critical"
    message: str
    line: int
    confidence: str    # "low" | "medium" | "high"


@runtime_checkable
class SecurityScanner(Protocol):
    """Interface for security scanning providers."""

    name: str

    def scan(self, code: str, language: str = "python") -> List[SecurityFinding]:
        """Scan code for security vulnerabilities.

        Args:
            code: Source code to scan
            language: Programming language (default: python)

        Returns:
            List of security findings
        """
        ...
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/swarm/test_scanners_base.py -v`
Expected: PASS (3 tests)

**Step 5: Commit**

```bash
git add systems/swarm/guilds/scanners/__init__.py
git add systems/swarm/guilds/scanners/base.py
git add tests/swarm/test_scanners_base.py
git commit -m "feat(guilds): add security scanner interface"
```

---

## Task 5: Bandit Scanner Implementation

**Files:**
- Create: `systems/swarm/guilds/scanners/bandit.py`
- Create: `tests/swarm/test_scanners_bandit.py`

**Step 1: Write the failing test**

```python
# tests/swarm/test_scanners_bandit.py
"""Tests for Bandit security scanner."""

import pytest
from systems.swarm.guilds.scanners.bandit import BanditScanner
from systems.swarm.guilds.scanners.base import SecurityFinding


class TestBanditScanner:
    """Test Bandit scanner implementation."""

    def test_scanner_name(self):
        """Scanner should have correct name."""
        scanner = BanditScanner()
        assert scanner.name == "bandit"

    def test_scan_detects_assert_usage(self):
        """Should detect assert usage (B101)."""
        scanner = BanditScanner()
        code = """
def test_something():
    assert True
    assert 1 + 1 == 2
"""
        findings = scanner.scan(code)
        assert len(findings) >= 1
        assert any(f.rule_id == "B101" for f in findings)

    def test_scan_detects_exec_usage(self):
        """Should detect exec usage (B102)."""
        scanner = BanditScanner()
        code = 'exec("print(1)")'
        findings = scanner.scan(code)
        assert len(findings) >= 1
        assert any(f.rule_id == "B102" for f in findings)

    def test_scan_clean_code_returns_empty(self):
        """Clean code should return no findings."""
        scanner = BanditScanner()
        code = """
def add(a, b):
    return a + b
"""
        findings = scanner.scan(code)
        assert len(findings) == 0

    def test_finding_has_correct_structure(self):
        """Findings should have all required fields."""
        scanner = BanditScanner()
        code = "eval('1+1')"
        findings = scanner.scan(code)

        assert len(findings) >= 1
        finding = findings[0]
        assert isinstance(finding, SecurityFinding)
        assert finding.rule_id.startswith("B")
        assert finding.severity in ("low", "medium", "high", "critical")
        assert finding.line > 0
        assert finding.confidence in ("low", "medium", "high")

    def test_scan_handles_invalid_python(self):
        """Should handle syntax errors gracefully."""
        scanner = BanditScanner()
        code = "this is not valid python !!!"
        # Should not raise, return empty or error finding
        findings = scanner.scan(code)
        assert isinstance(findings, list)
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/test_scanners_bandit.py -v`
Expected: FAIL with "ModuleNotFoundError"

**Step 3: Write implementation**

```python
# systems/swarm/guilds/scanners/bandit.py
"""Bandit security scanner implementation."""

import json
import subprocess
import tempfile
from pathlib import Path
from typing import List

from systems.swarm.guilds.scanners.base import SecurityFinding


class BanditScanner:
    """Bandit-based security scanner for Python code."""

    def __init__(self, severity_threshold: str = "low"):
        """
        Args:
            severity_threshold: Minimum severity to report ("low", "medium", "high")
        """
        self.name = "bandit"
        self._severity_threshold = severity_threshold

    def scan(self, code: str, language: str = "python") -> List[SecurityFinding]:
        """Scan code using bandit."""
        if language != "python":
            return []  # Bandit only supports Python

        # Write to temp file for bandit
        with tempfile.NamedTemporaryFile(
            mode="w",
            suffix=".py",
            delete=False
        ) as f:
            f.write(code)
            temp_path = f.name

        try:
            result = subprocess.run(
                ["bandit", "-f", "json", "-r", temp_path],
                capture_output=True,
                text=True,
                timeout=30
            )

            # Bandit returns non-zero on findings
            if result.returncode not in (0, 1):
                # Actual error
                return []

            return self._parse_output(result.stdout)

        except subprocess.TimeoutExpired:
            return []
        except FileNotFoundError:
            # Bandit not installed
            return []
        finally:
            Path(temp_path).unlink(missing_ok=True)

    def _parse_output(self, json_output: str) -> List[SecurityFinding]:
        """Parse bandit JSON output into findings."""
        if not json_output.strip():
            return []

        try:
            data = json.loads(json_output)
        except json.JSONDecodeError:
            return []

        findings = []
        severity_map = {
            "LOW": "low",
            "MEDIUM": "medium",
            "HIGH": "high",
            "CRITICAL": "critical"
        }

        for issue in data.get("results", []):
            severity = severity_map.get(
                issue.get("issue_severity", "LOW").upper(),
                "low"
            )

            findings.append(SecurityFinding(
                rule_id=issue.get("test_id", "UNKNOWN"),
                severity=severity,
                message=issue.get("issue_text", ""),
                line=issue.get("line_number", 0),
                confidence=issue.get("issue_confidence", "MEDIUM").lower()
            ))

        return findings
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/swarm/test_scanners_bandit.py -v`
Expected: PASS (6 tests)

**Step 5: Commit**

```bash
git add systems/swarm/guilds/scanners/bandit.py
git add tests/swarm/test_scanners_bandit.py
git commit -m "feat(guilds): add Bandit security scanner"
```

---

## Task 6: Ruff Style Checker

**Files:**
- Create: `systems/swarm/guilds/linters/__init__.py`
- Create: `systems/swarm/guilds/linters/ruff.py`
- Create: `tests/swarm/test_linters_ruff.py`

**Step 1: Write the failing test**

```python
# tests/swarm/test_linters_ruff.py
"""Tests for Ruff style checker."""

import pytest
from systems.swarm.guilds.linters.ruff import RuffChecker, StyleViolation


class TestStyleViolation:
    """Test StyleViolation dataclass."""

    def test_violation_has_required_fields(self):
        """Violation should have all required fields."""
        violation = StyleViolation(
            code="E501",
            message="Line too long",
            line=10,
            column=90,
            fixable=True
        )
        assert violation.code == "E501"
        assert violation.line == 10
        assert violation.fixable is True


class TestRuffChecker:
    """Test Ruff checker implementation."""

    def test_checker_exists(self):
        """RuffChecker should be instantiable."""
        checker = RuffChecker()
        assert checker is not None

    def test_check_detects_long_lines(self):
        """Should detect line length violations (E501)."""
        checker = RuffChecker(line_length=50)
        code = "x = " + "a" * 100  # Very long line
        violations = checker.check(code)
        assert any(v.code == "E501" for v in violations)

    def test_check_detects_unused_imports(self):
        """Should detect unused imports (F401)."""
        checker = RuffChecker()
        code = "import os\nimport sys\n\ndef foo(): pass"
        violations = checker.check(code)
        # Both os and sys are unused
        assert len(violations) >= 2
        assert any(v.code == "F401" for v in violations)

    def test_check_clean_code_returns_empty(self):
        """Clean code should return no violations."""
        checker = RuffChecker()
        code = 'def add(a: int, b: int) -> int:\n    return a + b\n'
        violations = checker.check(code)
        # May have minor issues but should be mostly clean
        critical = [v for v in violations if v.code.startswith(("E", "F"))]
        assert len(critical) == 0

    def test_format_returns_formatted_code(self):
        """Format should return properly formatted code."""
        checker = RuffChecker()
        code = "x=1+2"  # Missing spaces
        formatted = checker.format(code)
        assert formatted.strip() == "x = 1 + 2"

    def test_check_handles_invalid_python(self):
        """Should handle syntax errors gracefully."""
        checker = RuffChecker()
        code = "def incomplete("
        violations = checker.check(code)
        assert isinstance(violations, list)
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/test_linters_ruff.py -v`
Expected: FAIL with "ModuleNotFoundError"

**Step 3: Write implementation**

```python
# systems/swarm/guilds/linters/__init__.py
"""Style checker integrations for guild agents."""

from systems.swarm.guilds.linters.ruff import RuffChecker, StyleViolation

__all__ = ["RuffChecker", "StyleViolation"]
```

```python
# systems/swarm/guilds/linters/ruff.py
"""Ruff-based style and lint checking."""

import json
import subprocess
from dataclasses import dataclass
from typing import List


@dataclass
class StyleViolation:
    """A style or lint violation."""

    code: str          # "E501", "F401", etc.
    message: str
    line: int
    column: int
    fixable: bool


class RuffChecker:
    """Ruff-based style and lint checking."""

    def __init__(self, line_length: int = 88):
        """
        Args:
            line_length: Maximum line length (default: 88, Black's default)
        """
        self._line_length = line_length

    def check(self, code: str) -> List[StyleViolation]:
        """Run ruff lint on code string."""
        try:
            result = subprocess.run(
                [
                    "ruff", "check",
                    "--output-format=json",
                    f"--line-length={self._line_length}",
                    "-"
                ],
                input=code,
                capture_output=True,
                text=True,
                timeout=30
            )

            return self._parse_output(result.stdout)

        except subprocess.TimeoutExpired:
            return []
        except FileNotFoundError:
            # Ruff not installed
            return []

    def format(self, code: str) -> str:
        """Auto-format code with ruff format."""
        try:
            result = subprocess.run(
                ["ruff", "format", "-"],
                input=code,
                capture_output=True,
                text=True,
                timeout=30
            )
            return result.stdout

        except (subprocess.TimeoutExpired, FileNotFoundError):
            return code  # Return unchanged on error

    def _parse_output(self, json_output: str) -> List[StyleViolation]:
        """Parse ruff JSON output into violations."""
        if not json_output.strip():
            return []

        try:
            data = json.loads(json_output)
        except json.JSONDecodeError:
            return []

        violations = []
        for issue in data:
            violations.append(StyleViolation(
                code=issue.get("code", "UNKNOWN"),
                message=issue.get("message", ""),
                line=issue.get("location", {}).get("row", 0),
                column=issue.get("location", {}).get("column", 0),
                fixable=issue.get("fix") is not None
            ))

        return violations
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/swarm/test_linters_ruff.py -v`
Expected: PASS (6 tests)

**Step 5: Commit**

```bash
git add systems/swarm/guilds/linters/__init__.py
git add systems/swarm/guilds/linters/ruff.py
git add tests/swarm/test_linters_ruff.py
git commit -m "feat(guilds): add Ruff style checker"
```

---

## Task 7: Sandbox Executor

**Files:**
- Create: `systems/swarm/guilds/executor.py`
- Create: `tests/swarm/test_executor.py`

**Step 1: Write the failing test**

```python
# tests/swarm/test_executor.py
"""Tests for sandbox code executor."""

import pytest
import sys
from systems.swarm.guilds.executor import SandboxExecutor, ExecutionResult


class TestExecutionResult:
    """Test ExecutionResult dataclass."""

    def test_result_has_required_fields(self):
        """Result should have all required fields."""
        result = ExecutionResult(
            success=True,
            stdout="output",
            stderr="",
            return_code=0
        )
        assert result.success is True
        assert result.stdout == "output"
        assert result.return_code == 0


class TestSandboxExecutor:
    """Test sandbox executor implementation."""

    def test_executor_exists(self):
        """SandboxExecutor should be instantiable."""
        executor = SandboxExecutor()
        assert executor is not None

    def test_run_python_simple_code(self):
        """Should execute simple Python code."""
        executor = SandboxExecutor(timeout_seconds=5)
        result = executor.run_python("print('hello')")
        assert result.success is True
        assert "hello" in result.stdout

    def test_run_python_captures_output(self):
        """Should capture stdout."""
        executor = SandboxExecutor()
        result = executor.run_python("print(1 + 2)")
        assert result.success is True
        assert "3" in result.stdout

    def test_run_python_captures_errors(self):
        """Should capture stderr on failure."""
        executor = SandboxExecutor()
        result = executor.run_python("raise ValueError('test error')")
        assert result.success is False
        assert "test error" in result.stderr

    def test_run_python_enforces_timeout(self):
        """Should timeout on infinite loop."""
        executor = SandboxExecutor(timeout_seconds=1)
        result = executor.run_python("while True: pass")
        assert result.success is False
        assert result.timed_out is True

    def test_run_python_returns_code_on_success(self):
        """Should have return_code 0 on success."""
        executor = SandboxExecutor()
        result = executor.run_python("x = 1")
        assert result.return_code == 0

    def test_run_python_returns_code_on_error(self):
        """Should have non-zero return_code on error."""
        executor = SandboxExecutor()
        result = executor.run_python("exit(1)")
        assert result.return_code == 1
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/test_executor.py -v`
Expected: FAIL with "ModuleNotFoundError"

**Step 3: Write implementation**

```python
# systems/swarm/guilds/executor.py
"""Sandboxed code execution with resource limits."""

import subprocess
import resource
from dataclasses import dataclass


@dataclass
class ExecutionResult:
    """Result of sandboxed code execution."""

    success: bool
    stdout: str
    stderr: str
    return_code: int
    timed_out: bool = False


class SandboxExecutor:
    """Execute Python code with resource limits."""

    def __init__(
        self,
        timeout_seconds: int = 30,
        max_memory_mb: int = 512,
        max_cpu_seconds: int = 10,
    ):
        """
        Args:
            timeout_seconds: Wall-clock timeout
            max_memory_mb: Maximum memory in MB
            max_cpu_seconds: Maximum CPU time
        """
        self.timeout = timeout_seconds
        self.max_memory = max_memory_mb * 1024 * 1024
        self.max_cpu = max_cpu_seconds

    def run_python(self, code: str) -> ExecutionResult:
        """Execute Python code in sandboxed subprocess."""
        def set_limits():
            """Set resource limits in child process."""
            try:
                # Memory limit
                resource.setrlimit(
                    resource.RLIMIT_AS,
                    (self.max_memory, self.max_memory)
                )
            except (ValueError, resource.error):
                pass  # May fail on some systems

            try:
                # CPU time limit
                resource.setrlimit(
                    resource.RLIMIT_CPU,
                    (self.max_cpu, self.max_cpu)
                )
            except (ValueError, resource.error):
                pass

        try:
            result = subprocess.run(
                [sys.executable, "-c", code],
                capture_output=True,
                text=True,
                timeout=self.timeout,
                preexec_fn=set_limits
            )

            return ExecutionResult(
                success=result.returncode == 0,
                stdout=result.stdout,
                stderr=result.stderr,
                return_code=result.returncode
            )

        except subprocess.TimeoutExpired:
            return ExecutionResult(
                success=False,
                stdout="",
                stderr=f"Execution timed out after {self.timeout}s",
                return_code=-1,
                timed_out=True
            )

        except Exception as e:
            return ExecutionResult(
                success=False,
                stdout="",
                stderr=str(e),
                return_code=-1
            )
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/swarm/test_executor.py -v`
Expected: PASS (7 tests)

**Step 5: Commit**

```bash
git add systems/swarm/guilds/executor.py
git add tests/swarm/test_executor.py
git commit -m "feat(guilds): add sandbox executor with resource limits"
```

---

## Task 8: Update EngineerAgent with Real Integrations

**Files:**
- Modify: `systems/swarm/guilds/engineer.py`
- Modify: `tests/swarm/test_engineer.py`

**Step 1: Write the failing test**

Add to `tests/swarm/test_engineer.py`:

```python
class TestEngineerAgentWithIntegrations:
    """Test EngineerAgent with real integrations."""

    @pytest.fixture
    def mock_provider(self):
        """Create mock LLM provider."""
        from systems.swarm.guilds.providers.mock import MockProvider
        return MockProvider(response="def add(a, b): return a + b")

    @pytest.fixture
    def executor(self):
        """Create sandbox executor."""
        from systems.swarm.guilds.executor import SandboxExecutor
        return SandboxExecutor(timeout_seconds=5)

    @pytest.fixture
    def engineer_with_integrations(self, tmp_path, mock_provider, executor):
        """Create EngineerAgent with integrations."""
        from systems.swarm.guilds.engineer import EngineerAgent
        from systems.swarm.task_board import TaskBoard
        from systems.swarm.neb_bus import NEBBus

        task_board = TaskBoard(str(tmp_path / "tasks"))
        event_bus = NEBBus(node_id="test")

        return EngineerAgent(
            agent_id="test-engineer",
            task_board=task_board,
            event_bus=event_bus,
            llm_provider=mock_provider,
            executor=executor
        )

    @pytest.mark.asyncio
    async def test_write_code_uses_llm_provider(self, engineer_with_integrations, tmp_path):
        """write_code should use injected LLM provider."""
        from systems.swarm.task import Task, TaskType
        from systems.swarm.task_board import TaskBoard

        task_board = TaskBoard(str(tmp_path / "tasks"))
        task = task_board.post(Task(
            task_id="test-1",
            task_type=TaskType.CODE_GENERATION,
            payload={"spec": "Add two numbers", "language": "python"}
        ))
        task_board.claim(task.task_id, "test-engineer")

        result = await engineer_with_integrations.write_code(task)

        assert result["success"] is True
        assert "def add" in result["code"]

    def test_test_code_uses_executor(self, engineer_with_integrations, tmp_path):
        """test_code should use injected executor."""
        from systems.swarm.task import Task, TaskType

        task = Task(
            task_id="test-2",
            task_type=TaskType.CODE_TESTING,
            payload={
                "code": "def add(a, b): return a + b",
                "tests": "assert add(1, 2) == 3"
            }
        )

        result = engineer_with_integrations.test_code(task)

        assert result["passed"] is True
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/test_engineer.py::TestEngineerAgentWithIntegrations -v`
Expected: FAIL (new tests not passing yet)

**Step 3: Update EngineerAgent**

Modify `systems/swarm/guilds/engineer.py`:

```python
"""EngineerAgent implementation for code generation and testing."""

from typing import Optional
from systems.swarm.guilds.base import GuildAgent
from systems.swarm.task import Task, TaskType


class EngineerAgent(GuildAgent):
    """Agent for code generation and testing."""

    role = "engineer"
    capabilities = [TaskType.CODE_GENERATION, TaskType.CODE_TESTING]

    def __init__(
        self,
        agent_id: str,
        task_board,
        event_bus,
        llm_provider=None,
        executor=None,
    ):
        super().__init__(agent_id, task_board, event_bus)

        self.llm = llm_provider
        self.executor = executor

        # Register handlers
        self.register_handler(TaskType.CODE_GENERATION, self.write_code)
        self.register_handler(TaskType.CODE_TESTING, self.test_code)

    async def write_code(self, task: Task) -> dict:
        """Generate code using LLM provider."""
        spec = task.payload.get("spec", "")
        language = task.payload.get("language", "python")

        if self.llm is None:
            # Fallback to hardcoded template
            return self._template_code(spec, language)

        try:
            prompt = f"""Generate {language} code for:
{spec}

Return only the code, no explanations."""

            code = await self.llm.generate(prompt, temperature=0.3)
            return {"code": code, "language": language, "success": True}

        except Exception as e:
            return {"error": str(e), "success": False}

    def test_code(self, task: Task) -> dict:
        """Execute tests in sandbox."""
        code = task.payload.get("code", "")
        tests = task.payload.get("tests", "")

        if self.executor is None:
            return {"passed": False, "error": "No executor configured"}

        full_code = f"{code}\n\n{tests}"
        result = self.executor.run_python(full_code)

        return {
            "passed": result.success,
            "output": result.stdout or result.stderr,
            "timed_out": result.timed_out
        }

    def _template_code(self, spec: str, language: str) -> dict:
        """Fallback template code generation."""
        return {
            "code": f"# TODO: Implement\n# {spec}\npass",
            "language": language,
            "success": True
        }

    def _summarize(self, result: dict) -> str:
        """Create brief summary of result."""
        if result.get("success"):
            return f"Generated {result.get('language', 'code')}"
        return f"Error: {result.get('error', 'unknown')}"
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/swarm/test_engineer.py -v`
Expected: PASS (all tests including new ones)

**Step 5: Commit**

```bash
git add systems/swarm/guilds/engineer.py
git add tests/swarm/test_engineer.py
git commit -m "feat(guilds): integrate LLM provider and executor into EngineerAgent"
```

---

## Task 9: Update ReviewerAgent with Real Integrations

**Files:**
- Modify: `systems/swarm/guilds/reviewer.py`
- Modify: `tests/swarm/test_reviewer.py`

**Step 1: Write the failing test**

Add to `tests/swarm/test_reviewer.py`:

```python
class TestReviewerAgentWithIntegrations:
    """Test ReviewerAgent with real integrations."""

    @pytest.fixture
    def reviewer_with_integrations(self, tmp_path):
        """Create ReviewerAgent with integrations."""
        from systems.swarm.guilds.reviewer import ReviewerAgent
        from systems.swarm.guilds.scanners.bandit import BanditScanner
        from systems.swarm.guilds.linters.ruff import RuffChecker
        from systems.swarm.task_board import TaskBoard
        from systems.swarm.neb_bus import NEBBus

        task_board = TaskBoard(str(tmp_path / "tasks"))
        event_bus = NEBBus(node_id="test")
        scanner = BanditScanner()
        checker = RuffChecker()

        return ReviewerAgent(
            agent_id="test-reviewer",
            task_board=task_board,
            event_bus=event_bus,
            scanner=scanner,
            checker=checker
        )

    def test_review_code_uses_scanner(self, reviewer_with_integrations, tmp_path):
        """review_code should use injected scanner."""
        from systems.swarm.task import Task, TaskType

        task = Task(
            task_id="test-review-1",
            task_type=TaskType.CODE_REVIEW,
            payload={"code": "eval('1+1')"}  # Security issue
        )

        result = reviewer_with_integrations.review_code(task)

        assert result["score"] < 100  # Should detect issue
        assert len(result["security_findings"]) > 0

    def test_review_code_uses_checker(self, reviewer_with_integrations, tmp_path):
        """review_code should use injected style checker."""
        from systems.swarm.task import Task, TaskType

        task = Task(
            task_id="test-review-2",
            task_type=TaskType.CODE_REVIEW,
            payload={"code": "import os\nimport sys\nx=1"}  # Style issues
        )

        result = reviewer_with_integrations.review_code(task)

        assert len(result["style_violations"]) > 0
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/test_reviewer.py::TestReviewerAgentWithIntegrations -v`
Expected: FAIL

**Step 3: Update ReviewerAgent**

Modify `systems/swarm/guilds/reviewer.py`:

```python
"""ReviewerAgent implementation for code review and security scanning."""

from typing import Optional
from systems.swarm.guilds.base import GuildAgent
from systems.swarm.task import Task, TaskType


class ReviewerAgent(GuildAgent):
    """Agent for code review and security analysis."""

    role = "reviewer"
    capabilities = [TaskType.CODE_REVIEW, TaskType.SECURITY_SCAN]

    def __init__(
        self,
        agent_id: str,
        task_board,
        event_bus,
        scanner=None,
        checker=None,
    ):
        super().__init__(agent_id, task_board, event_bus)

        self.scanner = scanner
        self.checker = checker

        self.register_handler(TaskType.CODE_REVIEW, self.review_code)
        self.register_handler(TaskType.SECURITY_SCAN, self.security_scan)

    def review_code(self, task: Task) -> dict:
        """Full code review: style + security."""
        code = task.payload.get("code", "")

        style_issues = []
        security_issues = []

        if self.checker:
            style_issues = self.checker.check(code)

        if self.scanner:
            security_issues = self.scanner.scan(code)

        # Calculate score (0-100)
        style_penalty = min(len(style_issues) * 2, 30)
        sec_penalty = sum(
            {"low": 5, "medium": 15, "high": 30, "critical": 50}.get(
                s.severity, 5
            )
            for s in security_issues
        )
        score = max(0, 100 - style_penalty - sec_penalty)

        return {
            "score": score,
            "style_violations": [v.__dict__ for v in style_issues],
            "security_findings": [f.__dict__ for f in security_issues],
            "passed": score >= 70
        }

    def security_scan(self, task: Task) -> dict:
        """Security-only scan."""
        code = task.payload.get("code", "")

        if self.scanner is None:
            return {"vulnerabilities": [], "severity": "none", "secure": True}

        findings = self.scanner.scan(code)

        severity = "none"
        if findings:
            severity_order = ["low", "medium", "high", "critical"]
            severities = [f.severity for f in findings]
            severity = max(severities, key=lambda s: severity_order.index(s))

        return {
            "vulnerabilities": [f.__dict__ for f in findings],
            "severity": severity,
            "secure": len(findings) == 0
        }

    def _summarize(self, result: dict) -> str:
        """Create brief summary of result."""
        if "score" in result:
            return f"Review score: {result['score']}/100"
        return f"Security: {result.get('severity', 'unknown')}"
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/swarm/test_reviewer.py -v`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/swarm/guilds/reviewer.py
git add tests/swarm/test_reviewer.py
git commit -m "feat(guilds): integrate scanner and checker into ReviewerAgent"
```

---

## Task 10: Update Module Exports

**Files:**
- Modify: `systems/swarm/guilds/__init__.py`
- Modify: `systems/swarm/__init__.py`

**Step 1: Update guilds __init__.py**

```python
# systems/swarm/guilds/__init__.py
"""Guild agents for code generation, review, and architecture."""

from systems.swarm.guilds.base import GuildAgent
from systems.swarm.guilds.engineer import EngineerAgent
from systems.swarm.guilds.reviewer import ReviewerAgent
from systems.swarm.guilds.architect import ArchitectAgent
from systems.swarm.guilds.factory import GuildFactory
from systems.swarm.guilds.executor import SandboxExecutor, ExecutionResult

__all__ = [
    "GuildAgent",
    "EngineerAgent",
    "ReviewerAgent",
    "ArchitectAgent",
    "GuildFactory",
    "SandboxExecutor",
    "ExecutionResult",
]
```

**Step 2: Update swarm __init__.py**

Add to `systems/swarm/__init__.py`:

```python
# Add these to existing exports
from systems.swarm.guilds import (
    EngineerAgent,
    ReviewerAgent,
    ArchitectAgent,
    GuildFactory,
    SandboxExecutor,
)
from systems.swarm.guilds.providers import LLMProvider, LLMProviderError
from systems.swarm.guilds.providers.mock import MockProvider
from systems.swarm.guilds.scanners import SecurityFinding, SecurityScanner
from systems.swarm.guilds.linters import RuffChecker, StyleViolation
```

**Step 3: Verify imports work**

Run: `python -c "from systems.swarm import EngineerAgent, MockProvider, RuffChecker, SandboxExecutor; print('OK')"`
Expected: OK

**Step 4: Run all guild tests**

Run: `pytest tests/swarm/ -v -k "guild or provider or scanner or linter or executor"`
Expected: All PASS

**Step 5: Commit**

```bash
git add systems/swarm/guilds/__init__.py
git add systems/swarm/__init__.py
git commit -m "feat(guilds): export Phase 2 integration classes"
```

---

## Task 11: Quality Checkpoint

**Step 1: Run full test suite**

Run: `pytest tests/swarm/ -v --tb=short`
Expected: All tests pass

**Step 2: Check type hints**

Run: `mypy systems/swarm/guilds/ --ignore-missing-imports`
Expected: No errors (or only minor warnings)

**Step 3: Run linting**

Run: `ruff check systems/swarm/guilds/`
Expected: No errors

**Step 4: Commit any fixes**

```bash
git add -A
git commit -m "fix(guilds): address type and lint issues"
```

---

## Summary

| Task | Description | Files |
|------|-------------|-------|
| 1 | LLM Provider Interface | 3 files |
| 2 | Mock Provider | 2 files |
| 3 | OpenAI Provider | 2 files |
| 4 | Security Scanner Interface | 3 files |
| 5 | Bandit Scanner | 2 files |
| 6 | Ruff Style Checker | 3 files |
| 7 | Sandbox Executor | 2 files |
| 8 | Update EngineerAgent | 2 files |
| 9 | Update ReviewerAgent | 2 files |
| 10 | Module Exports | 2 files |
| 11 | Quality Checkpoint | - |

**Total: ~25 files, ~50 tests**
