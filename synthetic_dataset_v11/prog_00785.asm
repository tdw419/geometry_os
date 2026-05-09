; DESCRIPTION: Draws a white circle centered at (105, 164) with radius 37.
; PLAN: r0=105(x), r1=164(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 164
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
