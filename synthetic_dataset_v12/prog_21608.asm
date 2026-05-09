; DESCRIPTION: Draws a green circle centered at (96, 174) with radius 68.
; PLAN: r0=96(x), r1=174(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 174
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
