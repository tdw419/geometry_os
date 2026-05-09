; DESCRIPTION: Draws a blue circle centered at (222, 104) with radius 14.
; PLAN: r0=222(x), r1=104(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 104
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
