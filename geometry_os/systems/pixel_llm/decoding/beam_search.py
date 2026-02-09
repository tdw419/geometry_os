"""
Beam Search Decoder Module

This module provides the BeamSearchDecoder class for generating text using beam search decoding.
Beam search maintains multiple candidate sequences (beams) at each step, keeping only the
top-k sequences based on cumulative scores.

Example:
    >>> from geometry_os.systems.pixel_llm.decoding import BeamSearchDecoder
    >>> decoder = BeamSearchDecoder(num_beams=5, max_length=50)
    >>> tokens, scores = decoder.decode(model, images)
"""
import torch
import torch.nn.functional as F
from typing import Optional, Tuple, List
from collections import namedtuple
from dataclasses import dataclass


BeamCandidate = namedtuple("BeamCandidate", ["tokens", "log_prob", "score"])


@dataclass
class GenerationConfig:
    """Configuration for text generation

    Attributes:
        max_length: Maximum sequence length to generate
        min_length: Minimum sequence length to generate
        temperature: Sampling temperature (1.0 = no scaling)
        repetition_penalty: Penalty for repeating tokens (1.0 = no penalty)
        length_penalty: Penalty for longer sequences (1.0 = no penalty)
        num_beams: Number of beams for beam search
        early_stopping: Stop generation when all beams reach EOS
        bos_token_id: Beginning of sequence token ID
        eos_token_id: End of sequence token ID
        pad_token_id: Padding token ID
    """
    max_length: int = 100
    min_length: int = 1
    temperature: float = 1.0
    repetition_penalty: float = 1.0
    length_penalty: float = 1.0
    num_beams: int = 5
    early_stopping: bool = True
    bos_token_id: int = 1
    eos_token_id: int = 2
    pad_token_id: int = 0


class BeamSearchDecoder:
    """Beam search decoder for text generation

    Beam search maintains multiple candidate sequences (beams) at each step,
    keeping only the top-k sequences based on cumulative scores.

    Args:
        num_beams: Number of beams to maintain (default: 5)
        max_length: Maximum generation length (default: 100)
        min_length: Minimum generation length (default: 1)
        temperature: Sampling temperature (default: 1.0)
        repetition_penalty: Penalty for repeating tokens (default: 1.0)
        length_penalty: Penalty for longer sequences (default: 1.0)
        early_stopping: Stop when all beams reach EOS (default: True)
        bos_token_id: Beginning of sequence token ID (default: 1)
        eos_token_id: End of sequence token ID (default: 2)
        pad_token_id: Padding token ID (default: 0)

    Example:
        >>> decoder = BeamSearchDecoder(num_beams=5, max_length=50)
        >>> tokens, scores = decoder.decode(model, images)
        >>> print(tokens.shape)  # (batch_size, <=50)
    """

    def __init__(
        self,
        num_beams: int = 5,
        max_length: int = 100,
        min_length: int = 1,
        temperature: float = 1.0,
        repetition_penalty: float = 1.0,
        length_penalty: float = 1.0,
        early_stopping: bool = True,
        bos_token_id: int = 1,
        eos_token_id: int = 2,
        pad_token_id: int = 0,
    ):
        self.config = GenerationConfig(
            num_beams=num_beams,
            max_length=max_length,
            min_length=min_length,
            temperature=temperature,
            repetition_penalty=repetition_penalty,
            length_penalty=length_penalty,
            early_stopping=early_stopping,
            bos_token_id=bos_token_id,
            eos_token_id=eos_token_id,
            pad_token_id=pad_token_id,
        )

    def _apply_repetition_penalty(
        self,
        logits: torch.Tensor,
        token_ids: torch.Tensor,
    ) -> torch.Tensor:
        """Apply repetition penalty to logits

        Args:
            logits: Logits [vocab_size]
            token_ids: Previously generated tokens [seq_len]

        Returns:
            Logits with repetition penalty applied
        """
        if self.config.repetition_penalty == 1.0:
            return logits

        # Get unique tokens in history
        unique_tokens = torch.unique(token_ids)

        # Apply penalty: divide logit by penalty if token was seen before
        for token in unique_tokens:
            if token.item() < logits.shape[-1]:
                if logits[token] > 0:
                    logits[token] = logits[token] / self.config.repetition_penalty
                else:
                    logits[token] = logits[token] * self.config.repetition_penalty

        return logits

    def decode(
        self,
        model: torch.nn.Module,
        images: torch.Tensor,
    ) -> Tuple[torch.Tensor, torch.Tensor]:
        """Generate captions using beam search decoding

        Args:
            model: PixelLLM model with vision_encoder and language_decoder
            images: Input images [batch_size, 3, image_size, image_size]

        Returns:
            Tuple of:
            - Generated token IDs [batch_size, generated_seq_len]
            - Beam scores [batch_size]

        Example:
            >>> decoder = BeamSearchDecoder(num_beams=5)
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

        # Expand vision features for beams
        vision_features = vision_features.unsqueeze(1).expand(
            -1, config.num_beams, -1, -1
        ).reshape(batch_size * config.num_beams, -1, vision_features.shape[-1])

        # Initialize beams with BOS token
        beams = [
            [BeamCandidate(
                tokens=torch.tensor([[config.bos_token_id]], device=device),
                log_prob=0.0,
                score=0.0
            ) for _ in range(config.num_beams)
            ] for _ in range(batch_size)
        ]

        completed_beams: List[List[BeamCandidate]] = [[] for _ in range(batch_size)]

        for step in range(config.max_length):
            all_candidates: List[List[BeamCandidate]] = [[] for _ in range(batch_size)]

            for batch_idx in range(batch_size):
                # Get active beams (not completed)
                active_beams = [b for b in beams[batch_idx] if b not in completed_beams[batch_idx]]

                if not active_beams:
                    all_candidates[batch_idx] = beams[batch_idx]
                    continue

                # Prepare batch input from active beams
                beam_tokens = torch.cat([b.tokens for b in active_beams], dim=0)

                # Get next token logits
                with torch.no_grad():
                    logits = model.language_decoder(beam_tokens, vision_features[
                        batch_idx * config.num_beams:(batch_idx + 1) * config.num_beams
                    ][:len(active_beams)])
                    next_token_logits = logits[:, -1, :]

                # Apply length normalization
                if config.length_penalty != 1.0:
                    length_penalty = ((5.0 + step + 1) / (5.0 + 1)) ** config.length_penalty
                else:
                    length_penalty = 1.0

                # Compute log probabilities
                log_probs = F.log_softmax(next_token_logits, dim=-1)

                # Get top-k candidates for each beam
                for beam_idx, beam in enumerate(active_beams):
                    beam_log_probs = log_probs[beam_idx]

                    # Apply repetition penalty
                    if config.repetition_penalty != 1.0:
                        beam_log_probs = self._apply_repetition_penalty(
                            beam_log_probs,
                            beam.tokens.squeeze(0)
                        )

                    # Get top-k next tokens
                    top_k_log_probs, top_k_tokens = torch.topk(
                        beam_log_probs, min(config.num_beams * 2, beam_log_probs.shape[-1])
                    )

                    # Create new candidates
                    for k in range(len(top_k_tokens)):
                        new_tokens = torch.cat([
                            beam.tokens,
                            top_k_tokens[k:k+1].unsqueeze(0)
                        ], dim=1)

                        new_log_prob = beam.log_prob + top_k_log_probs[k].item()

                        # Normalize score by length
                        new_score = new_log_prob / length_penalty

                        # Check for EOS
                        if top_k_tokens[k].item() == config.eos_token_id:
                            if step >= config.min_length - 1:
                                completed_beams[batch_idx].append(BeamCandidate(
                                    tokens=new_tokens,
                                    log_prob=new_log_prob,
                                    score=new_score
                                ))

                        all_candidates[batch_idx].append(BeamCandidate(
                            tokens=new_tokens,
                            log_prob=new_log_prob,
                            score=new_score
                        ))

            # Select top beams for each batch
            for batch_idx in range(batch_size):
                # Sort by score and keep top num_beams
                all_candidates[batch_idx].sort(key=lambda x: x.score, reverse=True)
                beams[batch_idx] = all_candidates[batch_idx][:config.num_beams]

            # Check early stopping
            if config.early_stopping:
                all_finished = all(
                    len(completed_beams[batch_idx]) >= config.num_beams
                    for batch_idx in range(batch_size)
                )
                if all_finished:
                    break

        # Collect final results
        output_tokens = []
        output_scores = []

        for batch_idx in range(batch_size):
            # Combine active and completed beams
            all_beams = beams[batch_idx] + completed_beams[batch_idx]

            # Sort by score and select best
            all_beams.sort(key=lambda x: x.score, reverse=True)
            best_beam = all_beams[0]

            # Remove BOS token
            tokens = best_beam.tokens[:, 1:]

            output_tokens.append(tokens)
            output_scores.append(best_beam.score)

        # Pad sequences to same length
        max_len = max(t.shape[1] for t in output_tokens)
        padded_tokens = []
        for tokens in output_tokens:
            if tokens.shape[1] < max_len:
                padding = torch.full(
                    (1, max_len - tokens.shape[1]),
                    config.pad_token_id,
                    device=device,
                    dtype=tokens.dtype
                )
                tokens = torch.cat([tokens, padding], dim=1)
            padded_tokens.append(tokens)

        output_tokens = torch.cat(padded_tokens, dim=0)
        output_scores = torch.tensor(output_scores, device=device)

        return output_tokens, output_scores


def create_beam_search_decoder(**kwargs) -> BeamSearchDecoder:
    """Factory function to create a BeamSearchDecoder

    Args:
        **kwargs: Arguments passed to BeamSearchDecoder constructor

    Returns:
        Configured BeamSearchDecoder instance

    Example:
        >>> decoder = create_beam_search_decoder(num_beams=5, max_length=50)
        >>> tokens, scores = decoder.decode(model, images)
    """
    return BeamSearchDecoder(**kwargs)
