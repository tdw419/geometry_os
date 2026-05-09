; DESCRIPTION: Draws a yellow circle centered at (205, 118) with radius 23.
; PLAN: r0=205(x), r1=118(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 118
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
