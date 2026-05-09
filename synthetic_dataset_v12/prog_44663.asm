; DESCRIPTION: Places a white circle of radius 32 at center (102, 204).
; PLAN: r0=102(x), r1=204(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 204
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
