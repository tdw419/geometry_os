; DESCRIPTION: Sets a single orange pixel at (64, 178).
; PLAN: r0=64(x), r1=178(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 64
LDI r1, 178
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
