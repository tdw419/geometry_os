; DESCRIPTION: Draws a green circle centered at (432, 95) with radius 40.
; PLAN: r0=432(x), r1=95(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 95
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
