; DESCRIPTION: Places a orange dot at position (229, 33).
; PLAN: r0=229(x), r1=33(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 229
LDI r1, 33
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
