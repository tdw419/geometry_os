; DESCRIPTION: Draws a yellow circle centered at (316, 109) with radius 66.
; PLAN: r0=316(x), r1=109(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 109
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
