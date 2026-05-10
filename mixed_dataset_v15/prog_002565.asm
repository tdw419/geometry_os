; DESCRIPTION: Draws a white circle centered at (244, 56) with radius 18.
; PLAN: r0=244(x), r1=56(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 56
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
