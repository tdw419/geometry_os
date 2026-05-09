; DESCRIPTION: Places a white circle of radius 16 at center (120, 34).
; PLAN: r0=120(x), r1=34(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 34
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
