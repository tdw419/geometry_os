; DESCRIPTION: Places a white circle of radius 15 at center (323, 56).
; PLAN: r0=323(x), r1=56(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 56
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
