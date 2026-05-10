; DESCRIPTION: Sets a single red pixel at (84, 14).
; PLAN: r0=84(x), r1=14(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 84
LDI r1, 14
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
