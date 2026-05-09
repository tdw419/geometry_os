; DESCRIPTION: Draws a yellow circle centered at (112, 123) with radius 52.
; PLAN: r0=112(x), r1=123(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 123
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
