; DESCRIPTION: Draws a red circle centered at (232, 63) with radius 22.
; PLAN: r0=232(x), r1=63(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 232
LDI r1, 63
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
