; DESCRIPTION: Sets a single cyan pixel at (139, 255).
; PLAN: r0=139(x), r1=255(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 139
LDI r1, 255
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
