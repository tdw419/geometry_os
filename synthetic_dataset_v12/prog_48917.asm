; DESCRIPTION: Draws a white circle centered at (110, 145) with radius 65.
; PLAN: r0=110(x), r1=145(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 145
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
