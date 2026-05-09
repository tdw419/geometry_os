; DESCRIPTION: Sets a single orange pixel at (203, 171).
; PLAN: r0=203(x), r1=171(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 203
LDI r1, 171
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
