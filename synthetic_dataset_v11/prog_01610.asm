; DESCRIPTION: Places a orange dot at position (194, 12).
; PLAN: r0=194(x), r1=12(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 194
LDI r1, 12
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
