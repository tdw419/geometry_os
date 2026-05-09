; DESCRIPTION: Draws a green circle centered at (123, 175) with radius 14.
; PLAN: r0=123(x), r1=175(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 175
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
