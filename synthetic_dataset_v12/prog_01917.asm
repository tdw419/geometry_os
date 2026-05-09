; DESCRIPTION: Draws a white circle centered at (136, 58) with radius 23.
; PLAN: r0=136(x), r1=58(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 58
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
