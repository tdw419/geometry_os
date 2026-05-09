; DESCRIPTION: Draws a yellow circle centered at (246, 86) with radius 72.
; PLAN: r0=246(x), r1=86(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 86
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
