; DESCRIPTION: Creates a magenta circular shape at (155, 128) with radius 34.
; PLAN: r0=155(x), r1=128(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 128
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
