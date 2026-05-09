; DESCRIPTION: Draws a white circle centered at (136, 175) with radius 26.
; PLAN: r0=136(x), r1=175(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 175
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
