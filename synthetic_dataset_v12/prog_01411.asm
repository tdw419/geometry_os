; DESCRIPTION: Places a white circle of radius 11 at center (217, 134).
; PLAN: r0=217(x), r1=134(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 134
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
