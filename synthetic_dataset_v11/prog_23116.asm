; DESCRIPTION: Draws a black circle centered at (169, 134) with radius 39.
; PLAN: r0=169(x), r1=134(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 134
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
