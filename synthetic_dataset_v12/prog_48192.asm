; DESCRIPTION: Sets a single cyan pixel at (378, 235).
; PLAN: r0=378(x), r1=235(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 378
LDI r1, 235
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
