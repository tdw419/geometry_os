; DESCRIPTION: Draws a green circle centered at (109, 146) with radius 15.
; PLAN: r0=109(x), r1=146(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 146
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
