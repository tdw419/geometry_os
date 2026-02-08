# Genome to Rust Converter

The Genome to Rust Converter enables bio-inspired software development in Geometry OS.

## Overview

Genetic programs are represented as genomes containing:
- **Genes**: Code units (functions, structs, traits, etc.)
- **Sequences**: DNA-like strings for genetic operations
- **Regulatory Regions**: Control gene expression
- **AST Bodies**: Executable code representations

## Installation

```bash
pip install -e systems/genome
```

## Quick Start

### Create a Genome

```json
{
  "version": "1.0",
  "genes": [
    {
      "id": "g1",
      "type": "function",
      "name": "add",
      "sequence": "ATCG",
      "parameters": [
        {"name": "a", "type": "i32"},
        {"name": "b", "type": "i32"}
      ],
      "return_type": "i32",
      "body": {
        "type": "binary_op",
        "operator": "+",
        "left": {"type": "variable", "name": "a"},
        "right": {"type": "variable", "name": "b"}
      }
    }
  ],
  "regulatory_regions": {
    "promoters": ["g1"],
    "enhancers": [],
    "suppressors": []
  }
}
```

### Generate Rust Code

```bash
python -m genome.cli generate my_genome.json -o output.rs
```

### Evolve Genomes

```bash
# Mutate a genome
python -m genome.cli mutate my_genome.json --mutation-rate 0.1 -o mutated.json

# Crossover two genomes
python -m genome.cli crossover parent1.json parent2.json -o offspring.json
```

## Architecture

See [ARCHITECTURE.md](ARCHITECTURE.md) for detailed architecture documentation.

## Examples

See [TUTORIAL.md](TUTORIAL.md) for step-by-step tutorials.
