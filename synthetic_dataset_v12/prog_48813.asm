; DESCRIPTION: Draws a white circle centered at (376, 92) with radius 49.
; PLAN: r0=376(x), r1=92(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 92
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
