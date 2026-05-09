; DESCRIPTION: Sets a single purple pixel at (244, 47).
; PLAN: r0=244(x), r1=47(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 244
LDI r1, 47
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
