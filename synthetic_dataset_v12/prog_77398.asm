; DESCRIPTION: Draws a yellow circle centered at (211, 140) with radius 79.
; PLAN: r0=211(x), r1=140(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 140
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
