; DESCRIPTION: Places a magenta circle of radius 52 at center (155, 161).
; PLAN: r0=155(x), r1=161(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 161
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
