; DESCRIPTION: Sets a single purple pixel at (237, 150).
; PLAN: r0=237(x), r1=150(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 150
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
