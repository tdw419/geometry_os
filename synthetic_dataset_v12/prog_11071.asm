; DESCRIPTION: Draws a black circle centered at (306, 163) with radius 77.
; PLAN: r0=306(x), r1=163(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 163
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
