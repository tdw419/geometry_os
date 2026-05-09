; DESCRIPTION: Sets a single orange pixel at (131, 109).
; PLAN: r0=131(x), r1=109(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 131
LDI r1, 109
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
