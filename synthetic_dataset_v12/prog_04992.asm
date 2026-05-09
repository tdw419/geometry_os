; DESCRIPTION: Draws a yellow circle centered at (118, 123) with radius 62.
; PLAN: r0=118(x), r1=123(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 123
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
