; DESCRIPTION: Draws a white circle centered at (405, 79) with radius 22.
; PLAN: r0=405(x), r1=79(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 79
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
