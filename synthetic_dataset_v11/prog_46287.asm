; DESCRIPTION: Places a magenta circle of radius 75 at center (155, 119).
; PLAN: r0=155(x), r1=119(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 119
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
