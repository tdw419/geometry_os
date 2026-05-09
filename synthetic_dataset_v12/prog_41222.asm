; DESCRIPTION: Draws a white circle centered at (444, 188) with radius 28.
; PLAN: r0=444(x), r1=188(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 444
LDI r1, 188
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
