; DESCRIPTION: Draws a white circle centered at (378, 15) with radius 17.
; PLAN: r0=378(x), r1=15(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 15
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
