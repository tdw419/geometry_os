; DESCRIPTION: Places a magenta circle of radius 22 at center (155, 98).
; PLAN: r0=155(x), r1=98(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 98
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
