; DESCRIPTION: Sets a single red pixel at (119, 166).
; PLAN: r0=119(x), r1=166(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 119
LDI r1, 166
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
