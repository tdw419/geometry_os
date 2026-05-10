; DESCRIPTION: Draws a white circle centered at (448, 113) with radius 55.
; PLAN: r0=448(x), r1=113(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 113
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
