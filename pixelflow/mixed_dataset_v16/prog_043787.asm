; DESCRIPTION: Draws a white circle centered at (315, 83) with radius 79.
; PLAN: r0=315(x), r1=83(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 83
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
