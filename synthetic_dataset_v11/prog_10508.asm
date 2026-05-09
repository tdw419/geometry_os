; DESCRIPTION: Draws a white circle centered at (48, 57) with radius 34.
; PLAN: r0=48(x), r1=57(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 48
LDI r1, 57
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
