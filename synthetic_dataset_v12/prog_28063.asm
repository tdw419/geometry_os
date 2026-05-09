; DESCRIPTION: Draws a green circle centered at (167, 118) with radius 66.
; PLAN: r0=167(x), r1=118(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 118
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
