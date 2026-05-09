; DESCRIPTION: Creates a magenta circular shape at (382, 85) with radius 27.
; PLAN: r0=382(x), r1=85(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 85
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
