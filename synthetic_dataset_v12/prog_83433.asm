; DESCRIPTION: Draws a white circle centered at (171, 176) with radius 11.
; PLAN: r0=171(x), r1=176(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 176
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
