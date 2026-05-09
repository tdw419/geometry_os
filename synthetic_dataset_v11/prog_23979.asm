; DESCRIPTION: Draws a white circle centered at (137, 67) with radius 52.
; PLAN: r0=137(x), r1=67(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 67
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
