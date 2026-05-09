; DESCRIPTION: Places a orange dot at position (39, 131).
; PLAN: r0=39(x), r1=131(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 39
LDI r1, 131
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
