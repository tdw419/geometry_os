; DESCRIPTION: Sets a single orange pixel at (156, 153).
; PLAN: r0=156(x), r1=153(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 156
LDI r1, 153
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
