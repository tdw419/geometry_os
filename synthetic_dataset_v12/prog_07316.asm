; DESCRIPTION: Sets a single orange pixel at (43, 64).
; PLAN: r0=43(x), r1=64(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 43
LDI r1, 64
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
