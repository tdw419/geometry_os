; DESCRIPTION: Draws a white circle centered at (140, 194) with radius 58.
; PLAN: r0=140(x), r1=194(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 194
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
