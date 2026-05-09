; DESCRIPTION: Places a magenta circle of radius 72 at center (107, 137).
; PLAN: r0=107(x), r1=137(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 137
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
