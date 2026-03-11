# Genome Architecture

## Components

### Genome Schema (`genome_schema.py`)

Defines the data structures for genetic programs:
- `Gene`: Individual code unit
- `Genome`: Complete genetic program
- `RegulatoryRegion`: Control logic

### Rust Generator (`rust_generator.py`)

Converts genome AST to Rust code:
- Function generation
- Struct generation
- Trait generation
- Expression generation

### Genetic Operators (`genetic_ops.py`)

Evolutionary algorithms:
- Point mutation
- Crossover (single-point, two-point, uniform)
- Selection (tournament, roulette, rank)
- Population evolution

### CLI (`cli.py`)

Command-line interface for all operations.

## Data Flow

```
Genome JSON
    |
    v
Schema Validation
    |
    v
Regulatory Logic
    |
    v
AST Traversal
    |
    v
Rust Code Generation
    |
    v
Cargo Build
    |
    v
Executable
```

## Extension Points

### Custom Gene Types

Add new `GeneType` enum values and update the generator.

### Custom AST Nodes

Add new node types to `ast_nodes.py` and update `generate_expression`.

### Genetic Operators

Implement new operators in `genetic_ops.py`.

## GPU Acceleration

Future work:
- Parallel fitness evaluation on GPU
- Neural-guided mutation
- Visual debugging of evolution
