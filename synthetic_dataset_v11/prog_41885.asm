; DESCRIPTION: Draws a white circle centered at (94, 138) with radius 71.
; PLAN: r0=94(x), r1=138(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 138
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
