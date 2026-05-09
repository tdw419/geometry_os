; DESCRIPTION: Places a white circle of radius 40 at center (162, 61).
; PLAN: r0=162(x), r1=61(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 61
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
