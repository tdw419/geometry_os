; DESCRIPTION: Sets a single cyan pixel at (195, 139).
; PLAN: r0=195(x), r1=139(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 195
LDI r1, 139
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
