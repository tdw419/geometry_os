; DESCRIPTION: Sets a single orange pixel at (156, 76).
; PLAN: r0=156(x), r1=76(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 156
LDI r1, 76
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
