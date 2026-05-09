; DESCRIPTION: Draws a black circle centered at (87, 106) with radius 71.
; PLAN: r0=87(x), r1=106(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 106
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
