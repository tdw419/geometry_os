; DESCRIPTION: Sets a single red pixel at (201, 174).
; PLAN: r0=201(x), r1=174(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 201
LDI r1, 174
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
