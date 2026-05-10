; DESCRIPTION: Sets a single cyan pixel at (166, 110).
; PLAN: r0=166(x), r1=110(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 110
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
