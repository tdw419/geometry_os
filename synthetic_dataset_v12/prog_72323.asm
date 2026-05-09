; DESCRIPTION: Places a white circle of radius 16 at center (194, 62).
; PLAN: r0=194(x), r1=62(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 62
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
