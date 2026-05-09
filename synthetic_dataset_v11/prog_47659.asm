; DESCRIPTION: Sets a single red pixel at (61, 60).
; PLAN: r0=61(x), r1=60(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 61
LDI r1, 60
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
