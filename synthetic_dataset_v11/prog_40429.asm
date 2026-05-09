; DESCRIPTION: Draws a white circle centered at (120, 204) with radius 34.
; PLAN: r0=120(x), r1=204(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 204
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
