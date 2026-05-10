; DESCRIPTION: Draws a white circle centered at (72, 65) with radius 35.
; PLAN: r0=72(x), r1=65(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 65
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
