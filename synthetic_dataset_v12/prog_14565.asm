; DESCRIPTION: Sets a single red pixel at (83, 206).
; PLAN: r0=83(x), r1=206(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 206
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
