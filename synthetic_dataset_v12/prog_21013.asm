; DESCRIPTION: Places a orange dot at position (484, 241).
; PLAN: r0=484(x), r1=241(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 484
LDI r1, 241
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
