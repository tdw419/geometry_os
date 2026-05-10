; DESCRIPTION: Places a orange dot at position (178, 36).
; PLAN: r0=178(x), r1=36(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 36
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
