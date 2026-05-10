; DESCRIPTION: Draws a white circle centered at (265, 134) with radius 24.
; PLAN: r0=265(x), r1=134(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 134
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
