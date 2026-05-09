; DESCRIPTION: Draws a yellow circle centered at (114, 80) with radius 51.
; PLAN: r0=114(x), r1=80(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 80
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
