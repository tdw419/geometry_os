; DESCRIPTION: Draws a white circle centered at (314, 122) with radius 78.
; PLAN: r0=314(x), r1=122(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 122
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
