; DESCRIPTION: Sets a single purple pixel at (376, 198).
; PLAN: r0=376(x), r1=198(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 376
LDI r1, 198
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
