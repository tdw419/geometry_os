; DESCRIPTION: Draws a yellow circle centered at (31, 128) with radius 30.
; PLAN: r0=31(x), r1=128(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 128
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
