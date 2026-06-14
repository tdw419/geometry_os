# CSV Timeline Compiler for GeOS

Compile CSV animation timelines into GeOS assembly programs.

**See the full protocol specification in [docs/CSV_TIMELINE_PROTOCOL.md](../docs/CSV_TIMELINE_PROTOCOL.md).**

## Quick Start

```bash
# Compile and print to stdout
python3 scripts/csv2asm.py examples/demo_timeline.csv

# Compile to file
python3 scripts/csv2asm.py examples/demo_timeline.csv -o programs/demo.asm

# Looping animation with dark background
python3 scripts/csv2asm.py examples/demo_timeline.csv --bg 0x001020 --loop -o programs/demo.asm
```

## Example CSV

```csv
frame,op,x,y,w,h,r,g,b,text
0,FILL,0,0,0,0,0,16,32,
0,TEXT,60,20,200,16,255,255,255,HELLO WORLD
1,RECTF,20,80,100,30,255,68,68,
2,LINE,10,10,200,200,255,0,0,
```
