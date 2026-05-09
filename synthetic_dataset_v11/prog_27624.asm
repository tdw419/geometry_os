; DESCRIPTION: Sets a single orange pixel at (136, 179).
; PLAN: r0=136(x), r1=179(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 136
LDI r1, 179
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
