; DESCRIPTION: Creates a magenta circular shape at (107, 95) with radius 61.
; PLAN: r0=107(x), r1=95(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 95
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
