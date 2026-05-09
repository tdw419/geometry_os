; DESCRIPTION: Draws a blue circle centered at (175, 104) with radius 13.
; PLAN: r0=175(x), r1=104(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 104
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
