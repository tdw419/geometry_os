; DESCRIPTION: Creates a blue circular shape at (151, 101) with radius 63.
; PLAN: r0=151(x), r1=101(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 101
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
