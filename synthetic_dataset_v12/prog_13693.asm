; DESCRIPTION: Places a magenta circle of radius 15 at center (89, 237).
; PLAN: r0=89(x), r1=237(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 237
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
