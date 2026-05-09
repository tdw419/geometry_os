; DESCRIPTION: Sets a single cyan pixel at (406, 66).
; PLAN: r0=406(x), r1=66(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 406
LDI r1, 66
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
