; DESCRIPTION: Sets a single purple pixel at (63, 215).
; PLAN: r0=63(x), r1=215(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 63
LDI r1, 215
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
