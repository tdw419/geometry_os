; DESCRIPTION: Sets a single orange pixel at (65, 235).
; PLAN: r0=65(x), r1=235(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 65
LDI r1, 235
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
