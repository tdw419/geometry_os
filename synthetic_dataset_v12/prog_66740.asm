; DESCRIPTION: Sets a single purple pixel at (294, 14).
; PLAN: r0=294(x), r1=14(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 294
LDI r1, 14
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
