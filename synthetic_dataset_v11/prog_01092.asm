; DESCRIPTION: Sets a single red pixel at (89, 170).
; PLAN: r0=89(x), r1=170(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 89
LDI r1, 170
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
