; DESCRIPTION: Draws a white circle centered at (163, 148) with radius 55.
; PLAN: r0=163(x), r1=148(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 148
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
