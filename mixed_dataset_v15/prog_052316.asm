; DESCRIPTION: Sets a single orange pixel at (15, 42).
; PLAN: r0=15(x), r1=42(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 15
LDI r1, 42
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
