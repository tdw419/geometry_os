; DESCRIPTION: Draws a white circle centered at (213, 110) with radius 14.
; PLAN: r0=213(x), r1=110(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 110
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
