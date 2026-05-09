; DESCRIPTION: Draws a green circle centered at (167, 97) with radius 20.
; PLAN: r0=167(x), r1=97(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 97
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
