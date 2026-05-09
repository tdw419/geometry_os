; DESCRIPTION: Sets a single blue pixel at (470, 177).
; PLAN: r0=470(x), r1=177(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 470
LDI r1, 177
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
