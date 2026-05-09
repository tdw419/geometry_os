; DESCRIPTION: Places a white circle of radius 24 at center (397, 114).
; PLAN: r0=397(x), r1=114(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 114
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
