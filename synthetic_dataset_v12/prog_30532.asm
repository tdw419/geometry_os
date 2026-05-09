; DESCRIPTION: Draws a yellow circle centered at (166, 84) with radius 66.
; PLAN: r0=166(x), r1=84(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 84
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
