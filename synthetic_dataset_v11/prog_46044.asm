; DESCRIPTION: Places a orange dot at position (5, 211).
; PLAN: r0=5(x), r1=211(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 5
LDI r1, 211
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
