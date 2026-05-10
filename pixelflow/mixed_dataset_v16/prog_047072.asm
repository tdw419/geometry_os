; DESCRIPTION: Places a orange disk with center (318, 195) and radius 74.
; PLAN: r0=318(x), r1=195(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 195
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
