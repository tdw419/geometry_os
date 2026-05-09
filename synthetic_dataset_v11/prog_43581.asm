; DESCRIPTION: Draws a black circle centered at (140, 120) with radius 76.
; PLAN: r0=140(x), r1=120(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 120
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
