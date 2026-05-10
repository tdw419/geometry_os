; DESCRIPTION: Sets a single purple pixel at (126, 27).
; PLAN: r0=126(x), r1=27(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 126
LDI r1, 27
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
