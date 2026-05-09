; DESCRIPTION: Draws a yellow circle centered at (123, 115) with radius 38.
; PLAN: r0=123(x), r1=115(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 115
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
