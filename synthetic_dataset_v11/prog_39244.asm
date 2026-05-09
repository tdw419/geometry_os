; DESCRIPTION: Draws a white circle centered at (177, 95) with radius 47.
; PLAN: r0=177(x), r1=95(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 95
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
