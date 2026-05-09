; DESCRIPTION: Sets a single purple pixel at (198, 98).
; PLAN: r0=198(x), r1=98(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 198
LDI r1, 98
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
