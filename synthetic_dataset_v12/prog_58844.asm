; DESCRIPTION: Draws a yellow circle centered at (252, 123) with radius 13.
; PLAN: r0=252(x), r1=123(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 123
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
