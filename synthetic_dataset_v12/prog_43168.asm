; DESCRIPTION: Draws a green circle centered at (247, 85) with radius 46.
; PLAN: r0=247(x), r1=85(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 85
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
