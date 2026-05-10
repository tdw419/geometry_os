; DESCRIPTION: Sets a single cyan pixel at (493, 158).
; PLAN: r0=493(x), r1=158(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 493
LDI r1, 158
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
