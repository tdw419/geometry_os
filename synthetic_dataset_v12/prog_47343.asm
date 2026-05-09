; DESCRIPTION: Places a white circle of radius 15 at center (179, 44).
; PLAN: r0=179(x), r1=44(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 44
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
