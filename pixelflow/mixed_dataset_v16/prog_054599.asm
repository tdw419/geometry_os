; DESCRIPTION: Draws a yellow circle centered at (267, 140) with radius 76.
; PLAN: r0=267(x), r1=140(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 140
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
