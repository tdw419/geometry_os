; DESCRIPTION: Sets a single red pixel at (7, 226).
; PLAN: r0=7(x), r1=226(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 7
LDI r1, 226
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
