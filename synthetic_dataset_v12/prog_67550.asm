; DESCRIPTION: Creates a blue circular shape at (389, 156) with radius 56.
; PLAN: r0=389(x), r1=156(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 156
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
