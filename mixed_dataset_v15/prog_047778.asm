; DESCRIPTION: Sets a single red pixel at (492, 216).
; PLAN: r0=492(x), r1=216(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 492
LDI r1, 216
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
