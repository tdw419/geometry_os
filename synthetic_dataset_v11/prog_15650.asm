; DESCRIPTION: Draws a yellow circle centered at (34, 29) with radius 10.
; PLAN: r0=34(x), r1=29(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 34
LDI r1, 29
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
