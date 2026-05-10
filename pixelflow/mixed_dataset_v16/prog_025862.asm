; DESCRIPTION: Draws a blue circle centered at (353, 117) with radius 12.
; PLAN: r0=353(x), r1=117(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 117
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
