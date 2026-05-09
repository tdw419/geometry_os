; DESCRIPTION: Places a white circle of radius 72 at center (162, 106).
; PLAN: r0=162(x), r1=106(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 106
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
