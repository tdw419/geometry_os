; DESCRIPTION: Sets a single cyan pixel at (106, 24).
; PLAN: r0=106(x), r1=24(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 24
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
