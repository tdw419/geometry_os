; DESCRIPTION: Draws a yellow circle centered at (47, 78) with radius 36.
; PLAN: r0=47(x), r1=78(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 78
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
