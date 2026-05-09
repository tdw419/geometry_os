; DESCRIPTION: Sets a single red pixel at (60, 191).
; PLAN: r0=60(x), r1=191(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 60
LDI r1, 191
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
