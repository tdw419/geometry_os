; DESCRIPTION: Sets a single red pixel at (47, 232).
; PLAN: r0=47(x), r1=232(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 47
LDI r1, 232
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
