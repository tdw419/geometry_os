; DESCRIPTION: Draws a white circle centered at (102, 85) with radius 78.
; PLAN: r0=102(x), r1=85(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 85
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
