; DESCRIPTION: Places a white circle of radius 23 at center (28, 62).
; PLAN: r0=28(x), r1=62(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 62
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
