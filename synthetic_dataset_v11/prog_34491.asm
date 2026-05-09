; DESCRIPTION: Places a orange dot at position (85, 87).
; PLAN: r0=85(x), r1=87(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 87
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
