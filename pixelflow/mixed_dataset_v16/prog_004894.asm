; DESCRIPTION: Sets a single orange pixel at (131, 115).
; PLAN: r0=131(x), r1=115(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 131
LDI r1, 115
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
