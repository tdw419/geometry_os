; DESCRIPTION: Draws a white circle centered at (33, 188) with radius 12.
; PLAN: r0=33(x), r1=188(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 33
LDI r1, 188
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
