; DESCRIPTION: Draws a white circle centered at (74, 73) with radius 21.
; PLAN: r0=74(x), r1=73(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 73
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
