; DESCRIPTION: Draws a green circle centered at (219, 55) with radius 34.
; PLAN: r0=219(x), r1=55(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 55
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
