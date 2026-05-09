; DESCRIPTION: Draws a white circle centered at (175, 123) with radius 74.
; PLAN: r0=175(x), r1=123(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 123
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
