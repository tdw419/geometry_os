; DESCRIPTION: Draws a yellow circle centered at (357, 11) with radius 53.
; PLAN: r0=357(x), r1=11(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 11
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
