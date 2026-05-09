; DESCRIPTION: Draws a yellow circle centered at (201, 64) with radius 29.
; PLAN: r0=201(x), r1=64(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 64
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
