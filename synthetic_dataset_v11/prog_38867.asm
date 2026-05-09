; DESCRIPTION: Sets a single cyan pixel at (230, 13).
; PLAN: r0=230(x), r1=13(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 230
LDI r1, 13
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
