; DESCRIPTION: Places a white circle of radius 10 at center (376, 16).
; PLAN: r0=376(x), r1=16(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 16
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
