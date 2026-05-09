; DESCRIPTION: Draws a yellow circle centered at (72, 110) with radius 32.
; PLAN: r0=72(x), r1=110(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 110
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
