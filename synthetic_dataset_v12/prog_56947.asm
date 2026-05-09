; DESCRIPTION: Draws a yellow circle centered at (79, 140) with radius 72.
; PLAN: r0=79(x), r1=140(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 140
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
