; DESCRIPTION: Draws a white circle centered at (349, 103) with radius 26.
; PLAN: r0=349(x), r1=103(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 103
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
