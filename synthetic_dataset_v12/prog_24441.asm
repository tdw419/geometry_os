; DESCRIPTION: Sets a single red pixel at (44, 109).
; PLAN: r0=44(x), r1=109(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 44
LDI r1, 109
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
