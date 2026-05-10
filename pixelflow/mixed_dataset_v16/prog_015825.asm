; DESCRIPTION: Draws a green circle centered at (466, 62) with radius 25.
; PLAN: r0=466(x), r1=62(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 466
LDI r1, 62
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
