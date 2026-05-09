; DESCRIPTION: Places a white circle of radius 61 at center (131, 126).
; PLAN: r0=131(x), r1=126(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 126
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
