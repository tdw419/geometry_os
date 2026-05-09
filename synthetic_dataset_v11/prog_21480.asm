; DESCRIPTION: Sets a single red pixel at (111, 116).
; PLAN: r0=111(x), r1=116(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 116
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
