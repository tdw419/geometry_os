; DESCRIPTION: Sets a single red pixel at (301, 61).
; PLAN: r0=301(x), r1=61(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 301
LDI r1, 61
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
