; DESCRIPTION: Places a white circle of radius 28 at center (396, 183).
; PLAN: r0=396(x), r1=183(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 183
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
