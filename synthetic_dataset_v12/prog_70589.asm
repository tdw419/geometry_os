; DESCRIPTION: Draws a white circle centered at (141, 159) with radius 14.
; PLAN: r0=141(x), r1=159(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 159
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
