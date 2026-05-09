; DESCRIPTION: Draws a green circle centered at (205, 40) with radius 24.
; PLAN: r0=205(x), r1=40(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 40
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
