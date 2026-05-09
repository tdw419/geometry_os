; DESCRIPTION: Places a white circle of radius 52 at center (98, 152).
; PLAN: r0=98(x), r1=152(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 152
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
