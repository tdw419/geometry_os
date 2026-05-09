; DESCRIPTION: Places a white circle of radius 32 at center (312, 44).
; PLAN: r0=312(x), r1=44(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 44
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
