; DESCRIPTION: Draws a white circle centered at (212, 65) with radius 30.
; PLAN: r0=212(x), r1=65(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 65
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
