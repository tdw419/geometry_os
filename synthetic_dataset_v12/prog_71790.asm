; DESCRIPTION: Sets a single cyan pixel at (165, 97).
; PLAN: r0=165(x), r1=97(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 165
LDI r1, 97
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
