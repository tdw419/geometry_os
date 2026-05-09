; DESCRIPTION: Draws a white circle centered at (427, 151) with radius 28.
; PLAN: r0=427(x), r1=151(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 151
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
