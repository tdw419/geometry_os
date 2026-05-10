; DESCRIPTION: Sets a single orange pixel at (315, 2).
; PLAN: r0=315(x), r1=2(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 315
LDI r1, 2
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
