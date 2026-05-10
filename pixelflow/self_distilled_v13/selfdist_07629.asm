; DESCRIPTION: Sets a single cyan pixel at (373, 97).
; PLAN: r0=373(x), r1=97(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 373
LDI r1, 97
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
