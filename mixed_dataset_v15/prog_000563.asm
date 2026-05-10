; DESCRIPTION: Places a orange dot at position (212, 43).
; PLAN: r0=212(x), r1=43(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 212
LDI r1, 43
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
