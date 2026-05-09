; DESCRIPTION: Draws a white circle centered at (223, 104) with radius 13.
; PLAN: r0=223(x), r1=104(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 104
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
