; DESCRIPTION: Sets a single red pixel at (466, 33).
; PLAN: r0=466(x), r1=33(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 466
LDI r1, 33
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
