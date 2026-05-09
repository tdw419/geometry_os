; DESCRIPTION: Places a white circle of radius 66 at center (313, 96).
; PLAN: r0=313(x), r1=96(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 96
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
