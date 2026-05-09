; DESCRIPTION: Places a white circle of radius 21 at center (123, 60).
; PLAN: r0=123(x), r1=60(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 60
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
