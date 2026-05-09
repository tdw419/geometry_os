; DESCRIPTION: Sets a single red pixel at (201, 157).
; PLAN: r0=201(x), r1=157(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 201
LDI r1, 157
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
