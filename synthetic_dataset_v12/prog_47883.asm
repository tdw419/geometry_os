; DESCRIPTION: Draws a magenta circle centered at (331, 109) with radius 12.
; PLAN: r0=331(x), r1=109(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 109
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
