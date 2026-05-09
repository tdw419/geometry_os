; DESCRIPTION: Places a white circle of radius 76 at center (152, 129).
; PLAN: r0=152(x), r1=129(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 129
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
