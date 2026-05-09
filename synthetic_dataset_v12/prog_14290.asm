; DESCRIPTION: Sets a single red pixel at (475, 98).
; PLAN: r0=475(x), r1=98(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 475
LDI r1, 98
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
