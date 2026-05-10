; DESCRIPTION: Places a orange disk with center (211, 67) and radius 39.
; PLAN: r0=211(x), r1=67(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 67
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
