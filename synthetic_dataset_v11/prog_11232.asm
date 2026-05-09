; DESCRIPTION: Draws a yellow circle centered at (61, 78) with radius 58.
; PLAN: r0=61(x), r1=78(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 78
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
