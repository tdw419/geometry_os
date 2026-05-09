; DESCRIPTION: Sets a single purple pixel at (308, 78).
; PLAN: r0=308(x), r1=78(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 308
LDI r1, 78
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
