; DESCRIPTION: Sets a single blue pixel at (306, 86).
; PLAN: r0=306(x), r1=86(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 306
LDI r1, 86
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
