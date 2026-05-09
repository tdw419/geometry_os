; DESCRIPTION: Draws a white circle centered at (181, 60) with radius 25.
; PLAN: r0=181(x), r1=60(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 60
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
