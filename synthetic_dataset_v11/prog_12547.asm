; DESCRIPTION: Sets a single cyan pixel at (73, 77).
; PLAN: r0=73(x), r1=77(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 73
LDI r1, 77
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
