; DESCRIPTION: Draws a yellow circle centered at (145, 144) with radius 20.
; PLAN: r0=145(x), r1=144(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 144
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
