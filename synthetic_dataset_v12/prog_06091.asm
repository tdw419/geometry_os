; DESCRIPTION: Draws a white circle centered at (230, 79) with radius 26.
; PLAN: r0=230(x), r1=79(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 79
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
