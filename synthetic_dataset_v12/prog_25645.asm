; DESCRIPTION: Sets a single orange pixel at (433, 76).
; PLAN: r0=433(x), r1=76(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 433
LDI r1, 76
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
