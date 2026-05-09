; DESCRIPTION: Draws a white circle centered at (411, 177) with radius 56.
; PLAN: r0=411(x), r1=177(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 177
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
