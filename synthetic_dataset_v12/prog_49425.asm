; DESCRIPTION: Draws a white circle centered at (87, 92) with radius 73.
; PLAN: r0=87(x), r1=92(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 92
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
