; DESCRIPTION: Draws a yellow circle centered at (457, 109) with radius 13.
; PLAN: r0=457(x), r1=109(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 457
LDI r1, 109
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
