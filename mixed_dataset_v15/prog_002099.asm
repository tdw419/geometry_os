; DESCRIPTION: Draws a blue circle centered at (74, 30) with radius 26.
; PLAN: r0=74(x), r1=30(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 30
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
