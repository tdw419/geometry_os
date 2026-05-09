; DESCRIPTION: Places a white circle of radius 60 at center (102, 101).
; PLAN: r0=102(x), r1=101(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 101
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
