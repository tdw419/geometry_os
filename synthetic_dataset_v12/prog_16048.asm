; DESCRIPTION: Sets a single cyan pixel at (261, 110).
; PLAN: r0=261(x), r1=110(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 261
LDI r1, 110
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
