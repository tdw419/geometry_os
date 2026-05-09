; DESCRIPTION: Places a purple dot at position (458, 77).
; PLAN: r0=458(x), r1=77(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 458
LDI r1, 77
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
