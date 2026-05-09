; DESCRIPTION: Sets a single orange pixel at (36, 24).
; PLAN: r0=36(x), r1=24(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 36
LDI r1, 24
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
