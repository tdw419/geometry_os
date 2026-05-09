; DESCRIPTION: Draws a yellow circle centered at (379, 78) with radius 76.
; PLAN: r0=379(x), r1=78(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 78
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
