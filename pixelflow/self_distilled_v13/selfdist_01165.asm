; DESCRIPTION: Places a orange disk with center (107, 11) and radius 61.
; PLAN: r0=107(x), r1=11(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 11
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
