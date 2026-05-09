; DESCRIPTION: Draws a white circle centered at (153, 120) with radius 41.
; PLAN: r0=153(x), r1=120(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 120
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
