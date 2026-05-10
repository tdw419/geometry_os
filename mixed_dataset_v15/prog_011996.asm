; DESCRIPTION: Sets a single orange pixel at (12, 195).
; PLAN: r0=12(x), r1=195(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 12
LDI r1, 195
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
