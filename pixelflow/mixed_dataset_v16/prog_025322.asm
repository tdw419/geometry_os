; DESCRIPTION: Places a orange dot at position (335, 76).
; PLAN: r0=335(x), r1=76(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 335
LDI r1, 76
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
