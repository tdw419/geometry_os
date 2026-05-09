; DESCRIPTION: Sets a single purple pixel at (66, 228).
; PLAN: r0=66(x), r1=228(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 66
LDI r1, 228
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
