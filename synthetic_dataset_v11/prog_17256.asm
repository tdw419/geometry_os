; DESCRIPTION: Draws a black circle centered at (93, 106) with radius 80.
; PLAN: r0=93(x), r1=106(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 106
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
