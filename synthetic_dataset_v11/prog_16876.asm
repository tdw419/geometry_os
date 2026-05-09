; DESCRIPTION: Sets a single purple pixel at (29, 54).
; PLAN: r0=29(x), r1=54(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 29
LDI r1, 54
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
