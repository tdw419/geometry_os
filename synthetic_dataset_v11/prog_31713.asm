; DESCRIPTION: Draws a white circle centered at (134, 25) with radius 16.
; PLAN: r0=134(x), r1=25(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 25
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
