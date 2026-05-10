; DESCRIPTION: Sets a single red pixel at (247, 145).
; PLAN: r0=247(x), r1=145(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 247
LDI r1, 145
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
