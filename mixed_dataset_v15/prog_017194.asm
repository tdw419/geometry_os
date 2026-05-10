; DESCRIPTION: Places a orange dot at position (195, 18).
; PLAN: r0=195(x), r1=18(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 195
LDI r1, 18
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
