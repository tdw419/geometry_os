; DESCRIPTION: Draws a blue circle centered at (350, 114) with radius 74.
; PLAN: r0=350(x), r1=114(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 114
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
