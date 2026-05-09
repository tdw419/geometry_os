; DESCRIPTION: Draws a white circle centered at (142, 153) with radius 66.
; PLAN: r0=142(x), r1=153(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 153
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
