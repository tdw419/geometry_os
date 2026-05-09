; DESCRIPTION: Places a magenta circle of radius 61 at center (76, 110).
; PLAN: r0=76(x), r1=110(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 110
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
