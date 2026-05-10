; DESCRIPTION: Draws a blue circle centered at (213, 175) with radius 22.
; PLAN: r0=213(x), r1=175(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 175
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
