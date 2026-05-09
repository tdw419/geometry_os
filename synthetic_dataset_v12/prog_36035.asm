; DESCRIPTION: Draws a green circle centered at (223, 25) with radius 22.
; PLAN: r0=223(x), r1=25(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 25
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
