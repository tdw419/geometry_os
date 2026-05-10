; DESCRIPTION: Renders a green circular shape at (316, 84) with radius 58.
; PLAN: r0=316(x), r1=84(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 84
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
