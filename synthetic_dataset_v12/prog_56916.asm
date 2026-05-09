; DESCRIPTION: Sets a single orange pixel at (185, 9).
; PLAN: r0=185(x), r1=9(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 185
LDI r1, 9
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
