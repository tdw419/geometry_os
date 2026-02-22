"""
Decoding Module for Pixel LLM

This module provides decoding strategies for generating text from the Pixel LLM model.
It includes beam search and greedy decoders, along with configuration classes.

Example:
    >>> from geometry_os.systems.pixel_llm.decoding import BeamSearchDecoder, GreedyDecoder
    >>> from geometry_os.systems.pixel_llm import PixelLLM
    >>>
    >>> # Beam search decoding
    >>> beam_decoder = BeamSearchDecoder(num_beams=5, max_length=50)
    >>> tokens, scores = beam_decoder.decode(model, images)
    >>>
    >>> # Greedy decoding
    >>> greedy_decoder = GreedyDecoder(max_length=50)
    >>> tokens, scores = greedy_decoder.decode(model, images)
"""

# Import decoders
from .beam_search import (
    BeamSearchDecoder,
    create_beam_search_decoder,
    GenerationConfig as BeamSearchConfig,
)

from .greedy import (
    GreedyDecoder,
    create_greedy_decoder,
    GenerationConfig as GreedyConfig,
)

# Import types
from .beam_search import BeamCandidate

__all__ = [
    # Decoders
    "BeamSearchDecoder",
    "GreedyDecoder",
    # Factory functions
    "create_beam_search_decoder",
    "create_greedy_decoder",
    # Configs
    "BeamSearchConfig",
    "GreedyConfig",
    # Types
    "BeamCandidate",
    # Utilities
    "get_decoder",
]


def get_decoder(
    decoder_type: str = "greedy",
    **kwargs
) -> "BeamSearchDecoder | GreedyDecoder":
    """Factory function to create a decoder by type

    Args:
        decoder_type: Type of decoder ("greedy" or "beam")
        **kwargs: Additional arguments passed to the decoder constructor

    Returns:
        Configured decoder instance

    Raises:
        ValueError: If decoder_type is not recognized

    Example:
        >>> # Get greedy decoder (default)
        >>> decoder = get_decoder()
        >>>
        >>> # Get beam search decoder
        >>> decoder = get_decoder("beam", num_beams=5, max_length=50)
        >>>
        >>> # Get greedy decoder with sampling
        >>> decoder = get_decoder("greedy", do_sample=True, temperature=0.8)
    """
    decoder_type = decoder_type.lower()

    if decoder_type == "greedy":
        return create_greedy_decoder(**kwargs)
    elif decoder_type == "beam" or decoder_type == "beam_search":
        return create_beam_search_decoder(**kwargs)
    else:
        raise ValueError(
            f"Unknown decoder type: {decoder_type}. "
            f"Supported types: 'greedy', 'beam'"
        )


def create_decoder_config(
    decoder_type: str = "greedy",
    **kwargs
):
    """Create a generation config for the specified decoder type

    Args:
        decoder_type: Type of decoder ("greedy" or "beam")
        **kwargs: Configuration parameters

    Returns:
        Config instance (BeamSearchConfig or GreedyConfig)

    Example:
        >>> config = create_decoder_config("beam", num_beams=5, max_length=50)
        >>> decoder = BeamSearchDecoder.from_config(config)
    """
    decoder_type = decoder_type.lower()

    if decoder_type == "greedy":
        return GreedyConfig(**kwargs)
    elif decoder_type == "beam" or decoder_type == "beam_search":
        return BeamSearchConfig(**kwargs)
    else:
        raise ValueError(
            f"Unknown decoder type: {decoder_type}. "
            f"Supported types: 'greedy', 'beam'"
        )


# Module-level convenience functions
def quick_beam_search(
    model,
    images,
    num_beams: int = 5,
    max_length: int = 100,
):
    """Quick beam search decoding with default parameters

    Args:
        model: PixelLLM model
        images: Input images
        num_beams: Number of beams (default: 5)
        max_length: Maximum length (default: 100)

    Returns:
        Tuple of (tokens, scores)
    """
    decoder = BeamSearchDecoder(num_beams=num_beams, max_length=max_length)
    return decoder.decode(model, images)


def quick_greedy_decode(
    model,
    images,
    max_length: int = 100,
):
    """Quick greedy decoding with default parameters

    Args:
        model: PixelLLM model
        images: Input images
        max_length: Maximum length (default: 100)

    Returns:
        Tuple of (tokens, scores)
    """
    decoder = GreedyDecoder(max_length=max_length)
    return decoder.decode(model, images)
