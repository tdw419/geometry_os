; DESCRIPTION: Places a magenta circle of radius 56 at center (351, 101).
; PLAN: r0=351(x), r1=101(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 101
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
