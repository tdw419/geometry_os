; DESCRIPTION: Places a white circle of radius 61 at center (304, 91).
; PLAN: r0=304(x), r1=91(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 91
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
