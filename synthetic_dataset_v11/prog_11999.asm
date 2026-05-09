; DESCRIPTION: Draws a white circle centered at (160, 181) with radius 15.
; PLAN: r0=160(x), r1=181(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 181
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
