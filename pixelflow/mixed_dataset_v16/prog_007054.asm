; DESCRIPTION: Draws a white circle centered at (117, 35) with radius 28.
; PLAN: r0=117(x), r1=35(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 35
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
