; DESCRIPTION: Sets a single purple pixel at (424, 198).
; PLAN: r0=424(x), r1=198(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 424
LDI r1, 198
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
