; DESCRIPTION: Draws a yellow circle centered at (145, 83) with radius 80.
; PLAN: r0=145(x), r1=83(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 83
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
