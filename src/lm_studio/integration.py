import asyncio
import os
from typing import Dict, Any, List, Optional, TYPE_CHECKING
import json
import numpy as np
import aiohttp

if TYPE_CHECKING:
    from ctrm_core.truth_manager import CTRMTruthManager

class VectorModelRouter:
    def __init__(self, ctrm: "CTRMTruthManager"):
        self.ctrm = ctrm
        self.model_embeddings = {}  # Cache of model capability embeddings

    async def route_to_best_model(self, query: str, context: Dict = None) -> Dict[str, Any]:
        """Route query to best LM Studio model based on semantic match"""
        if context is None:
            context = {}

        # Get query embedding
        query_embedding = await self.ctrm.embedder.embed(query)

        # Find similar past queries in CTRM
        similar_queries = await self.ctrm.find_similar_truths(
            query,
            limit=5
        )

        # Analyze which models performed well on similar queries
        model_scores = {}
        for past_query in similar_queries:
            if "model_performance" in past_query.get("metadata", {}):
                for model, perf in past_query["metadata"]["model_performance"].items():
                    if model not in model_scores:
                        model_scores[model] = []
                    model_scores[model].append(
                        perf["quality_score"] * past_query["relevance_score"]
                    )

        # Calculate average scores
        avg_scores = {}
        for model, scores in model_scores.items():
            avg_scores[model] = sum(scores) / len(scores)

        # If no history, use model capability embeddings
        if not avg_scores:
            model_capabilities = await self.get_model_capabilities()

            for model, capability_embedding in model_capabilities.items():
                similarity = self.cosine_similarity(query_embedding, capability_embedding)
                avg_scores[model] = similarity

        # Select best model
        best_model = max(avg_scores.items(), key=lambda x: x[1])[0]

        # Create CTRM truth for this routing decision
        routing_truth = await self.ctrm.create_truth(
            statement=f"Query type '{self.classify_query(query)}' best handled by model '{best_model}'",
            context=json.dumps({
                "query": query,
                "model_scores": avg_scores,
                "selected_model": best_model,
                "selection_confidence": avg_scores[best_model]
            })
        )

        return {
            "model": best_model,
            "confidence": avg_scores[best_model],
            "routing_truth_id": routing_truth.id,
            "alternative_models": [
                {"model": m, "score": s}
                for m, s in sorted(avg_scores.items(), key=lambda x: x[1], reverse=True)[1:3]
            ]
        }

    async def get_model_capabilities(self) -> Dict[str, List[float]]:
        """Get embeddings representing each model's capabilities"""
        if not self.model_embeddings:
            # Mock model list - would be from actual LM Studio
            models = [
                {"id": "gpt-4", "context_length": 8192},
                {"id": "gpt-3.5-turbo", "context_length": 4096},
                {"id": "llama-2-70b", "context_length": 4096},
                {"id": "mistral-7b", "context_length": 8192}
            ]

            # Create capability descriptions for each model
            for model in models:
                capability_text = f"""
                Model: {model['id']}
                Type: {self.infer_model_type(model['id'])}
                Good for: {self.infer_capabilities(model['id'])}
                Context window: {model.get('context_length', 'unknown')}
                """

                embedding = await self.ctrm.embedder.embed(capability_text)
                self.model_embeddings[model['id']] = embedding

        return self.model_embeddings

    def classify_query(self, query: str) -> str:
        """Classify query type"""
        query_lower = query.lower()
        if "code" in query_lower or "program" in query_lower:
            return "coding"
        elif "math" in query_lower or "calculate" in query_lower:
            return "mathematics"
        elif "write" in query_lower or "compose" in query_lower:
            return "writing"
        else:
            return "general"

    def infer_model_type(self, model_id: str) -> str:
        """Infer model type from ID"""
        if "gpt" in model_id:
            return "openai"
        elif "llama" in model_id:
            return "meta"
        elif "mistral" in model_id:
            return "mistral"
        else:
            return "unknown"

    def infer_capabilities(self, model_id: str) -> str:
        """Infer capabilities from model ID"""
        if "gpt-4" in model_id:
            return "complex reasoning, coding, creative writing"
        elif "gpt-3.5" in model_id:
            return "general purpose, coding, writing"
        elif "llama" in model_id:
            return "general purpose, open source"
        elif "mistral" in model_id:
            return "efficient, multilingual"
        else:
            return "general purpose"

    def cosine_similarity(self, a: List[float], b: List[float]) -> float:
        """Calculate cosine similarity between two vectors"""
        a_np = np.array(a)
        b_np = np.array(b)
        return float(np.dot(a_np, b_np) / (np.linalg.norm(a_np) * np.linalg.norm(b_np)))

class CTRMPromptOptimizer:
    def __init__(self, ctrm: "CTRMTruthManager"):
        self.ctrm = ctrm
        self.prompt_patterns = {}  # Cache of effective prompt patterns

    async def optimize_prompt(self, base_prompt: str, objective: str) -> str:
        """Optimize prompt using CTRM truths about effective prompting"""
        # Search for similar successful prompts in CTRM
        similar_prompts = await self.ctrm.find_similar_truths(
            f"prompt pattern for {objective}",
            limit=3
        )

        if similar_prompts:
            # Use proven patterns
            best_pattern = similar_prompts[0]

            optimized_prompt = self.apply_pattern(
                base_prompt,
                pattern=best_pattern.get("metadata", {}).get("pattern", {}),
                context=best_pattern.get("metadata", {}).get("context", {})
            )

            # Add CTRM reasoning to prompt
            ctrm_context = f"""
            Based on CTRM analysis (confidence: {best_pattern['confidence']}):
            {best_pattern['statement']}

            Previous success rate: {best_pattern.get('metadata', {}).get('success_rate', 'unknown')}
            """

            optimized_prompt = ctrm_context + "\n\n" + optimized_prompt

        else:
            # No proven patterns, use general optimization
            optimization_truths = await self.ctrm.find_similar_truths(
                "effective prompt engineering",
                limit=5
            )

            optimizations = []
            for truth in optimization_truths:
                if truth["confidence"] > 0.7:
                    optimizations.append(truth["statement"])

            if optimizations:
                optimization_guide = "\n".join([f"- {opt}" for opt in optimizations[:3]])
                optimized_prompt = f"""
                Apply these proven prompt optimizations:
                {optimization_guide}

                Original prompt:
                {base_prompt}
                """
            else:
                optimized_prompt = base_prompt

        # Create truth for this optimization
        await self.ctrm.create_truth(
            statement=f"Optimized prompt for objective: {objective}",
            context=json.dumps({
                "base_prompt": base_prompt,
                "optimized_prompt": optimized_prompt,
                "objective": objective,
                "optimization_strategy": "ctrm_pattern_based" if similar_prompts else "ctrm_principles"
            })
        )

        return optimized_prompt

    def apply_pattern(self, base_prompt: str, pattern: Dict, context: Dict) -> str:
        """Apply prompt pattern to base prompt"""
        # Simple pattern application for now
        if pattern.get("add_context"):
            return f"{context.get('context', '')}\n\n{base_prompt}"
        elif pattern.get("add_instructions"):
            return f"{pattern.get('instructions', '')}\n\n{base_prompt}"
        else:
            return base_prompt

class LMStudioIntegration:
    def __init__(self, base_url: Optional[str] = None):
        self.models = {
            "gpt-4": {"context_length": 8192},
            "gpt-3.5-turbo": {"context_length": 4096},
            "llama-2-70b": {"context_length": 4096},
            "mistral-7b": {"context_length": 8192},
            "glm-4.6v-flash": {"context_length": 31027},
            "microsoft/phi-4": {"context_length": 16384} # Added based on user request
        }
        # Allow overriding LM Studio API endpoint via env var
        base_url = (base_url or os.getenv("LM_STUDIO_BASE_URL") or "http://localhost:1234").rstrip("/")
        if base_url.endswith("/v1"):
            base_url = base_url[:-3]
        self.base_url = base_url.rstrip("/")
        # Context tuning for LM Studio OpenAI endpoint
        self.num_ctx = int(os.getenv("LM_STUDIO_NUM_CTX", "8192"))
        self.num_keep = int(os.getenv("LM_STUDIO_NUM_KEEP", "0"))

    async def generate(self, model: str, prompt: str, **kwargs) -> Dict[str, Any]:
        """Generate response using LM Studio (OpenAI-compatible API)."""
        max_tokens = kwargs.get("max_tokens", 500)
        temperature = kwargs.get("temperature", 0.7)
        stop = kwargs.get("stop")

        # Apply context window management
        original_length = len(prompt)
        safe_prompt = self.truncate_context_to_window(prompt, model)
        truncated_length = len(safe_prompt)

        if truncated_length < original_length * 0.95:  # Significant truncation
            truncation_percentage = (1 - truncated_length/original_length) * 100
            print(f"⚠️  Context truncated by {truncation_percentage:.1f}% to fit model {model} context window")

        # Force English responses by adding strong language instruction
        english_prompt = f"RESPOND EXCLUSIVELY IN ENGLISH. DO NOT USE ANY OTHER LANGUAGE. Question: {safe_prompt}"

        payload = {
            "model": model,
            "messages": [{"role": "user", "content": english_prompt}],
            "max_tokens": max_tokens,
            "temperature": temperature,
            "stream": False,
            "options": {
                "num_ctx": self.num_ctx,
                "num_keep": self.num_keep,
            },
        }
        if stop:
            payload["stop"] = stop

        try:
            async with aiohttp.ClientSession() as session:
                chat_url = f"{self.base_url}/v1/chat/completions"
                try:
                    async with session.post(chat_url, json=payload, timeout=120) as resp:
                        if resp.status != 200:
                            body = await resp.text()
                            print(f"⚠️  Chat completion HTTP {resp.status}: {body}")

                            # Check for context overflow error specifically
                            if "context overflows" in body or "context length" in body:
                                print(f"⚠️  Context overflow detected, applying more aggressive truncation")
                                # Apply even more aggressive truncation
                                double_truncated = self.truncate_context_to_window(prompt, model, safety_margin=1000)
                                if double_truncated != safe_prompt:
                                    print(f"⚠️  Applied additional context truncation")
                                    # Update the payload with the more aggressively truncated prompt
                                    english_prompt = f"RESPOND EXCLUSIVELY IN ENGLISH. DO NOT USE ANY OTHER LANGUAGE. Question: {double_truncated}"
                                    payload["messages"] = [{"role": "user", "content": english_prompt}]
                                    # Retry with the new payload
                                    async with session.post(chat_url, json=payload, timeout=120) as retry_resp:
                                        if retry_resp.status == 200:
                                            response_json = await retry_resp.json()
                                            if response_json and response_json.get("choices"):
                                                content = response_json["choices"][0].get("message", {}).get("content", "")
                                                usage = self._normalize_usage(response_json.get("usage"), prompt, content, max_tokens)
                                                return {
                                                    "content": content,
                                                    "token_usage": usage,
                                                    "model": response_json.get("model", model),
                                                }
                                            else:
                                                print(f"⚠️  Retry response missing choices or content: {response_json}")
                                        else:
                                            retry_body = await retry_resp.text()
                                            print(f"⚠️  Retry failed: {retry_body}")
                                else:
                                    print(f"⚠️  Aggressive truncation did not yield a new prompt. Skipping retry.")
                        else: # Original chat completion was successful
                            response_json = await resp.json()
                            if response_json and response_json.get("choices"):
                                content = response_json["choices"][0].get("message", {}).get("content", "")
                                if content: # Only return if content is found
                                    usage = self._normalize_usage(response_json.get("usage"), prompt, content, max_tokens)
                                    return {
                                        "content": content,
                                        "token_usage": usage,
                                        "model": response_json.get("model", model),
                                    }
                                else:
                                    print(f"⚠️  Chat completion succeeded but no content in choices[0].message.content. Full response: {json.dumps(response_json, indent=2)}")
                            else:
                                print(f"⚠️  Chat completion succeeded but no choices found. Full response: {json.dumps(response_json, indent=2)}")
                except Exception as e:
                    print(f"⚠️  Chat completion failed, trying text completions: {e}")

                # Fallback to text completions endpoint
                comp_url = f"{self.base_url}/v1/completions"
                comp_payload = {
                    "model": model,
                    "prompt": safe_prompt,
                    "max_tokens": max_tokens,
                    "temperature": temperature,
                    "stream": False,
                    "options": {
                        "num_ctx": self.num_ctx,
                        "num_keep": self.num_keep,
                    },
                }
                if stop:
                    comp_payload["stop"] = stop
                try:
                    async with session.post(comp_url, json=comp_payload, timeout=120) as resp:
                        if resp.status != 200:
                            body = await resp.text()
                            print(f"⚠️  Text completion HTTP {resp.status}: {body}")
                        resp.raise_for_status() # Raise for HTTP errors here after logging
                        response_json = await resp.json()
                        choices = response_json.get("choices", [])
                        if choices:
                            content = choices[0].get("text", "")
                            if content: # Only return if content is found
                                usage = self._normalize_usage(response_json.get("usage"), prompt, content, max_tokens)
                                return {
                                    "content": content,
                                    "token_usage": usage,
                                    "model": response_json.get("model", model),
                                }
                            else:
                                print(f"⚠️  Text completion succeeded but no content in choices[0].text. Full response: {json.dumps(response_json, indent=2)}")
                        else:
                            print(f"⚠️  Text completion succeeded but no choices found. Full response: {json.dumps(response_json, indent=2)}")
                except Exception as e:
                    print(f"⚠️  Text completion failed, falling back to mock response: {e}")

        except aiohttp.ClientConnectorError as e:
            print(f"⚠️  Connection to LM Studio failed at {self.base_url}: {e}")
            mock_response = f"[Mocked due to connection error] {prompt[:50]}..."
            usage = self._normalize_usage({}, prompt, mock_response, max_tokens)
            return {
                "content": mock_response,
                "token_usage": usage,
                "model": model,
            }
        except Exception as e:
            print(f"⚠️  An unexpected error occurred during LM Studio generation: {e}")

        # Final fallback to mock behaviour if LM Studio is unreachable or returns no choices
        mock_response = f"[Model Response] {prompt[:50]}... (response)"
        usage = self._normalize_usage({}, prompt, mock_response, max_tokens)
        return {
            "content": mock_response,
            "token_usage": usage,
            "model": model,
        }
    def _normalize_usage(self, usage: Optional[Dict[str, Any]], prompt: str, completion: str, max_tokens: int) -> Dict[str, Any]:
        """Ensure token usage numbers are present; fall back to rough estimates."""
        if usage is None:
            usage = {}
        prompt_tokens = usage.get("prompt_tokens")
        completion_tokens = usage.get("completion_tokens")
        total_tokens = usage.get("total_tokens")

        # Fallback estimates if missing
        if prompt_tokens is None:
            prompt_tokens = int(len(prompt.split()) * 1.3)
        if completion_tokens is None:
            completion_tokens = int(min(max_tokens, len(completion.split()) * 1.3))
        if total_tokens is None:
            total_tokens = prompt_tokens + completion_tokens

        return {
            "prompt_tokens": prompt_tokens,
            "completion_tokens": completion_tokens,
            "total_tokens": total_tokens,
        }

    async def generate_embedding(self, model: str, input_text: str) -> List[float]:
        """Generate embedding using LM Studio."""
        try:
            async with aiohttp.ClientSession() as session:
                url = f"{self.base_url}/v1/embeddings"
                payload = {
                    "model": model,
                    "input": input_text
                }
                async with session.post(url, json=payload, timeout=30) as resp:
                    if resp.status == 200:
                        data = await resp.json()
                        if data and 'data' in data and len(data['data']) > 0:
                            return data['data'][0]['embedding']
                    
                    # If we get here, something failed or wasn't in expected format
                    # print(f"⚠️  Embedding generation failed or invalid format. Status: {resp.status}")
        except Exception as e:
            print(f"⚠️  Embedding generation failed: {e}")
        
        # Fallback to a mock embedding (random-ish deterministic vector) if actual fails
        # This ensures the systems keeps running even if embeddings aren't supported by the loaded model
        import hashlib
        hash_obj = hashlib.md5(input_text.encode())
        seed = int(hash_obj.hexdigest(), 16) % (2**32 - 1)
        np.random.seed(seed)
        vec = np.random.randn(768)
        norm = np.linalg.norm(vec)
        if norm > 0:
            vec = vec / norm
        return list(vec)  # Consistent 768-dimensional normalized vectors

    async def list_models(self) -> List[Dict[str, Any]]:
        """List available models"""
        # Try real LM Studio endpoint first
        # try:
        #     async with aiohttp.ClientSession() as session:
        #         url = f"{self.base_url}/v1/models"
        #         async with session.get(url, timeout=5) as resp:
        #             resp.raise_for_status()
        #             payload = await resp.json()
        #             data = payload.get("data", [])
        #             if data:
        #                 models = []
        #                 for item in data:
        #                     model_id = item.get("id")
        #                     if model_id:
        #                         item_copy = {k: v for k, v in item.items() if k != "id"}
        #                         models.append({"id": model_id, **item_copy})
        #                 if models:
        #                     return models
        # except Exception as e:
        #     print(f"⚠️  Could not fetch models from LM Studio at {self.base_url}: {e}")

        # Fallback to mocked list
        return [{"id": model_id, **info} for model_id, info in self.models.items()]

    async def get_loaded_model(self) -> Optional[str]:
        """Get the currently loaded model"""
        # Highest precedence: explicit env override
        env_model = os.getenv("LM_STUDIO_MODEL")
        if env_model:
            return env_model

        # Next: ask LM Studio which models are available (assume first is loaded)
        models = await self.list_models()
        if models:
            # Prefer a generation-capable model (skip obvious embedding models)
            # Also prefer base model names without version suffixes (e.g., "microsoft/phi-4" over "microsoft/phi-4:2")
            base_models = []
            versioned_models = []

            for m in models:
                model_id = m.get("id", "")
                if "embedding" not in model_id.lower():
                    # Check if this is a versioned model (contains ":")
                    if ":" in model_id:
                        versioned_models.append(model_id)
                    else:
                        base_models.append(model_id)

            # Return base models first, then versioned models
            if base_models:
                return base_models[0]
            elif versioned_models:
                return versioned_models[0]
            # If only embeddings are available, fall back to the first entry
            return models[0]["id"]

        # Fallback to first mocked model
        if self.models:
            return list(self.models.keys())[0]
        return None

    def get_model_context_length(self, model: str) -> int:
        """Get the context length for a specific model"""
        model_info = self.models.get(model, {})
        return model_info.get("context_length", 8192)  # Default to 8192 if unknown

    def truncate_context_to_window(self, prompt: str, model: str, safety_margin: int = 500) -> str:
        """
        Truncate prompt to fit within model's context window
        Uses token estimation to ensure we stay within limits
        """
        context_length = self.get_model_context_length(model)
        max_tokens = context_length - safety_margin  # Leave room for response

        # Estimate current token count (approximate: 1 token ≈ 0.75 words)
        current_token_estimate = self.estimate_token_count(prompt)

        if current_token_estimate <= max_tokens:
            return prompt  # No truncation needed

        # Calculate how many words we can keep (more conservative approach)
        max_words = int((max_tokens * 0.7) / 1.3)  # Account for token estimation ratio
        words = prompt.split()

        # If the prompt is extremely large, be more aggressive with truncation
        if current_token_estimate > context_length * 2:  # More than double the context
            max_words = int((max_tokens * 0.5) / 1.3)  # Only use 50% of available space

        truncated_words = words[-max_words:]  # Keep the end (most relevant part)

        # Add ellipsis to indicate truncation
        truncated_prompt = "[Context truncated for model limits] ... " + " ".join(truncated_words)

        # Verify the truncated version fits
        truncated_token_estimate = self.estimate_token_count(truncated_prompt)
        if truncated_token_estimate > max_tokens and len(words) > 100:
            # Fallback to very aggressive truncation if still too large
            max_words = int((max_tokens * 0.3) / 1.3)
            truncated_words = words[-max_words:]
            truncated_prompt = "[Severe context truncation] ... " + " ".join(truncated_words)

        return truncated_prompt

    def estimate_token_count(self, text: str) -> int:
        """Estimate token count for given text"""
        # Simple estimation: 1 token ≈ 0.75 words for English
        return int(len(text.split()) * 1.3)

    async def analyze_code_quality(self, code: str, language: str = "python") -> Dict[str, Any]:
        """Analyze code quality using LM Studio."""
        prompt = f"""
        Analyze the following {language} code for quality, performance, and best practices:

        ```{language}
        {code}
        ```

        Provide a comprehensive analysis including:
        1. Code quality score (1-10)
        2. Specific improvements needed
        3. Performance optimization suggestions
        4. Security considerations
        5. Documentation recommendations
        6. Error handling improvements

        Return the analysis as structured JSON.
        """

        try:
            response = await self.generate(
                model="glm-4.6v-flash",
                prompt=prompt,
                max_tokens=1000,
                temperature=0.3
            )

            # Try to parse JSON from response
            content = response['content']
            try:
                # Extract JSON from response
                json_start = content.find('{')
                json_end = content.rfind('}') + 1
                if json_start >= 0 and json_end > json_start:
                    analysis_json = content[json_start:json_end]
                    analysis = json.loads(analysis_json)
                    return analysis
            except json.JSONDecodeError:
                # Fallback structured analysis
                return {
                    'code_quality_score': 7,
                    'improvements': self._extract_improvements(content),
                    'performance_suggestions': self._extract_performance_suggestions(content),
                    'security_considerations': self._extract_security_considerations(content),
                    'documentation_recommendations': self._extract_documentation_recommendations(content),
                    'error_handling_improvements': self._extract_error_handling_improvements(content)
                }

        except Exception as e:
            print(f"⚠️  Code analysis failed, using fallback: {e}")
            return self._fallback_code_analysis(code, language)

    def _extract_improvements(self, text: str) -> List[str]:
        """Extract improvement suggestions from text."""
        improvements = []
        lines = text.split('\n')
        for line in lines:
            if any(word in line.lower() for word in ['improve', 'better', 'enhance', 'optimize']):
                improvements.append(line.strip())
        return improvements[:5] or ['Add comprehensive docstrings', 'Implement proper error handling']

    def _extract_performance_suggestions(self, text: str) -> List[str]:
        """Extract performance suggestions from text."""
        suggestions = []
        lines = text.split('\n')
        for line in lines:
            if any(word in line.lower() for word in ['performance', 'faster', 'optimize', 'efficient']):
                suggestions.append(line.strip())
        return suggestions[:3] or ['Use list comprehensions', 'Consider caching results']

    def _extract_security_considerations(self, text: str) -> List[str]:
        """Extract security considerations from text."""
        considerations = []
        lines = text.split('\n')
        for line in lines:
            if any(word in line.lower() for word in ['security', 'safe', 'vulnerable', 'input validation']):
                considerations.append(line.strip())
        return considerations[:3] or ['Add input validation', 'Use parameterized queries for databases']

    def _extract_documentation_recommendations(self, text: str) -> List[str]:
        """Extract documentation recommendations from text."""
        recommendations = []
        lines = text.split('\n')
        for line in lines:
            if any(word in line.lower() for word in ['document', 'docstring', 'comment', 'explain']):
                recommendations.append(line.strip())
        return recommendations[:3] or ['Add function docstrings', 'Document complex algorithms']

    def _extract_error_handling_improvements(self, text: str) -> List[str]:
        """Extract error handling improvements from text."""
        improvements = []
        lines = text.split('\n')
        for line in lines:
            if any(word in line.lower() for word in ['error', 'exception', 'try', 'catch', 'handle']):
                improvements.append(line.strip())
        return improvements[:3] or ['Add try-catch blocks', 'Handle edge cases gracefully']

    def _fallback_code_analysis(self, code: str, language: str) -> Dict[str, Any]:
        """Fallback code analysis when LM Studio is unavailable."""
        analysis = {
            'code_quality_score': 6,
            'improvements': [],
            'performance_suggestions': [],
            'security_considerations': [],
            'documentation_recommendations': [],
            'error_handling_improvements': []
        }

        # Basic static analysis
        if 'def ' in code and '"""' not in code:
            analysis['documentation_recommendations'].append('Add docstrings to all functions')

        if 'import' in code and 'try:' not in code:
            analysis['error_handling_improvements'].append('Add error handling for imports')

        if 'for ' in code and 'enumerate' not in code and 'range(' in code:
            analysis['improvements'].append('Consider using enumerate() for cleaner loop syntax')

        if '/' in code and 'try:' not in code:
            analysis['error_handling_improvements'].append('Add ZeroDivisionError handling')

        if len(code.split('\n')) > 50:
            analysis['improvements'].append('Consider breaking into smaller functions')

        if 'print(' in code and 'logging' not in code:
            analysis['improvements'].append('Consider using logging instead of print for production code')

        return analysis

    async def generate_improved_code(self, original_code: str, analysis: Dict[str, Any]) -> str:
        """Generate improved code based on analysis."""
        improvements_text = "\n".join([
            f"- {imp}" for imp in analysis.get('improvements', [])
        ])

        prompt = f"""
        Improve the following Python code based on this analysis:

        ORIGINAL CODE:
        ```python
        {original_code}
        ```

        ANALYSIS:
        {improvements_text}

        Provide the complete improved code as a single code block.
        """

        try:
            response = await self.generate(
                model="glm-4.6v-flash",
                prompt=prompt,
                max_tokens=1500,
                temperature=0.2
            )

            # Extract code block
            content = response['content']
            code_start = content.find('```python')
            code_end = content.rfind('```')
            if code_start >= 0 and code_end > code_start:
                improved_code = content[code_start+9:code_end].strip()
                return improved_code

            return content

        except Exception as e:
            print(f"⚠️  Code improvement failed, using simple improvements: {e}")
            return self._apply_simple_improvements(original_code, analysis)

    def _apply_simple_improvements(self, code: str, analysis: Dict[str, Any]) -> str:
        """Apply simple code improvements without LM Studio."""
        improved_code = code

        # Add basic docstring if missing
        if 'def ' in improved_code and '"""' not in improved_code:
            improved_code = improved_code.replace(
                'def ', 'def \n    """Auto-generated docstring"""'
            )

        # Add basic error handling for division
        if '/' in improved_code and 'try:' not in improved_code:
            improved_code = improved_code.replace(
                'result = ', 'try:\n    result = \n    except ZeroDivisionError:\n        result = 0\n        ')

        return improved_code

    async def analyze_execution_results(self, code: str, execution_result: Dict[str, Any]) -> Dict[str, Any]:
        """Analyze execution results and suggest improvements."""
        success = execution_result.get('success', False)
        error = execution_result.get('error', '')
        stdout = execution_result.get('stdout', '')
        stderr = execution_result.get('stderr', '')

        prompt = f"""
        Analyze the execution results of this Python code:

        CODE:
        ```python
        {code}
        ```

        EXECUTION RESULTS:
        - Success: {success}
        - Error: {error}
        - Stdout: {stdout[:500]}...
        - Stderr: {stderr[:500]}...

        Provide analysis and specific improvement suggestions based on:
        1. Why the execution succeeded/failed
        2. Performance characteristics
        3. Error handling effectiveness
        4. Output quality
        5. Specific code improvements needed

        Return as structured JSON.
        """

        try:
            response = await self.generate(
                model="glm-4.6v-flash",
                prompt=prompt,
                max_tokens=800,
                temperature=0.3
            )

            # Try to parse JSON from response
            content = response['content']
            try:
                # Extract JSON from response
                json_start = content.find('{')
                json_end = content.rfind('}') + 1
                if json_start >= 0 and json_end > json_start:
                    analysis_json = content[json_start:json_end]
                    analysis = json.loads(analysis_json)
                    return analysis
            except json.JSONDecodeError:
                # Fallback structured analysis
                return {
                    'execution_analysis': 'Execution completed successfully' if success else 'Execution failed',
                    'root_cause': error if error else 'No errors detected',
                    'improvement_suggestions': ['Optimize performance', 'Enhance error handling'],
                    'performance_characteristics': 'Acceptable performance',
                    'output_quality': 'Good output quality'
                }

        except Exception as e:
            print(f"⚠️  Execution analysis failed, using fallback: {e}")
            return self._fallback_execution_analysis(code, execution_result)

    def _fallback_execution_analysis(self, code: str, execution_result: Dict[str, Any]) -> Dict[str, Any]:
        """Fallback execution analysis when LM Studio is unavailable."""
        success = execution_result.get('success', False)
        error = execution_result.get('error', '')

        analysis = {
            'execution_analysis': 'Execution completed successfully' if success else 'Execution failed',
            'root_cause': error if error else 'No errors detected',
            'improvement_suggestions': [],
            'performance_characteristics': 'Unknown',
            'output_quality': 'Unknown'
        }

        if not success:
            if 'ZeroDivisionError' in error:
                analysis['improvement_suggestions'].append('Add division by zero error handling')
            elif 'NameError' in error:
                analysis['improvement_suggestions'].append('Check for undefined variables')
            elif 'TypeError' in error:
                analysis['improvement_suggestions'].append('Add type checking and validation')

        return analysis
