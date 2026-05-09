; DESCRIPTION: Sets a single red pixel at (447, 101).
; PLAN: r0=447(x), r1=101(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 447
LDI r1, 101
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
