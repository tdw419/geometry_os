; DESCRIPTION: Sets a single red pixel at (388, 131).
; PLAN: r0=388(x), r1=131(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 388
LDI r1, 131
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
