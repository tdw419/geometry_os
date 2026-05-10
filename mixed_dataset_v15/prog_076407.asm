; DESCRIPTION: Sets a single orange pixel at (140, 101).
; PLAN: r0=140(x), r1=101(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 140
LDI r1, 101
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
