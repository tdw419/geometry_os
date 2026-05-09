; DESCRIPTION: Draws a black circle centered at (175, 222) with radius 15.
; PLAN: r0=175(x), r1=222(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 222
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
