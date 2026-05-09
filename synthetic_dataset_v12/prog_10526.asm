; DESCRIPTION: Draws a white circle centered at (272, 139) with radius 11.
; PLAN: r0=272(x), r1=139(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 139
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
