; DESCRIPTION: Sets a single cyan pixel at (276, 31).
; PLAN: r0=276(x), r1=31(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 276
LDI r1, 31
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
