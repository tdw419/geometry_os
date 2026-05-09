; DESCRIPTION: Draws a white circle centered at (185, 103) with radius 38.
; PLAN: r0=185(x), r1=103(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 103
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
