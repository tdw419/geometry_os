; DESCRIPTION: Draws a white circle centered at (461, 210) with radius 40.
; PLAN: r0=461(x), r1=210(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 461
LDI r1, 210
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
