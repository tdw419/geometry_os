; DESCRIPTION: Sets a single red pixel at (96, 0).
; PLAN: r0=96(x), r1=0(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 96
LDI r1, 0
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
