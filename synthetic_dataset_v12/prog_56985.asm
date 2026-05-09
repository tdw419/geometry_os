; DESCRIPTION: Draws a yellow circle centered at (51, 75) with radius 18.
; PLAN: r0=51(x), r1=75(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 75
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
