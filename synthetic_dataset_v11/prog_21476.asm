; DESCRIPTION: Places a white circle of radius 56 at center (182, 183).
; PLAN: r0=182(x), r1=183(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 183
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
