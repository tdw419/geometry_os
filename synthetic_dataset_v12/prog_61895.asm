; DESCRIPTION: Places a white circle of radius 70 at center (407, 163).
; PLAN: r0=407(x), r1=163(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 163
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
