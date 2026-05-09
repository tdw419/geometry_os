; DESCRIPTION: Creates a magenta circular shape at (177, 183) with radius 64.
; PLAN: r0=177(x), r1=183(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 183
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
