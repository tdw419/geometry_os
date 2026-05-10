; DESCRIPTION: Draws a yellow circle centered at (264, 216) with radius 18.
; PLAN: r0=264(x), r1=216(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 216
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
