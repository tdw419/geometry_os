; DESCRIPTION: Draws a white circle centered at (74, 184) with radius 68.
; PLAN: r0=74(x), r1=184(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 184
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
