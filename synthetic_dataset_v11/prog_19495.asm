; DESCRIPTION: Sets a single purple pixel at (81, 213).
; PLAN: r0=81(x), r1=213(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 213
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
