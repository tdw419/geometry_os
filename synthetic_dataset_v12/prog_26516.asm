; DESCRIPTION: Places a white circle of radius 18 at center (183, 97).
; PLAN: r0=183(x), r1=97(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 97
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
