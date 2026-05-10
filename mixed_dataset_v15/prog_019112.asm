; DESCRIPTION: Draws a green circle centered at (140, 102) with radius 61.
; PLAN: r0=140(x), r1=102(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 102
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
