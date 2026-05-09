; DESCRIPTION: Draws a white circle centered at (142, 142) with radius 21.
; PLAN: r0=142(x), r1=142(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 142
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
