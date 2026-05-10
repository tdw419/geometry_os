; DESCRIPTION: Sets a single cyan pixel at (235, 36).
; PLAN: r0=235(x), r1=36(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 235
LDI r1, 36
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
