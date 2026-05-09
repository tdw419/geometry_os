; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (156, 137) with radius 73. Then Sets a single black pixel at (32, 20).
; PLAN: r0=156(x), r1=137(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=32(x), r1=20(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a magenta circular shape at (156, 137) with radius 73.
; PLAN: r0=156(x), r1=137(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 137
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single black pixel at (32, 20).
; PLAN: r0=32(x), r1=20(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 20
LDI r2, 0x000000
PSET r0, r1, r2
HALT
