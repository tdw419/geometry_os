; DESCRIPTION: Sets a single blue pixel at (296, 140).
; PLAN: r0=296(x), r1=140(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 296
LDI r1, 140
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
