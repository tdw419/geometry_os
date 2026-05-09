; DESCRIPTION: Draws a green circle centered at (125, 96) with radius 43.
; PLAN: r0=125(x), r1=96(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 96
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
