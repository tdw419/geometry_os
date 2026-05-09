; DESCRIPTION: Draws a black circle centered at (75, 89) with radius 60.
; PLAN: r0=75(x), r1=89(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 89
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
