; DESCRIPTION: Draws a white circle centered at (337, 79) with radius 51.
; PLAN: r0=337(x), r1=79(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 79
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
