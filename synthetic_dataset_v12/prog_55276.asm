; DESCRIPTION: Sets a single red pixel at (319, 102).
; PLAN: r0=319(x), r1=102(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 319
LDI r1, 102
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
