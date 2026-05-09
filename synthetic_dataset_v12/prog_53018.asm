; DESCRIPTION: Places a orange dot at position (93, 33).
; PLAN: r0=93(x), r1=33(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 93
LDI r1, 33
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
