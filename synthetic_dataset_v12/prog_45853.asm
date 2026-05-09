; DESCRIPTION: Draws a white circle centered at (154, 105) with radius 78.
; PLAN: r0=154(x), r1=105(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 105
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
