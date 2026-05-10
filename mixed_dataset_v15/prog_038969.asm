; DESCRIPTION: Sets a single cyan pixel at (90, 43).
; PLAN: r0=90(x), r1=43(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 90
LDI r1, 43
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
