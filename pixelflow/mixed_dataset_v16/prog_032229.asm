; DESCRIPTION: Draws a green circle centered at (81, 115) with radius 23.
; PLAN: r0=81(x), r1=115(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 115
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
