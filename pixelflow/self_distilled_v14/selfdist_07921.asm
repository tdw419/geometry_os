; DESCRIPTION: Draws a green circle centered at (44, 0) with radius 71.
; PLAN: r0=44(x), r1=0(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 0
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
