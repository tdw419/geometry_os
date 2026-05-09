; DESCRIPTION: Sets a single orange pixel at (73, 142).
; PLAN: r0=73(x), r1=142(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 73
LDI r1, 142
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
