; DESCRIPTION: Places a orange disk with center (251, 106) and radius 39.
; PLAN: r0=251(x), r1=106(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 106
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
