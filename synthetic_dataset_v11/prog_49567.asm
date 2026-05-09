; DESCRIPTION: Sets a single blue pixel at (246, 221).
; PLAN: r0=246(x), r1=221(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 246
LDI r1, 221
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
