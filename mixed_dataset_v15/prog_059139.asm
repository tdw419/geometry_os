; DESCRIPTION: Sets a single blue pixel at (228, 183).
; PLAN: r0=228(x), r1=183(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 228
LDI r1, 183
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
