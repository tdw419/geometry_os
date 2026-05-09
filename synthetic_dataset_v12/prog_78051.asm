; DESCRIPTION: Places a orange dot at position (331, 3).
; PLAN: r0=331(x), r1=3(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 331
LDI r1, 3
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
