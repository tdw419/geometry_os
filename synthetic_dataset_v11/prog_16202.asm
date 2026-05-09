; DESCRIPTION: Places a magenta circle of radius 15 at center (158, 37).
; PLAN: r0=158(x), r1=37(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 37
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
