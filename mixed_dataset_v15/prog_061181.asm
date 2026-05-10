; DESCRIPTION: Places a white disk with center (107, 90) and radius 80.
; PLAN: r0=107(x), r1=90(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 90
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
