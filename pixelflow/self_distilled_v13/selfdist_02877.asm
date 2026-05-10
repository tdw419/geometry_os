; DESCRIPTION: Draws a yellow circle centered at (88, 166) with radius 30.
; PLAN: r0=88(x), r1=166(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 166
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
