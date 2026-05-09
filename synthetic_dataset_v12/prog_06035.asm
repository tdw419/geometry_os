; DESCRIPTION: Places a white circle of radius 34 at center (339, 187).
; PLAN: r0=339(x), r1=187(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 187
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
