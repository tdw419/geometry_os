; DESCRIPTION: Draws a white circle centered at (77, 57) with radius 46.
; PLAN: r0=77(x), r1=57(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 57
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
