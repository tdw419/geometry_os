; DESCRIPTION: Sets a single red pixel at (357, 19).
; PLAN: r0=357(x), r1=19(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 357
LDI r1, 19
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
