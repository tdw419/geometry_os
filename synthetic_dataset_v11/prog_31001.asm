; DESCRIPTION: Sets a single purple pixel at (50, 76).
; PLAN: r0=50(x), r1=76(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 50
LDI r1, 76
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
