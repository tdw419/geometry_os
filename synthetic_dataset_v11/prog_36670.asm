; DESCRIPTION: Creates a green circular shape at (143, 131) with radius 61.
; PLAN: r0=143(x), r1=131(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 131
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
