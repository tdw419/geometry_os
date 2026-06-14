# Geometry OS CLI SOP

## Domain: Crystallization
| Action | Command | Backend |
| :--- | :--- | :--- |
| Standard Binary to PNG | `geo crystallize standard <in> <out>` | `pixelrts_v2_converter.py` |
| RISC-V to Geometric VM | `geo crystallize geometric <in> <out>` | `riscv_to_geometric_vm.py` |

## Domain: Orchestration
| Action | Command | Description |
| :--- | :--- | :--- |
| Launch Map | `geo map [--brick <path>]` | Starts the Rust-based compositor |
| Start Evolution | `geo evolve <path>` | Triggers AI mutation loop |

## Output Formats
- **Human**: Branded REPL skin with status icons.
- **Machine**: JSON objects via `--json` flag.

## Testing
Run `pytest` in the `agent-harness` directory.
