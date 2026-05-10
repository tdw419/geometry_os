; DESCRIPTION: Draws a yellow circle centered at (118, 55) with radius 16.
; PLAN: r0=118(x), r1=55(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 55
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
