; DESCRIPTION: Sets a single cyan pixel at (26, 79).
; PLAN: r0=26(x), r1=79(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 26
LDI r1, 79
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
