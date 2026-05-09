; DESCRIPTION: Places a orange dot at position (97, 105).
; PLAN: r0=97(x), r1=105(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 97
LDI r1, 105
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
