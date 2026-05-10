; DESCRIPTION: Draws a white circle centered at (421, 153) with radius 64.
; PLAN: r0=421(x), r1=153(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 153
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
