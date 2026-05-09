; DESCRIPTION: Draws a green circle centered at (99, 134) with radius 23.
; PLAN: r0=99(x), r1=134(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 134
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
