; DESCRIPTION: Places a orange dot at position (432, 24).
; PLAN: r0=432(x), r1=24(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 432
LDI r1, 24
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
