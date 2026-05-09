; DESCRIPTION: Sets a single purple pixel at (272, 50).
; PLAN: r0=272(x), r1=50(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 272
LDI r1, 50
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
