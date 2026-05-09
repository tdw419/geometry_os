; DESCRIPTION: Draws a white circle centered at (339, 103) with radius 63.
; PLAN: r0=339(x), r1=103(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 103
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
