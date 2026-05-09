; DESCRIPTION: Draws a blue circle centered at (473, 187) with radius 38.
; PLAN: r0=473(x), r1=187(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 473
LDI r1, 187
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
