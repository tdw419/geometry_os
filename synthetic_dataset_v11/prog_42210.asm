; DESCRIPTION: Draws a green circle centered at (144, 156) with radius 78.
; PLAN: r0=144(x), r1=156(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 156
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
