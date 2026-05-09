; DESCRIPTION: Sets a single red pixel at (315, 153).
; PLAN: r0=315(x), r1=153(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 315
LDI r1, 153
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
