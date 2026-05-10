; DESCRIPTION: Sets a single purple pixel at (359, 157).
; PLAN: r0=359(x), r1=157(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 359
LDI r1, 157
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
