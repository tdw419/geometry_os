; DESCRIPTION: Draws a yellow circle centered at (210, 81) with radius 18.
; PLAN: r0=210(x), r1=81(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 81
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
