; DESCRIPTION: Places a orange dot at position (234, 99).
; PLAN: r0=234(x), r1=99(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 234
LDI r1, 99
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
