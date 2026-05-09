; DESCRIPTION: Sets a single red pixel at (216, 252).
; PLAN: r0=216(x), r1=252(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 216
LDI r1, 252
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
