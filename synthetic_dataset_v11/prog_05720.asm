; DESCRIPTION: Draws a yellow circle centered at (60, 145) with radius 17.
; PLAN: r0=60(x), r1=145(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 145
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
