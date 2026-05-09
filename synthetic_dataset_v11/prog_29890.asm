; DESCRIPTION: Draws a green circle centered at (162, 86) with radius 78.
; PLAN: r0=162(x), r1=86(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 86
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
