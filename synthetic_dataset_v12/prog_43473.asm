; DESCRIPTION: Sets a single orange pixel at (32, 102).
; PLAN: r0=32(x), r1=102(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 102
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
