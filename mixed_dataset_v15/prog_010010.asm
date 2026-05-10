; DESCRIPTION: Places a orange disk with center (367, 176) and radius 59.
; PLAN: r0=367(x), r1=176(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 176
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
