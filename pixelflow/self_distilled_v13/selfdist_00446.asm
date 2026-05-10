; DESCRIPTION: Draws a white circle centered at (357, 149) with radius 74.
; PLAN: r0=357(x), r1=149(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 149
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
