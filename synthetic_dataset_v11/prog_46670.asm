; DESCRIPTION: Creates a white circular shape at (145, 125) with radius 58.
; PLAN: r0=145(x), r1=125(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 125
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
