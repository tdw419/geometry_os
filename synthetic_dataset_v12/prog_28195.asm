; DESCRIPTION: Draws a yellow circle centered at (140, 103) with radius 56.
; PLAN: r0=140(x), r1=103(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 103
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
