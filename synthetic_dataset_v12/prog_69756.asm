; DESCRIPTION: Draws a yellow circle centered at (312, 137) with radius 24.
; PLAN: r0=312(x), r1=137(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 137
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
