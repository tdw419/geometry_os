; DESCRIPTION: Sets a single red pixel at (20, 78).
; PLAN: r0=20(x), r1=78(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 20
LDI r1, 78
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
