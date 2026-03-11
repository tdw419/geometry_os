---
name: genome-validate
description: Validate, generate, mutate, and evolve genetic code using the Genome CLI for AI-driven code generation
category: development
---

# Genome Validate

Work with genetic code representations for AI-driven code generation and evolution.

## When to Use

- Validating genome JSON schemas before code generation
- Generating Rust code from genome specifications
- Mutating genomes for evolutionary experiments
- Crossing over genomes to combine features

## Procedure

### Step 1: Validate a Genome

```bash
cd systems/genome
python3 -m src.cli validate genome.json
```

Expected output:
```
✅ Genome is valid
```

### Step 2: Generate Rust Code

```bash
python3 -m src.cli generate genome.json --output src/generated.rs
```

### Step 3: Mutate a Genome

```bash
python3 -m src.cli mutate genome.json --output mutated.json --rate 0.1
```

### Step 4: Cross Over Genomes

```bash
python3 -m src.cli crossover parent1.json parent2.json --output child.json
```

### Step 5: Evolve a Population

```bash
python3 -m src.cli evolve population.json --generations 10 --output evolved.json
```

## CLI Reference

### validate - Check genome schema

```
usage: cli.py validate [-h] INPUT

positional:
  INPUT          Genome JSON file to validate

Exit codes:
  0 = Valid
  1 = Validation errors found
```

### generate - Produce Rust code

```
usage: cli.py generate [-h] INPUT [--output OUTPUT]

positional:
  INPUT          Genome JSON file

optional:
  --output FILE  Output .rs file (default: stdout)
```

### mutate - Apply point mutations

```
usage: cli.py mutate [-h] INPUT --output OUTPUT [--rate RATE]

positional:
  INPUT          Genome JSON file

required:
  --output FILE  Output mutated genome

optional:
  --rate FLOAT   Mutation rate (default: 0.1)
```

### crossover - Combine two genomes

```
usage: cli.py crossover [-h] PARENT1 PARENT2 --output OUTPUT

positional:
  PARENT1        First parent genome
  PARENT2        Second parent genome

required:
  --output FILE  Output child genome
```

### evolve - Run evolutionary algorithm

```
usage: cli.py evolve [-h] INPUT --generations N --output OUTPUT

positional:
  INPUT          Population JSON file

required:
  --generations N  Number of generations
  --output FILE    Output evolved population
```

## Genome Schema

```json
{
  "name": "example-genome",
  "version": "1.0",
  "generation": 0,
  "genes": [
    {
      "id": "func_1",
      "type": "function",
      "name": "calculate",
      "inputs": [{"name": "x", "type": "i32"}],
      "output": "i32",
      "body": ["load x", "const 2", "mul", "return"]
    }
  ],
  "metadata": {
    "fitness": 0.0,
    "parents": []
  }
}
```

## Troubleshooting

### "Genome validation failed"

**Cause**: Missing required fields or invalid types.
**Fix**: Check schema compliance.

```bash
# Show specific errors
python3 -m src.cli validate genome.json

# Common issues:
# - Missing "name" field
# - Invalid gene type
# - Missing gene body
```

### "Unknown gene type"

**Cause**: Gene type not recognized by generator.
**Fix**: Use valid gene types: function, struct, impl, trait.

```json
{
  "type": "function"  // Valid
  "type": "method"    // Invalid
}
```

### "Rust generation failed"

**Cause**: Invalid gene structure for Rust output.
**Fix**: Ensure genes follow Rust syntax patterns.

```bash
# Validate before generating
python3 -m src.cli validate genome.json && \
python3 -m src.cli generate genome.json --output out.rs
```

### "Crossover produced invalid offspring"

**Cause**: Incompatible parent structures.
**Fix**: Ensure parents have compatible gene types.

```bash
# Check both parents
python3 -m src.cli validate parent1.json
python3 -m src.cli validate parent2.json
```

## Examples

### Create and Evolve a Simple Genome

```bash
# Create base genome
cat > base.json << 'EOF'
{
  "name": "simple-math",
  "version": "1.0",
  "generation": 0,
  "genes": [
    {
      "id": "add",
      "type": "function",
      "name": "add",
      "inputs": [{"name": "a", "type": "i32"}, {"name": "b", "type": "i32"}],
      "output": "i32",
      "body": ["load a", "load b", "add", "return"]
    }
  ]
}
EOF

# Validate
python3 -m src.cli validate base.json

# Generate Rust
python3 -m src.cli generate base.json --output add.rs

# Mutate
python3 -m src.cli mutate base.json --output mutated.json --rate 0.2

# Generate mutated version
python3 -m src.cli generate mutated.json --output add_mutated.rs
```

### Evolve Population for Optimization

```bash
# Create population with variants
python3 -m src.cli evolve population.json --generations 50 --output best.json

# Generate optimized code
python3 -m src.cli generate best.json --output optimized.rs
```

## Related Skills

- `evolution-daemon-control` - Run continuous evolution
- `pixelrts-agent-build` - Build spatial agents
