; DESCRIPTION: Draws a blue circle centered at (427, 187) with radius 69.
; PLAN: r0=427(x), r1=187(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 187
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
