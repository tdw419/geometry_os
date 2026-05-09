; DESCRIPTION: Places a white circle of radius 75 at center (140, 122).
; PLAN: r0=140(x), r1=122(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 122
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
