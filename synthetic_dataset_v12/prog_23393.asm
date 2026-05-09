; DESCRIPTION: Places a orange dot at position (301, 40).
; PLAN: r0=301(x), r1=40(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 301
LDI r1, 40
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
