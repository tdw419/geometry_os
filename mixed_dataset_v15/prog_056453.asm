; DESCRIPTION: Sets a single orange pixel at (201, 59).
; PLAN: r0=201(x), r1=59(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 201
LDI r1, 59
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
