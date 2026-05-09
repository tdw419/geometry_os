; DESCRIPTION: Places a white circle of radius 47 at center (432, 165).
; PLAN: r0=432(x), r1=165(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 165
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
