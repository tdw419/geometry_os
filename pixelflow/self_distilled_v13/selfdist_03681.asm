; DESCRIPTION: Sets a single blue pixel at (180, 178).
; PLAN: r0=180(x), r1=178(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 180
LDI r1, 178
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
