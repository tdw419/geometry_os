; DESCRIPTION: Draws a white circle centered at (380, 140) with radius 72.
; PLAN: r0=380(x), r1=140(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 140
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
