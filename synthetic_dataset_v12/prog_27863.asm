; DESCRIPTION: Sets a single red pixel at (477, 92).
; PLAN: r0=477(x), r1=92(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 477
LDI r1, 92
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
