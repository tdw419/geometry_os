; DESCRIPTION: Sets a single cyan pixel at (248, 105).
; PLAN: r0=248(x), r1=105(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 248
LDI r1, 105
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
