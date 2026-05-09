; DESCRIPTION: Draws a yellow circle centered at (13, 92) with radius 13.
; PLAN: r0=13(x), r1=92(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 13
LDI r1, 92
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
