; DESCRIPTION: Draws a white circle centered at (401, 125) with radius 71.
; PLAN: r0=401(x), r1=125(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 125
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
