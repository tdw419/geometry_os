; DESCRIPTION: Draws a blue circle centered at (175, 76) with radius 61.
; PLAN: r0=175(x), r1=76(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 76
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
