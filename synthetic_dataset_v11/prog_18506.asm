; DESCRIPTION: Sets a single red pixel at (170, 216).
; PLAN: r0=170(x), r1=216(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 170
LDI r1, 216
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
