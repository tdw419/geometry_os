; DESCRIPTION: Sets a single red pixel at (177, 36).
; PLAN: r0=177(x), r1=36(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 36
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
