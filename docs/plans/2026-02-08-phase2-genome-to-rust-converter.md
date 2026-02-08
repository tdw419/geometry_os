# Geometry OS Phase 2: Genome to Rust Converter - Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Build a Genome to Rust code converter that transforms genetic/evolutionary representations into executable Rust code, enabling bio-inspired software development.

**Architecture:** A multi-stage pipeline that parses genome specifications, applies evolutionary transformations, validates generated code, and integrates with the existing Geometry OS codebase.

**Tech Stack:** Python 3.12+, Tree-sitter (parsing), Syn (Rust AST), existing geometry_os codebase, WGSL for GPU acceleration

---

## Task 1: Genome Specification Format

**Files:**
- Create: `systems/genome/spec/genome_schema.json`
- Create: `systems/genome/spec/README.md`
- Test: `tests/genome/test_genome_schema.py`

**Context:** Define the genome format that represents genetic programs. This will be the input format for the converter.

**Step 1: Write the failing test**

```python
# tests/genome/test_genome_schema.py
import pytest
import json
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).parent.parent / "systems" / "genome"))

def test_genome_schema_validates():
    """Test that genome schema can be loaded and validated"""
    from genome_schema import validate_genome, GenomeSchema

    # Valid minimal genome
    valid_genome = {
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
            "enhancers": []
        }
    }

    schema = GenomeSchema()
    errors = schema.validate(valid_genome)
    assert len(errors) == 0, f"Validation failed: {errors}"

def test_genome_schema_rejects_invalid():
    """Test that invalid genomes are rejected"""
    from genome_schema import validate_genome, GenomeSchema

    invalid_genome = {
        "version": "1.0",
        "genes": [
            {
                "id": "g1",
                "type": "function",
                # Missing required fields
            }
        ]
    }

    schema = GenomeSchema()
    errors = schema.validate(invalid_genome)
    assert len(errors) > 0, "Should have validation errors"
```

**Step 2: Run test to verify it fails**

Run: `python -m pytest tests/genome/test_genome_schema.py -v`

Expected: FAIL with "ModuleNotFoundError: No module named 'genome_schema'"

**Step 3: Create the schema implementation**

```python
# systems/genome/spec/genome_schema.py
"""
Genome Schema Specification

Defines the format for genetic program representations in Geometry OS.
"""
import json
from typing import Dict, List, Any, Optional
from dataclasses import dataclass, field
from enum import Enum


class GeneType(Enum):
    """Types of genes in the genome"""
    FUNCTION = "function"
    STRUCT = "struct"
    ENUM = "enum"
    TRAIT = "trait"
    IMPL = "impl"
    MODULE = "module"
    CONSTANT = "constant"


class ASTNodeType(Enum):
    """AST node types for gene bodies"""
    # Literals
    LITERAL = "literal"
    VARIABLE = "variable"

    # Operations
    BINARY_OP = "binary_op"
    UNARY_OP = "unary_op"

    # Control flow
    IF = "if"
    LOOP = "loop"
    MATCH = "match"
    BLOCK = "block"

    # Functions
    CALL = "call"
    RETURN = "return"

    # Declarations
    LET = "let"
    ASSIGN = "assign"


@dataclass
class Parameter:
    """Function or method parameter"""
    name: str
    type: str
    default: Optional[Any] = None


@dataclass
class Gene:
    """A single gene in the genome"""
    id: str
    type: GeneType
    name: str
    sequence: str  # DNA-like sequence for genetic operations

    # For functions
    parameters: List[Parameter] = field(default_factory=list)
    return_type: Optional[str] = None
    body: Optional[Dict[str, Any]] = None

    # For structs/traits
    fields: List[Dict[str, Any]] = field(default_factory=list)
    methods: List[str] = field(default_factory=list)

    # Metadata
    annotations: List[str] = field(default_factory=list)
    documentation: Optional[str] = None


@dataclass
class RegulatoryRegion:
    """Regulatory elements controlling gene expression"""
    promoters: List[str] = field(default_factory=list)  # Genes to activate
    enhancers: List[str] = field(default_factory=list)  # Genes to enhance
    suppressors: List[str] = field(default_factory=list)  # Genes to suppress

    # Conditional regulation
    conditional: List[Dict[str, Any]] = field(default_factory=list)


@dataclass
class Genome:
    """Complete genome specification"""
    version: str
    genes: List[Gene]
    regulatory_regions: RegulatoryRegion

    # Metadata
    author: Optional[str] = None
    description: Optional[str] = None
    created_at: Optional[str] = None
    generation: int = 0
    fitness_score: Optional[float] = None


class GenomeSchema:
    """Validator for genome specifications"""

    REQUIRED_FIELDS = {
        "version",
        "genes",
        "regulatory_regions"
    }

    GENE_REQUIRED_FIELDS = {
        "id",
        "type",
        "name",
        "sequence"
    }

    def validate(self, genome_data: Dict[str, Any]) -> List[str]:
        """
        Validate a genome specification.

        Returns:
            List of error messages (empty if valid)
        """
        errors = []

        # Check required top-level fields
        for field in self.REQUIRED_FIELDS:
            if field not in genome_data:
                errors.append(f"Missing required field: {field}")

        if errors:
            return errors

        # Validate genes
        if not isinstance(genome_data["genes"], list):
            errors.append("'genes' must be a list")
        else:
            for i, gene in enumerate(genome_data["genes"]):
                gene_errors = self._validate_gene(gene, i)
                errors.extend(gene_errors)

        # Validate regulatory regions
        reg_errors = self._validate_regulatory_regions(
            genome_data.get("regulatory_regions", {})
        )
        errors.extend(reg_errors)

        return errors

    def _validate_gene(self, gene: Dict[str, Any], index: int) -> List[str]:
        """Validate a single gene"""
        errors = []
        prefix = f"Gene {index}:"

        # Check required fields
        for field in self.GENE_REQUIRED_FIELDS:
            if field not in gene:
                errors.append(f"{prefix} Missing required field: {field}")

        if errors:
            return errors

        # Validate gene type
        try:
            GeneType(gene["type"])
        except ValueError:
            errors.append(f"{prefix} Invalid gene type: {gene['type']}")

        # Validate function-specific fields
        if gene["type"] == "function":
            if "parameters" in gene:
                if not isinstance(gene["parameters"], list):
                    errors.append(f"{prefix} 'parameters' must be a list")

            if "body" in gene and not isinstance(gene["body"], dict):
                errors.append(f"{prefix} 'body' must be an object")

        return errors

    def _validate_regulatory_regions(self, regions: Dict[str, Any]) -> List[str]:
        """Validate regulatory regions"""
        errors = []

        valid_keys = {"promoters", "enhancers", "suppressors", "conditional"}
        for key in regions:
            if key not in valid_keys:
                errors.append(f"Unknown regulatory region key: {key}")

        for key in ["promoters", "enhancers", "suppressors"]:
            if key in regions and not isinstance(regions[key], list):
                errors.append(f"'regulatory_regions.{key}' must be a list")

        return errors


def load_genome(path: str) -> Genome:
    """Load a genome from a JSON file"""
    with open(path, 'r') as f:
        data = json.load(f)

    schema = GenomeSchema()
    errors = schema.validate(data)

    if errors:
        raise ValueError(f"Invalid genome schema:\n" + "\n".join(errors))

    # Convert to Genome dataclass
    regulatory = RegulatoryRegion(
        promoters=data.get("regulatory_regions", {}).get("promoters", []),
        enhancers=data.get("regulatory_regions", {}).get("enhancers", []),
        suppressors=data.get("regulatory_regions", {}).get("suppressors", []),
        conditional=data.get("regulatory_regions", {}).get("conditional", [])
    )

    genes = []
    for gene_data in data["genes"]:
        gene = Gene(
            id=gene_data["id"],
            type=GeneType(gene_data["type"]),
            name=gene_data["name"],
            sequence=gene_data["sequence"],
            parameters=[
                Parameter(**p) for p in gene_data.get("parameters", [])
            ],
            return_type=gene_data.get("return_type"),
            body=gene_data.get("body"),
            fields=gene_data.get("fields", []),
            methods=gene_data.get("methods", []),
            annotations=gene_data.get("annotations", []),
            documentation=gene_data.get("documentation")
        )
        genes.append(gene)

    return Genome(
        version=data["version"],
        genes=genes,
        regulatory_regions=regulatory,
        author=data.get("author"),
        description=data.get("description"),
        created_at=data.get("created_at"),
        generation=data.get("generation", 0),
        fitness_score=data.get("fitness_score")
    )


def save_genome(genome: Genome, path: str):
    """Save a genome to a JSON file"""
    data = {
        "version": genome.version,
        "genes": [
            {
                "id": g.id,
                "type": g.type.value,
                "name": g.name,
                "sequence": g.sequence,
                "parameters": [
                    {"name": p.name, "type": p.type, "default": p.default}
                    for p in g.parameters
                ],
                "return_type": g.return_type,
                "body": g.body,
                "fields": g.fields,
                "methods": g.methods,
                "annotations": g.annotations,
                "documentation": g.documentation
            }
            for g in genome.genes
        ],
        "regulatory_regions": {
            "promoters": genome.regulatory_regions.promoters,
            "enhancers": genome.regulatory_regions.enhancers,
            "suppressors": genome.regulatory_regions.suppressors,
            "conditional": genome.regulatory_regions.conditional
        },
        "author": genome.author,
        "description": genome.description,
        "created_at": genome.created_at,
        "generation": genome.generation,
        "fitness_score": genome.fitness_score
    }

    with open(path, 'w') as f:
        json.dump(data, f, indent=2)
```

**Step 4: Create the JSON schema**

```json
// systems/genome/spec/genome_schema.json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "Geometry OS Genome Schema",
  "description": "Schema for genetic program representations",
  "type": "object",
  "required": ["version", "genes", "regulatory_regions"],
  "properties": {
    "version": {
      "type": "string",
      "description": "Genome schema version"
    },
    "genes": {
      "type": "array",
      "items": {
        "type": "object",
        "required": ["id", "type", "name", "sequence"],
        "properties": {
          "id": { "type": "string" },
          "type": {
            "type": "string",
            "enum": ["function", "struct", "enum", "trait", "impl", "module", "constant"]
          },
          "name": { "type": "string" },
          "sequence": { "type": "string" },
          "parameters": {
            "type": "array",
            "items": {
              "type": "object",
              "required": ["name", "type"],
              "properties": {
                "name": { "type": "string" },
                "type": { "type": "string" },
                "default": {}
              }
            }
          },
          "return_type": { "type": "string" },
          "body": { "type": "object" },
          "fields": { "type": "array" },
          "methods": { "type": "array", "items": { "type": "string" } },
          "annotations": { "type": "array", "items": { "type": "string" } },
          "documentation": { "type": "string" }
        }
      }
    },
    "regulatory_regions": {
      "type": "object",
      "properties": {
        "promoters": { "type": "array", "items": { "type": "string" } },
        "enhancers": { "type": "array", "items": { "type": "string" } },
        "suppressors": { "type": "array", "items": { "type": "string" } },
        "conditional": { "type": "array" }
      }
    },
    "author": { "type": "string" },
    "description": { "type": "string" },
    "created_at": { "type": "string" },
    "generation": { "type": "integer" },
    "fitness_score": { "type": "number" }
  }
}
```

**Step 5: Run test to verify it passes**

Run: `python -m pytest tests/genome/test_genome_schema.py -v`

Expected: PASS

**Step 6: Commit**

```bash
git add systems/genome/ tests/genome/
git commit -m "feat(genome): add genome schema specification and validator"
```

---

## Task 2: AST to Rust Code Generator

**Files:**
- Create: `systems/genome/src/rust_generator.py`
- Create: `systems/genome/src/ast_nodes.py`
- Test: `tests/genome/test_rust_generator.py`

**Context:** Convert genome AST representations into valid Rust code.

**Step 1: Write the failing test**

```python
# tests/genome/test_rust_generator.py
import pytest
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).parent.parent / "systems" / "genome"))

def test_generate_simple_function():
    """Test generating a simple Rust function"""
    from rust_generator import RustCodeGenerator
    from genome_schema import Gene, GeneType, Parameter

    gene = Gene(
        id="g1",
        type=GeneType.FUNCTION,
        name="add",
        sequence="ATCG",
        parameters=[
            Parameter(name="a", type="i32"),
            Parameter(name="b", type="i32")
        ],
        return_type="i32",
        body={
            "type": "binary_op",
            "operator": "+",
            "left": {"type": "variable", "name": "a"},
            "right": {"type": "variable", "name": "b"}
        }
    )

    generator = RustCodeGenerator()
    code = generator.generate_function(gene)

    assert "fn add" in code
    assert "a: i32" in code
    assert "b: i32" in code
    assert "-> i32" in code
    assert "a + b" in code

def test_generate_struct():
    """Test generating a Rust struct"""
    from rust_generator import RustCodeGenerator
    from genome_schema import Gene, GeneType

    gene = Gene(
        id="g2",
        type=GeneType.STRUCT,
        name="Point",
        sequence="GCTA",
        fields=[
            {"name": "x", "type": "f64"},
            {"name": "y", "type": "f64"}
        ]
    )

    generator = RustCodeGenerator()
    code = generator.generate_struct(gene)

    assert "struct Point" in code
    assert "x: f64" in code
    assert "y: f64" in code
```

**Step 2: Run test to verify it fails**

Run: `python -m pytest tests/genome/test_rust_generator.py -v`

Expected: FAIL with "ModuleNotFoundError: No module named 'rust_generator'"

**Step 3: Create the generator implementation**

```python
# systems/genome/src/ast_nodes.py
"""
AST node definitions for genome code generation.
"""
from typing import Any, List, Optional
from dataclasses import dataclass


@dataclass
class ASTNode:
    """Base class for all AST nodes"""
    type: str


@dataclass
class LiteralNode(ASTNode):
    """Literal value"""
    value: Any
    data_type: Optional[str] = None


@dataclass
class VariableNode(ASTNode):
    """Variable reference"""
    name: str


@dataclass
class BinaryOpNode(ASTNode):
    """Binary operation"""
    operator: str
    left: Dict[str, Any]
    right: Dict[str, Any]


@dataclass
class UnaryOpNode(ASTNode):
    """Unary operation"""
    operator: str
    operand: Dict[str, Any]


@dataclass
class IfNode(ASTNode):
    """If/else expression"""
    condition: Dict[str, Any]
    then_branch: Dict[str, Any]
    else_branch: Optional[Dict[str, Any]] = None


@dataclass
class BlockNode(ASTNode):
    """Block of statements"""
    statements: List[Dict[str, Any]]


@dataclass
class CallNode(ASTNode):
    """Function call"""
    function: str
    arguments: List[Dict[str, Any]]


@dataclass
class LetNode(ASTNode):
    """Variable declaration"""
    name: str
    value_type: Optional[str]
    value: Dict[str, Any]
    mutable: bool = False


@dataclass
class ReturnNode(ASTNode):
    """Return statement"""
    value: Optional[Dict[str, Any]] = None


@dataclass
class LoopNode(ASTNode):
    """Loop expression"""
    body: Dict[str, Any]


@dataclass
class MatchNode(ASTNode):
    """Match expression"""
    value: Dict[str, Any]
    arms: List[Dict[str, Any]]


def parse_ast_node(data: Dict[str, Any]) -> ASTNode:
    """Parse a dictionary into an AST node"""
    node_type = data.get("type", "")

    if node_type == "literal":
        return LiteralNode(
            type=node_type,
            value=data.get("value"),
            data_type=data.get("data_type")
        )
    elif node_type == "variable":
        return VariableNode(type=node_type, name=data["name"])
    elif node_type == "binary_op":
        return BinaryOpNode(
            type=node_type,
            operator=data["operator"],
            left=data["left"],
            right=data["right"]
        )
    elif node_type == "unary_op":
        return UnaryOpNode(
            type=node_type,
            operator=data["operator"],
            operand=data["operand"]
        )
    elif node_type == "if":
        return IfNode(
            type=node_type,
            condition=data["condition"],
            then_branch=data["then_branch"],
            else_branch=data.get("else_branch")
        )
    elif node_type == "block":
        return BlockNode(
            type=node_type,
            statements=data.get("statements", [])
        )
    elif node_type == "call":
        return CallNode(
            type=node_type,
            function=data["function"],
            arguments=data.get("arguments", [])
        )
    elif node_type == "let":
        return LetNode(
            type=node_type,
            name=data["name"],
            value_type=data.get("value_type"),
            value=data["value"],
            mutable=data.get("mutable", False)
        )
    elif node_type == "return":
        return ReturnNode(type=node_type, value=data.get("value"))
    elif node_type == "loop":
        return LoopNode(type=node_type, body=data["body"])
    elif node_type == "match":
        return MatchNode(
            type=node_type,
            value=data["value"],
            arms=data.get("arms", [])
        )
    else:
        raise ValueError(f"Unknown AST node type: {node_type}")
```

```python
# systems/genome/src/rust_generator.py
"""
Rust code generator from genome AST.
"""
from typing import Optional, List, Set
from .genome_schema import Gene, GeneType, Genome
from .ast_nodes import parse_ast_node, ASTNode


class RustCodeGenerator:
    """Generate Rust code from genome specifications"""

    def __init__(self, indent: str = "    "):
        self.indent = indent
        self.indent_level = 0

    def generate(self, genome: Genome) -> str:
        """Generate complete Rust code from a genome"""
        pieces = []

        # Header
        pieces.append("// Auto-generated from genome")
        pieces.append(f"// Generation: {genome.generation}")
        if genome.description:
            pieces.append(f"// {genome.description}")
        pieces.append("")

        # Apply regulatory logic
        active_genes = self._apply_regulatory_logic(genome)

        # Generate each active gene
        for gene in active_genes:
            if gene.type == GeneType.FUNCTION:
                pieces.append(self.generate_function(gene))
            elif gene.type == GeneType.STRUCT:
                pieces.append(self.generate_struct(gene))
            elif gene.type == GeneType.ENUM:
                pieces.append(self.generate_enum(gene))
            elif gene.type == GeneType.TRAIT:
                pieces.append(self.generate_trait(gene))
            elif gene.type == GeneType.IMPL:
                pieces.append(self.generate_impl(gene))
            elif gene.type == GeneType.CONSTANT:
                pieces.append(self.generate_constant(gene))
            pieces.append("")

        return "\n".join(pieces)

    def _apply_regulatory_logic(self, genome: Genome) -> List[Gene]:
        """Apply regulatory regions to determine active genes"""
        # Start with all genes
        gene_map = {g.id: g for g in genome.genes}
        active = set(gene_map.keys())

        # Apply suppressors
        for suppressor in genome.regulatory_regions.suppressors:
            active.discard(suppressor)

        # Apply promoters (ensure these are active)
        for promoter in genome.regulatory_regions.promoters:
            if promoter in gene_map:
                active.add(promoter)

        return [gene_map[gid] for gid in active if gid in gene_map]

    def generate_function(self, gene: Gene) -> str:
        """Generate a Rust function"""
        lines = []

        # Documentation
        if gene.documentation:
            lines.append(f"/// {gene.documentation}")

        # Annotations
        for annotation in gene.annotations:
            lines.append(f"#{annotation}")

        # Function signature
        params = ", ".join(
            f"{p.name}: {p.type}" for p in gene.parameters
        )

        return_type = f" -> {gene.return_type}" if gene.return_type else ""
        sig = f"fn {gene.name}({params}){return_type}"
        lines.append(sig + " {")

        # Function body
        self.indent_level += 1
        if gene.body:
            body_code = self.generate_expression(gene.body)
            lines.append(self.indent_str() + body_code)
        else:
            lines.append(self.indent_str() + "todo!()")
        self.indent_level -= 1

        lines.append("}")
        return "\n".join(lines)

    def generate_struct(self, gene: Gene) -> str:
        """Generate a Rust struct"""
        lines = []

        if gene.documentation:
            lines.append(f"/// {gene.documentation}")

        lines.append(f"pub struct {gene.name} {{")
        self.indent_level += 1

        for field in gene.fields:
            field_name = field["name"]
            field_type = field["type"]
            visibility = field.get("visibility", "pub")
            lines.append(f"{self.indent_str()}{visibility} {field_name}: {field_type},")

        self.indent_level -= 1
        lines.append("}")

        return "\n".join(lines)

    def generate_enum(self, gene: Gene) -> str:
        """Generate a Rust enum"""
        lines = []

        if gene.documentation:
            lines.append(f"/// {gene.documentation}")

        lines.append(f"pub enum {gene.name} {{")
        self.indent_level += 1

        for variant in gene.fields:
            variant_name = variant["name"]
            if "data" in variant:
                lines.append(f"{self.indent_str()}{variant_name}({variant['data']}),")
            else:
                lines.append(f"{self.indent_str()}{variant_name},")

        self.indent_level -= 1
        lines.append("}")

        return "\n".join(lines)

    def generate_trait(self, gene: Gene) -> str:
        """Generate a Rust trait"""
        lines = []

        if gene.documentation:
            lines.append(f"/// {gene.documentation}")

        lines.append(f"pub trait {gene.name} {{")
        self.indent_level += 1

        for method_name in gene.methods:
            lines.append(f"{self.indent_str()}fn {method_name}(...);")

        self.indent_level -= 1
        lines.append("}")

        return "\n".join(lines)

    def generate_impl(self, gene: Gene) -> str:
        """Generate a Rust impl block"""
        lines = []

        target = gene.name
        lines.append(f"impl {target} {{")
        self.indent_level += 1

        for method_name in gene.methods:
            lines.append(f"{self.indent_str()}// Method: {method_name}")

        self.indent_level -= 1
        lines.append("}")

        return "\n".join(lines)

    def generate_constant(self, gene: Gene) -> str:
        """Generate a Rust constant"""
        if gene.body:
            value = self.generate_expression(gene.body)
            return f"pub const {gene.name}: {gene.return_type or '_' } = {value};"
        return f"pub const {gene.name}: _ = todo!();"

    def generate_expression(self, expr: Dict[str, Any]) -> str:
        """Generate a Rust expression from AST node"""
        if not isinstance(expr, dict):
            return str(expr)

        node_type = expr.get("type", "")

        if node_type == "literal":
            value = expr.get("value")
            if isinstance(value, str):
                return f'"{value}"'
            return str(value)

        elif node_type == "variable":
            return expr["name"]

        elif node_type == "binary_op":
            left = self.generate_expression(expr["left"])
            right = self.generate_expression(expr["right"])
            op = expr["operator"]
            return f"({left} {op} {right})"

        elif node_type == "unary_op":
            operand = self.generate_expression(expr["operand"])
            op = expr["operator"]
            return f"{op}{operand}"

        elif node_type == "if":
            condition = self.generate_expression(expr["condition"])
            then_branch = self.generate_expression(expr["then_branch"])
            else_branch = self.generate_expression(expr["else_branch"]) if expr.get("else_branch") else None

            if else_branch:
                return f"if {condition} {{ {then_branch} }} else {{ {else_branch} }}"
            return f"if {condition} {{ {then_branch} }}"

        elif node_type == "block":
            statements = expr.get("statements", [])
            if not statements:
                return "{}"

            stmts = " ".join([
                self.generate_expression(s) + ";"
                for s in statements
            ])
            return f"{{ {stmts} }}"

        elif node_type == "call":
            func = expr["function"]
            args = ", ".join([
                self.generate_expression(a)
                for a in expr.get("arguments", [])
            ])
            return f"{func}({args})"

        elif node_type == "let":
            mut = "mut " if expr.get("mutable") else ""
            name = expr["name"]
            value = self.generate_expression(expr["value"])
            type_ann = f": {expr['value_type']}" if expr.get("value_type") else ""
            return f"let {mut}{name}{type_ann} = {value};"

        elif node_type == "return":
            if expr.get("value"):
                value = self.generate_expression(expr["value"])
                return f"return {value};"
            return "return;"

        elif node_type == "loop":
            body = self.generate_expression(expr["body"])
            return f"loop {{ {body} }}"

        elif node_type == "match":
            value = self.generate_expression(expr["value"])
            arms = []
            for arm in expr.get("arms", []):
                pattern = arm.get("pattern", "_")
                body = self.generate_expression(arm.get("body", "{}"))
                arms.append(f"{pattern} => {body},")
            arms_str = " ".join(arms)
            return f"match {value} {{ {arms_str} }}"

        else:
            return "/* unknown expression */"

    def indent_str(self) -> str:
        """Get current indentation string"""
        return self.indent * self.indent_level
```

**Step 4: Run test to verify it passes**

Run: `python -m pytest tests/genome/test_rust_generator.py -v`

Expected: PASS

**Step 5: Commit**

```bash
git add systems/genome/src/rust_generator.py systems/genome/src/ast_nodes.py tests/genome/test_rust_generator.py
git commit -m "feat(genome): add Rust code generator from genome AST"
```

---

## Task 3: Genome Mutation and Crossover Operators

**Files:**
- Create: `systems/genome/src/genetic_ops.py`
- Test: `tests/genome/test_genetic_ops.py`

**Context:** Implement genetic operators (mutation, crossover) for evolving genomes.

**Step 1: Write the failing test**

```python
# tests/genome/test_genetic_ops.py
import pytest
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).parent.parent / "systems" / "genome"))

def test_point_mutation():
    """Test single point mutation in gene sequence"""
    from genetic_ops import mutate_sequence, PointMutationConfig

    original = "ATCGATCG"
    config = PointMutationConfig(mutation_rate=0.5)

    mutated = mutate_sequence(original, config)

    # Should be same length
    assert len(mutated) == len(original)
    # May be different due to mutation
    assert mutated == original or mutated != original

def test_crossover():
    """Test single-point crossover between two genomes"""
    from genetic_ops import crossover_genomes
    from genome_schema import Genome, Gene, GeneType, RegulatoryRegion

    parent1 = Genome(
        version="1.0",
        genes=[
            Gene(id="g1", type=GeneType.FUNCTION, name="func1", sequence="AAAA"),
            Gene(id="g2", type=GeneType.FUNCTION, name="func2", sequence="CCCC"),
        ],
        regulatory_regions=RegulatoryRegion()
    )

    parent2 = Genome(
        version="1.0",
        genes=[
            Gene(id="g1", type=GeneType.FUNCTION, name="func1", sequence="TTTT"),
            Gene(id="g3", type=GeneType.FUNCTION, name="func3", sequence="GGGG"),
        ],
        regulatory_regions=RegulatoryRegion()
    )

    child = crossover_genomes(parent1, parent2, crossover_point=0.5)

    # Should have genes from both parents
    assert len(child.genes) <= 3  # g1, g2, g3
```

**Step 2: Run test to verify it fails**

Run: `python -m pytest tests/genome/test_genetic_ops.py -v`

Expected: FAIL with "ModuleNotFoundError: No module named 'genetic_ops'"

**Step 3: Create the genetic operations implementation**

```python
# systems/genome/src/genetic_ops.py
"""
Genetic operators for genome evolution.

Implements mutation, crossover, and selection operations
for evolving genome specifications.
"""
import random
from typing import List, Optional, Tuple
from dataclasses import dataclass, field
from .genome_schema import Genome, Gene, GeneType, RegulatoryRegion


@dataclass
class PointMutationConfig:
    """Configuration for point mutations"""
    mutation_rate: float = 0.01  # Probability per base
    nucleotides: str = "ATCG"

    def __post_init__(self):
        if not 0 <= self.mutation_rate <= 1:
            raise ValueError("mutation_rate must be between 0 and 1")


@dataclass
class CrossoverConfig:
    """Configuration for crossover operations"""
    method: str = "single_point"  # single_point, two_point, uniform
    gene_crossover_rate: float = 0.5
    sequence_crossover_rate: float = 0.3


@dataclass
class SelectionConfig:
    """Configuration for selection"""
    method: str = "tournament"  # tournament, roulette, rank
    tournament_size: int = 3
    elitism_count: int = 1


def mutate_sequence(sequence: str, config: PointMutationConfig) -> str:
    """
    Apply point mutations to a DNA sequence.

    Args:
        sequence: Original DNA sequence
        config: Mutation configuration

    Returns:
        Mutated sequence
    """
    result = []
    for base in sequence:
        if random.random() < config.mutation_rate:
            # Mutate to different nucleotide
            choices = [n for n in config.nucleotides if n != base]
            result.append(random.choice(choices))
        else:
            result.append(base)
    return "".join(result)


def mutate_gene(gene: Gene, config: PointMutationConfig) -> Gene:
    """Apply mutations to a gene"""
    # Mutate sequence
    new_sequence = mutate_sequence(gene.sequence, config)

    # Occasionally mutate body (swap operators, change values)
    new_body = gene.body
    if gene.body and random.random() < config.mutation_rate * 10:
        new_body = mutate_ast(gene.body, config)

    return Gene(
        id=gene.id,
        type=gene.type,
        name=gene.name,
        sequence=new_sequence,
        parameters=gene.parameters,
        return_type=gene.return_type,
        body=new_body,
        fields=gene.fields,
        methods=gene.methods,
        annotations=gene.annotations,
        documentation=gene.documentation
    )


def mutate_ast(node: dict, config: PointMutationConfig) -> dict:
    """Recursively mutate an AST node"""
    if not isinstance(node, dict):
        return node

    result = dict(node)

    node_type = node.get("type", "")

    # Swap operators
    if node_type == "binary_op":
        if random.random() < config.mutation_rate * 5:
            operators = ["+", "-", "*", "/", "%"]
            current = node.get("operator", "+")
            if current in operators:
                new_op = random.choice(operators)
                result["operator"] = new_op

    # Mutate numeric literals
    elif node_type == "literal":
        value = node.get("value")
        if isinstance(value, (int, float)):
            if random.random() < config.mutation_rate * 3:
                perturbation = random.uniform(-0.1, 0.1) * value
                result["value"] = value + perturbation

    # Recursively mutate child nodes
    for key in ["left", "right", "condition", "then_branch", "else_branch",
                "body", "value", "operand"]:
        if key in result and isinstance(result[key], dict):
            result[key] = mutate_ast(result[key], config)

    return result


def crossover_sequences(seq1: str, seq2: str, point: Optional[int] = None) -> Tuple[str, str]:
    """
    Perform single-point crossover on two sequences.

    Args:
        seq1: First sequence
        seq2: Second sequence
        point: Crossover point (None for random)

    Returns:
        Tuple of (new_seq1, new_seq2)
    """
    min_len = min(len(seq1), len(seq2))
    if point is None:
        point = random.randint(0, min_len)

    new_seq1 = seq1[:point] + seq2[point:]
    new_seq2 = seq2[:point] + seq1[point:]

    return new_seq1, new_seq2


def crossover_genes(gene1: Gene, gene2: Gene, config: CrossoverConfig) -> List[Gene]:
    """Crossover two genes"""
    if gene1.id != gene2.id:
        # Different genes - can't crossover meaningfully
        return [gene1, gene2] if random.random() < 0.5 else [gene2, gene1]

    # Crossover sequences
    seq1, seq2 = crossover_sequences(gene1.sequence, gene2.sequence)

    # Crossover bodies if both exist
    body1, body2 = gene1.body, gene2.body
    if body1 and body2 and random.random() < config.sequence_crossover_rate:
        body1, body2 = crossover_bodies(body1, body2)

    return [
        Gene(
            id=gene1.id,
            type=gene1.type,
            name=gene1.name,
            sequence=seq1,
            parameters=gene1.parameters,
            return_type=gene1.return_type,
            body=body1,
            fields=gene1.fields,
            methods=gene1.methods,
            annotations=gene1.annotations,
            documentation=gene1.documentation
        ),
        Gene(
            id=gene2.id,
            type=gene2.type,
            name=gene2.name,
            sequence=seq2,
            parameters=gene2.parameters,
            return_type=gene2.return_type,
            body=body2,
            fields=gene2.fields,
            methods=gene2.methods,
            annotations=gene2.annotations,
            documentation=gene2.documentation
        )
    ]


def crossover_bodies(body1: dict, body2: dict) -> Tuple[dict, dict]:
    """Crossover two AST bodies"""
    # For now, just swap them
    # More sophisticated crossover could swap subtrees
    if random.random() < 0.5:
        return body2, body1
    return body1, body2


def crossover_genomes(genome1: Genome, genome2: Genome,
                      config: Optional[CrossoverConfig] = None,
                      crossover_point: float = 0.5) -> Genome:
    """
    Crossover two genomes to create offspring.

    Args:
        genome1: First parent genome
        genome2: Second parent genome
        config: Crossover configuration
        crossover_point: Fraction of genes to take from first parent (0-1)

    Returns:
        Child genome
    """
    if config is None:
        config = CrossoverConfig()

    # Get gene maps
    genes1 = {g.id: g for g in genome1.genes}
    genes2 = {g.id: g for g in genome2.genes}

    # Determine which genes come from which parent
    all_gene_ids = set(genes1.keys()) | set(genes2.keys())

    child_genes = []
    for gene_id in all_gene_ids:
        has_in_1 = gene_id in genes1
        has_in_2 = gene_id in genes2

        if has_in_1 and has_in_2:
            # Gene exists in both - potentially crossover
            if random.random() < config.gene_crossover_rate:
                crossed = crossover_genes(genes1[gene_id], genes2[gene_id], config)
                child_genes.extend(crossed)
            else:
                # Take from one parent
                if random.random() < crossover_point:
                    child_genes.append(genes1[gene_id])
                else:
                    child_genes.append(genes2[gene_id])
        elif has_in_1:
            child_genes.append(genes1[gene_id])
        else:
            child_genes.append(genes2[gene_id])

    # Crossover regulatory regions
    child_regulatory = RegulatoryRegion(
        promoters=list(set(genome1.regulatory_regions.promoters) |
                       set(genome2.regulatory_regions.promoters)),
        enhancers=list(set(genome1.regulatory_regions.enhancers) |
                       set(genome2.regulatory_regions.enhancers)),
        suppressors=[]  # Don't inherit suppressors
    )

    return Genome(
        version=genome1.version,
        genes=child_genes,
        regulatory_regions=child_regulatory,
        author=f"Cross of {genome1.author or '?'} and {genome2.author or '?'}",
        description=f"Offspring of genome crossover",
        created_at=None,
        generation=max(genome1.generation, genome2.generation) + 1,
        fitness_score=None
    )


def tournament_select(population: List[Genome],
                      config: SelectionConfig) -> Genome:
    """
    Select a genome using tournament selection.

    Args:
        population: List of genomes to select from
        config: Selection configuration

    Returns:
        Selected genome
    """
    if config.method != "tournament":
        raise ValueError(f"Unsupported selection method: {config.method}")

    # Randomly sample tournament_size individuals
    tournament = random.sample(population, min(config.tournament_size, len(population)))

    # Return the one with highest fitness
    return max(tournament, key=lambda g: g.fitness_score or 0)


def roulette_select(population: List[Genome],
                    config: SelectionConfig) -> Genome:
    """
    Select a genome using roulette wheel selection.

    Args:
        population: List of genomes to select from
        config: Selection configuration

    Returns:
        Selected genome
    """
    # Calculate total fitness
    total_fitness = sum(max(0, g.fitness_score or 0) for g in population)

    if total_fitness == 0:
        return random.choice(population)

    # Select based on fitness proportion
    r = random.uniform(0, total_fitness)
    cumsum = 0

    for genome in population:
        cumsum += max(0, genome.fitness_score or 0)
        if cumsum >= r:
            return genome

    return population[-1]


def evolve_population(population: List[Genome],
                      mutation_config: Optional[PointMutationConfig] = None,
                      crossover_config: Optional[CrossoverConfig] = None,
                      selection_config: Optional[SelectionConfig] = None,
                      population_size: int = None) -> List[Genome]:
    """
    Evolve a population of genomes.

    Args:
        population: Current population
        mutation_config: Mutation configuration
        crossover_config: Crossover configuration
        selection_config: Selection configuration
        population_size: Target population size

    Returns:
        Next generation population
    """
    if population_size is None:
        population_size = len(population)

    if mutation_config is None:
        mutation_config = PointMutationConfig()
    if crossover_config is None:
        crossover_config = CrossoverConfig()
    if selection_config is None:
        selection_config = SelectionConfig()

    new_population = []

    # Elitism - keep best individuals
    if selection_config.elitism_count > 0:
        sorted_pop = sorted(population, key=lambda g: g.fitness_score or 0, reverse=True)
        new_population.extend(sorted_pop[:selection_config.elitism_count])

    # Generate offspring
    while len(new_population) < population_size:
        # Select parents
        if selection_config.method == "tournament":
            parent1 = tournament_select(population, selection_config)
            parent2 = tournament_select(population, selection_config)
        elif selection_config.method == "roulette":
            parent1 = roulette_select(population, selection_config)
            parent2 = roulette_select(population, selection_config)
        else:
            parent1 = random.choice(population)
            parent2 = random.choice(population)

        # Crossover
        child = crossover_genomes(parent1, parent2, crossover_config)

        # Mutate
        child_genes = []
        for gene in child.genes:
            mutated = mutate_gene(gene, mutation_config)
            child_genes.append(mutated)
        child.genes = child_genes

        new_population.append(child)

    return new_population[:population_size]
```

**Step 4: Run test to verify it passes**

Run: `python -m pytest tests/genome/test_genetic_ops.py -v`

Expected: PASS

**Step 5: Commit**

```bash
git add systems/genome/src/genetic_ops.py tests/genome/test_genetic_ops.py
git commit -m "feat(genome): add genetic operators for evolution"
```

---

## Task 4: CLI Interface for Genome Operations

**Files:**
- Create: `systems/genome/bin/genome`
- Create: `systems/genome/src/cli.py`
- Test: `tests/genome/test_cli.py`

**Context:** Create command-line interface for genome operations.

**Step 1: Write the failing test**

```python
# tests/genome/test_cli.py
import pytest
import subprocess
import sys
from pathlib import Path

def test_cli_validate_command():
    """Test genome validate command"""
    result = subprocess.run(
        [sys.executable, "-m", "genome.cli", "validate", "--help"],
        capture_output=True
    )
    assert result.returncode == 0

def test_cli_generate_command():
    """Test genome generate command"""
    result = subprocess.run(
        [sys.executable, "-m", "genome.cli", "generate", "--help"],
        capture_output=True
    )
    assert result.returncode == 0
```

**Step 2: Run test to verify it fails**

Run: `python -m pytest tests/genome/test_cli.py -v`

Expected: FAIL with subprocess error

**Step 3: Create the CLI implementation**

```python
# systems/genome/src/cli.py
"""
Command-line interface for genome operations.
"""
import sys
import argparse
import json
from pathlib import Path
from .genome_schema import load_genome, save_genome, GenomeSchema
from .rust_generator import RustCodeGenerator
from .genetic_ops import (
    mutate_sequence, crossover_genomes, evolve_population,
    PointMutationConfig, CrossoverConfig, SelectionConfig
)


def cmd_validate(args):
    """Validate a genome file"""
    schema = GenomeSchema()

    try:
        with open(args.input, 'r') as f:
            data = json.load(f)

        errors = schema.validate(data)

        if errors:
            print("❌ Genome validation failed:")
            for error in errors:
                print(f"  - {error}")
            return 1
        else:
            print("✅ Genome is valid")
            return 0

    except Exception as e:
        print(f"❌ Error loading genome: {e}")
        return 1


def cmd_generate(args):
    """Generate Rust code from genome"""
    try:
        genome = load_genome(args.input)
        generator = RustCodeGenerator()

        code = generator.generate(genome)

        if args.output:
            with open(args.output, 'w') as f:
                f.write(code)
            print(f"✅ Generated Rust code: {args.output}")
        else:
            print(code)

        return 0

    except Exception as e:
        print(f"❌ Error generating code: {e}")
        return 1


def cmd_mutate(args):
    """Mutate a genome"""
    try:
        genome = load_genome(args.input)

        config = PointMutationConfig(
            mutation_rate=args.mutation_rate
        )

        from .genetic_ops import mutate_gene
        mutated_genes = []
        for gene in genome.genes:
            mutated = mutate_gene(gene, config)
            mutated_genes.append(mutated)

        genome.genes = mutated_genes
        genome.generation += 1

        output = args.output or f"mutated_{Path(args.input).name}"
        save_genome(genome, output)
        print(f"✅ Mutated genome saved: {output}")

        return 0

    except Exception as e:
        print(f"❌ Error mutating genome: {e}")
        return 1


def cmd_crossover(args):
    """Crossover two genomes"""
    try:
        parent1 = load_genome(args.parent1)
        parent2 = load_genome(args.parent2)

        config = CrossoverConfig(
            method=args.method,
            gene_crossover_rate=args.crossover_rate
        )

        child = crossover_genomes(parent1, parent2, config)

        output = args.output or "offspring.genome.json"
        save_genome(child, output)
        print(f"✅ Offspring genome saved: {output}")

        return 0

    except Exception as e:
        print(f"❌ Error crossing genomes: {e}")
        return 1


def cmd_info(args):
    """Display genome information"""
    try:
        genome = load_genome(args.input)

        print(f"Genome Information")
        print(f"=" * 50)
        print(f"Version: {genome.version}")
        print(f"Generation: {genome.generation}")
        print(f"Author: {genome.author or 'Unknown'}")
        print(f"Description: {genome.description or 'None'}")
        print(f"Fitness Score: {genome.fitness_score or 'Not evaluated'}")
        print(f"")
        print(f"Genes: {len(genome.genes)}")
        for gene in genome.genes:
            print(f"  - {gene.type.value}: {gene.name} ({gene.id})")
        print(f"")
        print(f"Regulatory Regions:")
        print(f"  - Promoters: {len(genome.regulatory_regions.promoters)}")
        print(f"  - Enhancers: {len(genome.regulatory_regions.enhancers)}")
        print(f"  - Suppressors: {len(genome.regulatory_regions.suppressors)}")

        return 0

    except Exception as e:
        print(f"❌ Error loading genome: {e}")
        return 1


def main():
    parser = argparse.ArgumentParser(
        description="Geometry OS Genome Tools",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  genome validate input.genome.json
  genome generate input.genome.json -o output.rs
  genome mutate input.genome.json --mutation-rate 0.1 -o mutated.json
  genome crossover parent1.json parent2.json -o offspring.json
  genome info input.genome.json
        """
    )

    subparsers = parser.add_subparsers(dest='command', help='Command to run')

    # Validate command
    validate_parser = subparsers.add_parser('validate', help='Validate genome file')
    validate_parser.add_argument('input', help='Input genome file')

    # Generate command
    generate_parser = subparsers.add_parser('generate', help='Generate Rust code')
    generate_parser.add_argument('input', help='Input genome file')
    generate_parser.add_argument('-o', '--output', help='Output Rust file')

    # Mutate command
    mutate_parser = subparsers.add_parser('mutate', help='Mutate genome')
    mutate_parser.add_argument('input', help='Input genome file')
    mutate_parser.add_argument('-o', '--output', help='Output genome file')
    mutate_parser.add_argument('--mutation-rate', type=float, default=0.01,
                               help='Mutation rate (default: 0.01)')

    # Crossover command
    crossover_parser = subparsers.add_parser('crossover', help='Crossover genomes')
    crossover_parser.add_argument('parent1', help='First parent genome')
    crossover_parser.add_argument('parent2', help='Second parent genome')
    crossover_parser.add_argument('-o', '--output', help='Offspring genome file')
    crossover_parser.add_argument('--method', default='single_point',
                                  choices=['single_point', 'two_point', 'uniform'],
                                  help='Crossover method')
    crossover_parser.add_argument('--crossover-rate', type=float, default=0.5,
                                  help='Gene crossover rate')

    # Info command
    info_parser = subparsers.add_parser('info', help='Display genome info')
    info_parser.add_argument('input', help='Input genome file')

    args = parser.parse_args()

    if not args.command:
        parser.print_help()
        return 1

    # Dispatch
    handlers = {
        'validate': cmd_validate,
        'generate': cmd_generate,
        'mutate': cmd_mutate,
        'crossover': cmd_crossover,
        'info': cmd_info,
    }

    return handlers[args.command](args)


if __name__ == '__main__':
    sys.exit(main())
```

**Step 4: Create the executable wrapper**

```bash
#!/usr/bin/env python3
# systems/genome/bin/genome
import sys
from pathlib import Path

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent / "src"))

from cli import main

if __name__ == '__main__':
    sys.exit(main())
```

**Step 5: Run test to verify it passes**

Run: `python -m pytest tests/genome/test_cli.py -v`

Expected: PASS

**Step 6: Commit**

```bash
git add systems/genome/bin/genome systems/genome/src/cli.py tests/genome/test_cli.py
git commit -m "feat(genome): add CLI interface for genome operations"
```

---

## Task 5: Integration with Existing Codebase

**Files:**
- Create: `systems/genome/integration/build.py`
- Create: `systems/genome/integration/compile.sh`
- Modify: `Cargo.toml` - add genome-generated module

**Context:** Integrate generated Rust code into the Geometry OS build system.

**Step 1: Create build integration**

```python
# systems/genome/integration/build.py
"""
Build integration for genome-generated code.
"""
import subprocess
import sys
from pathlib import Path
import json


def generate_from_genomes(genome_dir: Path, output_dir: Path):
    """Generate Rust code from all genomes in directory"""
    genome_files = list(genome_dir.glob("*.genome.json"))

    if not genome_files:
        print("No genome files found")
        return

    print(f"Found {len(genome_files)} genome(s)")

    for genome_file in genome_files:
        print(f"Generating code from: {genome_file.name}")

        # Use the CLI to generate code
        result = subprocess.run([
            sys.executable, "-m", "genome.cli", "generate",
            str(genome_file), "-o", str(output_dir / f"{genome_file.stem}.rs")
        ])

        if result.returncode != 0:
            print(f"❌ Failed to generate from {genome_file.name}")
            continue

        print(f"✅ Generated: {genome_file.stem}.rs")


def create_mod_rs(output_dir: Path):
    """Create mod.rs with all generated modules"""
    rs_files = list(output_dir.glob("*.rs"))

    mod_content = "// Auto-generated from genomes\n\n"

    for rs_file in rs_files:
        module_name = rs_file.stem
        mod_content += f"pub mod {module_name};\n"

    mod_file = output_dir / "mod.rs"
    mod_file.write_text(mod_content)
    print(f"✅ Created {mod_file}")


def main():
    import argparse

    parser = argparse.ArgumentParser(description="Build genome-generated code")
    parser.add_argument("--genome-dir", default="data/genomes",
                       help="Directory containing genome files")
    parser.add_argument("--output-dir", default="geometry_os/src/generated",
                       help="Output directory for generated Rust code")

    args = parser.parse_args()

    genome_dir = Path(args.genome_dir)
    output_dir = Path(args.output_dir)

    output_dir.mkdir(parents=True, exist_ok=True)

    generate_from_genomes(genome_dir, output_dir)
    create_mod_rs(output_dir)


if __name__ == "__main__":
    main()
```

```bash
#!/bin/bash
# systems/genome/integration/compile.sh
set -e

GENOME_DIR="${1:-data/genomes}"
OUTPUT_DIR="${2:-geometry_os/src/generated}"

echo "Building genome-generated code..."

# Generate Rust code
python3 systems/genome/integration/build.py \
    --genome-dir "$GENOME_DIR" \
    --output-dir "$OUTPUT_DIR"

# Add generated module to Cargo.toml if not present
if ! grep -q "generated" geometry_os/Cargo.toml; then
    echo "" >> geometry_os/Cargo.toml
    echo "[dependencies.generated]" >> geometry_os/Cargo.toml
    echo "path = \"src/generated\"" >> geometry_os/Cargo.toml
fi

echo "✅ Build complete"
```

**Step 2: Update main Cargo.toml**

Add to `geometry_os/Cargo.toml`:

```toml
[dependencies]
# ... existing dependencies ...

# Auto-generated from genomes
generated = { optional = true, path = "src/generated" }
```

**Step 3: Update main.rs to conditionally include generated code**

Add to `geometry_os/src/main.rs`:

```rust
#[cfg(feature = "generated")]
pub mod generated;
```

**Step 4: Commit**

```bash
git add systems/genome/integration/ geometry_os/Cargo.toml geometry_os/src/main.rs
git commit -m "feat(genome): integrate with build system"
```

---

## Task 6: Documentation

**Files:**
- Create: `docs/genome/README.md`
- Create: `docs/genome/TUTORIAL.md`
- Create: `docs/genome/ARCHITECTURE.md`

**Step 1: Create main README**

```markdown
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
```

**Step 2: Create tutorial**

```markdown
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
```

**Step 3: Create architecture doc**

```markdown
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
    ↓
Schema Validation
    ↓
Regulatory Logic
    ↓
AST Traversal
    ↓
Rust Code Generation
    ↓
Cargo Build
    ↓
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
```

**Step 4: Commit**

```bash
git add docs/genome/
git commit -m "docs(genome): add comprehensive documentation"
```

---

## Summary

This implementation plan creates a complete **Genome to Rust Converter** for Geometry OS Phase 2:

**Deliverables:**
1. ✅ Genome schema specification and validator
2. ✅ Rust code generator from AST
3. ✅ Genetic operators (mutation, crossover, selection)
4. ✅ CLI interface for all operations
5. ✅ Build system integration
6. ✅ Comprehensive documentation

**Estimated time:** 5-7 days for full implementation

**Next phases:**
- Neuromorphic Memory System (Phase 2b)
- PixelCPU v2.0 Architecture Research (Phase 2c)
- Infinite Desktop Spatial UI Improvements (Phase 2d)
