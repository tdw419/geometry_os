; DESCRIPTION: Places a orange disk with center (76, 143) and radius 35.
; PLAN: r0=76(x), r1=143(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 143
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
