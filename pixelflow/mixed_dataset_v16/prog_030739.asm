; DESCRIPTION: Draws a yellow circle centered at (325, 66) with radius 49.
; PLAN: r0=325(x), r1=66(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 66
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
