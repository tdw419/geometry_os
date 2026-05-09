; DESCRIPTION: Draws a yellow circle centered at (222, 100) with radius 30.
; PLAN: r0=222(x), r1=100(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 100
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
