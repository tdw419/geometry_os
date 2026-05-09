; DESCRIPTION: Sets a single red pixel at (35, 130).
; PLAN: r0=35(x), r1=130(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 35
LDI r1, 130
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
