; DESCRIPTION: Places a magenta circle of radius 63 at center (90, 137).
; PLAN: r0=90(x), r1=137(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 137
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
