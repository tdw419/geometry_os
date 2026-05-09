; DESCRIPTION: Draws a white circle centered at (54, 198) with radius 51.
; PLAN: r0=54(x), r1=198(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 198
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
