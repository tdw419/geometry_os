"""
Greedy Decoder Module

This module provides the GreedyDecoder class for generating text using greedy decoding.
Greedy decoding always selects the most likely token at each step. This is fast but
can lead to repetitive outputs.

The module also supports sampling strategies (temperature, top-k, top-p) for more
diverse generation.

Example:
    >>> from geometry_os.systems.pixel_llm.decoding import GreedyDecoder
    >>> decoder = GreedyDecoder(max_length=50, temperature=0.8)
    >>> tokens, scores = decoder.decode(model, images)
"""
import torch
import torch.nn.functional as F
from typing import Optional, Tuple
from dataclasses import dataclass


@dataclass
class GenerationConfig:
    """Configuration for text generation

    Attributes:
        max_length: Maximum sequence length to generate
        min_length: Minimum sequence length to generate
        temperature: Sampling temperature (1.0 = no scaling)
        do_sample: Whether to use sampling (False = greedy decoding)
        top_k: Top-k sampling parameter (None = disabled)
        top_p: Top-p (nucleus) sampling parameter (None = disabled)
        bos_token_id: Beginning of sequence token ID
        eos_token_id: End of sequence token ID
        pad_token_id: Padding token ID
    """
    max_length: int = 100
    min_length: int = 1
    temperature: float = 1.0
    do_sample: bool = False
    top_k: Optional[int] = None
    top_p: Optional[float] = None
    bos_token_id: int = 1
    eos_token_id: int = 2
    pad_token_id: int = 0


class GreedyDecoder:
    """Greedy decoder for fast text generation

    Greedy decoding always selects the most likely token at each step.
    This is the fastest decoding strategy but can lead to repetitive outputs.

    Args:
        max_length: Maximum generation length (default: 100)
        min_length: Minimum generation length (default: 1)
        temperature: Sampling temperature (default: 1.0)
        do_sample: Whether to use sampling (default: False)
        top_k: Top-k sampling parameter (default: None)
        top_p: Top-p (nucleus) sampling parameter (default: None)
        bos_token_id: Beginning of sequence token ID (default: 1)
        eos_token_id: End of sequence token ID (default: 2)
        pad_token_id: Padding token ID (default: 0)

    Example:
        >>> decoder = GreedyDecoder(max_length=50)
        >>> tokens, scores = decoder.decode(model, images)
        >>> print(tokens.shape)  # (batch_size, <=50)

        >>> # With sampling
        >>> decoder = GreedyDecoder(max_length=50, do_sample=True, temperature=0.8)
        >>> tokens, scores = decoder.decode(model, images)
    """

    def __init__(
        self,
        max_length: int = 100,
        min_length: int = 1,
        temperature: float = 1.0,
        do_sample: bool = False,
        top_k: Optional[int] = None,
        top_p: Optional[float] = None,
        bos_token_id: int = 1,
        eos_token_id: int = 2,
        pad_token_id: int = 0,
    ):
        self.config = GenerationConfig(
            max_length=max_length,
            min_length=min_length,
            temperature=temperature,
            do_sample=do_sample,
            top_k=top_k,
            top_p=top_p,
            bos_token_id=bos_token_id,
            eos_token_id=eos_token_id,
            pad_token_id=pad_token_id,
        )

    def _temperature_sample(self, logits: torch.Tensor) -> torch.Tensor:
        """Apply temperature scaling to logits

        Args:
            logits: Logits [vocab_size]

        Returns:
            Scaled logits
        """
        if self.config.temperature == 1.0:
            return logits

        if self.config.temperature <= 0:
            raise ValueError(f"Temperature must be positive, got {self.config.temperature}")

        return logits / self.config.temperature

    def _top_k_sample(self, logits: torch.Tensor) -> torch.Tensor:
        """Filter logits to top-k values

        Args:
            logits: Logits [vocab_size]

        Returns:
            Logits with only top-k values retained
        """
        if self.config.top_k is None or self.config.top_k >= logits.shape[-1]:
            return logits

        if self.config.top_k < 1:
            raise ValueError(f"top_k must be >= 1, got {self.config.top_k}")

        # Get top-k values and indices
        top_k_values, top_k_indices = torch.topk(logits, self.config.top_k, dim=-1)

        # Create output tensor filled with -inf
        output = torch.full_like(logits, float("-inf"))

        # Scatter top-k values back
        output[top_k_indices] = top_k_values

        return output

    def _top_p_sample(self, logits: torch.Tensor) -> torch.Tensor:
        """Filter logits using nucleus (top-p) sampling

        Args:
            logits: Logits [vocab_size]

        Returns:
            Logits with only nucleus tokens retained
        """
        if self.config.top_p is None or self.config.top_p >= 1.0:
            return logits

        if self.config.top_p <= 0:
            raise ValueError(f"top_p must be > 0, got {self.config.top_p}")

        # Sort logits in descending order
        sorted_logits, sorted_indices = torch.sort(logits, descending=True, dim=-1)

        # Compute cumulative probabilities
        sorted_probs = F.softmax(sorted_logits, dim=-1)
        cumulative_probs = torch.cumsum(sorted_probs, dim=-1)

        # Find indices where cumulative probability exceeds top_p
        sorted_indices_to_remove = cumulative_probs > self.config.top_p

        # Shift to keep first token above threshold
        sorted_indices_to_remove = sorted_indices_to_remove.roll(1, dims=-1)
        sorted_indices_to_remove[0] = False

        # Scatter back to original indices
        indices_to_remove = sorted_indices_to_remove.scatter(
            0, sorted_indices, sorted_indices_to_remove
        )

        # Set removed logits to -inf
        logits = logits.masked_fill(indices_to_remove, float("-inf"))

        return logits

    def _sample_next_token(self, logits: torch.Tensor) -> torch.Tensor:
        """Sample next token using configured sampling strategy

        Args:
            logits: Logits [vocab_size]

        Returns:
            Sampled token ID
        """
        # Apply temperature scaling
        logits = self._temperature_sample(logits)

        # Apply top-k filtering
        if self.config.top_k is not None:
            logits = self._top_k_sample(logits)

        # Apply top-p filtering
        if self.config.top_p is not None:
            logits = self._top_p_sample(logits)

        # Compute probabilities
        probs = F.softmax(logits, dim=-1)

        # Sample or take argmax
        if self.config.do_sample:
            next_token = torch.multinomial(probs, num_samples=1)
        else:
            next_token = torch.argmax(probs, dim=-1, keepdim=True)

        return next_token

    def decode(
        self,
        model: torch.nn.Module,
        images: torch.Tensor,
    ) -> Tuple[torch.Tensor, torch.Tensor]:
        """Generate captions using greedy decoding

        Args:
            model: PixelLLM model with vision_encoder and language_decoder
            images: Input images [batch_size, 3, image_size, image_size]

        Returns:
            Tuple of:
            - Generated token IDs [batch_size, generated_seq_len]
            - Token scores [batch_size, generated_seq_len]

        Example:
            >>> decoder = GreedyDecoder(max_length=50)
            >>> tokens, scores = decoder.decode(model, images)
            >>> print(tokens.shape)  # (batch_size, <=max_length)
        """
        config = self.config
        model.eval()
        batch_size = images.shape[0]
        device = images.device

        # Encode images once
        with torch.no_grad():
            vision_features = model.vision_encoder(images)
            if hasattr(model, 'vision_projection'):
                vision_features = model.vision_projection(vision_features)

        # Start with BOS token
        input_ids = torch.full(
            (batch_size, 1),
            config.bos_token_id,
            dtype=torch.long,
            device=device
        )

        scores = torch.zeros(batch_size, 1, device=device)

        for step in range(config.max_length):
            # Get logits for next token
            with torch.no_grad():
                logits = model.language_decoder(input_ids, vision_features)
                next_token_logits = logits[:, -1, :]

            # Process each sequence in the batch
            next_tokens = []
            next_scores = []

            for i in range(batch_size):
                # Apply temperature
                token_logits = next_token_logits[i]
                token_logits = self._temperature_sample(token_logits)

                # Sample or greedy
                next_token = self._sample_next_token(token_logits)

                # Get score for this token
                token_scores = F.log_softmax(token_logits, dim=-1)
                token_score = token_scores[next_token]

                next_tokens.append(next_token)
                next_scores.append(token_score)

            # Stack results
            next_token = torch.cat(next_tokens, dim=0).unsqueeze(1)
            next_score = torch.cat(next_scores, dim=0).unsqueeze(1)

            # Append to sequences
            input_ids = torch.cat([input_ids, next_token], dim=1)
            scores = torch.cat([scores, next_score], dim=1)

            # Check for EOS
            if (next_token == config.eos_token_id).all() and step >= config.min_length - 1:
                break

        # Remove BOS token
        input_ids = input_ids[:, 1:]
        scores = scores[:, 1:]

        return input_ids, scores


def create_greedy_decoder(**kwargs) -> GreedyDecoder:
    """Factory function to create a GreedyDecoder

    Args:
        **kwargs: Arguments passed to GreedyDecoder constructor

    Returns:
        Configured GreedyDecoder instance

    Example:
        >>> decoder = create_greedy_decoder(max_length=50, do_sample=True)
        >>> tokens, scores = decoder.decode(model, images)
    """
    return GreedyDecoder(**kwargs)
