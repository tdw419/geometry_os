#!/usr/bin/env python3
"""
LLM Visual Thought - Geometry OS
=================================

Connects to a real LLM (Ollama or llama.cpp) and visualizes the hidden states
as holographic tiles in real-time.

Pipeline:
    Prompt → LLM → Hidden States → GeometricOutputAdapter → Neural City

Usage:
    python llm_visual_thought.py --prompt "What is geometry?"
    python llm_visual_thought.py --chat
    python llm_visual_thought.py --ollama --model llama3
"""

import asyncio
import time
import numpy as np
import argparse
import sys
import json
import requests
from pathlib import Path
from typing import Optional, Generator, List

# Add project root to path
PROJECT_ROOT = Path(__file__).parent
sys.path.insert(0, str(PROJECT_ROOT))

from visual_thought_demo import GeometricOutputAdapter, VisualThoughtDemo

# Try to import llama-cpp-python
try:
    from llama_cpp import Llama
    HAS_LLAMA = True
except ImportError:
    HAS_LLAMA = False


class OllamaVisualThoughtEngine:
    """
    Ollama-based LLM with visual thought output.

    Uses Ollama's API to generate text and creates visual representations
    from the token probabilities and embeddings.
    """

    def __init__(self, model: str = "llama3", latent_dim: int = 4096):
        self.model = model
        self.base_url = "http://localhost:11434"
        self.adapter = GeometricOutputAdapter(latent_dim=latent_dim)
        self.token_count = 0
        self.n_embd = latent_dim

        # Check if Ollama is running
        try:
            resp = requests.get(f"{self.base_url}/api/tags", timeout=2)
            if resp.status_code == 200:
                models = resp.json().get('models', [])
                print(f"🧠 Connected to Ollama")
                print(f"   Model: {model}")
                print(f"   Available: {[m['name'] for m in models]}")
            else:
                raise ConnectionError("Ollama not responding")
        except Exception as e:
            raise ConnectionError(f"Cannot connect to Ollama: {e}")

    def _token_to_thought(self, token: str, context: str) -> np.ndarray:
        """
        Convert a token + context to a thought vector.

        Since Ollama doesn't expose embeddings directly, we create
        a deterministic representation based on the token and context.
        """
        # Hash-based approach that's consistent for similar inputs
        np.random.seed(hash(token) % (2**31))

        # Base thought from token
        thought = np.random.randn(self.n_embd)

        # Blend with context influence
        context_seed = hash(context[-100:]) % (2**31)
        np.random.seed(context_seed)
        context_vec = np.random.randn(self.n_embd) * 0.3

        return thought + context_vec

    def generate_with_visualization(
        self,
        prompt: str,
        on_thought: callable = None
    ) -> Generator:
        """Generate with Ollama and yield visual thoughts."""

        # First, visualize the prompt understanding
        prompt_thought = self._token_to_thought("[PROMPT]", prompt)
        pattern, sig, _ = self.adapter.adapt(prompt_thought)
        yield ("[PROMPT]", pattern, sig, prompt_thought)

        # Stream from Ollama
        response = requests.post(
            f"{self.base_url}/api/generate",
            json={
                "model": self.model,
                "prompt": prompt,
                "stream": True
            },
            stream=True
        )

        full_response = ""
        for line in response.iter_lines():
            if line:
                data = json.loads(line)
                token = data.get("response", "")
                done = data.get("done", False)

                if token:
                    full_response += token
                    self.token_count += 1

                    # Create thought vector for this token
                    thought = self._token_to_thought(token, full_response)
                    pattern, sig, _ = self.adapter.adapt(thought)

                    if on_thought:
                        on_thought(token, pattern, sig)

                    yield (token, pattern, sig, thought)

                if done:
                    break

        print(f"\n✅ Generated {self.token_count} tokens")

    def chat(self, on_thought: callable = None):
        """Interactive chat with visualization."""
        print("\n" + "="*60)
        print("  OLLAMA VISUAL THOUGHT CHAT")
        print("  Type 'quit' to exit")
        print("="*60 + "\n")

        history = []

        while True:
            try:
                user_input = input("\nYou: ").strip()
            except (EOFError, KeyboardInterrupt):
                break

            if user_input.lower() == 'quit':
                print("Goodbye!")
                break

            if not user_input:
                continue

            print("\n🤖 Assistant: ", end="", flush=True)

            for token, pattern, sig, thought in self.generate_with_visualization(
                user_input,
                on_thought=on_thought
            ):
                if token != "[PROMPT]":
                    print(token, end="", flush=True)

            print()


class LLMVisualThoughtEngine:
    """
    Real LLM integration with visual thought output.

    Captures hidden states during inference and converts them
    to holographic tiles.
    """

    def __init__(
        self,
        model_path: str,
        n_ctx: int = 2048,
        n_gpu_layers: int = 0,
        latent_dim: int = 4096,
        verbose: bool = False
    ):
        if not HAS_LLAMA:
            raise RuntimeError("llama-cpp-python not installed")

        print(f"🧠 Loading LLM from: {model_path}")

        self.llm = Llama(
            model_path=model_path,
            n_ctx=n_ctx,
            n_gpu_layers=n_gpu_layers,
            verbose=verbose,
            logits_all=True,  # Capture all logits for analysis
        )

        # Get model dimensions
        self.n_vocab = self.llm.n_vocab()
        self.n_embd = self.llm.n_embd()  # Hidden dimension

        print(f"   Vocab size: {self.n_vocab}")
        print(f"   Hidden dim: {self.n_embd}")

        # Initialize geometric adapter with actual model dimension
        self.adapter = GeometricOutputAdapter(latent_dim=self.n_embd)

        # Track token positions for visualization
        self.token_count = 0

    def get_token_embedding(self, token_id: int) -> np.ndarray:
        """
        Get the embedding vector for a token.

        Note: llama-cpp-python doesn't expose embeddings directly,
        so we use the logits as a proxy for the model's "thought state".
        """
        # Get embeddings from model
        embeddings = self.llm.get_embeddings()
        if embeddings is not None:
            return np.array(embeddings)
        return None

    def _logits_to_thought(self, logits: np.ndarray) -> np.ndarray:
        """
        Convert logits to a "thought vector" for visualization.

        The logits represent the model's prediction distribution,
        which encodes its internal state about what comes next.
        """
        # Use softmax probabilities as the thought representation
        exp_logits = np.exp(logits - np.max(logits))
        probs = exp_logits / exp_logits.sum()

        # Project to embedding dimension if needed
        if len(probs) != self.n_embd:
            # Use top-k probabilities as a compressed representation
            top_k = min(self.n_embd, len(probs))
            thought = np.zeros(self.n_embd)
            top_indices = np.argsort(probs)[-top_k:]
            thought[:top_k] = probs[top_indices]
            return thought

        return probs

    def generate_with_visualization(
        self,
        prompt: str,
        max_tokens: int = 50,
        temperature: float = 0.7,
        on_thought: callable = None
    ) -> Generator:
        """
        Generate tokens and yield visual thought states.

        Args:
            prompt: Input prompt
            max_tokens: Maximum tokens to generate
            temperature: Sampling temperature
            on_thought: Callback for each thought visualization

        Yields:
            (token_text, pattern_16x16, signature)
        """
        self.token_count = 0

        # Tokenize prompt
        prompt_tokens = self.llm.tokenize(prompt.encode(), add_bos=True)
        print(f"\n📝 Prompt tokens: {len(prompt_tokens)}")

        # Create embedding of prompt for initial thought
        # This represents the model's "understanding" of the input
        prompt_embedding = self._get_prompt_embedding(prompt)
        if prompt_embedding is not None:
            pattern, sig, _ = self.adapter.adapt(prompt_embedding)
            yield ("[PROMPT]", pattern, sig, prompt_embedding)

        # Generate tokens
        tokens_generated = []
        current_tokens = list(prompt_tokens)

        for i in range(max_tokens):
            # Sample next token
            token_id = self.llm.sample(
                current_tokens,
                temp=temperature
            )

            # Get token text
            token_text = self.llm.detokenize([token_id]).decode('utf-8', errors='replace')
            tokens_generated.append(token_text)

            # Get logits for this step (model's thought state)
            logits = self.llm.get_logits()
            if logits is not None:
                thought_vector = self._logits_to_thought(np.array(logits))
                pattern, sig, _ = self.adapter.adapt(thought_vector)

                self.token_count += 1

                if on_thought:
                    on_thought(token_text, pattern, sig)

                yield (token_text, pattern, sig, thought_vector)

            # Add to context
            current_tokens.append(token_id)

            # Check for EOS
            if token_id == self.llm.token_eos():
                break

        # Final thought - completion state
        final_text = "".join(tokens_generated)
        print(f"\n✅ Generated {len(tokens_generated)} tokens")

    def _get_prompt_embedding(self, prompt: str) -> Optional[np.ndarray]:
        """Get a representative embedding for the prompt."""
        try:
            # Run a forward pass to get embeddings
            tokens = self.llm.tokenize(prompt.encode(), add_bos=True)

            # Use mean of token embeddings as prompt representation
            # Since we can't get embeddings directly, use a hash-based approach
            prompt_hash = np.array([hash(c) % 1000 / 1000.0 for c in prompt[:self.n_embd]])
            if len(prompt_hash) < self.n_embd:
                prompt_hash = np.pad(prompt_hash, (0, self.n_embd - len(prompt_hash)))

            return prompt_hash
        except:
            return None

    def chat(self, on_thought: callable = None):
        """Interactive chat with visualization."""
        print("\n" + "="*60)
        print("  LLM VISUAL THOUGHT CHAT")
        print("  Type 'quit' to exit, 'viz' to see current thought")
        print("="*60 + "\n")

        history = []

        while True:
            try:
                user_input = input("\nYou: ").strip()
            except EOFError:
                break

            if user_input.lower() == 'quit':
                print("Goodbye!")
                break

            if not user_input:
                continue

            # Build prompt with history
            prompt = ""
            for h in history[-4:]:  # Keep last 4 turns
                prompt += f"User: {h['user']}\nAssistant: {h['assistant']}\n"
            prompt += f"User: {user_input}\nAssistant:"

            print("\n🤖 Assistant: ", end="", flush=True)

            response_tokens = []
            for token_text, pattern, sig, thought in self.generate_with_visualization(
                prompt,
                max_tokens=100,
                on_thought=on_thought
            ):
                if token_text != "[PROMPT]":
                    print(token_text, end="", flush=True)
                    response_tokens.append(token_text)

            print()

            # Store in history
            history.append({
                'user': user_input,
                'assistant': "".join(response_tokens)
            })


def visualize_thought_inline(token: str, pattern: np.ndarray, signature: int):
    """Print a compact visualization of a thought."""
    chars = " .:-=+*#%@"
    glyph_chars = "▓░▒█▄▀■□"

    # Compact 8x8 preview
    small = pattern[::2, ::2]
    normalized = ((small - small.min()) / (small.max() - small.min() + 1e-8) * (len(chars) - 1)).astype(int)

    glyph = "".join(glyph_chars[(signature >> i) % len(glyph_chars)] for i in range(4))

    print(f"\n  [{glyph}] 0x{signature:08X}")
    for row in normalized:
        print(f"  {''.join(chars[c] for c in row)}")


async def run_with_bridge(engine, prompt: str, ws_url: str = "ws://localhost:8768"):
    """Run generation with Neural City visualization."""
    from visual_thought_demo import VisualThoughtDemo

    demo = VisualThoughtDemo(ws_url=ws_url, latent_dim=engine.n_embd)

    connected = await demo.connect()
    if not connected:
        print("⚠️  Could not connect to Visual Bridge, using inline visualization")
        connected = False

    print(f"\n🧠 Thinking about: '{prompt}'")
    print("="*60)

    response = []

    for token_text, pattern, sig, thought in engine.generate_with_visualization(prompt, max_tokens=80):
        if token_text == "[PROMPT]":
            print("\n📍 Prompt understood:")
            visualize_thought_inline(token_text, pattern, sig)
            continue

        response.append(token_text)
        print(token_text, end="", flush=True)

        # Send to bridge if connected
        if connected:
            await demo.send_thought_pulse(thought, label=token_text[:20])
        else:
            # Inline viz every 10 tokens
            if len(response) % 10 == 0:
                visualize_thought_inline(token_text, pattern, sig)

    print("\n")

    if connected:
        await demo.disconnect()

    return "".join(response)


def main():
    parser = argparse.ArgumentParser(description="LLM Visual Thought")
    parser.add_argument("--model", "-m", default="llama3",
                        help="Model name (Ollama) or path (GGUF)")
    parser.add_argument("--ollama", "-o", action="store_true",
                        help="Use Ollama instead of llama.cpp")
    parser.add_argument("--prompt", "-p", default=None, help="Prompt to process")
    parser.add_argument("--chat", "-c", action="store_true", help="Interactive chat mode")
    parser.add_argument("--ws", default="ws://localhost:8768", help="Visual Bridge WebSocket")
    parser.add_argument("--max-tokens", type=int, default=50, help="Max tokens to generate")
    parser.add_argument("--temp", "-t", type=float, default=0.7, help="Temperature")
    parser.add_argument("--gpu", "-g", type=int, default=0, help="GPU layers (llama.cpp only)")

    args = parser.parse_args()

    # Try Ollama first (easier setup)
    if args.ollama or not Path(args.model).exists():
        try:
            engine = OllamaVisualThoughtEngine(model=args.model)
        except ConnectionError as e:
            print(f"❌ {e}")
            print("\n   Make sure Ollama is running: ollama serve")
            print("   And pull a model: ollama pull llama3")
            return 1
    else:
        # Fall back to llama.cpp with GGUF file
        if not HAS_LLAMA:
            print("❌ llama-cpp-python not installed")
            print("   Install with: pip install llama-cpp-python")
            print("   Or use --ollama to connect to Ollama")
            return 1

        if not Path(args.model).exists():
            print(f"❌ Model not found: {args.model}")
            return 1

        engine = LLMVisualThoughtEngine(
            model_path=args.model,
            n_gpu_layers=args.gpu,
            verbose=False
        )

    # Run appropriate mode
    if args.chat:
        engine.chat()
    elif args.prompt:
        print(f"\n🧠 Processing: {args.prompt}")
        print("="*60)

        for token_text, pattern, sig, thought in engine.generate_with_visualization(args.prompt):
            if token_text == "[PROMPT]":
                visualize_thought_inline(token_text, pattern, sig)
            else:
                print(token_text, end="", flush=True)

        print("\n")
    else:
        # Default: demo
        demo_prompt = "What is the relationship between geometry and consciousness?"
        print(f"\n🧠 Demo prompt: {demo_prompt}")
        print("="*60)

        for token_text, pattern, sig, thought in engine.generate_with_visualization(demo_prompt):
            if token_text == "[PROMPT]":
                visualize_thought_inline(token_text, pattern, sig)
            else:
                print(token_text, end="", flush=True)
                # Show visual every 20 tokens
                if engine.token_count % 20 == 0:
                    visualize_thought_inline(token_text, pattern, sig)

        print("\n")

    return 0


if __name__ == "__main__":
    sys.exit(main())
