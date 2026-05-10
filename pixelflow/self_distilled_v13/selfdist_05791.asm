; DESCRIPTION: Sets a single cyan pixel at (30, 11).
; PLAN: r0=30(x), r1=11(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 30
LDI r1, 11
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
