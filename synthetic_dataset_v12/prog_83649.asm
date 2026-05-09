; DESCRIPTION: Sets a single red pixel at (428, 1).
; PLAN: r0=428(x), r1=1(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 428
LDI r1, 1
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
