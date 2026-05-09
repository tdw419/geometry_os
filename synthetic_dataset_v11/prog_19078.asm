; DESCRIPTION: Creates a green circular shape at (101, 143) with radius 61.
; PLAN: r0=101(x), r1=143(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 143
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
