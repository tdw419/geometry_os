; DESCRIPTION: Sets a single red pixel at (292, 15).
; PLAN: r0=292(x), r1=15(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 292
LDI r1, 15
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
