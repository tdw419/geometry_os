; DESCRIPTION: Draws a white circle centered at (324, 204) with radius 11.
; PLAN: r0=324(x), r1=204(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 204
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
