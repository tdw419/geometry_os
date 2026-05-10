; DESCRIPTION: Draws a yellow circle centered at (375, 217) with radius 22.
; PLAN: r0=375(x), r1=217(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 217
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
