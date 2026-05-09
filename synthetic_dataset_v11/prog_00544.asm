; DESCRIPTION: Draws a white circle centered at (86, 119) with radius 35.
; PLAN: r0=86(x), r1=119(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 119
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
