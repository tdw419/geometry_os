; DESCRIPTION: Draws a white circle centered at (285, 142) with radius 79.
; PLAN: r0=285(x), r1=142(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 142
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
