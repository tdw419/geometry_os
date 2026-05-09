; DESCRIPTION: Places a orange dot at position (348, 186).
; PLAN: r0=348(x), r1=186(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 348
LDI r1, 186
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
