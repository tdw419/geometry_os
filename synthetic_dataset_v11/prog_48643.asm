; DESCRIPTION: Places a orange dot at position (159, 24).
; PLAN: r0=159(x), r1=24(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 159
LDI r1, 24
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
