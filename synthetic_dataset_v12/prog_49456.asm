; DESCRIPTION: Sets a single cyan pixel at (309, 204).
; PLAN: r0=309(x), r1=204(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 309
LDI r1, 204
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
