; DESCRIPTION: Draws a purple circle centered at (151, 163) with radius 66.
; PLAN: r0=151(x), r1=163(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 163
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
