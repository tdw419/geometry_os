; DESCRIPTION: Sets a single red pixel at (484, 108).
; PLAN: r0=484(x), r1=108(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 484
LDI r1, 108
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
