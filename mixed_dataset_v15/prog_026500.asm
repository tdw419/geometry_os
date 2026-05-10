; DESCRIPTION: Sets a single cyan pixel at (139, 20).
; PLAN: r0=139(x), r1=20(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 139
LDI r1, 20
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
