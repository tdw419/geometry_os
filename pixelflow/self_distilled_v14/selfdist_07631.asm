; DESCRIPTION: Places a orange disk with center (299, 125) and radius 16.
; PLAN: r0=299(x), r1=125(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 125
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
