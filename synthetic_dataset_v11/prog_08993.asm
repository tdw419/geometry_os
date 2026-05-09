; DESCRIPTION: Places a magenta circle of radius 80 at center (140, 88).
; PLAN: r0=140(x), r1=88(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 88
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
