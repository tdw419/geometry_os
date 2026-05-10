; DESCRIPTION: Places a orange dot at position (299, 139).
; PLAN: r0=299(x), r1=139(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 299
LDI r1, 139
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
