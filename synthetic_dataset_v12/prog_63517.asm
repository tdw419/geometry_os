; DESCRIPTION: Sets a single cyan pixel at (468, 232).
; PLAN: r0=468(x), r1=232(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 468
LDI r1, 232
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
