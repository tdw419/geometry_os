; DESCRIPTION: Draws a white circle centered at (448, 142) with radius 57.
; PLAN: r0=448(x), r1=142(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 142
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
