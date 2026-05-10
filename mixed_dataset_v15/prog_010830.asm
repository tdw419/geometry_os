; DESCRIPTION: Draws a green circle centered at (302, 7) with radius 65.
; PLAN: r0=302(x), r1=7(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 7
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
