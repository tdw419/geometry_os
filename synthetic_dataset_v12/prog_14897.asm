; DESCRIPTION: Draws a white circle centered at (90, 155) with radius 30.
; PLAN: r0=90(x), r1=155(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 155
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
