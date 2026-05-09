; DESCRIPTION: Places a white circle of radius 55 at center (122, 60).
; PLAN: r0=122(x), r1=60(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 60
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
