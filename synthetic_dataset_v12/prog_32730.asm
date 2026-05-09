; DESCRIPTION: Draws a white circle centered at (376, 145) with radius 61.
; PLAN: r0=376(x), r1=145(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 145
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
