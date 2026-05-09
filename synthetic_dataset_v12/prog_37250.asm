; DESCRIPTION: Draws a yellow circle centered at (381, 138) with radius 63.
; PLAN: r0=381(x), r1=138(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 138
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
