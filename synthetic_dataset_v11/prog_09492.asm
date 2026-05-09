; DESCRIPTION: Creates a black circular shape at (194, 63) with radius 42.
; PLAN: r0=194(x), r1=63(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 63
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
