; DESCRIPTION: Places a white circle of radius 18 at center (364, 194).
; PLAN: r0=364(x), r1=194(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 194
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
