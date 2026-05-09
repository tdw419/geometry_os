; DESCRIPTION: Draws a white circle centered at (310, 135) with radius 19.
; PLAN: r0=310(x), r1=135(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 135
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
