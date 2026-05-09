; DESCRIPTION: Draws a green circle centered at (136, 84) with radius 51.
; PLAN: r0=136(x), r1=84(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 84
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
