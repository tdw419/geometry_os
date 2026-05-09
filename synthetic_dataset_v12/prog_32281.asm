; DESCRIPTION: Creates a magenta circular shape at (388, 176) with radius 63.
; PLAN: r0=388(x), r1=176(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 176
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
