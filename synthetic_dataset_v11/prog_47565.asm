; DESCRIPTION: Draws a yellow circle centered at (101, 202) with radius 51.
; PLAN: r0=101(x), r1=202(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 202
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
