; DESCRIPTION: Places a orange dot at position (313, 102).
; PLAN: r0=313(x), r1=102(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 313
LDI r1, 102
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
