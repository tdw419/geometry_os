; DESCRIPTION: Draws a yellow circle centered at (416, 118) with radius 11.
; PLAN: r0=416(x), r1=118(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 118
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
