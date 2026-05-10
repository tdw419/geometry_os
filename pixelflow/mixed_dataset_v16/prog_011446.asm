; DESCRIPTION: Sets a single orange pixel at (177, 175).
; PLAN: r0=177(x), r1=175(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 175
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
