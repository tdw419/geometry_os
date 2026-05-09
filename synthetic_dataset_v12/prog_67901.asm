; DESCRIPTION: Sets a single blue pixel at (308, 36).
; PLAN: r0=308(x), r1=36(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 308
LDI r1, 36
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
