; DESCRIPTION: Sets a single purple pixel at (403, 172).
; PLAN: r0=403(x), r1=172(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 403
LDI r1, 172
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
