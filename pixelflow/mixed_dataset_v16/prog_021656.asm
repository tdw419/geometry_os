; DESCRIPTION: Draws a white circle centered at (327, 117) with radius 78.
; PLAN: r0=327(x), r1=117(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 117
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
