; DESCRIPTION: Draws a green circle centered at (93, 134) with radius 14.
; PLAN: r0=93(x), r1=134(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 134
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
