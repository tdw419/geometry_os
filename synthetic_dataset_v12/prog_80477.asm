; DESCRIPTION: Sets a single orange pixel at (353, 233).
; PLAN: r0=353(x), r1=233(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 353
LDI r1, 233
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
