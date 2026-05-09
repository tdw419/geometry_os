; DESCRIPTION: Sets a single orange pixel at (234, 247).
; PLAN: r0=234(x), r1=247(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 234
LDI r1, 247
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
