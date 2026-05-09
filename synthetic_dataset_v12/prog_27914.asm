; DESCRIPTION: Sets a single cyan pixel at (449, 12).
; PLAN: r0=449(x), r1=12(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 449
LDI r1, 12
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
