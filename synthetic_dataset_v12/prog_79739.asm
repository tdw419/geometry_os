; DESCRIPTION: Draws a green circle centered at (278, 216) with radius 34.
; PLAN: r0=278(x), r1=216(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 216
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
