# Genome Tutorial

## Tutorial 1: Your First Genome

Create a simple function that adds two numbers.

### Step 1: Create the genome

Save as `adder.genome.json`:

```json
{
  "version": "1.0",
  "genes": [
    {
      "id": "g1",
      "type": "function",
      "name": "add",
      "sequence": "ATCGATCG",
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

### Step 2: Generate Rust code

```bash
python -m genome.cli generate adder.genome.json -o adder.rs
```

### Step 3: View the output

```rust
// Auto-generated from genome
// Generation: 0

fn add(a: i32, b: i32) -> i32 {
    (a + b)
}
```

## Tutorial 2: Evolving Programs

Use genetic operators to evolve better solutions.

### Step 1: Create initial population

Create two parent genomes with different implementations.

### Step 2: Crossover

```bash
python -m genome.cli crossover parent1.genome.json parent2.genome.json -o offspring.json
```

### Step 3: Mutate

```bash
python -m genome.cli mutate offspring.json --mutation-rate 0.05 -o mutated.json
```

### Step 4: Generate and test

```bash
python -m genome.cli generate mutated.json -o solution.rs
cargo test
```

## Tutorial 3: Regulatory Logic

Use regulatory regions to control which genes are active.

### Promoters

Genes in the promoters list are guaranteed to be active.

### Suppressors

Genes in the suppressors list are never active.

### Conditional Regulation

Create complex logic for gene expression based on conditions.
