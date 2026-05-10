; DESCRIPTION: Draws a white circle centered at (99, 113) with radius 47.
; PLAN: r0=99(x), r1=113(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 113
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
