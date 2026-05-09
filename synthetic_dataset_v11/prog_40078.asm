; DESCRIPTION: Creates a magenta circular shape at (112, 87) with radius 75.
; PLAN: r0=112(x), r1=87(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 87
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
