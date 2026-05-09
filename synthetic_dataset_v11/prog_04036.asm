; DESCRIPTION: Draws a white circle centered at (76, 161) with radius 71.
; PLAN: r0=76(x), r1=161(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 161
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
