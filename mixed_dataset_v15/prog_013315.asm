; DESCRIPTION: Sets a single cyan pixel at (393, 66).
; PLAN: r0=393(x), r1=66(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 393
LDI r1, 66
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
