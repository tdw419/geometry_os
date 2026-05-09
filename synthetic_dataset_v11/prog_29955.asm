; DESCRIPTION: Places a white circle of radius 57 at center (65, 183).
; PLAN: r0=65(x), r1=183(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 183
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
