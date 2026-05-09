; DESCRIPTION: Sets a single yellow pixel at (344, 97).
; PLAN: r0=344(x), r1=97(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 344
LDI r1, 97
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
