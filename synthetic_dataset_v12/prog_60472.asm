; DESCRIPTION: Draws a green circle centered at (252, 143) with radius 37.
; PLAN: r0=252(x), r1=143(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 143
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
