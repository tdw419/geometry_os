; DESCRIPTION: Draws a white circle centered at (135, 54) with radius 31.
; PLAN: r0=135(x), r1=54(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 54
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
