; DESCRIPTION: Places a orange disk with center (40, 81) and radius 30.
; PLAN: r0=40(x), r1=81(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 81
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
