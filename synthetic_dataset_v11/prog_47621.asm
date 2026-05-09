; DESCRIPTION: Sets a single red pixel at (4, 124).
; PLAN: r0=4(x), r1=124(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 4
LDI r1, 124
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
