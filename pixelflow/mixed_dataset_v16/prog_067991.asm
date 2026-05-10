; DESCRIPTION: Places a magenta circle of radius 34 at center (427, 106).
; PLAN: r0=427(x), r1=106(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 106
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
