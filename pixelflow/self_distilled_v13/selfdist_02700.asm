; DESCRIPTION: Sets a single orange pixel at (235, 26).
; PLAN: r0=235(x), r1=26(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 235
LDI r1, 26
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
