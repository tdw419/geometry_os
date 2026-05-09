; DESCRIPTION: Places a magenta circle of radius 65 at center (158, 137).
; PLAN: r0=158(x), r1=137(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 137
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
