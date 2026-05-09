; DESCRIPTION: Sets a single cyan pixel at (13, 26).
; PLAN: r0=13(x), r1=26(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 13
LDI r1, 26
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
