; DESCRIPTION: Draws a white circle centered at (276, 43) with radius 35.
; PLAN: r0=276(x), r1=43(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 43
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
