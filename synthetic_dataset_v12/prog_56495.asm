; DESCRIPTION: Draws a white circle centered at (182, 117) with radius 47.
; PLAN: r0=182(x), r1=117(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 117
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
