; DESCRIPTION: Sets a single purple pixel at (276, 198).
; PLAN: r0=276(x), r1=198(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 276
LDI r1, 198
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
