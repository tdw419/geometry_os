; DESCRIPTION: Places a magenta circle of radius 62 at center (433, 87).
; PLAN: r0=433(x), r1=87(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 87
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
