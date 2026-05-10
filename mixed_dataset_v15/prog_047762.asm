; DESCRIPTION: Places a white circle of radius 57 at center (162, 109).
; PLAN: r0=162(x), r1=109(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 109
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
