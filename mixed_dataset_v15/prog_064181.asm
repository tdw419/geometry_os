; DESCRIPTION: Places a white circle of radius 20 at center (107, 203).
; PLAN: r0=107(x), r1=203(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 203
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
