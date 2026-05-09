; DESCRIPTION: Sets a single purple pixel at (400, 100).
; PLAN: r0=400(x), r1=100(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 400
LDI r1, 100
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
