; DESCRIPTION: Draws a white circle centered at (250, 83) with radius 63.
; PLAN: r0=250(x), r1=83(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 83
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
