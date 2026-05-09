; DESCRIPTION: Draws a green circle centered at (212, 95) with radius 26.
; PLAN: r0=212(x), r1=95(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 95
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
