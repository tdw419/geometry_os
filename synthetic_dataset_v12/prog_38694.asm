; DESCRIPTION: Places a orange dot at position (3, 71).
; PLAN: r0=3(x), r1=71(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 71
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
